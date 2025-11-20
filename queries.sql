-- 1. Listar todos os clientes
SELECT * FROM customers;

-- 2. Listar todos os produtos
SELECT * FROM products;

-- 3. Listar todos os pedidos
SELECT * FROM orders;

-- 4. Quantos clientes existem?
SELECT COUNT(*) AS total_customers
FROM customers;

-- 5. Quantos produtos estão cadastrados?
SELECT COUNT(*) AS total_products
FROM products;

-- 6. Valor total de todos os pedidos (quantity * price)
SELECT 
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 7. Valor médio dos pedidos
SELECT 
    AVG(o.quantity * p.price) AS avg_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 8. Pedido mais caro e pedido mais barato
SELECT 
    MAX(order_total) AS highest_order,
    MIN(order_total) AS lowest_order
FROM (
    SELECT 
        o.order_id,
        SUM(o.quantity * p.price) AS order_total
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY o.order_id
) t;

-- 9. Produtos ordenados do mais caro para o mais barato
SELECT * 
FROM products
ORDER BY price DESC;

-- 10. Relatório unindo clientes, produtos e valor do pedido
SELECT 
    c.customer_name,
    c.city,
    p.product_name,
    o.quantity,
    (o.quantity * p.price) AS total_value
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
ORDER BY total_value DESC;
