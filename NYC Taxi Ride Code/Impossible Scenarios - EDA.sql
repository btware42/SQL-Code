-- Discovering the number of records for each type of error found during the EDA
SELECT
	-- PickupDate is after today
	COUNT (CASE WHEN PickupDate > GETDATE() THEN 1 END) AS 'FuturePickup',
    -- DropOffDate is after today
	COUNT (CASE WHEN DropOffDate > GETDATE() THEN 1 END) AS 'FutureDropOff',
    -- PickupDate is after DropOffDate
	COUNT (CASE WHEN PickupDate > DropOffDate THEN 1 END) AS 'PickupBeforeDropoff',
    -- TripDistance is 0
	COUNT (CASE WHEN TripDistance = 0 THEN 1 END) AS 'ZeroTripDistance'  
FROM YellowTripData;