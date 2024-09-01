from dagster import (
    AssetExecutionContext,
    file_relative_path,
    Config
)
from dagster_dbt import (
    DbtCliResource,
    dbt_assets,
)

DBT_PROJECT_DIR = file_relative_path(__file__, "../../../dbt")

dbt_resource = DbtCliResource(project_dir=DBT_PROJECT_DIR)
dbt_parse_invocation = dbt_resource.cli(["parse"]).wait()
dbt_manifest_path = dbt_parse_invocation.target_path.joinpath("manifest.json")

# Add config: full_refresh
class MyDbtConfig(Config):
    full_refresh: bool

@dbt_assets(
    manifest=dbt_manifest_path,
)
def dbt_project_assets(context: AssetExecutionContext, dbt: DbtCliResource, config: MyDbtConfig):
    dbt_build_args = ["build"]
    if config.full_refresh:
        dbt_build_args += ["--full-refresh"]

    yield from dbt.cli(dbt_build_args, context=context).stream()