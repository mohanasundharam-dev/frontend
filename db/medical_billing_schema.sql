-- Medical Billing Database Schema (PostgreSQL style)

CREATE TABLE companies (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  gstin VARCHAR(20),
  address TEXT,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE customers (
  id BIGSERIAL PRIMARY KEY,
  customer_code VARCHAR(30) UNIQUE NOT NULL,
  name VARCHAR(120) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(120),
  address TEXT,
  opening_balance NUMERIC(12,2) DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE suppliers (
  id BIGSERIAL PRIMARY KEY,
  supplier_code VARCHAR(30) UNIQUE NOT NULL,
  name VARCHAR(120) NOT NULL,
  phone VARCHAR(20),
  gstin VARCHAR(20),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products (
  id BIGSERIAL PRIMARY KEY,
  sku VARCHAR(40) UNIQUE NOT NULL,
  name VARCHAR(200) NOT NULL,
  hsn_code VARCHAR(20),
  unit VARCHAR(20) NOT NULL,
  mrp NUMERIC(12,2) NOT NULL,
  purchase_price NUMERIC(12,2) NOT NULL,
  sale_price NUMERIC(12,2) NOT NULL,
  gst_rate NUMERIC(5,2) DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE stock_batches (
  id BIGSERIAL PRIMARY KEY,
  product_id BIGINT NOT NULL REFERENCES products(id),
  batch_no VARCHAR(40) NOT NULL,
  expiry_date DATE,
  qty NUMERIC(12,2) NOT NULL,
  free_qty NUMERIC(12,2) DEFAULT 0,
  purchase_rate NUMERIC(12,2) NOT NULL,
  mrp NUMERIC(12,2) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE purchases (
  id BIGSERIAL PRIMARY KEY,
  invoice_no VARCHAR(40) NOT NULL,
  supplier_id BIGINT NOT NULL REFERENCES suppliers(id),
  invoice_date DATE NOT NULL,
  taxable_amount NUMERIC(12,2) NOT NULL,
  tax_amount NUMERIC(12,2) NOT NULL,
  discount_amount NUMERIC(12,2) DEFAULT 0,
  net_amount NUMERIC(12,2) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE purchase_items (
  id BIGSERIAL PRIMARY KEY,
  purchase_id BIGINT NOT NULL REFERENCES purchases(id) ON DELETE CASCADE,
  product_id BIGINT NOT NULL REFERENCES products(id),
  stock_batch_id BIGINT REFERENCES stock_batches(id),
  qty NUMERIC(12,2) NOT NULL,
  rate NUMERIC(12,2) NOT NULL,
  gst_rate NUMERIC(5,2) NOT NULL,
  amount NUMERIC(12,2) NOT NULL
);

CREATE TABLE bills (
  id BIGSERIAL PRIMARY KEY,
  bill_no VARCHAR(40) UNIQUE NOT NULL,
  customer_id BIGINT REFERENCES customers(id),
  bill_date TIMESTAMP NOT NULL,
  taxable_amount NUMERIC(12,2) NOT NULL,
  tax_amount NUMERIC(12,2) NOT NULL,
  discount_amount NUMERIC(12,2) DEFAULT 0,
  net_amount NUMERIC(12,2) NOT NULL,
  payment_mode VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE bill_items (
  id BIGSERIAL PRIMARY KEY,
  bill_id BIGINT NOT NULL REFERENCES bills(id) ON DELETE CASCADE,
  product_id BIGINT NOT NULL REFERENCES products(id),
  stock_batch_id BIGINT REFERENCES stock_batches(id),
  qty NUMERIC(12,2) NOT NULL,
  rate NUMERIC(12,2) NOT NULL,
  gst_rate NUMERIC(5,2) NOT NULL,
  discount_percent NUMERIC(5,2) DEFAULT 0,
  amount NUMERIC(12,2) NOT NULL
);

CREATE TABLE stock_ledgers (
  id BIGSERIAL PRIMARY KEY,
  product_id BIGINT NOT NULL REFERENCES products(id),
  stock_batch_id BIGINT REFERENCES stock_batches(id),
  txn_type VARCHAR(30) NOT NULL,
  reference_table VARCHAR(30),
  reference_id BIGINT,
  qty_in NUMERIC(12,2) DEFAULT 0,
  qty_out NUMERIC(12,2) DEFAULT 0,
  txn_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE settings (
  id BIGSERIAL PRIMARY KEY,
  setting_key VARCHAR(60) UNIQUE NOT NULL,
  setting_value TEXT NOT NULL,
  updated_at TIMESTAMP DEFAULT NOW()
);
