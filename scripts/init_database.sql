/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

--must have a database 'DataWarehouse' created 

create schema bronze;
create schema silver;
create schema gold;
