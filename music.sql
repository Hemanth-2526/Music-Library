CREATE DATABASE music_libb;
USE music_libb;

CREATE TABLE `album` (
  `AlbumID` int(11) NOT NULL CHECK (`AlbumID` >= 10000 AND `AlbumID` <= 99999),
  `SongCount` int(11) NOT NULL CHECK (`SongCount` > 0),
  `name` varchar(255) DEFAULT NULL,
  `ArtistID` int(11) NOT NULL CHECK (`ArtistID` >= 1000 AND `ArtistID` <= 9999),
  PRIMARY KEY (`AlbumID`),
  KEY `ArtistID` (`ArtistID`)
);











CREATE TABLE `artist` (
  `Age` int(11) NOT NULL,
  `StageName` varchar(255) NOT NULL,
  `RecordLabel` varchar(255) DEFAULT NULL,
  `ArtistID` int(11) NOT NULL CHECK (`ArtistID` >= 1000 AND `ArtistID` <= 9999),
  `Description` text DEFAULT NULL,
  `OriginCountry` varchar(255) NOT NULL,
  PRIMARY KEY (`ArtistID`)
);



CREATE TABLE `genre` (
  `GenreID` int(11) NOT NULL CHECK (`GenreID` > 0 AND `GenreID` < 1000),
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`GenreID`),
  UNIQUE KEY `Name` (`Name`)
);



CREATE TABLE `playlist` (
  `PlaylistID` int(11) NOT NULL CHECK (`PlaylistID` >= 10000 AND `PlaylistID` <= 99999),
  `Name` varchar(255) NOT NULL,
  `SongCount` int(11) NOT NULL CHECK (`SongCount` > 0),
  `Description` text DEFAULT NULL,
  `GenreID` int(11) NOT NULL CHECK (`GenreID` > 0 AND `GenreID` < 1000),
  PRIMARY KEY (`PlaylistID`),
  KEY `GenreID` (`GenreID`)
);


CREATE TABLE `playlist_song` (
  `SongID` int(11) NOT NULL CHECK (`SongID` >= 100000 AND `SongID` <= 999999),
  `PlaylistID` int(11) NOT NULL CHECK (`PlaylistID` >= 10000 AND `PlaylistID` <= 99999),
  PRIMARY KEY (`SongID`,`PlaylistID`),
  KEY `PlaylistID` (`PlaylistID`),
  CONSTRAINT `FK_playlist_song_playlist` FOREIGN KEY (`PlaylistID`) REFERENCES `playlist` (`PlaylistID`),
  CONSTRAINT `FK_playlist_song_song` FOREIGN KEY (`SongID`) REFERENCES `song` (`SongID`)
);

CREATE TABLE `podcast` (
  `PodcastID` int(11) NOT NULL CHECK (`PodcastID` >= 1000 AND `PodcastID` <= 9999),
  `Name` varchar(255) NOT NULL,
  `EpisodeNo` int(11) NOT NULL CHECK (`EpisodeNo` > 0),
  `Description` text DEFAULT NULL,
  `YearReleased` int(11) NOT NULL CHECK (`YearReleased` > 1600 AND `YearReleased` <= 2021),
  `Length` time NOT NULL,
  `ArtistID` int(11) NOT NULL CHECK (`ArtistID` >= 1000 AND `ArtistID` <= 9999),
  PRIMARY KEY (`PodcastID`),
  KEY `ArtistID` (`ArtistID`),
  CONSTRAINT `FK_podcast_artist` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`)
);



CREATE TABLE `song` (
  `SongID` int(11) NOT NULL CHECK (`SongID` >= 100000 AND `SongID` <= 999999),
  `Name` varchar(255) NOT NULL,
  `YearReleased` int(11) NOT NULL CHECK (`YearReleased` >= 1600 AND `YearReleased` <= 2021),
  `RecordLabel` varchar(255) DEFAULT NULL,
  `Language` varchar(255) NOT NULL,
  `Length` time NOT NULL,
  `ArtistID` int(11) NOT NULL CHECK (`ArtistID` >= 1000 AND `ArtistID` <= 9999),
  `AlbumID` int(11) NOT NULL CHECK (`AlbumID` >= 10000 AND `AlbumID` <= 99999),
  PRIMARY KEY (`SongID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `AlbumID` (`AlbumID`),
  CONSTRAINT `FK_song_artist` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`),
  CONSTRAINT `FK_song_album` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`AlbumID`)
);






CREATE TABLE `users` (
  `UserID` int(11) NOT NULL CHECK (`UserID` > 10000 AND `UserID` <= 99999),
  `Email` varchar(255) NOT NULL CHECK (`Email` LIKE '%@%'),
  `Name` varchar(255) NOT NULL,
  `MembershipPlan` varchar(255) NOT NULL CHECK (`MembershipPlan` IN ('Standard','Premium')),
  PRIMARY KEY (`UserID`)
);


CREATE TABLE `user_artist` (
  `ArtistID` int(11) NOT NULL CHECK (`ArtistID` >= 1000 and `ArtistID` <= 9999),
  `UserID` int(11) NOT NULL CHECK (`UserID` > 10000 and `UserID` <= 99999),
  PRIMARY KEY (`ArtistID`,`UserID`),
  KEY `UserID` (`UserID`)
);

CREATE TABLE `user_friend` (
  `UserID` int(11) NOT NULL CHECK (`UserID` > 10000 and `UserID` <= 99999),
  `FriendUserID` int(11) NOT NULL CHECK (`FriendUserID` > 10000 and `FriendUserID` <= 99999),
  PRIMARY KEY (`UserID`,`FriendUserID`),
  KEY `FriendUserID` (`FriendUserID`)
);

CREATE TABLE `user_playlist` (
  `PlaylistID` int(11) NOT NULL CHECK (`PlaylistID` >= 10000 and `PlaylistID` <= 99999),
  `UserID` int(11) NOT NULL CHECK (`UserID` > 10000 and `UserID` <= 99999),
  PRIMARY KEY (`PlaylistID`,`UserID`),
  KEY `UserID` (`UserID`)
);

CREATE TABLE `user_podcast` (
  `PodcastID` int(11) NOT NULL CHECK (`PodcastID` >= 1000 and `PodcastID` <= 9999),
  `UserID` int(11) NOT NULL CHECK (`UserID` > 10000 and `UserID` <= 99999),
  PRIMARY KEY (`PodcastID`,`UserID`),
  KEY `UserID` (`UserID`)
);

CREATE TABLE `user_song` (
  `SongID` int(11) NOT NULL CHECK (`SongID` >= 100000 and `SongID` <= 999999),
  `UserID` int(11) NOT NULL CHECK (`UserID` > 10000 and `UserID` <= 99999),
  PRIMARY KEY (`SongID`,`UserID`),
  KEY `UserID` (`UserID`)
);

