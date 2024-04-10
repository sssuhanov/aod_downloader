import json

from dagster import ConfigurableResource

class FilesClient(ConfigurableResource):
    def write_file(self, data, filename):
        with open(filename, 'w') as f:
            f.write(data)