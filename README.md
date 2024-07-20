# Music-database
UNIVERSITY OF APPLIED SCIENCES

ASCHAFFENBURG

# DATABASES

Project: Music Database

**Authors:** Zübeyir Eser, Ashish Ghaskata, Ahmed Mohammedseid, Hassaan Naveed, Welat Irmak

**Documentname:** Music_database

**Creation date:** 09.07.2024

**File:** <https://github.com/ZuebeyirEser/Music-database>

**TABLE OF CONTENTS**

[DATABASES 1](#_Toc171984033)

[1 Introduction 3](#_Toc171984034)

[1.1 Overview 4](#_Toc171984035)

[2 User Stories 5](#_Toc171984036)

[2.1 Zübeyir Eser’s User Stories 5](#_Toc171984037)

[2.1.1 **Zübeyir Eser’s User story to ER Model** 6](#_Toc171984038)

[2.2 Ashish Ghaskata’s User Stories 7](#_Toc171984039)

[2.2.1 **Ashish Ghaskata’s User story to ER Model** 8](#_Toc171984040)

[2.3 Welat Irmak’s User Story 9](#_Toc171984041)

[2.3.1 **Welat Irmak’s User Story to ER Model** 10](#_Toc171984042)

[2.4 Hassaan Naveed’s User Stories 10](#_Toc171984043)

[2.4.1 **Hassaan Naveed’s User Story to ER Model** 12](#_Toc171984044)

[2.5 Ahmed Mohammedseid’s User Stories 12](#_Toc171984045)

[2.5.1 **Ahmed Mohammedseid’s User Story to ER Model** 14](#_Toc171984046)

[3 Entity-Relationship Model (ERM): 14](#_Toc171984047)

[3.1 Tables and its Attributes 14](#_Toc171984048)

[3.2 Relations: 16](#_Toc171984049)

[4 Entity-Relationship Diagram (ERD): 18](#_Toc171984050)

[4.1 Data Types and Constraints in Database Design 19](#_Toc171984051)

[4.1.1 **Data Types** 20](#_Toc171984052)

[5 Normalization 20](#_Toc171984053)

[6 Contribution 21](#_Toc171984054)

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

## Zübeyir Eser’s User Stories

**User Story 1:** _Retrieve the 10 Most Recent Song Additions to Playlists_

**As a** music streaming application user, **I want to** view the 10 most recent song additions to playlists, **so that** I can discover new music and see what other users are adding to their playlists.

**Acceptance Criteria 1:**

1. I navigate to the "Recent Additions" section, I should see a list of the 10 most recently added songs to any playlist
2. each entry should display the song name, playlist name, playlist id, date that added and user name
3. the songs should be ordered by the time they were added, with the most recent addition appearing first.
4. the list should update to reflect the 10 most recent additions

**User Story 2:**

As professional DJ, I want to see all songs with more than 5000 views that are part of at least one track, sorted from increasing to decreasing order, so that I can discover popular songs that are used in tracks.

**Acceptance Criteria 2:**

1. The system should list all songs that have more than 5000 views.
2. The system should ensure that the listed songs are part of at least one track.
3. The system should sort the list of songs in decreasing order of views.
4. The system should display the song title, number of views, and the track(s) it is part of.
5. The system should handle any exceptions or errors gracefully and inform the user accordingly.

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

### **Zübeyir Eser’s User story to ER Model**

The first user story requires the system to retrieve the 10 most recent song additions to playlists. This directly relates to the _playlistsContains_ table in your database, which records the _Song_ID_, _Playlist_ID_, and _Date_added_. To fulfill this user story, you would need to perform a query on this table to select the 10 most recent song additions.

The second user story involves a professional DJ who wants to see all songs with more than 5000 views that are part of at least one track. This involves the Songs and Contains tables. The Songs table has a View_count field, and the Contains table links songs to tracks. A query joining these two tables and filtering based on the _View_count_ field would fulfill this user story.

The third user story involves multiple tables. The user wants to see the top 5 songs ranked by view count, along with detailed information about the album and artist. This would involve the Songs, Album, and Users tables. The Songs table contains the _View_count_ field, the Album table can provide details about the album, and the Users table can provide details about the artist.

The fourth user story requires the system to provide the top 3 most popular genres based on total views of songs within those genres. This directly relates to the Songs table, which has fields for Genre and _View_count_. A query that groups by the Genre field and sums the _View_count_ field would fulfill this user story.

The fifth user story is similar to the first one, but it specifically involves public playlists. This would involve the _playlistsContains_ and Playlist tables. The Playlist table has a _Privacy_Status_ field that can be used to filter for public playlists.

## Ashish Ghaskata’s User Stories

**User Story 1:**

As a user with diverse musical tastes, I want a feature that offers curated playlists based on specific themes or occasions. Such as road trips, study sessions, or holiday celebrations, enhancing my listening experience with tailored content.

**Acceptance Criteria 1:**

1. Users can select from a variety of themes or occasions (e.g., road trips, study sessions, holiday celebrations).
2. The system provides curated playlists for the selected theme.
3. Playlists are updated regularly to include new songs.
4. Users can save and access these curated playlists for future use.
5. The feature is accessible from the main menu or a dedicated section of the app.

**User Story 2:**

As a user who enjoys music from around the world, I want access to a feature that offers curated playlists showcasing music from different cultures, regions, and languages, allowing me to explore diverse musical traditions and genres

**Acceptance Criteria 2:**

1. Users can select from a list of cultures, regions, and languages.
2. The system provides curated playlists for the selected culture, region, or language.
3. Playlists include a diverse range of music from the selected area.
4. Users can save and access these curated playlists for future listening.
5. The feature includes detailed information about the music and artists from the selected regions.

**User Story 3:´**

As a a user with a busy lifestyle, I want access to a feature that offers offline listening capabilities, allowing me to download my favourite songs, albums, and playlists to my device for uninterrupted music enjoyment on the go.

**Acceptance Criteria 3:**

1. Users can download individual songs, albums, and entire playlists for offline listening.
2. Downloaded content is stored locally on the user's device.
3. Users can access and play downloaded content without an internet connection.
4. Users can manage downloaded content, including deleting and re-downloading songs.
5. The system tracks and analyses the number of downloads for each song.

**User Story 4:**

As a user interested in discovering music from different eras, I want access to a feature that offers curated playlists showcasing music from specific decades or historical periods, allowing me to explore the evolution of popular music over time.

**Acceptance Criteria 4:**

1. Users can select from a list of decades or historical periods.
2. The system provides curated playlists for the selected decade or period.
3. Playlists include a wide range of popular music from the chosen time frame.
4. Users can save and access these curated playlists for future listening.
5. The feature includes historical context and information about the music and artists from the selected period.

**User Story 5:**

As a music enthusiast, I want to see the view counts for songs and albums, so I can easily discover and enjoy popular tracks that resonate with other listeners, ensuring I stay up to date with trending and widely-loved music.

**Acceptance Criteria 5:**

1. The system displays the view counts for each song and album.
2. View counts are updated in real-time or at regular intervals.
3. Users can sort and filter songs and albums by view count.
4. Users can access additional details about the popularity trends of specific songs and albums.

### **Ashish Ghaskata’s User story to ER Model**

We try to the user stories and acceptance criteria align with our ER Model. Here the Users entity, with attributes like User ID represents individual users. The Songs entity provides detailed song information such as song ID, album ID, and view count. The relationship between Users and Songs supports key features like viewing song details, offline downloads and tracking popularity.

The Album entity links Users and Songs, enabling comprehensive music exploration. The Playlist entity is essential for curated content, supporting the creation, sharing and following of playlists, aligned with user stories on themed playlists and cultural music exploration,

The Downloads entity tracks offline listening. While the View Counts entity displays song and album popularity, The Rate entity captures user feedback for personalized recommendations.

## Welat Irmak’s User Story

**User Story 1:**

As a music enthusiast, I want to be able to search for songs by genre, artist, or release date, so I can discover new music and explore different styles easily.

**Acceptance Criteria 1:**

1. Users can search for songs by entering a genre, artist name, or release date.
2. Users should have the option to further refine their search results based on additional criteria such as album name or popularity.

**User Story 2:**

As a DJ, I need a music database that not only provides BPM and key detection but also offers detailed waveform analysis and beat grid alignment for each track, allowing me to perform precise cueing and beatmatching, even in challenging mixing environments such as noisy clubs or outdoor events.

**Acceptance Criteria 2:**

1. Accurate BPM detection for each track.
2. Ability to browse songs by BPM and view popular playlists.

**User Story 3:**

As a concert organizer, I require a music database that has audience analytics, enabling me to analyze past attendance data, identify popular genres and artists, and curate lineups that resonate with my target audience, ultimately maximizing my ticket sales and enhancing the overall concert experience. Ticket sales are conducted on other platform.

**Acceptance Criteria 3:**

1. \-It must provide comprehensive audience analytics like demographics.
2. \-Ability to browse songs by artists.

**User Story 4:**

As a music teacher, I want to have access to a comprehensive database of sheet music to aid in lesson planning and curriculum development.

**Acceptance Criteria 4:**

1. The database should include a wide range of music sheets.
2. The database should provide information about each piece of sheet music, time signature, language and any special instructions.

**User Story 5:**

As a record label executive, I need a music database that offers detailed analytics on streaming for artists' tracks, including listener demographics, geographic distribution, and trend analysis, empowering me to identify emerging markets and allocate resources effectively to maximize our artists' reach and revenue potential.

**Acceptance Criteria 5:**

1. Enable trend analysis over time and filtering by artist/album.
2. Include metrics like downloads, and listener demographics.

### **Welat Irmak’s User Story to ER Model**

To meet the diverse needs of music enthusiasts, DJs, concert organizers, music teachers, and record label executives, the proposed ER Model integrates several key entities and relationships. Users can explore songs through comprehensive search functionalities by genre, artist, or release date, facilitated by the Song, Artist, and Album entities. Refinement options, such as filtering results by album name or popularity, enhance the user experience, aligning with the requirements of music enthusiasts seeking new discoveries.

The ER Model includes BPM recognition for DJs who need precise music management capabilities. BPM information found Songs.

The ER Model's audience analytics, which provide information on popular artists, genres, and demographics, are advantageous to concert promoters. This feature, which is derived from properties shared by entities such as Users, Songs, Downloads. Those statistics helps promote ticket sales and improve concert experiences by helping to curate lineups that appeal to a variety of audiences.

Moreover, the ER Model gives record label executives and music teachers access to extensive music databases. A vast selection of sheet music featuring comprehensive details on languages, and teaching notes is available to music educators. Record label executives, meanwhile, make strategic decisions to optimize artists' reach and financial potential by leveraging listener demographics and trend analysis from entities like Downloads, Users and Songs.

This integrated ER Model not only fulfills the specific needs outlined by each user story but also supports broader functionalities essential for navigating and leveraging the diverse landscape of the music industry today.

## Hassaan Naveed’s User Stories

**User Story 1:**

As a music enthusiast, I want to create personalized playlists so that I can organize songs based on my mood.

**Acceptance Criteria 1:**

- The system must allow users to create a new playlist, which will be recorded in the **Playlist** table.
- Each playlist must have a unique **Playlist_ID**, a **Creator** (which is a **User_ID**), **Playlist_Name**, **Privacy** settings, **View_count**, and a **Theme**.
- The system must update the **View_count** field each time the playlist is accessed.
- Songs added to a playlist must be recorded in the **playlistsContains** table with a valid **Song_ID**, **Playlist_ID**, **Date_added**, and **Rank_in_playlist**.
- Songs must contain **Mood** to identify them while creating a playlist.

**User Story 2:**

As a commuter, I want to be able to download songs so that I can listen to them offline.

**Acceptance Criteria 2:**

- The system must create a record in the **Downloads** table for each song downloaded.
- Each record in the Downloads table must contain a valid **User_ID** and **Song_ID**.
- The **Timestamp** field must be automatically populated.

**User Story 3:**

As a language learner, I want search songs based on the language I am currently learning to improve my language skills while enjoying music.

**Acceptance Criteria 3:**

- **T**he system must allow users to search for songs based on the **Language** field in the **Songs** table.
- The search functionality must query the **Songs** table and return songs that match the specified language.
- The system should display the **Song_Name**, **Artist**, **Album_Name**, and other relevant song information in the search results.

**User Story 4:**

As a party host, I want the ability to share my playlist publicly with the people in the party to create a dynamic and diverse music selection that enhances the atmosphere of the event.

**Acceptance Criteria 4:**

- The system must allow users to set the **Privacy** setting of a playlist to public, which is recorded in the **Playlist** table.
- When a playlist is set to public, it must create a record in the **Follows** table with the **Playlist_ID** and the **User_ID** of the party host.
- Other users must be able to **follow** the public playlist, allowing them to add or remove songs, recorded in the **playlistsContains** table.
- The system must ensure that changes to the playlist (adding/removing songs) are reflected in real-time for all users following the playlist.
- The **View_count** of the playlist must be updated each time it is accessed by any user.

**User Story 5:**

As an artist, I want to upload albums so that my music can be shared with others.

**Acceptance Criteria 5:**

- The system must allow artists (users with a specific User_type) to upload albums, recording each album in the Album table.
- Each album record must contain a unique Album_ID, User_ID (as the artist), Album_cover_Artist, Album_Name, and Album_view_count.
- Each song in the album must be associated with the album through the Songs table, which contains Album_ID.

### **Hassaan Naveed’s User Story to ER Model**

Based on User story 1, there has to be a zero to many relationships from User to Playlist with the name 'Creates'. There has to be a one to many between Playlist and Songs with the name 'Consist of'. The songs must also contain 'Mood' attribute. Based on User story 2, there has to be a zero to many relationship between User and Songs with the name 'Downloads'. Based on User story 4, There has to be a 'public/private' attribute to the playlist. According to User story 5, a Musician can upload an Album with zero to many relationship. A Song 'belongs to' an Album with one to many relationship.

## Ahmed Mohammedseid’s User Stories

**User Story 1:**

**As a gamer who enjoys in-game music**, I want to search for songs based on the video games they're featured in, so I can create a playlist that brings back nostalgic memories of my favorite gaming experiences.

**Acceptance Criteria 1:**

1. \-Users can search for songs by entering the name of a video game.
2. \-Search results should display song titles, artists (if applicable), and potentially information about the game itself (composer, genre).

**User Story 2:**

**As a forgetful user,** I want the database to automatically save my recent searches, so that I don't have to re-enter them every time. and also I want the database to automatically create playlists based on my recently played songs, so I can easily revisit music I enjoyed without having to remember the titles or artists.

**Acceptance Criteria 2:**

1. The database stores a user's recent searches.
2. Users may have the option to customize or edit automatically generated playlists. This could involve adding/removing songs or changing the playlist name
3. Based on a user's recent listening history, the database automatically generates playlists. Playlists can be generated daily, weekly, or based on a configurable timeframe.
4. Playlists may be based on factors like genre, mood, or similar artists. The specific algorithm used to generate playlists can be defined based on user preferences or system defaults.

**User Story 3:**

**As a music conspiracy theorist,** I want to search for hidden messages and symbolism within song lyrics and album artwork, so I can explore and document potential hidden meanings.

**Acceptance Criteria 3:**

1. Users can search for songs based on keywords or phrases potentially related to hidden messages.
2. Search results include song lyrics and access to album artwork.
3. The database may allow users to annotate lyrics or artwork with their interpretations.

**User Story 4:**

**As a productivity enthusiast who uses music for focus,** I want to be able to block out distractions with playlists featuring binaural beats or ambient soundscapes, so I can stay concentrated and achieve my goals.

Acceptance Criteria 4:

1. Users can search for music categorized as binaural beats or ambient soundscapes. The search functionality should allow filtering based on these categories.
2. Search results display song titles, artists (if applicable), and clear information about the music category (binaural beats/ambient soundscapes).
3. The database provides pre-curated playlists specifically designed for focus and concentration featuring binaural beats or ambient soundscapes. Users can easily access these playlists within the UI.

**User Story 5:**

**As a nostalgic listener who enjoys childhood memories,** I want to search for songs based on popular toys or trends from specific decades, so I can create playlists that take me back to a simpler time.

**Acceptance Criteria 5:**

1. Users can search for songs by entering keywords related to popular toys or trends from a specific decade.
2. Search results should display song titles, artists, and potentially release dates.
3. The database may include additional information about the songs' cultural context or association with the specified trends.

### **Ahmed Mohammedseid’s User Story to ER Model**

The ER diagram effectively supports the user stories and their respective acceptance criteria through its existing entities and relationships. For the gamer searching for songs based on video games, the Songs entity includes an attribute featured in a game or movie that the music was featured in, allowing users to search and display song titles and artists related to specific games. The forgetful user's need to save recent searches and auto-generate playlists is addressed by tracking user interactions with the Listen entity, which logs User-ID and Song-ID with a Timestamp, enabling the system to create and manage playlists through the Playlist entity and its relationship with Song via playlistsContains. The music conspiracy theorist can search for hidden messages in lyrics and album artwork using the Lyrics attribute within the Songs entity and linking album artwork through the Album entity's Album_cover_Artist attribute. Productivity enthusiasts can search for focus-enhancing music using the Genre and Mood attributes in the Songs entity, and access pre-curated playlists tailored for concentration within the Playlist entity, leveraging its Theme attribute. Lastly, nostalgic listeners can search for songs associated with popular toys or trends from specific decades by querying the Title and Lyrics attributes in the Songs entity and obtain details like song titles, artists, and release dates. Thus, the current ERD structure robustly supports the functionalities required by the user stories through well-defined attributes and relationships.

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
