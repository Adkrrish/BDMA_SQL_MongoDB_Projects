-- Stress Test
-- This script includes insert, update, delete, and cascade effect testing

-- Insert 20 Records into User Table
INSERT INTO User (UserID, Name, Email, SubscriptionType)
VALUES 
('U050', 'Alice Johnson', 'alice50@example.com', 'Premium'),
('U051', 'Bob Smith', 'bob51@example.com', 'Free'),
('U052', 'Charlie Davis', 'charlie52@example.com', 'Premium'),
('U053', 'David Wilson', 'david53@example.com', 'Free'),
('U054', 'Eve Martin', 'eve54@example.com', 'Premium'),
('U055', 'Frank Thomas', 'frank55@example.com', 'Free'),
('U056', 'Grace Lee', 'grace56@example.com', 'Premium'),
('U057', 'Hank White', 'hank57@example.com', 'Free'),
('U058', 'Ivy Green', 'ivy58@example.com', 'Premium'),
('U059', 'Jack Black', 'jack59@example.com', 'Free');

-- Insert Records into MusicLabel Table
INSERT INTO MusicLabel (LabelID, Name, EstablishedYear, ContactInfo, Headquarters)
VALUES 
('L050', 'Warner Music', 1958, 'info@warner.com', 'London'),
('L051', 'Atlantic Records', 1947, 'info@atlantic.com', 'New York');

-- Insert into Artist Table
INSERT INTO Artist (ArtistID, Name, StageName, Birthdate, Genre, ContactInfo)
VALUES 
('A050', 'Bruno Mars', 'Bruno', '1985-10-08', 'Pop', 'bruno@music.com'),
('A051', 'Taylor Swift', 'Taylor', '1989-12-13', 'Pop', 'taylor@music.com');

-- Insert into Album Table
INSERT INTO Album (AlbumID, Title, ReleaseDate, Genre, LabelID, ArtistID)
VALUES 
('AL050', 'Unorthodox Jukebox', '2012-12-07', 'Pop', 'L050', 'A050'),
('AL051', '1989', '2014-10-27', 'Pop', 'L051', 'A051');

-- Insert into Track Table
INSERT INTO Track (TrackID, Title, Duration, AlbumID)
VALUES 
('T050', 'Locked Out of Heaven', '3:54', 'AL050'),
('T051', 'Shake It Off', '3:39', 'AL051');

-- Insert into Playlist Table
INSERT INTO Playlist (PlaylistID, Name, CreatedBy, CreationDate, UserID)
VALUES 
('PL050', 'Pop Hits', 'Alice', '2025-03-16', 'U050'),
('PL051', 'Party Mix', 'Bob', '2025-03-16', 'U051');

-- Insert into PlaylistTrack Table
INSERT INTO PlaylistTrack (PlaylistID, TrackID)
VALUES 
('PL050', 'T050'),
('PL051', 'T051');


-- Update Records in Each Table
UPDATE User SET SubscriptionType = 'Premium' WHERE UserID IN ('U051', 'U053');
UPDATE Playlist SET Name = CONCAT(Name, ' (Updated)') WHERE PlaylistID IN ('PL050', 'PL051');
UPDATE Artist SET Genre = 'R&B' WHERE ArtistID = 'A051';
UPDATE Album SET Genre = 'R&B' WHERE AlbumID = 'AL051';
UPDATE Track SET Title = CONCAT(Title, ' - Remastered') WHERE TrackID = 'T050';

-- Delete and Test Cascading Effects
DELETE FROM User WHERE UserID IN ('U050', 'U051');
DELETE FROM Playlist WHERE PlaylistID IN ('PL050', 'PL051');
DELETE FROM Track WHERE TrackID IN ('T050', 'T051');
DELETE FROM Artist WHERE ArtistID = 'A051';


-- Check for Duplicates in PlaylistTrack Table
SELECT PlaylistID, TrackID,
count(*) FROM PlaylistTrack
GROUP BY PlaylistID, TrackID
HAVING count(*) >1 ;