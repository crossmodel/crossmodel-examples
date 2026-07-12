-- Table: prd (Product)
CREATE TABLE prd (
    prd_id INT PRIMARY KEY,
    nm VARCHAR(100) NOT NULL,
    desc_txt VARCHAR(255),
    sku VARCHAR(50) UNIQUE NOT NULL
);

-- Table: wh (Warehouse)
CREATE TABLE wh (
    wh_id INT PRIMARY KEY,
    nm VARCHAR(100) NOT NULL,
    loc VARCHAR(100)
);

-- Table: stk (Stock Level)
CREATE TABLE stk (
    stk_id INT PRIMARY KEY,
    prd_id INT NOT NULL,
    wh_id INT NOT NULL,
    qty INT NOT NULL,
    dt DATETIME NOT NULL,
    CONSTRAINT fk_stk_prd FOREIGN KEY (prd_id) REFERENCES prd(prd_id),
    CONSTRAINT fk_stk_wh FOREIGN KEY (wh_id) REFERENCES wh(wh_id)
);

-- Table: stx (Stock Transaction)
CREATE TABLE stx (
    stx_id INT PRIMARY KEY,
    prd_id INT NOT NULL,
    wh_id INT NOT NULL,
    qty INT NOT NULL,
    typ CHAR(1) NOT NULL, -- 'S' for Sale, 'P' for Purchase
    ref_id INT NOT NULL, -- Reference to sales or purchase shipment
    dt DATETIME NOT NULL,
    CONSTRAINT fk_stx_prd FOREIGN KEY (prd_id) REFERENCES prd(prd_id),
    CONSTRAINT fk_stx_wh FOREIGN KEY (wh_id) REFERENCES wh(wh_id)
);
