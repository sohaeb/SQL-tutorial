
# SQL Statments:
#############################################################################################################################################

#####################################

##### Display all Columns of a table:

#####################################
SELECT
c.name 'Column Name'
--,
--t.Name 'Data type',
--c.max_length 'Max Length',
--c.precision ,
--c.scale ,
--c.is_nullable,
--ISNULL(i.is_primary_key, 0) 'Primary Key'
FROM

sys.columns c
INNER JOIN
sys.types t ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN
sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
LEFT OUTER JOIN
sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
WHERE
c.object_id = OBJECT_ID('TEvents')

#####################################

############  Output  ###############

#####################################

------------
Column Name:
------------
EventID
EventCodeNo
EventCodeNo
EventCodeNo
EventCodeNo
EventDate
EventDate
EventDate
EventDate
EventDate
SystemID
SystemID
SystemID
PositionID
FobID
FobID
UserID
EngineID
FobSerialNumber
FobSerialNumber
AlarmPending
AlarmClearedDate
AlarmClearedUserID
SequenceNo

#############################################################################################################################################

###############################################

##### Search for a Column in the whole Databse

################################################

select * from INFORMATION_SCHEMA.COLUMNS
where COLUMN_NAME like '%sequenceno%'
order by TABLE_NAME


select * from INFORMATION_SCHEMA.COLUMNS
where COLUMN_NAME like '%sequenceno%'
order by TABLE_NAME

#############
#           #
#    OR     #
#           #
#############

SELECT 
   c.name 'Column Name',
   t.name,
   t.name +
   CASE WHEN t.name IN ('char', 'varchar','nchar','nvarchar') THEN '('+

             CASE WHEN c.max_length=-1 THEN 'MAX'

                  ELSE CONVERT(VARCHAR(4),

                               CASE WHEN t.name IN ('nchar','nvarchar')

                               THEN  c.max_length/2 ELSE c.max_length END )

                  END +')'

          WHEN t.name IN ('decimal','numeric')

                  THEN '('+ CONVERT(VARCHAR(4),c.precision)+','

                          + CONVERT(VARCHAR(4),c.Scale)+')'

                  ELSE '' END

   as "DDL name",
   c.max_length 'Max Length in Bytes',
   c.precision ,
   c.scale ,
   c.is_nullable,
   ISNULL(i.is_primary_key, 0) 'Primary Key'
FROM    
   sys.columns c
INNER JOIN 
   sys.types t ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN 
   sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
LEFT OUTER JOIN 
   sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
WHERE
   c.object_id = OBJECT_ID('YourTableName')

#############################################################################################################################################

##############################################

################ Join Tutorial ###############

##############################################


select 

Column1ONe
Column2Two

SuhaibTable.Column3Three
SenanTable.Column4Four

From [TrakaWEb].[dbo].[AnasTable]

LEFT JOIN 


############################################################################################################