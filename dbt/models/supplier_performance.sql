SELECT
    s.s_suppkey                             AS supplier_key,
    s.s_name                                AS supplier_name,
    COUNT(DISTINCT l.l_orderkey)            AS total_orders,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS total_revenue,
    AVG(l.l_discount)                       AS average_discount
FROM {{ source('tpch', 'supplier') }} s
LEFT JOIN {{ source('tpch', 'lineitem') }} l ON s.s_suppkey = l.l_suppkey
GROUP BY 1, 2
