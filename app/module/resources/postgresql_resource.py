import psycopg2
import json

from dagster import ConfigurableResource

class PostgreSQLClient(ConfigurableResource):
    dbname: str
    user: str
    host: str
    password: str

    def drop_json(self, data):
        # Connect to your postgres DB
        conn = psycopg2.connect(f"dbname='{self.dbname}' user='{self.user}' host='{self.host}' password='{self.password}'")

        # Open a cursor to perform database operations
        cur = conn.cursor()

        # Execute a command: this creates a new table
        cur.execute("CREATE TABLE IF NOT EXISTS your_table_name (id serial PRIMARY KEY, data jsonb);")

        # Insert data into the table
        # Note: Be mindful of SQL injection. Here, we are using a parameterized query.
        cur.execute("INSERT INTO your_table_name (data) VALUES (%s);", (json.dumps(data),))

        # Commit the changes to the database
        conn.commit()

        # Close communication with the database
        cur.close()
        conn.close()