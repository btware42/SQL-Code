-- Create a function to find the shift number taking the hour as an input parameter
CREATE FUNCTION dbo.GetShiftNumber (@Hour integer)
-- Specify return data type
RETURNS int
AS
BEGIN
RETURN
	-- 12am (0) to 9am (9) shift
	(CASE WHEN @Hour >= 0 AND @Hour < 9 THEN 1
     	  -- 9am (9) to 5pm (17) shift
		  WHEN @Hour >= 9 AND @Hour < 17 THEN 2
          -- 5pm (17) to 12am (24) shift
	      WHEN @Hour >= 17 AND @Hour < 24 THEN 3 END)
END;