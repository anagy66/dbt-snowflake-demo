{% docs table_customers %}
This is the customers table.
It contains all customer records in the Snowflake database (one record per customer).
{% enddocs %}

{% docs table_stg_customers %}
This is the staging customers table.
This model cleans up customer data from the source and prepares it for analysis and BI.
It contains all customer records in the Snowflake staging area (one record per customer).
{% enddocs %}

{% docs table_stg_orders %}
This is the staging orders table.
This model cleans up order data from the source and prepares it for analysis and BI.
It contains all order records in the Snowflake staging area (one record per order).
{% enddocs %}
