# Music Library

## Overview
The **Music Library** is a database system built using MySQL to manage and organize songs, albums, playlists, podcasts, and user interactions efficiently. The database maintains relationships between users, artists, songs, and playlists, providing a structured and scalable approach to music management.

## Features
- Store and retrieve detailed information about **songs, albums, artists, and podcasts**.
- Maintain **user interactions** with songs, artists, and podcasts.
- Categorize music by **genre, playlist, and album**.
- Manage **user memberships** and their listening preferences.

## Database Schema

### 1. **Album Table**
Stores information about albums.
```sql
Album (Album_ID, SongCount, Name, Age)
```
- **Album_ID**: Unique identifier for the album.
- **SongCount**: Number of songs in the album.
- **Name**: Name of the album.
- **Age**: Age of the album.

### 2. **Artist Table**
Stores details about music artists.
```sql
Artist (ArtistID, StageName, Age, RecordLabel, Description, OriginCountry)
```
- **ArtistID**: Unique identifier for the artist.
- **StageName**: Artist's professional name.
- **Age**: Age of the artist.
- **RecordLabel**: Label under which the artist releases music.
- **Description**: Additional details about the artist.
- **OriginCountry**: Artist's country of origin.

### 3. **Genre Table**
Stores different music genres.
```sql
Genre (GenreID, Name)
```
- **GenreID**: Unique identifier for the genre.
- **Name**: Genre name (e.g., Pop, Rock, Jazz).

### 4. **Playlist Table**
Stores information about user-created playlists.
```sql
Playlist (PlaylistID, Name, SongCount, Description, GenreID)
```
- **PlaylistID**: Unique identifier for the playlist.
- **Name**: Name of the playlist.
- **SongCount**: Number of songs in the playlist.
- **Description**: Brief details about the playlist.
- **GenreID**: Links to the genre category.

### 5. **Playlist_Song Table**
Associates songs with playlists.
```sql
Playlist_song (SongID, PlaylistID)
```
- **SongID**: Unique identifier of the song.
- **PlaylistID**: Unique identifier of the playlist.

### 6. **Podcast Table**
Stores podcast details.
```sql
Podcast (PodcastID, Name, EpisodeNO, Description, YearReleased, Length, ArtistID)
```
- **PodcastID**: Unique identifier for the podcast.
- **Name**: Name of the podcast.
- **EpisodeNO**: Episode number of the podcast.
- **Description**: Details about the podcast.
- **YearReleased**: Year the podcast was released.
- **Length**: Duration of the podcast.
- **ArtistID**: Links to the artist who created the podcast.

### 7. **Song Table**
Stores information about individual songs.
```sql
Song (SongID, Name, YearReleased, RecordLabel, Language, Length, ArtistID, AlbumID)
```
- **SongID**: Unique identifier for the song.
- **Name**: Song title.
- **YearReleased**: Release year of the song.
- **RecordLabel**: Label under which the song was released.
- **Language**: Language of the song.
- **Length**: Duration of the song.
- **ArtistID**: Links to the artist who performed the song.
- **AlbumID**: Links to the album it belongs to.

### 8. **User Table**
Stores user information.
```sql
User (UserID, Email, Name, MembershipPlan)
```
- **UserID**: Unique identifier for the user.
- **Email**: User's email address.
- **Name**: User's name.
- **MembershipPlan**: Subscription type (e.g., Free, Premium).

### 9. **User_Artist Table**
Tracks user interactions with artists.
```sql
User_artist (ArtistID, UserID)
```
- **ArtistID**: Unique identifier of the artist.
- **UserID**: Unique identifier of the user.

### 10. **User_Podcast Table**
Tracks user interactions with podcasts.
```sql
User_podcast (PodcastID, UserID)
```
- **PodcastID**: Unique identifier of the podcast.
- **UserID**: Unique identifier of the user.

### 11. **User_Song Table**
Tracks user interactions with songs.
```sql
User_song (SongID, UserID)
```
- **SongID**: Unique identifier of the song.
- **UserID**: Unique identifier of the user.

## Installation and Setup
### Prerequisites
- MySQL installed on your system.
- A MySQL client (such as MySQL Workbench or phpMyAdmin).

### Steps to Set Up
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/yourusername/music-library.git
   cd music-library
   ```
2. **Import the SQL Schema:**
   - Open MySQL Workbench or command line.
   - Create a new database:
     ```sql
     CREATE DATABASE MusicLibrary;
     USE MusicLibrary;
     ```
   - Import the provided SQL script:
     ```sh
     mysql -u root -p MusicLibrary < music_library.sql
     ```

3. **Verify Tables:**
   ```sql
   SHOW TABLES;
   ```
   Ensure all tables listed above are created.

## Future Enhancements
- Implement **stored procedures** for complex queries.
- Add **triggers** to automate playlist song count updates.
- Integrate with **a frontend application** for user interaction.
- Develop an **API** for external applications to access data.

## License
This project is open-source and available under the **MIT License**.

## Contributors
- Hemanth - Developer & Database Designer

## Contact
For any queries, feel free to reach out at **354he.35@gmail.com**.

