import requests

from dagster import ConfigurableResource

AOD_BASE_URL = "https://west.albion-online-data.com"

class AODAPIClient(ConfigurableResource):
    def fetch_current_prices_by_id(self, item_id: str):
        item_url = f"{AOD_BASE_URL}/api/v2/stats/prices/{item_id}"
        item = requests.get(item_url, timeout=5).json()
        return item
    
    def fetch_items_list(self):
        list_url = 'https://raw.githubusercontent.com/ao-data/ao-bin-dumps/master/formatted/items.json'

        # Make a GET request to fetch the raw file content
        items_list = requests.get(list_url, timeout=5).text
        
        return items_list