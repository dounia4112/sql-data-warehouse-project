
/*
-- use the BULK insert to insert the whole data at once
Since the data is in my local machine i need to execute this scommand in \psql:
	TRUNCATE TABLE bronze.crm_cust_info;  -- to delete all the data before loading
	\copy bronze.crm_cust_info FROM 'file path' 
	WITH (FORMAT CSV, HEADER true, DELIMITER ',');

Otherwise, use the below query
*/

CREATE OR ALTER PROCEDURE bronze.load_branze AS
BEGIN
	DECLARE @start_time TIMESTAMP WITHOUT TIME ZONE, @end_time TIMESTAMP WITHOUT TIME ZONE
	BEGIN TRY
		PRINT '==============================';
		PRINT 'Laoding Bronze Layer';
		PRINT '==============================';
	
		PRINT '------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
	
		PRINT '>> Inserting Data into: bronze.crm_cust_info';
		COPY bronze.crm_cust_info
		FROM 'C:\Users\Dounia Toubal\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FORMAT CSV ,
			HEADER true,
			DELIMITER  ','
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '-------------------'
		--SELECT * FROM bronze.crm_cust_info;
		
		---------------------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		
		PRINT '>> Inserting Data into: bronze.crm_prd_info';
		COPY bronze.crm_prd_info
		FROM 'C:\Users\Dounia Toubal\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FORMAT CSV ,
			HEADER true,
			DELIMITER  ','
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '-------------------'
		--SELECT * FROM bronze.crm_prd_info;
		
		--SELECT COUNT(*) from bronze.crm_prd_info;
		
		---------------------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
	
		PRINT '>> Inserting Data into: bronze.crm_sales_details';
		COPY bronze.crm_sales_details
		FROM 'C:\Users\Dounia Toubal\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FORMAT CSV ,
			HEADER true,
			DELIMITER  ','
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '-------------------'
		--SELECT * FROM bronze.crm_sales_details;
		
		--SELECT COUNT(*) from bronze.crm_sales_details;
		
		---------------------------------------------------------------------
	
		PRINT '------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------';
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
	
		PRINT '>> Inserting Data into: bronze.erp_cust_az12';
		COPY bronze.erp_cust_az12
		FROM 'C:\Users\Dounia Toubal\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FORMAT CSV ,
			HEADER true,
			DELIMITER  ','
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '-------------------'
		--SELECT * FROM bronze.erp_cust_az12;
		
		--SELECT COUNT(*) from bronze.erp_cust_az12;
		
		---------------------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
	
		PRINT '>> Inserting Data into: bronze.erp_loc_a101';
		COPY bronze.erp_loc_a101
		FROM 'C:\Users\Dounia Toubal\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FORMAT CSV ,
			HEADER true,
			DELIMITER  ','
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '-------------------'
		--SELECT * FROM bronze.erp_loc_a101;
		
		--SELECT COUNT(*) from bronze.erp_loc_a101;
		
		---------------------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	
		PRINT '>> Inserting Data into: bronze.erp_px_cat_g1v2';
		COPY bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Dounia Toubal\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FORMAT CSV ,f
			HEADER true,
			DELIMITER  ','
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '-------------------'
		--SELECT * FROM bronze.erp_px_cat_g1v2;
		
		--SELECT COUNT(*) from bronze.erp_px_cat_g1v2;
	END TRY 
	BEGIN CATCH 
		PRINT '=====================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS VARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS VARCHAR);
		PRINT '=====================================';
	END CATCH
END

