-- 1. Top Artists Based on Track Count
SELECT A.ArtistID, A.Name, COUNT(T.TrackID) AS TotalTracks
FROM Artist A
JOIN Album AL ON A.ArtistID = AL.ArtistID
JOIN Track T ON AL.AlbumID = T.AlbumID
GROUP BY A.ArtistID, A.Name
ORDER BY TotalTracks DESC
LIMIT 5;

-- 2. Most Popular Playlists Based on Track Count
SELECT P.PlaylistID, P.Name, COUNT(PT.TrackID) AS TotalTracks
FROM Playlist P
JOIN PlaylistTrack PT ON P.PlaylistID = PT.PlaylistID
GROUP BY P.PlaylistID, P.Name
ORDER BY TotalTracks DESC
LIMIT 5;

-- 3. Subscription Type Analysis
SELECT SubscriptionType, COUNT(UserID) AS UserCount,
       (COUNT(UserID) * 100.0 / (SELECT COUNT(*) FROM User)) AS Percentage
FROM User
GROUP BY SubscriptionType;

-- 4. Music Label Performance (Album Count per Label)
SELECT ML.LabelID, ML.Name AS LabelName, COUNT(A.AlbumID) AS TotalAlbums
FROM MusicLabel ML
JOIN Album A ON ML.LabelID = A.LabelID
GROUP BY ML.LabelID, ML.Name
ORDER BY TotalAlbums DESC;
