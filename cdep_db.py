#!/usr/bin/env python
from pgconnect import pgconnect
import psycopg2

db = pgconnect['db']
host = pgconnect['host']
user = pgconnect['user']

def get_con():
    return psycopg2.connect(database=db,host=host,user=user)

def get_engine():
    from sqlalchemy import create_engine

    url = f"postgres+psycopg2://{user}:@{host}:5432/{db}"
    return create_engine(url)