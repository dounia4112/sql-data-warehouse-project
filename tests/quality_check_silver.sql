SELECT * FROM bronze.crm_cust_info;

-- Check duplicate or null cst_id
SELECT cst_id, COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;


--Check for unwanted Spaces
-- Expectation : No Result
SELECT cst_firstname
FROM  bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

--Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info


--------------------------------------------------------------------------

SELECT * FROM bronze.crm_prd_info;

-- Check duplicate or null cst_id
SELECT prd_id, COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

--Check for unwanted Spaces
-- Expectation : No Result
SELECT prd_nrm
FROM  bronze.crm_prd_info
WHERE prd_nrm != TRIM(prd_nrm)

--Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info

-- Check duplicate or null or negative costs
SELECT prd_cost
FROM  bronze.crm_prd_info
WHERE  prd_cost < 0 OR prd_cost IS NULL

SELECT DISTINCT prd_line
FROM  bronze.crm_prd_info


SELECT * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt


------------------------------------------


SELECT 
	sls_ord_num ,
    sls_prd_key ,
    sls_cust_id ,
    sls_order_dt ,
    sls_ship_dt ,
    sls_due_dt ,
    sls_sales ,
    sls_quantity ,
    sls_price 
FROM bronze.crm_sales_details
WHERE sls_cust_id NOT IN (SELECT cst_id FROM silver.crm_cust_info)

SELECT 
NULLIF(sls_ship_dt, 0) sls_ship_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0 
	  OR LENGTH(CAST(sls_ship_dt AS TEXT)) != 8 
	  OR sls_ship_dt > 20250101


SELECT * 
FROM bronze.crm_sales_details
WHERE sls_order_dt > sls_ship_dt or sls_order_dt > sls_due_dt



SELECT 
    sls_sales ,
    sls_quantity ,
    sls_price ,
FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
or sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL 
OR sls_sales <=0 OR sls_quantity <=0 OR sls_price <=0




