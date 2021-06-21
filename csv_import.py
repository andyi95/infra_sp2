"""
This script imports given data from csv files to sqlite3 db, using Pandas
framework.
Don't forget to add user import!
"""
import sqlite3

import pandas

from api.models import User

con = sqlite3.connect('db.sqlite3')

df = pandas.read_csv('data/category.csv')
df.to_sql('api_category', con, if_exists='append', index=False)

df = pandas.read_csv('data/comments.csv')
df.to_sql('api_comment', con, if_exists='append', index=False)

df = pandas.read_csv('data/genre.csv')
df.to_sql('api_genre', con, if_exists='append', index=False)

df = pandas.read_csv('data/genre_title.csv')
df.to_sql('api_title_genre', con, if_exists='append', index=False)

df = pandas.read_csv('data/titles.csv')
df.to_sql('api_title', con, if_exists='append', index=False)

df = pandas.read_csv('data/users.csv')
df.to_sql('api_user', con, if_exists='append', index=False)

# Add a password for admin user to get access to admin area
usr = User.objects.get(email='capt_obvious@yamdb.fake')
usr.set_password('12345678a')
usr.save()
