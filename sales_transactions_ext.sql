CREATE TABLE sales_transactions_ext
(PROD_ID NUMBER,
 CUST_ID NUMBER,
 TIME_ID DATE,
 CHANNEL_ID CHAR,
 PROMO_ID NUMBER,
 QUANTITY_SOLD NUMBER,
 AMOUNT_SOLD NUMBER(10,2),
 UNIT_COST NUMBER(10,2),
 UNIT_PRICE NUMBER(10,2))
ORGANIZATION external
(TYPE oracle_loader
 DEFAULT DIRECTORY data_file_dir
 ACCESS PARAMETERS
  (RECORDS DELIMITED BY NEWLINE
   CHARACTERSET AL32UTF8
   PREPROCESSOR exec_file_dir:'zcat'
   BADFILE log_file_dir:'sh_sales.bad_xt'
   LOGFILE log_file_dir:'sh_sales.log_xt'
   FIELDS TERMINATED BY "|" LDRTRIM
  ( PROD_ID,
    CUST_ID,
    TIME_ID,
    CHANNEL_ID,
    PROMO_ID,
    QUANTITY_SOLD,
    AMOUNT_SOLD,
    UNIT_COST,
    UNIT_PRICE))
 location ('sh_sales.dat.gz')
)REJECT LIMIT UNLIMITED;