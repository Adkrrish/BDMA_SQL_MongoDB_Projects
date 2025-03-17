USE MusicStreaming;

-- Stress Test for 1st Normal Form (1NF) 
-- Checking for atomicity, unique primary keys, and no repeating groups

-- Check for multi-valued attributes in User
SELECT * FROM User 
WHERE Name LIKE '%,%' 
   OR Email LIKE '%,%' 
   OR SubscriptionType LIKE '%,%';
   
-- Check for multi-valued attributes in Artist
SELECT * FROM Artist 
WHERE Name LIKE '%,%' 
   OR StageName LIKE '%,%' 
   OR Genre LIKE '%,%';

-- Check for multi-valued attributes in Album
SELECT * FROM Album 
WHERE Title LIKE '%,%' 
   OR Genre LIKE '%,%';

-- Check for multi-valued attributes in Track
SELECT * FROM Track 
WHERE Title LIKE '%,%';

-- Check for multi-valued attributes in Playlist
SELECT * FROM Playlist 
WHERE Name LIKE '%,%';

-- Check for multi-valued attributes in MusicLabel
SELECT * FROM MusicLabel 
WHERE Name LIKE '%,%' 
   OR Headquarters LIKE '%,%';

-- Check for multi-valued attributes in Contract
SELECT * FROM Contract 
WHERE ContractTerms LIKE '%,%';


-- 2NF (Second Normal Form) Stress Testing

-- 1. Check for Composite Primary Keys
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'musicstreaming' 
AND CONSTRAINT_NAME = 'PRIMARY'
GROUP BY TABLE_NAME
HAVING COUNT(*) > 1;

-- 2. Check for Partial Dependencies in PlaylistTrack
SELECT * FROM PlaylistTrack
WHERE PlaylistID IN (
    SELECT PlaylistID FROM PlaylistTrack 
    GROUP BY PlaylistID 
    HAVING COUNT(DISTINCT TrackID) > 1
);

-- 3. Check for Partial Dependencies in Contract
SELECT * FROM Contract
WHERE ContractID IN (
    SELECT ContractID FROM Contract 
    GROUP BY ContractID 
    HAVING COUNT(DISTINCT ArtistID) > 1
);

-- 4. Check for Partial Dependencies in Album
SELECT AlbumID, LabelID, COUNT(DISTINCT ArtistID)
FROM Album
GROUP BY AlbumID, LabelID
HAVING COUNT(DISTINCT ArtistID) > 1;

-- 5. Check for Partial Dependencies in Track Table
SELECT AlbumID, COUNT(DISTINCT Title)
FROM Track
GROUP BY AlbumID
HAVING COUNT(DISTINCT Title) > 1;
