import requests

from dagster import ConfigurableResource

AOD_BASE_URL = "https://west.albion-online-data.com/api/v2/stats"

class AODAPIClient(ConfigurableResource):

    def __request(self, url: str, params={}):
        return requests.get(url, params=params, timeout=120).json()


    def fetch_current_prices_by_id(self, item_id: str):
        item_url = f"{AOD_BASE_URL}/prices/{item_id}"
        return self.__request(item_url)
    
    def fetch_history_by_id(self, item_id: str):
        params = {'time-scale': '24', 'qualities': '1,2,3,4,5'}
        item_url = f"{AOD_BASE_URL}/history/{item_id}"
        return self.__request(item_url, params)
    
    def fetch_items_list(self):
        list_url = 'https://raw.githubusercontent.com/ao-data/ao-bin-dumps/master/formatted/items.json'

        # Make a GET request to fetch the raw file content
        items_list = self.__request(url=list_url)
        
        return items_list
    
    def fetch_items_details(self):
        list_url = 'https://raw.githubusercontent.com/ao-data/ao-bin-dumps/master/items.json'

        # Make a GET request to fetch the raw file content
        answer = self.__request(url=list_url)
        
        return answer