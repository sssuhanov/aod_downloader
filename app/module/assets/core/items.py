import os
import json

from dagster import asset, AssetExecutionContext

from module.resources.aod_resource import AODAPIClient
from module.resources.postgresql_resource import PostgreSQLClient
from module.resources.files_resouce import FilesClient

@asset
def prices_item(aod_client: AODAPIClient, psql_client: PostgreSQLClient):
    current_prices = aod_client.fetch_current_prices_by_id("T4_ARMOR_PLATE_FEY@3")

    psql_client.drop_json(current_prices)

@asset
def history_item(aod_client: AODAPIClient, psql_client: PostgreSQLClient):
    history_prices = aod_client.fetch_history_by_id("T4_ARMOR_PLATE_FEY@3")

    # files_client.write_file(items_list, 'data/history.json')
    psql_client.drop_json(history_prices)

@asset
def history_items(context: AssetExecutionContext, aod_client: AODAPIClient, psql_client: PostgreSQLClient, files_client: FilesClient):
    data = files_client.read_json('data/items.json')

    items_list = [x['UniqueName'] for x in data]

    context.log.info(f"Items in file {len(items_list)}.")

    for i in range(0, len(items_list), 100):

        context.log.info(f"Got {i}.")

        chunk = items_list[i:i+100]

        items_string = ','.join(chunk)

        history = aod_client.fetch_history_by_id(items_string)

        psql_client.drop_json(history)

        if len(chunk) < 100:
            break

@asset
def items_list(aod_client: AODAPIClient, files_client: FilesClient):
    items_list = aod_client.fetch_items_list()
    files_client.write_json(items_list, 'data/items.json')