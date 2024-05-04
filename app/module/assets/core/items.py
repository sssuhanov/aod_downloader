import os
import json

from dagster import asset, AssetExecutionContext

from module.resources.aod_resource import AODAPIClient
from module.resources.postgresql_resource import PostgreSQLClient
from module.resources.files_resouce import FilesClient

@asset(deps=["items_names", "stg_aod__items_names"], key_prefix="aod", compute_kind='python')
def history(context: AssetExecutionContext, aod_client: AODAPIClient, psql_client: PostgreSQLClient):

    data = psql_client.read_table('dbt_dev', 'stg_aod__items_names')

    items_list = [x[1] for x in data if x[1] is not None] 

    context.log.info(f"Items in file {len(items_list)}.")

    for i in range(0, len(items_list), 100):

        context.log.info(f"Got {i}.")

        chunk = items_list[i:i+100]

        items_string = ','.join(chunk)

        history = aod_client.fetch_history_by_id(items_string)

        psql_client.drop_json(history, schema_name='aod', table_name='history')

        if len(chunk) < 100:
            break

@asset(key_prefix="aod", compute_kind='python')
def items_names(aod_client: AODAPIClient, psql_client: PostgreSQLClient):
    items_list = aod_client.fetch_items_list()
    psql_client.drop_json(items_list, schema_name='aod', table_name='items_names')