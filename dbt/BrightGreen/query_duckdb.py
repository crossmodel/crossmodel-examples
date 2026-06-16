import duckdb

query = """SELECT * FROM demo.customerfullname"""

print("Executing query: " + query)

con = duckdb.connect("demo.duckdb")
con.execute(query)

print(con.fetchall())