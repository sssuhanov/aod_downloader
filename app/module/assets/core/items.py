import os
import json

from dagster import asset, AssetExecutionContext

from module.resources.aod_resource import AODAPIClient
from module.resources.postgresql_resource import PostgreSQLClient
from module.resources.files_resouce import FilesClient

@asset(deps=["items_names", "stg_aod__items_names"], key_prefix="aod", compute_kind='python')
def history(context: AssetExecutionContext, aod_client: AODAPIClient, psql_client: PostgreSQLClient):

    SCHEMA = 'aod'
    TABLE = 'history'

    data = psql_client.read_table('dbt_dev', 'stg_aod__items_names')

    items_list = [x[1] for x in data if x[1] is not None] 

    context.log.info(f"Items in file {len(items_list)}.")

    psql_client.clear_table(schema_name=SCHEMA, table_name=TABLE)

    for i in range(0, len(items_list), 100):

        context.log.info(f"Got {i}.")

        chunk = items_list[i:i+100]

        items_string = ','.join(chunk)

        history = aod_client.fetch_history_by_id(items_string)

        psql_client.drop_json(history, schema_name=SCHEMA, table_name=TABLE)

        if len(chunk) < 100:
            break

@asset(key_prefix="aod", compute_kind='python')
def items_names(aod_client: AODAPIClient, psql_client: PostgreSQLClient):
    
    SCHEMA = 'aod'
    TABLE = 'items_names'
    
    psql_client.clear_table(schema_name=SCHEMA, table_name=TABLE)

    items_list = aod_client.fetch_items_list()
    psql_client.drop_json(items_list, schema_name=SCHEMA, table_name=TABLE)

@asset(key_prefix="aod", compute_kind='python')
def items_details(aod_client: AODAPIClient, psql_client: PostgreSQLClient):
    
    SCHEMA = 'aod'
    TABLE = 'items_details'

    psql_client.clear_table(schema_name=SCHEMA, table_name=TABLE)

    items_list = aod_client.fetch_items_details()
    psql_client.drop_json(items_list, schema_name=SCHEMA, table_name=TABLE)