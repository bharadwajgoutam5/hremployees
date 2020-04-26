Select * FROM sales_external EXTERNAL MODIFY (LOCATION ('sales_9.csv') 
   REJECT LIMIT UNLIMITED);
