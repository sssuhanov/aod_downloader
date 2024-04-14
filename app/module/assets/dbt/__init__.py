from dagster import AssetExecutionContext, file_relative_path
from dagster_dbt import (
    DbtCliResource,
    dbt_assets,
)

DBT_PROJECT_DIR = file_relative_path(__file__, "../../../dbt")

dbt_resource = DbtCliResource(project_dir=DBT_PROJECT_DIR)
dbt_parse_invocation = dbt_resource.cli(["parse"]).wait()
dbt_manifest_path = dbt_parse_invocation.target_path.joinpath("manifest.json")

@dbt_assets(
    manifest=dbt_manifest_path,
)
def dbt_project_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()