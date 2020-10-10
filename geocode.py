import requests
from time import sleep

from cdep_db import get_con

url = 'https://nominatim.openstreetmap.org/search?street={}&city=Dallas&county=Dallas&state=TX&country=USA&addressdetails=1&format=geojson'
update = "UPDATE cdep.address_lookup SET zip = %s, lat = %s, lon = %s WHERE address = %s;"

con = get_con()
cur = con.cursor()

## Prime the while loop by querying the first batch of 100 addresses for processing
## batching like this isn't necessary, but since we have to be careful with the API
## it makes sense to spend some computing time querying in batches to be safe
query = 'SELECT address FROM cdep.address_lookup WHERE queried IS False LIMIT 100;'
cur.execute(query) 
q = cur.fetchall() ## load results for processing. Come in as a list of tuples [(x,),(y,),...]

while q: # process addresses while there are still addresses to lookup in query
    for addr in q: ## assign each tuple with address in results to variable
        r = requests.get(url.format(addr[0])) ## take the first object in the tuple (the address)
        if r.json()['features']: ## check that there was a good result. Otherwise fail and set the boolean flag
            zc = r.json()['features'][0]['properties']['address']['postcode'] if 'postcode' in r.json()['features'][0]['properties']['address'].keys() and r.json()['features'][0]['properties']['address']['postcode'].find(':') == -1 else None
            lon, lat = r.json()['features'][0]['geometry']['coordinates']
            cur.execute(update,(zc,lat,lon,addr[0]))

        ## This is run whether or not we get an address to indicate it was queried
        cur.execute(f"UPDATE cdep.address_lookup SET queried = True WHERE address = '{addr[0]}';")
        con.commit() ## commit the result to the database
        sleep(1) ## pause one second to ease load on API

    ## Reset the batch for the next pass through the while loop
    cur.execute(query)
    q = cur.fetchall()

con.commit() # Just in case there are any uncommitted transactions in queue
con.close() # close the connection