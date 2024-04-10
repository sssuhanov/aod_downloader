import json

from dagster import ConfigurableResource

class FilesClient(ConfigurableResource):
    def write_file(self, data, filename):
        with open(filename, 'w') as f:
            f.write(data)

    def write_json(self, data, filename):
        with open(filename, 'w') as f:
            json.dump(data, f, indent=4)

    def read_json(self, filename):
        with open(filename, 'r') as f:
            data = json.load(f)

        return data