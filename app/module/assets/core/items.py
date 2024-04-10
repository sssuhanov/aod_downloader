import os
import json

from dagster import asset

from module.resources.aod_resource import AODAPIClient
from module.resources.postgresql_resource import PostgreSQLClient
from module.resources.files_resouce import FilesClient

@asset
def items(aod_client: AODAPIClient, psql_client: PostgreSQLClient):
    current_prices = aod_client.fetch_current_prices_by_id("T4_ARMOR_PLATE_FEY@3")

    psql_client.drop_json(current_prices)

@asset
def items_list(aod_client: AODAPIClient, files_client: FilesClient):
    items_list = aod_client.fetch_items_list()
    files_client.write_file(items_list, 'data/items.json')