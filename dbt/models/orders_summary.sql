SELECT
    o.o_orderkey                            AS order_key,
    o.o_custkey                             AS customer_key,
    o.o_orderstatus                         AS order_status,
    o.o_orderpriority                       AS order_priority,
    o.o_orderdate                           AS order_date,
    o.o_totalprice                          AS order_total_price,
    COUNT(l.l_linenumber)                   AS line_item_count,
    SUM(l.l_quantity)                       AS total_quantity,
    SUM(l.l_extendedprice)                  AS total_extended_price,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS total_net_price,
    SUM(l.l_extendedprice * (1 - l.l_discount) * (1 + l.l_tax)) AS total_charged_price
FROM {{ source('tpch', 'orders') }} o
LEFT JOIN {{ source('tpch', 'lineitem') }} l ON o.o_orderkey = l.l_orderkey
GROUP BY 1, 2, 3, 4, 5, 6
