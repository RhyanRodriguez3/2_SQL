/*
This is a SQL guide for beginner level queries. 
We will be going over statement structure (the syntax and major clauses) and basic functions for data manipulation.
*/


-- This is the basic statement structure to retreive data from the db.
        SELECT ColumnNames(s) AS RenameColumn(s)
        FROM TableName
        JOIN TableName1 AS RenamedTable ON RenamedTable1.IDColumnName = RenamedTable2.IDColumnName
        JOIN TableName3 AS RenamedTable3 ON RenamedTable2.IDColumnName = RenamedTable3.IDColumnName -- To JOIN more than one table, simply repeat the statement and connect the ID columns.
          /*
          JOIN clauses allow you to pull data from multiple tables.
          INNER JOIN only pulls rows from table columns whose ID match, and exclude values that don't.
          LEFT/RIGHT JOINs pull rows based on the original table columns. 
          FULL OUTER JOIN pulls all table columns and rows.
          */
        WHERE YourCondition -- Filters rows based on specified conditions. You define the conditions with operators. 
          /*
          Operators: 
            '=', '>=' (Greater than or equal to), '<>' (Not Equal), 
            'AND' (Specify multiple conditions), 'BETWEEN' (Specify a range), 'LIKE' (Search for Patterns), 'IN' (Specify your desired values)
          String/text values are:
            '%' wildcard which represents zero or multiple characters, '_' represents a single character*
          */
        GROUP BY ColumnName(s) -- Used to group rows that have the same values into summary rows. Often followed by a function.
        HAVING FUNCTION(ColumnName) -- The HAVING clause replaces the WHERE clause when you need to specify a function as a condition.
        ORDER BY ColumnNameYouWantSorted ON SpecifiedCriteria -- Sort the query result.
        LIMIT;


-- SELF JOIN is when you join a table to itself. Used for hierchical data, when you need to find data IDs connected to other columns within the same table and creating duplicate columns.
    SELECT TableName.ColumnName, TableName2.ColumnName
    FROM TableName tbl1
    INNER JOIN tbl1.IDColumnName = tbl2.IDColumnName;

-- UNION statement appends rows from separate tables with double SELECT statements.
    SELECT * FROM TableName1 WHERE YourCondition, 'YourBin' AS BinName  -- This creates a column with your string value as the entire column's value.
    UNION -- DISTINCT is default or you can use ALL to append it all
    SELECT * FROM TableName2 WHERE YourCondition, 'YourBin' AS BinName;        


-- Functions are calculations to handle dataset values. For a list of all SQL functions and syntax, refer to the RDBMS' documentation. The ones below are the most commonly used.
        String Functions -- Deals with string/text columns values
            LENGTH(ColumnName), UPPER(), 'L or R'TRIM(), LEFT(), RIGHT()
            CONCAT() /*used to combine column values*/ , FORMAT() /* Used to change the format of the value*/
            SUBSTRING(), -- This is great for finding values in columns
            REPLACE() -- To replace string characters in column values
                
        Aggregate Functions -- Deals with column value calculations
            SUM(), AVG(), MIN(), MAX(), COUNT(), STDEV() / STDEV_SAMP() / STDEV_POP(), VAR()
            GROUP_CONCAT()
            DISTINCT Removes duplicate records from a column.

-- CASE statements are used as IF THEN statements from excel.
        SELECT ColumnName
          CASE 
            WHEN ColumnName YourCondition THEN YourCondition
            WHEN ColumnName2 YourCondition THEN YourCondition -- You can create multiple when conditions
          END AS NameCreatedColumn
        FROM ColumnName;


