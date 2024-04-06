import requests

from dagster import ConfigurableResource

AOD_BASE_URL = "https://west.albion-online-data.com"

class AODAPIClient(ConfigurableResource):
    def fetch_current_prices_by_id(self, item_id: str):
        item_url = f"{AOD_BASE_URL}//api/v2/stats/view/{item_id}.json"
        item = requests.get(item_url, timeout=5).json()
        return item