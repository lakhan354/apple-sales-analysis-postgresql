CREATE INDEX idx_sales_store_id
ON sales(store_id);

CREATE INDEX idx_sales_product_id
ON sales(product_id);

CREATE INDEX idx_sales_sale_date
ON sales(sale_date);

CREATE INDEX idx_warranty_sale_id
ON warranty(sale_id);

CREATE INDEX idx_products_category_id
ON products(category_id);
