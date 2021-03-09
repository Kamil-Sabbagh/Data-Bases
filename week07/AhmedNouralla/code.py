import psycopg2
from geopy.geocoders import Nominatim

# connecting to the database server
con = psycopg2.connect(database="dvdrental", user="postgres",
                       password="postgres", host="127.0.0.1", port="5432")
print("Database opened successfully")

cur = con.cursor()

# call function
cur.execute('''select get_addr();''')
res = cur.fetchall()

locator = Nominatim(user_agent="ahmed_123456")

for i in res:
    location = locator.geocode(i[0])
    if location is None:
        print('0', '0')
    else:
        print(location.latitude, location.longitude)

# cur.execute('''alter table address add column longitude varchar(50);''')
# cur.execute('''alter table address add column latitude varchar(50);''')
for i in res:
    cur.execute('''UPDATE address
    SET longitude = ''' + str(location.longitude) + ''', latitude = ''' + str(location.latitude) + '''
    WHERE address.address = \'''' + i[0] + '''\';''')
