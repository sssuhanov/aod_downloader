import os
import json

from dagster import asset

from module.resources.aod_resource import AODAPIClient
from module.resources.postgresql_resource import PostgreSQLClient

@asset
def items(aod_client: AODAPIClient, psql_client: PostgreSQLClient):
    current_prices = aod_client.fetch_current_prices_by_id("T4_ARMOR_PLATE_FEY@3")

    psql_client.drop_json(current_prices)