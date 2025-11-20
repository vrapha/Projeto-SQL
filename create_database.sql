-- Criar tabelas básicas de um e-commerce
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    price REAL NOT NULL
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    order_date TEXT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- Inserindo produtos
INSERT INTO products VALUES
(1, 'Mouse USB', 'Periféricos', 79.90),
(2, 'Teclado Mecânico', 'Periféricos', 250.00),
(3, 'Monitor 27', 'Monitores', 1450.00),
(4, 'Headset Gamer', 'Áudio', 320.50);

-- Inserindo clientes
INSERT INTO customers VALUES
(1, 'Rafael Silva', 'Recife'),
(2, 'Bruna Costa', 'Olinda'),
(3, 'Pedro Marques', 'Jaboatão');

-- Inserindo pedidos
INSERT INTO orders VALUES
(1001, 1, 1, 1, '2024-01-01'),
(1002, 1, 2, 1, '2024-01-02'),
(1003, 2, 4, 2, '2024-01-05'),
(1004, 3, 3, 1, '2024-01-10'),
(1005, 1, 1, 3, '2024-02-01');
