-- Order date should be greather than 1900/1/1. 
-- This test returns any rows where order date is <= 1900-01-01.
select
    *
from {{ ref('stg_orders') }}
where order_date <= '1900-01-01'
