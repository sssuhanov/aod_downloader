from dagster import EnvVar

from .aod_resource import AODAPIClient
from .postgresql_resource import PostgreSQLClient
from .files_resouce import FilesClient

RESOURCES_LOCAL = {
    "aod_client": AODAPIClient(),
    "psql_client": PostgreSQLClient(
        dbname = EnvVar("DWH_POSTGRES_DB"),
        user = EnvVar("DWH_POSTGRES_USER"),
        host = EnvVar("DWH_POSTGRES_HOST"),
        password = EnvVar("DWH_POSTGRES_PASSWORD")
    ),
    "files_client": FilesClient(),
}