import os
import json
# import requests

from dagster import asset

from module.resources.aod_resource import AODAPIClient

@asset
def items(aod_client: AODAPIClient):
    current_prices = aod_client.fetch_current_prices_by_id("T4_ARMOR_PLATE_FEY@3")

    os.makedirs("data", exist_ok=True)
    with open("data/prices.json", "w") as f:
        json.dump(current_prices, f)