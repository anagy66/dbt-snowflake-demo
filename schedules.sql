-- To avoid issues with CREATE OR ALTER, suspend all of the tasks from root to child
-- ALTER TASK IF EXISTS ensures this file can execute on first run each time a task is added
ALTER TASK IF EXISTS run_snowflake_demo_subset SUSPEND;
ALTER TASK IF EXISTS run_snowflake_demo_full SUSPEND;
ALTER TASK IF EXISTS test_snowflake_demo SUSPEND;

-- This would be an example scenario where you have a subset of the DAG that needs to be available early for business needs:
CREATE OR ALTER TASK run_snowflake_demo_subset
  WAREHOUSE = compute_wh
  SCHEDULE = '12 hours'
  AS
      execute dbt project my_dbt_project_object_gh_action args='run --select stg_customers stg_orders customers --target prod';

-- Kick off a complete run of the full project
CREATE OR ALTER TASK run_snowflake_demo_full
  WAREHOUSE = compute_wh
  AFTER run_snowflake_demo_subset
  AS
      execute dbt project my_dbt_project_object_gh_action args='run --target prod';

-- Run any data quality tests you've defined
CREATE OR ALTER TASK test_snowflake_demo
  WAREHOUSE = compute_wh
  AFTER run_snowflake_demo_full
  AS
      execute dbt project my_dbt_project_object_gh_action args='test --target prod';

-- When a task is first created or if an existing task it paused, it MUST BE RESUMED to be activated
-- The tasks must be enabled in REVERSE ORDER from child to root
ALTER TASK IF EXISTS test_snowflake_demo RESUME;
ALTER TASK IF EXISTS run_snowflake_demo_full RESUME;
ALTER TASK IF EXISTS run_snowflake_demo_subset RESUME;
