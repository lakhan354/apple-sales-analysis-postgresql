CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE stores (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,

    category_id VARCHAR(10) NOT NULL,

    launch_date DATE NOT NULL,

    price NUMERIC(10,2) NOT NULL
        CHECK (price > 0),

    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

CREATE TABLE sales (
    sale_id VARCHAR(20) PRIMARY KEY,

    sale_date DATE NOT NULL,

    store_id VARCHAR(10) NOT NULL,

    product_id VARCHAR(10) NOT NULL,

    quantity INT NOT NULL
        CHECK (quantity > 0),

    CONSTRAINT fk_sales_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id),

    CONSTRAINT fk_sales_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE warranty (
    claim_id VARCHAR(20) PRIMARY KEY,

    claim_date DATE NOT NULL,

    sale_id VARCHAR(20) NOT NULL,

    repair_status VARCHAR(50) NOT NULL,

    CONSTRAINT fk_warranty_sale
        FOREIGN KEY (sale_id)
        REFERENCES sales(sale_id)
);