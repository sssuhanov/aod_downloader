from dagster import EnvVar

from .aod_resource import AODAPIClient
from .postgresql_resource import PostgreSQLClient
from .files_resouce import FilesClient

RESOURCES_LOCAL = {
    "aod_client": AODAPIClient(),
    "psql_client": PostgreSQLClient(
        dbname = EnvVar("dbname"),
        user = EnvVar("user"),
        host = EnvVar("host"),
        password = EnvVar("password")
    ),
    "files_client": FilesClient(),
}