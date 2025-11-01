import psycopg2

conn = psycopg2.connect(
    dbname="gisdb",
    user="postgres",
    password="postgres",
    host="db",
    port="5432"
)
cur = conn.cursor()
cur.execute("SELECT postgis_full_version();")
print(cur.fetchone())
cur.execute("SELECT pgr_version();")
print(cur.fetchone())
