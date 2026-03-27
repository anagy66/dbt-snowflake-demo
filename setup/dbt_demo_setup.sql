ALTER SCHEMA analytics.dev SET LOG_LEVEL = 'INFO';
ALTER SCHEMA analytics.dev SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA analytics.dev SET METRIC_LEVEL = 'ALL';

ALTER SCHEMA analytics.prod SET LOG_LEVEL = 'INFO';
ALTER SCHEMA analytics.prod SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA analytics.prod SET METRIC_LEVEL = 'ALL';

CREATE DATABASE analytics_dev;
CREATE SCHEMA analytics_dev.dbt_demo;

CREATE DATABASE analytics_prod;
CREATE SCHEMA analytics_prod.dbt_demo;