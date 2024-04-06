import os

from dagster import (
    Definitions,
    define_asset_job,
    AssetSelection,
    ScheduleDefinition,
    EnvVar
)

from .resources import RESOURCES_LOCAL

from .assets import core_assets

all_assets = [*core_assets]

# Addition: define a job that will materialize the assets
main_job = define_asset_job("main_job", selection=AssetSelection.all())

# Addition: a ScheduleDefinition the job it should run and a cron schedule of how frequently to run it
hour_schedule = ScheduleDefinition(
    job=main_job,
    cron_schedule="0 * * * *",  # every hour
)

resources_by_deployment_name = {
    "local": RESOURCES_LOCAL
}

deployment_name = os.environ.get("DAGSTER_DEPLOYMENT", "local")

defs = Definitions(
    assets=all_assets,
    schedules=[hour_schedule],
    resources=resources_by_deployment_name[deployment_name]
)
