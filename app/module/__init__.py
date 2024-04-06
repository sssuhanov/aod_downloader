# from dagster import Definitions, load_assets_from_modules
from dagster import (
    Definitions,
    define_asset_job,
    AssetSelection,
    ScheduleDefinition,
    load_assets_from_modules,
    EnvVar
)

from .resources import DataGeneratorResource

from .assets import assets

all_assets = load_assets_from_modules([assets])

# Addition: define a job that will materialize the assets
hackernews_job = define_asset_job("hackernews_job", selection=AssetSelection.all())

# Addition: a ScheduleDefinition the job it should run and a cron schedule of how frequently to run it
hackernews_schedule = ScheduleDefinition(
    job=hackernews_job,
    cron_schedule="0 * * * *",  # every hour
)

datagen = DataGeneratorResource(
    num_days = EnvVar.int("HACKERNEWS_NUM_DAYS_WINDOW")
)

defs = Definitions(
    assets=all_assets,
    schedules=[hackernews_schedule],
    resources={
        "hackernews_api": datagen,
    }
)
