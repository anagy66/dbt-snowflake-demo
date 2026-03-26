select
    c_custkey as customer_id,
    c_name as full_name
from {{ source('snowflake_sample', 'customer') }}
