import psycopg2
import json

from dagster import ConfigurableResource

class PostgreSQLClient(ConfigurableResource):
    dbname: str
    user: str
    host: str
    password: str

    def drop_json(self, data, schema_name, table_name):
        # Connect to your postgres DB
        conn = psycopg2.connect(dbname=self.dbname,
                                user=self.user,
                                host=self.host,
                                password=self.password,
                                options=f'-c search_path={schema_name}'
                                )

        # Open a cursor to perform database operations
        cur = conn.cursor()

        # Create schema
        cur.execute(f"CREATE SCHEMA IF NOT EXISTS {schema_name}")

        # Execute a command: this creates a new table
        cur.execute(f"CREATE TABLE IF NOT EXISTS {table_name} (id serial PRIMARY KEY, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, data jsonb);")

        # Insert data into the table
        # Note: Be mindful of SQL injection. Here, we are using a parameterized query.
        cur.execute(f"INSERT INTO {table_name} (data) VALUES (%s);", (json.dumps(data),))

        # Commit the changes to the database
        conn.commit()

        # Close communication with the database
        cur.close()
        conn.close()

    def read_table(self, schema_name, table_name):
        # Connect to your postgres DB
        conn = psycopg2.connect(dbname=self.dbname,
                                user=self.user,
                                host=self.host,
                                password=self.password
                                )

        # Open a cursor to perform database operations
        cur = conn.cursor()

        # Create schema
        cur.execute(f"select * from {schema_name}.{table_name}")

        all_rows = cur.fetchall()

        # Close communication with the database
        cur.close()
        conn.close()

        return all_rows