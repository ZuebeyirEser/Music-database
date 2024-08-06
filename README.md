# Introduction

This report presents an in-depth analysis of a comprehensive music database designed to create of a digital music platform database. The database encompasses a wide range of entities including users, songs, albums, playlists, and user interactions such as listens, downloads, and ratings.

**Objectives**:

- To design a relational database to manage music data efficiently.
- To implement user functionalities such as creating playlists, browsing songs, and tracking listening habits.
- To ensure data integrity and optimize query performance.

**Scope**: The project includes designing the database schema, entity relation model, entity relation diagram, data normalization implementing the database using MYSQL through TH-AB internal tool **_MyPhpAdmin_**<sup>[\[1\]](#footnote-1)</sup>.

**Use case:** The database is designed to support a music application where users can register and manage their profiles. They can upload music, create albums, and add songs with detailed attributes. Users can listen to and download songs, with each action being tracked for future recommendations or analysis. They can also create and manage playlists, deciding whether to make them public or private. Other users can follow these playlists, with the start and end dates of following being recorded. Users can rate songs, providing valuable feedback for the platform and other users. Additionally, users can create and manage tracks, which are collections of songs. Each of these use cases leverages specific tables in the database, ensuring efficient data management and retrieval.

This report details the design and implementation of a comprehensive music database, developed as part of a collaborative project with our team.

**Team Members**:

- Zübeyir Eser
- Welat Irmak
- Hassaan Naveed
- Ashish Ghaskata
- Ahmed Mohammedseid

## Overview

The “User Stories” section describes the different types of users who will interact with the database and what their needs are. These user stories guide the design of the database. Moreover each group member has listed its own user story as well as user story to entity relationship model.

The “Entity-Relationship Model (ERM)” section details the ERM of the database, a conceptual tool for representing the data structures and their relationships. The “Tables and its Attributes” subsection lists all the tables in the database along with their attributes and defines the primary key for each table. The “Relations” subsection describes the relationships between the tables in the database, specifying the foreign keys and the nature of the relationship (one-to-one, one-to-many, or many-to-many).

The “Entity-Relationship Diagram (ERD)” section presents a visual representation of the ERM using an ERD, showing all entities, attributes, and relationships in the database.

The “Data Types and Constraints in Database Design” subsection discusses the different data types used in the database and any constraints applied to the attributes. The “Data Types” sub-subsection lists and describes the data types of each attribute in the database.

Finally, the “Normalization” section discusses the normalization process applied to the database. It explains how the database was decomposed into tables to eliminate redundancy and dependency anomalies, and specifies the normal form (1NF, 2NF, 3NF, BCNF) that each table satisfies.


# User Stories

**User Story 1:** _Retrieve the 10 Most Recent Song Additions to Playlists_

**As a** music streaming application user, **I want to** view the 10 most recent song additions to playlists, **so that** I can discover new music and see what other users are adding to their playlists.

**Acceptance Criteria 1:**

1. I navigate to the "Recent Additions" section, I should see a list of the 10 most recently added songs to any playlist
2. each entry should display the song name, playlist name, playlist id, date that added and user name
3. the songs should be ordered by the time they were added, with the most recent addition appearing first.
4. the list should update to reflect the 10 most recent additions.

**Solutions 1:**
``` sql
SELECT 
    S.Song_ID, 
    S.Song_Name, 
    PC.Playlist_ID, 
    P.Playlist_Name, 
    PC.Date_added, 
    U.User_ID, 
    U.Username
FROM 
    Songs S
INNER JOIN 
    playlistsContains PC ON S.Song_ID = PC.Song_ID
INNER JOIN 
    Playlist P ON PC.Playlist_ID = P.Playlist_ID
INNER JOIN 
    Users U ON P.Creator = U.User_ID
ORDER BY 
    PC.Date_added DESC
LIMIT 10;
```
**User Story 2:**

As professional DJ, I want to see all songs with more than 5000 views that are part of at least one track, sorted from increasing to decreasing order, so that I can discover popular songs that are used in tracks.

**Acceptance Criteria 2:**

1. The system should list all songs that have more than 5000 views.
2. The system should ensure that the listed songs are part of at least one track.
3. The system should sort the list of songs in decreasing order of views.
4. The system should display the song title, number of views, and the track(s) it is part of.
5. The system should handle any exceptions or errors gracefully and inform the user accordingly.

**Solutions 2:**
``` sql
SELECT 
    S.Song_ID, 
    S.Song_Name, 
    S.View_count,
    T.Track_Name
FROM 
    Songs S
INNER JOIN 
    Contains C ON S.Song_ID = C.Song_ID
INNER JOIN
    Track T ON C.Track_ID = T.Track_ID
WHERE 
    S.View_count > 1000
ORDER BY
    S.View_count  DESC;
```
**User Story 3:**

As a registered user of our music streaming platform, I want the system to provide me with a list of the top 5 songs ranked by view count, so that I can easily discover what's trending and popular in the music world. This list should also include detailed information about the album from which the song originates and the artist who performed it. This will help me explore the context of each song, learn more about the albums and artists behind them, and potentially discover more songs that I might enjoy. In addition, I would like to see the total number of times each of these top songs has been downloaded. This will give me an idea of the song's popularity beyond just the number of views, as it indicates how many users loved the song enough to download it.

**Acceptance Criteria 3**:

1. The system should retrieve the top 5 songs based on view count.
2. The details of each song should be displayed, including: Song title, Album name, Artist name
3. The total number of times each song has been downloaded should be displayed.
4. The list should be sorted in descending order of view count.
5. If two or more songs have the same view count, the song with the higher download count should be ranked higher.
6. If there are fewer than 5 songs in the database, the system should return all songs sorted by view count.
7. The system should handle the case where there are no songs in the database gracefully, displaying an appropriate message to the user.

**Solutions 3:**
``` sql
SELECT 
    s.Song_ID, 
    s.Song_Name, 
    s.View_count AS Song_View_Count, 
    a.Album_Name, 
    u.Username AS Artist_Name, 
    d.Total_Downloads
FROM 
    Songs s
JOIN 
    Album a ON s.Album_ID = a.Album_Id
JOIN 
    Users u ON a.User_ID = u.User_ID
LEFT JOIN 
    (SELECT Song_ID, COUNT(*) AS Total_Downloads FROM Downloads GROUP BY Song_ID) d ON s.Song_ID = d.Song_ID
ORDER BY 
    s.View_count DESC, 
    d.Total_Downloads DESC
LIMIT 5;
```

**User Story 4:**

As a data analyst, I want to see the top 3 most popular genres based on total views of songs within those genres, so that I can discover popular music and explore songs within those genres.

**Acceptance Criteria 4:**

1. The system should calculate the total views of all songs within each genre.
2. The system should rank the genres based on the total views of songs within those genres.
3. The system should display the top 3 genres with the highest total views.
4. For each of the top 3 genres, the system should display:

- The total number of songs within that genre.
- The total views of all songs within that genre.
- The top 3 songs within that genre based on view count.

1. The system should be able to handle a large number of songs and playlists without performance degradation.
2. The system should ensure that only songs added to public playlists are displayed, not those added to private playlists.

**Solutions 4:**
``` sql
WITH GenreViews AS (
    SELECT 
        Genre,
        COUNT(Song_ID) AS Num_Songs,
        SUM(View_count) AS Total_Views
    FROM 
        Songs
    GROUP BY 
        Genre
),
TopGenres AS (
    SELECT 
        Genre,
        Num_Songs,
        Total_Views,
        ROW_NUMBER() OVER (ORDER BY Total_Views DESC) AS Genre_Rank
    FROM 
        GenreViews
),
Top3Genres AS (
    SELECT 
        Genre,
        Num_Songs,
        Total_Views
    FROM 
        TopGenres
    WHERE 
        Genre_Rank <= 3
),
TopSongsInGenres AS (
    SELECT 
        s.Genre,
        s.Song_ID,
        s.Song_Name,
        s.View_count,
        ROW_NUMBER() OVER (PARTITION BY s.Genre ORDER BY s.View_count DESC) AS Song_Rank
    FROM 
        Songs s
    WHERE 
        s.Genre IN (SELECT Genre FROM Top3Genres)
)
SELECT 
    g.Genre,
    g.Num_Songs,
    g.Total_Views,
    ts.Song_ID,
    ts.Song_Name,
    ts.View_count
FROM 
    Top3Genres g
JOIN 
    TopSongsInGenres ts ON g.Genre = ts.Genre
WHERE 
    ts.Song_Rank <= 3
ORDER BY 
    g.Total_Views DESC, g.Genre, ts.Song_Rank;
```

**User Story 5:**

As a music platform user, I want to see the 10 most recent songs added to public playlists, so that I can discover new music and stay updated with the latest additions.

**Acceptance Criteria 5:**

1. he system should track the date and time when songs are added to public playlists.
2. The system should sort the songs based on the date and time they were added to the playlists, with the most recent songs appearing first.
3. The system should display the 10 most recent songs added to public playlists.
4. For each song, the system should display:

- The song ID.
- The song name.
- The playlist name it was added to.
- The date that it was added.

**Solutions 5:**
``` sql
SELECT 
    S.Song_ID, 
    S.Song_Name, 
    P.Playlist_Name, 
    PC.Date_added
FROM 
    Songs S
INNER JOIN 
    playlistsContains PC ON S.Song_ID = PC.Song_ID
INNER JOIN 
    Playlist P ON PC.Playlist_ID = P.Playlist_ID
WHERE 
    P.Privacy_Status = 'public'
ORDER BY 
    PC.Date_added DESC
LIMIT 10;
```

## **User story to ER Model**

The first user story requires the system to retrieve the 10 most recent song additions to playlists. This directly relates to the _playlistsContains_ table in your database, which records the _Song_ID_, _Playlist_ID_, and _Date_added_. To fulfill this user story, you would need to perform a query on this table to select the 10 most recent song additions.

The second user story involves a professional DJ who wants to see all songs with more than 5000 views that are part of at least one track. This involves the Songs and Contains tables. The Songs table has a View_count field, and the Contains table links songs to tracks. A query joining these two tables and filtering based on the _View_count_ field would fulfill this user story.

The third user story involves multiple tables. The user wants to see the top 5 songs ranked by view count, along with detailed information about the album and artist. This would involve the Songs, Album, and Users tables. The Songs table contains the _View_count_ field, the Album table can provide details about the album, and the Users table can provide details about the artist.

The fourth user story requires the system to provide the top 3 most popular genres based on total views of songs within those genres. This directly relates to the Songs table, which has fields for Genre and _View_count_. A query that groups by the Genre field and sums the _View_count_ field would fulfill this user story.

The fifth user story is similar to the first one, but it specifically involves public playlists. This would involve the _playlistsContains_ and Playlist tables. The Playlist table has a _Privacy_Status_ field that can be used to filter for public playlists.


# Entity-Relationship Model (ERM)

In this part we provide description of each table and its attributes in bullet points as well as its relations.

## Tables and its Attributes

**Users Table:** This table stores information about the users of the music platform.

- **User_ID** (Primary Key): Unique identifier for each user.
- **Username**: Name of the user.
- **Email**: Email address of the user (unique).
- **Location**: Location of the user.
- **User_type**: Type of user (e.g., listener, artist).

**Album Table:** This table contains information about the music albums created by users.

- **Album_ID** (Primary Key): Unique identifier for each album.
- **User_ID** (Foreign Key): References the User_ID in the Users table.
- **Album_cover_Artist**: The artist of the album cover.
- **Album_Name**: Name of the album.
- **Album_view_count**: Number of views the album has received.

**Songs Table:** This table stores details about individual songs.

- **Song_ID** (Primary Key): Unique identifier for each song.
- **Album_ID** (Foreign Key): References the Album_ID in the Album table.
- **User_ID** (Foreign Key): References the User_ID in the Users table.
- **Song_Name**: Name of the song.
- **BPM**: Beats per minute.
- **Mood**: Mood of the song.
- **Writer**: Writer of the song.
- **Release_date**: Release date of the song.
- **Duration**: Duration of the song.
- **Featured_in**: Additional information about the song's features.
- **View_count**: Number of views the song has received.
- **Music_notes**: Text notes about the music.
- **Title**: Title of the song.
- **Genre**: Genre of the song.
- **Languages**: Languages of the song.
- **Lyrics**: Lyrics of the song.

**Listen Table:** This table logs the listening activity of users.

- **User_ID** (Primary Key, Foreign Key): References the User_ID in the Users table.
- **Song_ID** (Primary Key, Foreign Key): References the Song_ID in the Songs table.
- **Timestamp**: Date and time when the song was listened to.

**Downloads Table:** This table records the download activity of users.

- **User_ID** (Primary Key, Foreign Key): References the User_ID in the Users table.
- **Song_ID** (Primary Key, Foreign Key): References the Song_ID in the Songs table.
- **Timestamp**: Date and time when the song was downloaded.

**Track Table:** This table stores information about tracks created by users, which can contain multiple songs.

- **Track_ID** (Primary Key): Unique identifier for each track.
- **Creator** (Foreign Key): References the User_ID in the Users table.
- **Track_name**: Name of the track.
- **Length**: Length of the track.

**Contains Table:** This table defines the relationship between tracks and songs, indicating which songs are part of which tracks.

- **Track_ID** (Primary Key, Foreign Key): References the Track_ID in the Track table.
- **Song_ID** (Primary Key, Foreign Key): References the Song_ID in the Songs table.

**Rate Table:** This table logs the ratings given by users to songs.

- **User_ID** (Primary Key, Foreign Key): References the User_ID in the Users table.
- **Song_ID** (Primary Key, Foreign Key): References the Song_ID in the Songs table.
- **Timestamp**: Date and time when the song was rated.

**Playlist Table:** This table stores information about playlists created by users.

- **Playlist_ID** (Primary Key): Unique identifier for each playlist.
- **Creator** (Foreign Key): References the User_ID in the Users table.
- **Playlist_Name**: Name of the playlist.
- **Privacy_Status**: ENUM value ('public', 'private') indicating the privacy status of the playlist.
- **View_count**: Number of views the playlist has received.

**PlaylistsContains Table:** This table defines the relationship between playlists and songs, indicating which songs are part of which playlists.

- **Song_ID** (Primary Key, Foreign Key): References the Song_ID in the Songs table.
- **Playlist_ID** (Primary Key, Foreign Key): References the Playlist_ID in the Playlist table.
- **Date_added**: Date when the song was added to the playlist.
- **Rank_in_playlist**: Rank of the song within the playlist.

**Follows Table:** This table tracks the follow relationship between users and playlists.

- **Playlist_ID** (Primary Key, Foreign Key): References the Playlist_ID in the Playlist table.
- **User_ID** (Primary Key, Foreign Key): References the User_ID in the Users table.
- **Start_date**: Date when the user started following the playlist.
- **End_date**: Date when the user stopped following the playlist.

## Relations

**Users to Albums**:

- A user can create multiple albums.
- Each album is created by a single user.
- Relationship: One-to-Many (Users to Album).

**Users to Songs**:

- A user can create multiple songs.
- Each song is created by a single user.
- Relationship: One-to-Many (Users to Songs).

**Albums to Songs**:

- An album can contain multiple songs.
- Each song belongs to a single album.
- Relationship: One-to-Many (Albums to Songs).

**Users to Listen**:

- A user can listen to multiple songs.
- Each listen entry references a single user and a single song.
- Relationship: Many-to-Many (Users to Songs via Listen).

**Users to Downloads**:

- A user can download multiple songs.
- Each download entry references a single user and a single song.
- Relationship: Many-to-Many (Users to Songs via Downloads).

**Users to Tracks**:

- A user can create multiple tracks.
- Each track is created by a single user.
- Relationship: One-to-Many (Users to Track).

**Tracks to Songs**:

- A track can contain multiple songs.
- Each song can be part of multiple tracks.
- Relationship: Many-to-Many (Tracks to Songs via Contains).

**Users to Rate**:

- A user can rate multiple songs.
- Each rating references a single user and a single song.
- Relationship: Many-to-Many (Users to Songs via Rate).

**Users to Playlists**:

- A user can create multiple playlists.
- Each playlist is created by a single user.
- Relationship: One-to-Many (Users to Playlist).

**Playlists to Songs**:

- A playlist can contain multiple songs.
- Each song can be part of multiple playlists.
- Relationship: Many-to-Many (Playlists to Songs via PlaylistsContains).

**Users to Playlists via Follows**:

- A user can follow multiple playlists.
- A playlist can have multiple followers.
- Relationship: Many-to-Many (Users to Playlists via Follows).

The Entity-Relationship (ER) model for this music database is an essential aspect of understanding the structure and relationships within the data. Due to the complexity and detailed nature of the ER diagram, it is best viewed in a visual format that accurately represents the entities, attributes, and their interconnections which it has been described above.

To provide a clear and comprehensive view of the ER model, I have included a detailed visual representation in my GitHub repository<sup>[\[2\]](#footnote-2)</sup>. This repository contains the ER model in a high-quality format, ensuring that all relationships and constraints are easily interpretable.

# Entity-Relationship Diagram (ERD)

To provide a clear and comprehensive view of the ER diagram, I have included a detailed visual representation in my GitHub repository<sup>[\[3\]](#footnote-3)</sup>. This repository contains the ER model in a high-quality format, ensuring that all relationships and constraints are easily interpretable.

In following table, I have provided each of the fields data type as well as constraint according to our ER model and ER diagram.

| **Table Name** | **Field Name** | **Data Type** | **Constraints** |
| --- | --- | --- | --- |
| User | User_ID | INT | PRIMARY KEY |
|     | Username | VARCHAR(50) | NOT NULL |
|     | Email | VARCHAR(100) | UNIQUE, NOT NULL |
|     | Location | VARCHAR(100) |     |
|     | User_type | VARCHAR(20) |     |
| Album | Album_ID | INT | PRIMARY KEY |
|     | User_ID | INT | FOREIGN KEY (User_ID) |
|     | Album_cover_Artist | VARCHAR(100) |     |
|     | Album_Name | VARCHAR(100) | NOT NULL |
|     | Album_view_count | INT |     |
| Songs | Song_ID | INT | PRIMARY KEY |
|     | Album_ID | INT | FOREIGN KEY (Album_ID) |
|     | User_ID | INT | FOREIGN KEY (User_ID) |
|     | Song_Name | VARCHAR(100) | NOT NULL |
|     | BPM | INT |     |
|     | Mood | VARCHAR(50) |     |
|     | Writer | VARCHAR(100) |     |
|     | Release_date | DATE |     |
|     | Duration | TIME |     |
|     | View_count | INT |     |
|     | Music_notes | TEXT |     |
|     | Title | VARCHAR(100) |     |
|     | Genre | VARCHAR(50) |     |
|     | Languages | VARCHAR(50) |     |
|     | Lyrics | TEXT |     |
| Playlist | Playlist_ID | INT | PRIMARY KEY |
|     | Creator | INT | FOREIGN KEY (User_ID) |
|     | Playlist_Name | VARCHAR(100) | NOT NULL |
|     | Privacy | VARCHAR(20) |     |
|     | View_count | INT |     |
| Listen | User_ID | INT | FOREIGN KEY (User_ID) |
|     | Song_ID | INT | FOREIGN KEY (Song_ID) |
|     | Timestamp | TIMESTAMP |     |
| Download | User_ID | INT | FOREIGN KEY (User_ID) |
|     | Song_ID | INT | FOREIGN KEY (Song_ID) |
|     | Timestamp | TIMESTAMP |     |
| Rate | User_ID | INT | FOREIGN KEY (User_ID) |
|     | Song_ID | INT | FOREIGN KEY (Song_ID) |
|     | Timestamp | TIMESTAMP |     |
| Track | Track_id | INT | PRIMARY KEY |
|     | Creator | INT | FOREIGN KEY (User_ID) |
|     | Track_name | VARCHAR(100) |     |
|     | Length | TIME |     |
| Contains | Track_ID | INT | FOREIGN KEY (Track_id) |
|     | Song_ID | INT | FOREIGN KEY (Song_ID) |
| playlistsContains | Song_ID | INT | FOREIGN KEY (Song_ID) |
|     | Playlist_ID | INT | FOREIGN KEY (Playlist_ID) |
|     | Date_added | TIMESTAMP |     |
|     | Rank_in_playlist | INT |     |
| Follows | Playlist_ID | INT | FOREIGN KEY (Playlist_ID) |
|     | User_ID | INT | FOREIGN KEY (User_ID) |
|     | Start_date | DATE |     |
|     | End_date | DATE |     |

## Data Types and Constraints in Database Design

_Primary Key(PK)_ is a unique identifier for a record in a table. PK must be unique for each record, cannot be NULL. _Foreign Key(FK)_ is a column that establishes a link between records in two tables. It refers to the primary key of another table and ensures referential integrity by making sure the value exists in the referenced table.

### **Data Types**

**INT**: Integer values, used for IDs and counters.

**VARCHAR(n)**: Variable-length character strings, where n is the maximum length.

**CHAR(n):** Fixed-length character strings, padded with spaces if shorter than n.

**DATE**: Date values in YYYY-MM-DD format.

**TIME**: Time values in HH:MM:SS format.

**DATETIME**: Combined date and time values in YYYY-MM-DD HH:MM:SS format.

**TEXT**: Large text fields for lengthy descriptions.

# Normalization

Normalization is a database design technique that reduces data redundancy and eliminates undesirable characteristics like Insertion, Update and Deletion Anomalies. Normalization rules are divided into the following normal forms:

**First Normal Form (1NF)**: Each table cell should contain a single value, and each record needs to be unique. Your tables already satisfy this condition as each cell contains atomic values and each record is unique due to the primary key. All of our tables satisfy 1NF because each attribute contains only atomic (indivisible) values and each record is unique due to the primary key

**Second Normal Form (2NF)**: If it’s in 1NF and all non-key columns are fully dependent on the primary key. In our music database, all non-key columns in each table are fully functional dependent on their respective primary key. In our database, all non-key attributes in each table are fully functionally dependent on their respective primary key. For example, in the Users table, _Username_, _Email_, _Location_, and _User_type_ are all fully dependent on _User_ID_.

**Third Normal Form (3NF)**: If it’s in 2NF and there are no transitive dependencies. Our tables are in 3NF as there are no transitive dependencies. For example, in the **_Songs_** table, all attributes are directly dependent on **_Song_ID_**, and not on any other non-key attribute.

**Boyce-Codd Normal Form (BCNF)**: If it’s in 3NF and for every dependency X -> Y, X should be a super key. Your tables satisfy this condition as well.

1. **Users** table: The primary key is _User_ID_, and all other attributes (_Username, Email, Location, User_type_) are functionally dependent on _User_ID_. There are no other dependencies, so _User_ID_ is a superkey.
2. **Album** table: The primary key is Album_Id, and all other attributes are functionally dependent on _Album_Id_. The _User_ID_ is also a foreign key, but it doesn’t determine other attributes in this table. So, _Album_Id_ is a superkey.
3. **Songs** table: The primary key is _Song_ID_, and all other attributes are functionally dependent on _Song_ID_. The _Album_ID_ and _User_id_ are also foreign keys, but they don’t determine other attributes in this table. So, _Song_ID_ is a superkey.

The same logic applies to all other tables in your database. Therefore, our database satisfies BCNF.

# Contribution

Below table it is shown the contribtion of the each group member to music database project.

**Team Members**: **Contribution Rate:**

- Zübeyir Eser 25 %
- Welat Irmak 15 %
- Hassaan Naveed 20 %
- Ashish Ghaskata 25 %
- Ahmed Mohammedseid 15 %

1. <http://10.97.5.102/phpmyadmin>: Note that this URL is reachable within University of Applied Sciences Aschaffenburg network. [↑](#footnote-ref-1)

2. <https://github.com/ZuebeyirEser/Music-database> file name is ERM_Music_database.pdf [↑](#footnote-ref-2)

3. <https://github.com/ZuebeyirEser/Music-database> file name is ERD_Music_database.pdf [↑](#footnote-ref-3)
