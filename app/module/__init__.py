import os

from dagster import (
    Definitions,
    define_asset_job,
    AssetSelection,
    ScheduleDefinition,
    EnvVar,
    DefaultScheduleStatus
)

from .resources import RESOURCES_LOCAL

from .assets import core_assets
from .assets.dbt import (
    dbt_project_assets,
    dbt_resource,
)

all_assets = [dbt_project_assets, *core_assets]

# Addition: define a job that will materialize the assets
main_job = define_asset_job("main_job", selection=AssetSelection.all())

# Addition: a ScheduleDefinition the job it should run and a cron schedule of how frequently to run it
every_4_hours_schedule = ScheduleDefinition(
    job=main_job,
    cron_schedule="0 */4 * * *",  # every 4 hours
    default_status = DefaultScheduleStatus.RUNNING
)

resources_by_deployment_name = {
    "local": RESOURCES_LOCAL
}

deployment_name = os.environ.get("DAGSTER_DEPLOYMENT", "local")

res = resources_by_deployment_name[deployment_name]
res['dbt'] = dbt_resource

defs = Definitions(
    assets=all_assets,
    schedules=[every_4_hours_schedule],
    resources=res
)