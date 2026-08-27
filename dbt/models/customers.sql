SELECT
    c_custkey                               AS customer_key,
    c_name                                  AS customer_name,
    c_address                               AS address,
    c_phone                                 AS phone,
    c_acctbal                               AS account_balance,
    c_mktsegment                            AS market_segment,
    n.n_name                                AS nation,
    r.r_name                                AS region
FROM {{ source('tpch', 'customer') }} c
LEFT JOIN {{ source('tpch', 'nation') }} n ON c.c_nationkey = n.n_nationkey
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.region
-- {{ source('tpch', 'region') }} 
 r ON n.n_regionkey = r.r_regionkey
