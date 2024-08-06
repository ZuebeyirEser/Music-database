create database Music2;

use Music2;

CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Location VARCHAR(255),
    User_type VARCHAR(50)
);

CREATE TABLE Album (
    Album_Id INT PRIMARY KEY,
    User_ID INT,
    Album_cover_Artist VARCHAR(255),
    Album_Name VARCHAR(255),
    Album_view_count INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Songs (
    Song_ID INT PRIMARY KEY,
    Album_ID INT,
    User_id INT,
    Song_Name VARCHAR(255),
    BPM INT,
    Mood VARCHAR(50),
    Writer VARCHAR(255),
    Release_date DATE,
    Duration TIME,
    Featured_in VARCHAR(255),
    View_count INT,
    Music_notes TEXT,
    Title VARCHAR(255),
    Genre VARCHAR(50),
    Languages VARCHAR(255),
    Lyrics TEXT,
    FOREIGN KEY (Album_ID) REFERENCES Album(Album_Id),
    FOREIGN KEY (User_id) REFERENCES Users(User_ID)
);

CREATE TABLE Listen (
    User_ID INT,
    Song_ID INT,
    Timestamp DATETIME,
    PRIMARY KEY (User_ID, Song_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Song_ID) REFERENCES Songs(Song_ID)
);

CREATE TABLE Downloads (
    User_ID INT,
    Song_ID INT,
    Timestamp DATETIME,
    PRIMARY KEY (User_ID, Song_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Song_ID) REFERENCES Songs(Song_ID)
);

CREATE TABLE Track (
    Track_id INT PRIMARY KEY,
    Creator INT,
    Track_name VARCHAR(255),
    Length TIME,
    FOREIGN KEY (Creator) REFERENCES Users(User_ID)
);

CREATE TABLE Contains (
    Track_ID INT,
    Song_ID INT,
    PRIMARY KEY (Track_ID, Song_ID),
    FOREIGN KEY (Track_ID) REFERENCES Track(Track_id),
    FOREIGN KEY (Song_ID) REFERENCES Songs(Song_ID)
);

CREATE TABLE Rate (
    User_ID INT,
    Song_ID INT,
    Timestamp DATETIME,
    PRIMARY KEY (User_ID, Song_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Song_ID) REFERENCES Songs(Song_ID)
);

CREATE TABLE Playlist (
    Playlist_ID INT PRIMARY KEY,
    Creator INT,
    Name VARCHAR(255),
    Public_Private VARCHAR(50),
    View_count INT,
    FOREIGN KEY (Creator) REFERENCES Users(User_ID)
);
CREATE TABLE Playlist (
    Playlist_ID INT PRIMARY KEY,
    Creator INT,
    Playlist_Name VARCHAR(255),
    Privacy_Status ENUM('public', 'private') DEFAULT 'private',
    View_count INT,
    FOREIGN KEY (Creator) REFERENCES Users(User_ID)
);


CREATE TABLE playlistsContains (
    Song_ID INT,
    Playlist_ID INT,
    Date_added DATE,
    Rank_in_playlist INT,
    PRIMARY KEY (Song_ID, Playlist_ID),
    FOREIGN KEY (Song_ID) REFERENCES Songs(Song_ID),
    FOREIGN KEY (Playlist_ID) REFERENCES Playlist(Playlist_ID)
);

CREATE TABLE Follows (
    Playlist_ID INT,
    User_ID INT,
    Start_date DATE,
    End_date DATE,
    PRIMARY KEY (Playlist_ID, User_ID),
    FOREIGN KEY (Playlist_ID) REFERENCES Playlist(Playlist_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);


INSERT INTO Users (User_ID, Username, Email, Location, User_type) VALUES
(1, 'johndoe', 'johndoe@gmail.com', 'Berlin, Germany', 'User'),
(2, 'janedoe', 'janedoe@gmail.com', 'Munich, Germany', 'Musician'),
(3, 'michaelbrown', 'michaelbrown@gmail.com', 'Hamburg, Germany', 'User'),
(4, 'emilywhite', 'emilywhite@gmail.com', 'Cologne, Germany', 'Musician'),
(5, 'davidjohnson', 'davidjohnson@gmail.com', 'Frankfurt, Germany', 'User'),
(6, 'saradavis', 'saradavis@gmail.com', 'Stuttgart, Germany', 'Musician'),
(7, 'jamesmiller', 'jamesmiller@gmail.com', 'Düsseldorf, Germany', 'User'),
(8, 'marywilson', 'marywilson@gmail.com', 'Dortmund, Germany', 'Musician'),
(9, 'roberttaylor', 'roberttaylor@gmail.com', 'Essen, Germany', 'User'),
(10, 'lindamoore', 'lindamoore@gmail.com', 'Leipzig, Germany', 'DJ'),
(11, 'williamanderson', 'williamanderson@gmail.com', 'Bremen, Germany', 'User'),
(12, 'patriciaharris', 'patriciaharris@gmail.com', 'Dresden, Germany', 'Musician'),
(13, 'charlesmartinez', 'charlesmartinez@gmail.com', 'Hanover, Germany', 'User'),
(14, 'jenniferthompson', 'jenniferthompson@gmail.com', 'Nuremberg, Germany', 'Musician'),
(15, 'stevenhernandez', 'stevenhernandez@gmail.com', 'Duisburg, Germany', 'User'),
(16, 'karenmartin', 'karenmartin@gmail.com', 'Bochum, Germany', 'Musician'),
(17, 'josephlee', 'josephlee@gmail.com', 'Wuppertal, Germany', 'User'),
(18, 'susanclark', 'susanclark@gmail.com', 'Bielefeld, Germany', 'Musician'),
(19, 'paulrodriguez', 'paulrodriguez@gmail.com', 'Bonn, Germany', 'User'),
(20, 'barbaramartinez', 'barbaramartinez@gmail.com', 'Münster, Germany', 'DJ'),
(21, 'matthewlewis', 'matthewlewis@gmail.com', 'Karlsruhe, Germany', 'User'),
(22, 'nancyscott', 'nancyscott@gmail.com', 'Mannheim, Germany', 'Musician'),
(23, 'donaldwalker', 'donaldwalker@gmail.com', 'Augsburg, Germany', 'User'),
(24, 'dorothyhill', 'dorothyhill@gmail.com', 'Wiesbaden, Germany', 'Musician'),
(25, 'kevinallen', 'kevinallen@gmail.com', 'Gelsenkirchen, Germany', 'User'),
(26, 'sandralopez', 'sandralopez@gmail.com', 'Mönchengladbach, Germany', 'Musician'),
(27, 'jasonyoung', 'jasonyoung@gmail.com', 'Braunschweig, Germany', 'User'),
(28, 'ashleyking', 'ashleyking@gmail.com', 'Chemnitz, Germany', 'Musician'),
(29, 'brianwright', 'brianwright@gmail.com', 'Kiel, Germany', 'User'),
(30, 'melissagreen', 'melissagreen@gmail.com', 'Aachen, Germany', 'DJ'),
(31, 'georgesanchez', 'georgesanchez@gmail.com', 'Halle, Germany', 'User'),
(32, 'lisahill', 'lisahill@gmail.com', 'Magdeburg, Germany', 'Musician'),
(33, 'edwardclark', 'edwardclark@gmail.com', 'Freiburg, Germany', 'User'),
(34, 'bettyrobinson', 'bettyrobinson@gmail.com', 'Krefeld, Germany', 'Musician'),
(35, 'richardmoore', 'richardmoore@gmail.com', 'Lübeck, Germany', 'User'),
(36, 'helenyoung', 'helenyoung@gmail.com', 'Oberhausen, Germany', 'Musician'),
(37, 'kennethmartin', 'kennethmartin@gmail.com', 'Erfurt, Germany', 'User'),
(38, 'donnalee', 'donnalee@gmail.com', 'Mainz, Germany', 'Musician'),
(39, 'ronaldwhite', 'ronaldwhite@gmail.com', 'Rostock, Germany', 'User'),
(40, 'cindythomas', 'cindythomas@gmail.com', 'Kassel, Germany', 'DJ'),
(41, 'anthonywalker', 'anthonywalker@gmail.com', 'Hagen, Germany', 'User'),
(42, 'amandawilson', 'amandawilson@gmail.com', 'Hamm, Germany', 'Musician'),
(43, 'markbrown', 'markbrown@gmail.com', 'Saarbrücken, Germany', 'User'),
(44, 'angelathompson', 'angelathompson@gmail.com', 'Mülheim, Germany', 'Musician'),
(45, 'frankhernandez', 'frankhernandez@gmail.com', 'Potsdam, Germany', 'User'),
(46, 'rebeccacarter', 'rebeccacarter@gmail.com', 'Ludwigshafen, Germany', 'Musician'),
(47, 'scottmartinez', 'scottmartinez@gmail.com', 'Oldenburg, Germany', 'User'),
(48, 'lauragarcia', 'lauragarcia@gmail.com', 'Leverkusen, Germany', 'Musician'),
(49, 'erictaylor', 'erictaylor@gmail.com', 'Osnabrück, Germany', 'User'),
(50, 'margaretbrown', 'margaretbrown@gmail.com', 'Solingen, Germany', 'DJ'),
(51, 'danielmartin', 'danielmartin@gmail.com', 'Heidelberg, Germany', 'User'),
(52, 'elizabethjones', 'elizabethjones@gmail.com', 'Herne, Germany', 'Musician'),
(53, 'jerryrodriguez', 'jerryrodriguez@gmail.com', 'Neuss, Germany', 'User'),
(54, 'kimberlywilson', 'kimberlywilson@gmail.com', 'Darmstadt, Germany', 'Musician'),
(55, 'brandonhill', 'brandonhill@gmail.com', 'Paderborn, Germany', 'User'),
(56, 'emmalopez', 'emmalopez@gmail.com', 'Regensburg, Germany', 'Musician'),
(57, 'christophertaylor', 'christophertaylor@gmail.com', 'Ingolstadt, Germany', 'User'),
(58, 'michelleanderson', 'michelleanderson@gmail.com', 'Würzburg, Germany', 'Musician'),
(59, 'larrymartin', 'larrymartin@gmail.com', 'Wolfsburg, Germany', 'User'),
(60, 'deborahhernandez', 'deborahhernandez@gmail.com', 'Ulm, Germany', 'Musician'),
(61, 'stephenwhite', 'stephenwhite@gmail.com', 'Heilbronn, Germany', 'User'),
(62, 'wandarobinson', 'wandarobinson@gmail.com', 'Pforzheim, Germany', 'Musician'),
(63, 'ryantaylor', 'ryantaylor@gmail.com', 'Göttingen, Germany', 'User'),
(64, 'heatherclark', 'heatherclark@gmail.com', 'Bottrop, Germany', 'Musician'),
(65, 'timothymartin', 'timothymartin@gmail.com', 'Trier, Germany', 'User'),
(66, 'shirleywalker', 'shirleywalker@gmail.com', 'Recklinghausen, Germany', 'Musician'),
(67, 'jeffreyrodriguez', 'jeffreyrodriguez@gmail.com', 'Reutlingen, Germany', 'User'),
(68, 'doriscampbell', 'doriscampbell@gmail.com', 'Bremerhaven, Germany', 'Musician'),
(69, 'joshuaanderson', 'joshuaanderson@gmail.com', 'Koblenz, Germany', 'User'),
(70, 'anitarobinson', 'anitarobinson@gmail.com', 'Bergisch Gladbach, Germany', 'Musician'),
(71, 'kevinthompson', 'kevinthompson@gmail.com', 'Jena, Germany', 'User'),
(72, 'virginiamartin', 'virginiamartin@gmail.com', 'Remscheid, Germany', 'Musician'),
(73, 'nicholaslopez', 'nicholaslopez@gmail.com', 'Erlangen, Germany', 'User'),
(74, 'lauraallen', 'lauraallen@gmail.com', 'Moers, Germany', 'Musician'),
(75, 'andrewwilson', 'andrewwilson@gmail.com', 'Siegen, Germany', 'User'),
(76, 'denisewhite', 'denisewhite@gmail.com', 'Hildesheim, Germany', 'Musician'),
(77, 'jessicarichardson', 'jessicarichardson@gmail.com', 'Salzgitter, Germany', 'User'),
(78, 'ronaldking', 'ronaldking@gmail.com', 'Cottbus, Germany', 'Musician'),
(79, 'rachelhall', 'rachelhall@gmail.com', 'Kaiserslautern, Germany', 'User'),
(80, 'aaronlee', 'aaronlee@gmail.com', 'Gütersloh, Germany', 'Musician'),
(81, 'judyroberts', 'judyroberts@gmail.com', 'Schwerin, Germany', 'User'),
(82, 'waltermartin', 'waltermartin@gmail.com', 'Witten, Germany', 'Musician'),
(83, 'debramartinez', 'debramartinez@gmail.com', 'Wolfsburg, Germany', 'User'),
(84, 'henryclark', 'henryclark@gmail.com', 'Dessau, Germany', 'Musician'),
(85, 'alicewalker', 'alicewalker@gmail.com', 'Görlitz, Germany', 'User'),
(86, 'arthurhernandez', 'arthurhernandez@gmail.com', 'Kempten, Germany', 'Musician'),
(87, 'joannemartin', 'joannemartin@gmail.com', 'Fulda, Germany', 'User'),
(88, 'garyrodriguez', 'garyrodriguez@gmail.com', 'Offenbach, Germany', 'Musician'),
(89, 'cheryltaylor', 'cheryltaylor@gmail.com', 'Villingen-Schwenningen, Germany', 'User'),
(90, 'brendajohnson', 'brendajohnson@gmail.com', 'Lünen, Germany', 'Musician'),
(91, 'lawrencehill', 'lawrencehill@gmail.com', 'Gießen, Germany', 'User'),
(92, 'christinethomas', 'christinethomas@gmail.com', 'Marl, Germany', 'Musician'),
(93, 'gregorymoore', 'gregorymoore@gmail.com', 'Flensburg, Germany', 'User'),
(94, 'kathrynmartin', 'kathrynmartin@gmail.com', 'Bayreuth, Germany', 'Musician'),
(95, 'douglasharris', 'douglasharris@gmail.com', 'Lüneburg, Germany', 'User'),
(96, 'ruthjackson', 'ruthjackson@gmail.com', 'Neu-Ulm, Germany', 'Musician'),
(97, 'josephthompson', 'josephthompson@gmail.com', 'Speyer, Germany', 'User'),
(98, 'amberlopez', 'amberlopez@gmail.com', 'Dormagen, Germany', 'Musician'),
(99, 'jeremymartinez', 'jeremymartinez@gmail.com', 'Landshut, Germany', 'User'),
(100, 'emilylee', 'emilylee@gmail.com', 'Weimar, Germany', 'DJ');





INSERT INTO Album (Album_Id, User_ID, Album_cover_Artist, Album_Name, Album_view_count) VALUES
(1, 3, 'John Smith', 'Greatest Hits', 1000),
(2, 45, 'Sarah Johnson', 'Memories of Summer', 1500),
(3, 78, 'Michael Brown', 'Echoes of Silence', 1200),
(4, 22, 'Emily Davis', 'Whispers in the Wind', 800),
(5, 57, 'David Clark', 'Midnight Serenade', 2000),
(6, 12, 'Jessica Lee', 'Northern Lights', 3000),
(7, 34, 'Andrew White', 'Dreams Unfolding', 900),
(8, 99, 'Olivia Green', 'Golden Memories', 2500),
(9, 67, 'Matthew Taylor', 'Rhythm of the Rain', 1800),
(10, 81, 'Sophia Martinez', 'Enchanted Forest', 700),
(11, 53, 'Daniel Wilson', 'Melodies of Spring', 1200),
(12, 91, 'Emma Anderson', 'Whispering Pines', 500),
(13, 48, 'James Moore', 'Twilight Symphony', 300),
(14, 37, 'Lily Garcia', 'Songs of Solitude', 1000),
(15, 86, 'Benjamin Thompson', 'Sunset Reverie', 2200),
(16, 25, 'Chloe Harris', 'Harmony in Blue', 1900),
(17, 60, 'Lucas Martin', 'Echoes of Eternity', 800),
(18, 14, 'Ella Walker', 'Dancing in the Rain', 400),
(19, 72, 'Jackson King', 'Mystic Echo', 600),
(20, 28, 'Madison Wright', 'Whispered Dreams', 1500),
(21, 54, 'Gabriel Rodriguez', 'Starlit Serenade', 1700),
(22, 63, 'Ava Martinez', 'Silent Symphony', 1300),
(23, 20, 'Noah Scott', 'Emerald Shadows', 900),
(24, 31, 'Isabella Hall', 'Secret Garden', 1100),
(25, 88, 'Logan Young', 'Moonlit Melodies', 1400),
(26, 77, 'Mia Lewis', 'Enchanted Evening', 800),
(27, 11, 'Jacob Harris', 'Whispers of Love', 1000),
(28, 47, 'Sophie Wilson', 'Ocean Breeze', 1900),
(29, 84, 'William Brown', 'Starry Nights', 2200),
(30, 19, 'Zoe Rodriguez', 'Eternal Bliss', 3000),
(31, 2, 'Nathan Turner', 'Crystal Waters', 800),
(32, 59, 'Grace Martinez', 'Twilight Serenade', 400),
(33, 39, 'Ethan White', 'Serene Reflections', 600),
(34, 93, 'Avery Davis', 'Whispering Winds', 1500),
(35, 26, 'Hailey Clark', 'Cascade of Dreams', 1700),
(36, 73, 'Owen Taylor', 'Midnight Symphony', 1300),
(37, 41, 'Emma Parker', 'Tranquil Moments', 900),
(38, 8, 'Caleb King', 'Sapphire Skies', 1100),
(39, 92, 'Sophia Hill', 'Harmonic Echoes', 1400),
(40, 33, 'Liam Garcia', 'Echoes of Silence', 800),
(41, 6, 'Aria Moore', 'Moonlit Sonata', 1000),
(42, 71, 'Jack Thompson', 'Golden Sunsets', 1900),
(43, 52, 'Ella Walker', 'Whispers of Dawn', 2200),
(44, 38, 'Mason Martinez', 'Velvet Nightfall', 3000),
(45, 75, 'Hannah Young', 'Dream Weaver', 800),
(46, 85, 'Luke Scott', 'Twilight Dreams', 400),
(47, 17, 'Sofia Turner', 'Harmony of Stars', 600),
(48, 66, 'Max Wright', 'Celestial Lullaby', 1500),
(49, 95, 'Ava Hill', 'Enchanted Forest', 1700),
(50, 29, 'Benjamin Davis', 'Whispering Waters', 1300),
(51, 5, 'Emma Reed', 'Songs of Serenity', 900),
(52, 46, 'Ryan Parker', 'Serenade of Love', 1100),
(53, 79, 'Lily Phillips', 'Melodies of Moonlight', 1400),
(54, 23, 'Jacob Roberts', 'Ethereal Symphony', 800),
(55, 69, 'Grace Adams', 'Whispered Secrets', 1000),
(56, 43, 'Michael Turner', 'Starlit Reflections', 1900),
(57, 16, 'Sophie Garcia', 'Moonlit Sonata', 2200),
(58, 7, 'Noah Mitchell', 'Whispering Winds', 3000),
(59, 50, 'Olivia Scott', 'Silver Moonlight', 800),
(60, 96, 'Lucas Hill', 'Silent Echoes', 400),
(61, 4, 'Isabella Reed', 'Celestial Harmony', 600),
(62, 68, 'Ethan Young', 'Whispering Pines', 1500),
(63, 27, 'Chloe Parker', 'Melodies of Twilight', 1700),
(64, 80, 'Jackson Adams', 'Serenade of Stars', 1300),
(65, 15, 'Avery Roberts', 'Moonlit Memories', 900),
(66, 35, 'Mia Phillips', 'Echoes of Dawn', 1100),
(67, 21, 'Logan Foster', 'Enchanted Evening', 1400),
(68, 62, 'Emily Mitchell', 'Whispers of Love', 800),
(69, 70, 'Daniel Turner', 'Harmony in Blue', 1000),
(70, 13, 'Madison Walker', 'Dreams Unfolding', 1900),
(71, 1, 'William Hall', 'Golden Memories', 2200),
(72, 64, 'Sophia King', 'Rhythm of the Rain', 3000),
(73, 30, 'Elijah Wright', 'Enchanted Forest', 800),
(74, 74, 'Ava Harris', 'Melodies of Spring', 400),
(75, 40, 'Liam Martinez', 'Whispering Waters', 600),
(76, 18, 'Emma Turner', 'Starry Nights', 1500),
(77, 65, 'Olivia Walker', 'Silent Symphony', 1700),
(78, 10, 'Lucas Hill', 'Emerald Shadows', 1300),
(79, 98, 'Isabella Phillips', 'Secret Garden', 900),
(80, 24, 'Noah Adams', 'Moonlit Melodies', 1100),
(81, 87, 'Sophie Roberts', 'Enchanted Evening', 1400),
(82, 32, 'Jackson Foster', 'Whispers of Love', 800),
(83, 9, 'Chloe Mitchell', 'Ocean Breeze', 1000),
(84, 56, 'William Parker', 'Starry Nights', 1900),
(85, 97, 'Ella Hall', 'Eternal Bliss', 2200),
(86, 36, 'Benjamin King', 'Crystal Waters', 3000),
(87, 42, 'Grace Wright', 'Twilight Serenade', 800),
(88, 100, 'Jacob Harris', 'Serene Reflections', 400),
(89, 49, 'Avery Turner', 'Whispering Winds', 600),
(90, 55, 'Madison Walker', 'Cascade of Dreams', 1500),
(91, 58, 'Ethan Hall', 'Midnight Symphony', 1700),
(92, 44, 'Sophia Foster', 'Tranquil Moments', 1300),
(93, 94, 'Daniel Roberts', 'Sapphire Skies', 900),
(94, 83, 'Mia Phillips', 'Harmonic Echoes', 1100),
(95, 82, 'Liam Adams', 'Echoes of Silence', 1400),
(96, 61, 'Emma Turner', 'Moonlit Sonata', 800),
(97, 76, 'Olivia Harris', 'Golden Sunsets', 1000),
(98, 89, 'Lucas King', 'Whispers of Dawn', 1900),
(99, 51, 'Isabella Wright', 'Velvet Nightfall', 2200),
(100, 99, 'Noah Clark', 'Dream Weaver', 3000);




INSERT INTO Songs (Song_ID, Album_ID, User_id, Song_Name, BPM, Mood, Writer, Release_date, Duration, Featured_in, View_count, Music_notes, Title, Genre, Languages, Lyrics) VALUES
(1, 23, 47, 'Sunshine Dream', 120, 'Happy', 'Emily Johnson', '2023-01-01', '00:03:30', 'Movie 1', 5000, 'Catchy melody with uplifting lyrics.', 'Sunshine Dream', 'Pop', 'English', 'Feel the sun on my face, everything\s alright.'),
(2, 45, 16, 'Tears of Yesterday', 130, 'Sad', 'Michael Brown', '2023-01-02', '00:04:00', 'Game 1', 3000, 'Powerful ballad about lost love.', 'Tears of Yesterday', 'Rock', 'English', 'In the darkness, tears of yesterday.'),
(3, 67, 89, 'Dancing in the Rain', 110, 'Energetic', 'Sophia Davis', '2023-01-03', '00:03:45', 'Movie 2', 7000, 'Upbeat song perfect for dancing.', 'Dancing in the Rain', 'Dance', 'English', 'Dancing in the rain, feeling so alive.'),
(4, 12, 34, 'Midnight Blues', 90, 'Melancholic', 'James Smith', '2023-01-04', '00:04:20', 'Show 1', 2500, 'Slow, soulful tune with deep lyrics.', 'Midnight Blues', 'Blues', 'English', 'Under the moonlight, singing the midnight blues.'),
(5, 78, 22, 'Echoes of Silence', 95, 'Calm', 'Olivia Garcia', '2023-01-05', '00:05:00', 'Game 2', 1500, 'Relaxing instrumental piece.', 'Echoes of Silence', 'Instrumental', 'N/A', 'Instrumental track with echoes and silence.'),
(6, 19, 55, 'Electric Waves', 128, 'Excited', 'Daniel Miller', '2023-01-06', '00:03:15', 'Movie 3', 4500, 'High-energy electronic track.', 'Electric Waves', 'Electronic', 'English', 'Feel the electric waves, moving through the night.'),
(7, 36, 91, 'Lost in the Forest', 100, 'Mysterious', 'Emma Wilson', '2023-01-07', '00:04:10', 'Show 2', 3200, 'Haunting melody with mysterious lyrics.', 'Lost in the Forest', 'Alternative', 'English', 'Lost in the forest, shadows all around.'),
(8, 50, 17, 'Rising Sun', 115, 'Motivational', 'Liam Martinez', '2023-01-08', '00:03:50', 'Game 3', 5200, 'Inspirational song about new beginnings.', 'Rising Sun', 'Pop', 'English', 'With the rising sun, a new day has begun.'),
(9, 72, 64, 'Ocean Waves', 85, 'Relaxing', 'Isabella Anderson', '2023-01-09', '00:04:30', 'Show 3', 2800, 'Soothing track with ocean sounds.', 'Ocean Waves', 'Ambient', 'English', 'Listen to the ocean waves, washing worries away.'),
(10, 95, 40, 'Fire and Ice', 140, 'Intense', 'William Hernandez', '2023-01-10', '00:03:40', 'Movie 4', 6000, 'Dynamic song with contrasting themes.', 'Fire and Ice', 'Rock', 'English', 'Feel the fire and ice, clashing in the night.'),
(11, 13, 78, 'Silent Whisper', 88, 'Peaceful', 'Mason Martinez', '2023-01-11', '00:03:20', 'Movie 5', 4000, 'Soft, gentle melody for relaxation.', 'Silent Whisper', 'New Age', 'English', 'A silent whisper in the night, soothing and calm.'),
(12, 21, 56, 'Galactic Journey', 135, 'Adventurous', 'Evelyn Taylor', '2023-01-12', '00:04:00', 'Game 4', 3200, 'Epic soundtrack for an adventure.', 'Galactic Journey', 'Orchestral', 'English', 'On a galactic journey, beyond the stars.'),
(13, 34, 49, 'City Lights', 122, 'Chill', 'Lucas Moore', '2023-01-13', '00:04:10', 'Show 4', 5000, 'Cool and relaxed vibes.', 'City Lights', 'Jazz', 'English', 'Under the city lights, everything\s so bright.'),
(14, 56, 92, 'Mystic River', 98, 'Calm', 'Harper Clark', '2023-01-14', '00:03:45', 'Movie 6', 2000, 'Mellow track with flowing melodies.', 'Mystic River', 'Ambient', 'English', 'Down by the mystic river, flowing free.'),
(15, 47, 81, 'Thunderstorm', 150, 'Aggressive', 'Jackson Lewis', '2023-01-15', '00:03:55', 'Game 5', 6000, 'Intense and powerful song.', 'Thunderstorm', 'Metal', 'English', 'In the eye of the thunderstorm, feel the power.'),
(16, 29, 33, 'Broken Dreams', 112, 'Reflective', 'Amelia Young', '2023-01-16', '00:04:20', 'Show 5', 4200, 'A reflective and emotional song.', 'Broken Dreams', 'Indie', 'English', 'Broken dreams and shattered hopes.'),
(17, 38, 75, 'Crystal Clear', 106, 'Fresh', 'Henry King', '2023-01-17', '00:03:30', 'Game 6', 4500, 'Bright and clear instrumental.', 'Crystal Clear', 'Instrumental', 'N/A', 'Instrumental with crystal clear sound.'),
(18, 22, 58, 'Wild Heart', 125, 'Bold', 'Sofia Martinez', '2023-01-18', '00:04:00', 'Movie 7', 5800, 'Bold and spirited anthem.', 'Wild Heart', 'Pop', 'English', 'I\ve got a wild heart, can\t be tamed.'),
(19, 67, 35, 'Starry Night', 92, 'Calm', 'Ella White', '2023-01-19', '00:04:15', 'Show 6', 3400, 'Gentle song with celestial themes.', 'Starry Night', 'Ambient', 'English', 'Under the starry night, feeling so small.'),
(20, 85, 44, 'Fireworks', 142, 'Exciting', 'Sebastian Harris', '2023-01-20', '00:03:25', 'Movie 8', 6900, 'Explosive and vibrant track.', 'Fireworks', 'Pop', 'English', 'Like fireworks in the sky, lighting up the night.'),
(21, 10, 53, 'Moonlight Sonata', 80, 'Peaceful', 'Victoria Hill', '2023-01-21', '00:05:10', 'Game 7', 3100, 'Soothing and classical piece.', 'Moonlight Sonata', 'Classical', 'English', 'In the moonlight, everything feels right.'),
(22, 89, 24, 'Savannah Dreams', 105, 'Relaxed', 'Isaac Allen', '2023-01-22', '00:03:50', 'Show 7', 3700, 'Dreamy and relaxing melody.', 'Savannah Dreams', 'World', 'English', 'Dreaming in the savannah, under the sun.'),
(23, 75, 39, 'Raging Fire', 130, 'Intense', 'Aubrey Scott', '2023-01-23', '00:04:05', 'Movie 9', 5600, 'Passionate and fiery song.', 'Raging Fire', 'Rock', 'English', 'Like a raging fire, burning bright.'),
(24, 41, 66, 'Frozen Lake', 90, 'Calm', 'Lily Green', '2023-01-24', '00:03:45', 'Show 8', 2700, 'Cold and tranquil track.', 'Frozen Lake', 'Ambient', 'English', 'On the frozen lake, everything is still.'),
(25, 14, 12, 'Electric Dreams', 126, 'Energetic', 'David Adams', '2023-01-25', '00:04:10', 'Game 8', 4700, 'Fast-paced electronic track.', 'Electric Dreams', 'Electronic', 'English', 'Living in electric dreams, never slowing down.'),
(26, 55, 88, 'Whispers in the Dark', 95, 'Mysterious', 'Mia Phillips', '2023-01-26', '00:03:30', 'Movie 10', 4200, 'Mysterious and haunting melody.', 'Whispers in the Dark', 'Indie', 'English', 'Whispers in the dark, secrets untold.'),
(27, 81, 61, 'Golden Sunset', 110, 'Serene', 'Gabriel Carter', '2023-01-27', '00:04:25', 'Show 9', 3200, 'Beautiful instrumental for relaxation.', 'Golden Sunset', 'Instrumental', 'N/A', 'Instrumental track with a golden sunset.'),
(28, 63, 28, 'Crystal Rain', 96, 'Peaceful', 'Natalie Wright', '2023-01-28', '00:03:55', 'Game 9', 3800, 'Gentle raindrop sounds in music.', 'Crystal Rain', 'Ambient', 'English', 'Listen to the crystal rain, falling softly.'),
(29, 93, 51, 'Dreamland', 118, 'Dreamy', 'Caleb Morris', '2023-01-29', '00:03:40', 'Movie 11', 5300, 'Dreamy and atmospheric melody.', 'Dreamland', 'Pop', 'English', 'Lost in dreamland, floating away.'),
(30, 27, 76, 'Midnight City', 105, 'Epic', 'Ella Bell', '2023-01-30', '00:04:20', 'Show 10', 4900, 'Epic soundtrack for a bustling city.', 'Midnight City', 'Orchestral', 'English', 'In the midnight city, lights never fade.'),
(31, 60, 31, 'Northern Lights', 95, 'Enchanting', 'Oliver Ward', '2023-01-31', '00:03:25', 'Game 10', 4400, 'Enchanting melodies of the aurora.', 'Northern Lights', 'Ambient', 'English', 'Under the northern lights, magic unfolds.'),
(32, 32, 84, 'Heartbeat', 128, 'Energetic', 'Sophie Turner', '2023-02-01', '00:03:30', 'Movie 12', 4600, 'Fast-paced track with a heartbeat rhythm.', 'Heartbeat', 'Electronic', 'English', 'Feel the heartbeat, racing through the night.'),
(33, 54, 19, 'Whispering Pines', 85, 'Peaceful', 'Jack Cooper', '2023-02-02', '00:04:15', 'Show 11', 3800, 'Tranquil song with nature sounds.', 'Whispering Pines', 'Ambient', 'English', 'In the whispering pines, find peace.'),
(34, 76, 69, 'Lost Horizon', 110, 'Reflective', 'Emma Reed', '2023-02-03', '00:03:50', 'Game 11', 5400, 'Reflective melody for contemplation.', 'Lost Horizon', 'Pop', 'English', 'In the lost horizon, dreams are found.'),
(35, 89, 46, 'Eternal Flame', 120, 'Romantic', 'Benjamin Bailey', '2023-02-04', '00:03:40', 'Movie 13', 6000, 'Romantic ballad about eternal love.', 'Eternal Flame', 'Rock', 'English', 'Like an eternal flame, burning forever.'),
(36, 15, 67, 'Rainbow Serenade', 95, 'Joyful', 'Chloe Stewart', '2023-02-05', '00:04:10', 'Show 12', 4300, 'Upbeat melody celebrating colors.', 'Rainbow Serenade', 'Pop', 'English', 'In a rainbow serenade, colors shine bright.'),
(37, 37, 92, 'Morning Dew', 110, 'Calm', 'Leo Richardson', '2023-02-06', '00:03:20', 'Game 12', 3900, 'Gentle and serene morning melody.', 'Morning Dew', 'Ambient', 'English', 'Under the morning dew, a new day begins.'),
(38, 58, 26, 'Phoenix Rising', 125, 'Epic', 'Aria Hughes', '2023-02-07', '00:04:00', 'Movie 14', 5700, 'Epic anthem of resilience.', 'Phoenix Rising', 'Orchestral', 'English', 'Like a phoenix rising from the ashes.'),
(39, 83, 63, 'Silent Echoes', 100, 'Reflective', 'Logan Foster', '2023-02-08', '00:03:45', 'Show 13', 3400, 'Reflective melody with echoes of the past.', 'Silent Echoes', 'Jazz', 'English', 'In silent echoes, memories fade.'),
(40, 11, 38, 'Sapphire Skies', 115, 'Tranquil', 'Hazel Richardson', '2023-02-09', '00:04:20', 'Movie 15', 3100, 'Tranquil serenity under sapphire skies.', 'Sapphire Skies', 'Pop', 'English', 'Under sapphire skies, peace flows.'),
(41, 25, 71, 'Moonlit Whispers', 105, 'Romantic', 'Xavier Gray', '2023-02-10', '00:04:15', 'Game 13', 3600, 'Romantic whispers under the moonlit night.', 'Moonlit Whispers', 'New Age', 'English', 'In moonlit whispers, love softly speaks.'),
(42, 48, 14, 'Dancing Starlight', 128, 'Energetic', 'Harper Bell', '2023-02-11', '00:03:15', 'Show 14', 4700, 'Energetic dance under the starlit sky.', 'Dancing Starlight', 'Electronic', 'English', 'Dancing in starlight, energy ignites.'),
(43, 70, 79, 'Lost in Translation', 100, 'Reflective', 'Mila Rivera', '2023-02-12', '00:04:10', 'Movie 16', 3200, 'Lost in thoughts lost in translation.', 'Lost in Translation', 'Jazz', 'English', 'Lost in translation, meanings evolve.'),
(44, 84, 30, 'Rising Phoenix', 118, 'Epic', 'Ezra Hughes', '2023-02-13', '00:03:30', 'Game 14', 4900, 'Rising from ashes like a phoenix.', 'Rising Phoenix', 'Pop', 'English', 'Like a rising phoenix, reborn and bold.'),
(45, 31, 57, 'Serenity Falls', 95, 'Tranquil', 'Alexis Foster', '2023-02-14', '00:04:20', 'Show 15', 3800, 'Calm and serene waterfall sounds.', 'Serenity Falls', 'Ambient', 'English', 'By serenity falls, find inner peace.'),
(46, 59, 86, 'Golden Dreams', 115, 'Hopeful', 'Parker Collins', '2023-02-15', '00:03:50', 'Movie 17', 5500, 'Dreamy and hopeful melody.', 'Golden Dreams', 'Pop', 'English', 'Chasing golden dreams, reaching for the sky.'),
(47, 77, 37, 'Whispering Winds', 92, 'Peaceful', 'Riley Murphy', '2023-02-16', '00:04:15', 'Game 15', 3300, 'Gentle breeze in musical form.', 'Whispering Winds', 'Ambient', 'English', 'Whispering winds, calming the soul.'),
(48, 40, 82, 'Ethereal Journey', 108, 'Mystical', 'Quinn Perez', '2023-02-17', '00:03:40', 'Show 16', 4100, 'Mysterious and ethereal track.', 'Ethereal Journey', 'Electronic', 'English', 'Embark on an ethereal journey.'),
(49, 65, 52, 'Starlight Sonata', 85, 'Dreamy', 'Sydney Cook', '2023-02-18', '00:04:25', 'Movie 18', 2900, 'Dreamy sonata under starlit skies.', 'Starlight Sonata', 'Classical', 'English', 'In starlight sonata, dreams unfold.'),
(50, 21, 23, 'Enchanted Garden', 120, 'Magical', 'Elena Patterson', '2023-02-19', '00:03:50', 'Game 16', 5200, 'Magical wonders of an enchanted garden.', 'Enchanted Garden', 'Orchestral', 'English', 'In enchanted garden, dreams bloom.'),
(51, 44, 68, 'Echoes of Spring', 112, 'Joyful', 'Blake Sanchez', '2023-02-20', '00:03:55', 'Show 17', 3600, 'Joyful echoes of springtime.', 'Echoes of Spring', 'Pop', 'English', 'In echoes of spring, joy fills the air.'),
(52, 62, 42, 'Whispering Sands', 100, 'Tranquil', 'Zoe Edwards', '2023-02-21', '00:04:00', 'Movie 19', 4300, 'Tranquil melodies of whispering sands.', 'Whispering Sands', 'Ambient', 'English', 'In whispering sands, find peace within.'),
(53, 85, 17, 'Silver Lining', 122, 'Hopeful', 'Nathan Howard', '2023-02-22', '00:03:20', 'Game 17', 4800, 'Hopeful melody with a silver lining.', 'Silver Lining', 'Pop', 'English', 'In silver lining, hope always shines.'),
(54, 19, 74, 'Ocean Breeze', 96, 'Refreshing', 'Gabriella Flores', '2023-02-23', '00:04:10', 'Show 18', 3500, 'Refreshing ocean breeze in music.', 'Ocean Breeze', 'Ambient', 'English', 'Feel the ocean breeze, refreshing and cool.'),
(55, 37, 91, 'Mystic Sands', 110, 'Mysterious', 'Adrian Carter', '2023-02-24', '00:03:50', 'Movie 20', 5400, 'Mystical journey through sands of time.', 'Mystic Sands', 'Electronic', 'English', 'In mystic sands, secrets intertwine.'),
(56, 59, 30, 'Dreamers Waltz', 95, 'Whimsical', 'Alyssa Russell', '2023-02-25', '00:04:25', 'Game 18', 3900, 'Whimsical waltz for dreamers.', 'Dreamers Waltz', 'Classical', 'English', 'In dreamers waltz, fantasies dance.'),
(57, 71, 66, 'Epic Odyssey', 130, 'Epic', 'Christian Hayes', '2023-02-26', '00:03:45', 'Show 19', 5700, 'Epic journey through vast landscapes.', 'Epic Odyssey', 'Orchestral', 'English', 'In epic odyssey, legends are born.'),
(58, 43, 14, 'Crimson Sunset', 108, 'Reflective', 'Amber Kelly', '2023-02-27', '00:04:20', 'Movie 21', 3200, 'Reflective melody under crimson skies.', 'Crimson Sunset', 'Pop', 'English', 'Under crimson sunset, memories rise.'),
(59, 22, 82, 'Solitude', 95, 'Peaceful', 'Brayden Price', '2023-02-28', '00:03:55', 'Game 19', 3800, 'Peaceful solitude in musical form.', 'Solitude', 'Ambient', 'English', 'In solitude, find inner peace.'),
(60, 54, 57, 'Echoes of Autumn', 110, 'Reflective', 'Samantha Bell', '2023-03-01', '00:03:40', 'Show 20', 4500, 'Reflective echoes of the autumn breeze.', 'Echoes of Autumn', 'Jazz', 'English', 'In echoes of autumn, memories fall.'),
(61, 76, 37, 'Celestial Serenade', 122, 'Serene', 'Nicholas Murphy', '2023-03-02', '00:04:10', 'Movie 22', 5500, 'Celestial serenade under starlit skies.', 'Celestial Serenade', 'Ambient', 'English', 'In celestial serenade, stars align.'),
(62, 98, 74, 'Whispers of Love', 100, 'Romantic', 'Savannah Flores', '2023-03-03', '00:03:20', 'Game 20', 4600, 'Whispers of love in the gentle breeze.', 'Whispers of Love', 'Pop', 'English', 'In whispers of love, hearts entwine.'),
(63, 35, 24, 'Aurora Borealis', 112, 'Enchanting', 'Mateo Howard', '2023-03-04', '00:04:00', 'Show 21', 5200, 'Enchanting melodies of the northern lights.', 'Aurora Borealis', 'Orchestral', 'English', 'In aurora borealis, dreams take flight.'),
(64, 63, 68, 'Eternal Journey', 95, 'Epic', 'Aaliyah Hayes', '2023-03-05', '00:04:25', 'Movie 23', 3900, 'Epic journey through eternity.', 'Eternal Journey', 'Classical', 'English', 'In eternal journey, destinies entwine.'),
(65, 87, 30, 'Sapphire Dreams', 118, 'Hopeful', 'Jordan Kelly', '2023-03-06', '00:03:45', 'Game 21', 5800, 'Hopeful melodies under sapphire skies.', 'Sapphire Dreams', 'Pop', 'English', 'In sapphire dreams, aspirations soar.'),
(66, 11, 91, 'Echoes of Winter', 105, 'Reflective', 'Arianna Carter', '2023-03-07', '00:04:20', 'Show 22', 3400, 'Reflective echoes of winter\s silence.', 'Echoes of Winter', 'Ambient', 'English', 'In echoes of winter, memories whisper.'),
(67, 33, 14, 'Whispering Brook', 128, 'Tranquil', 'Aiden Price', '2023-03-08', '00:03:30', 'Movie 24', 4900, 'Tranquil whispers of a babbling brook.', 'Whispering Brook', 'Electronic', 'English', 'In whispering brook, serenity flows.'),
(68, 55, 82, 'Celestial Symphony', 100, 'Serene', 'Isabelle Bell', '2023-03-09', '00:04:10', 'Game 22', 3600, 'Celestial symphony under moonlit skies.', 'Celestial Symphony', 'Orchestral', 'English', 'In celestial symphony, stars dance.'),
(69, 77, 57, 'Echoes of Hope', 110, 'Hopeful', 'Elijah Murphy', '2023-03-10', '00:03:50', 'Show 23', 4300, 'Hopeful echoes of a brighter tomorrow.', 'Echoes of Hope', 'Pop', 'English', 'In echoes of hope, dreams ignite.'),
(70, 25, 37, 'Ethereal Waters', 95, 'Tranquil', 'Penelope Bell', '2023-03-11', '00:04:25', 'Movie 25', 4000, 'Ethereal waters in a tranquil melody.', 'Ethereal Waters', 'Ambient', 'English', 'In ethereal waters, peace flows.'),
(71, 47, 68, 'Serenity', 110, 'Peaceful', 'Zachary Hayes', '2023-03-12', '00:03:55', 'Game 23', 4700, 'Serenity in the beauty of a gentle breeze.', 'Serenity', 'Pop', 'English', 'In serenity, find tranquility.'),
(72, 69, 30, 'Dreamscape', 122, 'Enchanting', 'Madeline Kelly', '2023-03-13', '00:03:20', 'Show 24', 5400, 'Enchanting dreamscape of endless possibilities.', 'Dreamscape', 'Orchestral', 'English', 'In dreamscape, imagination soars.'),
(73, 91, 91, 'Crimson Horizon', 100, 'Reflective', 'Gavin Carter', '2023-03-14', '00:04:00', 'Movie 26', 3500, 'Reflective melodies under a crimson sky.', 'Crimson Horizon', 'Pop', 'English', 'Under crimson horizon, memories rise.'),
(74, 14, 14, 'Whispering Dreams', 95, 'Peaceful', 'Natalia Price', '2023-03-15', '00:04:20', 'Game 24', 4200, 'Whispering dreams in the quiet night.', 'Whispering Dreams', 'Ambient', 'English', 'In whispering dreams, peace resides.'),
(75, 36, 82, 'Eternal Serenade', 128, 'Romantic', 'Tyler Bell', '2023-03-16', '00:03:30', 'Show 25', 4900, 'Romantic serenade that spans eternity.', 'Eternal Serenade', 'Electronic', 'English', 'In eternal serenade, hearts entwine.'),
(76, 58, 57, 'Moonlit Mirage', 100, 'Dreamy', 'Aria Murphy', '2023-03-17', '00:04:25', 'Movie 27', 4600, 'Moonlit mirage of enchanting dreams.', 'Moonlit Mirage', 'Ambient', 'English', 'In moonlit mirage, dreams intertwine.'),
(77, 80, 37, 'Starry Night', 110, 'Hopeful', 'Xander Hayes', '2023-03-18', '00:03:50', 'Game 25', 5100, 'Hopeful melodies under starry skies.', 'Starry Night', 'Pop', 'English', 'In starry night, dreams reach the stars.'),
(78, 90, 68, 'Whispers of Hope', 112, 'Reflective', 'Hannah Carter', '2023-03-19', '00:03:55', 'Show 26', 5700, 'Reflective whispers of hope for tomorrow.', 'Whispers of Hope', 'Classical', 'English', 'In whispers of hope, find strength.'),
(79, 28, 30, 'Ethereal Symphony', 95, 'Tranquil', 'Chase Kelly', '2023-03-20', '00:04:20', 'Movie 28', 3200, 'Ethereal symphony in peaceful harmony.', 'Ethereal Symphony', 'Ambient', 'English', 'In ethereal symphony, find tranquility.'),
(80, 50, 57, 'Celestial Dreams', 110, 'Hopeful', 'Aurora Bell', '2023-03-21', '00:03:40', 'Game 26', 3800, 'Celestial dreams under moonlit skies.', 'Celestial Dreams', 'Pop', 'English', 'In celestial dreams, hope illuminates.'),
(81, 72, 91, 'Sapphire Horizon', 100, 'Reflective', 'Kai Hayes', '2023-03-22', '00:03:45', 'Show 27', 4400, 'Reflective melody under sapphire skies.', 'Sapphire Horizon', 'Ambient', 'English', 'Under sapphire horizon, dreams emerge.'),
(82, 94, 14, 'Tranquil Echoes', 128, 'Tranquil', 'Layla Carter', '2023-03-23', '00:03:25', 'Movie 29', 5000, 'Tranquil echoes in peaceful serenity.', 'Tranquil Echoes', 'Electronic', 'English', 'In tranquil echoes, find inner peace.'),
(83, 16, 82, 'Whispering Shadows', 100, 'Peaceful', 'River Hayes', '2023-03-24', '00:04:10', 'Game 27', 5400, 'Whispering shadows in the moonlit night.', 'Whispering Shadows', 'Ambient', 'English', 'In whispering shadows, peace resides.'),
(84, 38, 57, 'Eternal Symphony', 95, 'Romantic', 'Nova Bell', '2023-03-25', '00:04:25', 'Show 28', 3700, 'Romantic symphony that spans eternity.', 'Eternal Symphony', 'Orchestral', 'English', 'In eternal symphony, hearts entwine.'),
(85, 60, 37, 'Moonlit Echoes', 105, 'Dreamy', 'Luna Carter', '2023-03-26', '00:03:20', 'Movie 30', 4600, 'Moonlit echoes of enchanted dreams.', 'Moonlit Echoes', 'Ambient', 'English', 'In moonlit echoes, dreams dance.'),
(86, 82, 68, 'Stellar Serenade', 112, 'Hopeful', 'Cosmo Hayes', '2023-03-27', '00:03:55', 'Game 28', 5200, 'Hopeful serenade under starlit skies.', 'Stellar Serenade', 'Pop', 'English', 'In stellar serenade, hope ignites.'),
(87, 17, 30, 'Whispers of Serenity', 95, 'Tranquil', 'Nova Kelly', '2023-03-28', '00:04:20', 'Show 29', 3000, 'Whispers of serenity in peaceful tranquility.', 'Whispers of Serenity', 'Ambient', 'English', 'In whispers of serenity, find inner peace.'),
(88, 39, 57, 'Ethereal Dreams', 110, 'Hopeful', 'Orion Bell', '2023-03-29', '00:03:40', 'Movie 31', 3400, 'Ethereal dreams under moonlit skies.', 'Ethereal Dreams', 'Pop', 'English', 'In ethereal dreams, find endless possibilities.'),
(89, 61, 91, 'Sapphire Serenade', 100, 'Reflective', 'Aurora Hayes', '2023-03-30', '00:03:45', 'Game 29', 3800, 'Reflective serenade under sapphire skies.', 'Sapphire Serenade', 'Ambient', 'English', 'Under sapphire serenade, find tranquility.'),
(90, 83, 14, 'Whispering Waves', 128, 'Tranquil', 'Kai Carter', '2023-03-31', '00:03:25', 'Show 30', 4200, 'Tranquil whispers in the ocean waves.', 'Whispering Waves', 'Electronic', 'English', 'In whispering waves, peace drifts.'),
(91, 22, 82, 'Eternal Echoes', 100, 'Romantic', 'Cosmo Bell', '2023-04-01', '00:04:10', 'Movie 32', 4800, 'Romantic echoes that span eternity.', 'Eternal Echoes', 'Classical', 'English', 'In eternal echoes, hearts entwine.'),
(92, 44, 57, 'Moonlit Melodies', 95, 'Dreamy', 'Luna Hayes', '2023-04-02', '00:04:25', 'Game 30', 5100, 'Moonlit melodies of enchanting dreams.', 'Moonlit Melodies', 'Ambient', 'English', 'In moonlit melodies, dreams dance.'),
(93, 66, 37, 'Stellar Symphony', 110, 'Hopeful', 'Nova Hayes', '2023-04-03', '00:03:50', 'Show 31', 3800, 'Hopeful symphony under starlit skies.', 'Stellar Symphony', 'Pop', 'English', 'In stellar symphony, stars ignite the night.'),
(94, 88, 68, 'Whispers of Stardust', 112, 'Reflective', 'Orion Hayes', '2023-04-04', '00:03:55', 'Movie 33', 4400, 'Reflective whispers of stardust dreams.', 'Whispers of Stardust', 'Ambient', 'English', 'In whispers of stardust, dreams glow.'),
(95, 11, 30, 'Ethereal Serenade', 95, 'Tranquil', 'Kai Carter', '2023-04-05', '00:04:20', 'Game 31', 3200, 'Ethereal serenade in a peaceful melody.', 'Ethereal Serenade', 'Ambient', 'English', 'In ethereal serenade, tranquility flows.'),
(96, 33, 57, 'Sapphire Symphony', 110, 'Hopeful', 'Cosmo Bell', '2023-04-06', '00:03:40', 'Show 32', 3600, 'Hopeful symphony under sapphire skies.', 'Sapphire Symphony', 'Pop', 'English', 'In sapphire symphony, dreams soar high.'),
(97, 55, 91, 'Whispering Starlight', 100, 'Reflective', 'Aurora Hayes', '2023-04-07', '00:03:45', 'Movie 34', 4900, 'Reflective whispers under starlit skies.', 'Whispering Starlight', 'Ambient', 'English', 'In whispering starlight, find peace.'),
(98, 77, 14, 'Stellar Serenity', 128, 'Tranquil', 'Orion Carter', '2023-04-08', '00:03:25', 'Game 32', 5300, 'Tranquil serenity under stellar skies.', 'Stellar Serenity', 'Electronic', 'English', 'In stellar serenity, peace resides.'),
(99, 99, 82, 'Eternal Echo', 100, 'Romantic', 'Cosmo Bell', '2023-04-09', '00:04:10', 'Show 33', 3200, 'Romantic echo that spans eternity.', 'Eternal Echo', 'Classical', 'English', 'In eternal echo, hearts entwine.'),
(100, 21, 57, 'Moonlit Serenade', 95, 'Dreamy', 'Luna Hayes', '2023-04-10', '00:04:25', 'Movie 35', 3600, 'Moonlit serenade of enchanting dreams.', 'Moonlit Serenade', 'Ambient', 'English', 'In moonlit serenade, dreams intertwine.');





INSERT INTO Listen (User_ID, Song_ID, Timestamp) VALUES
(78, 26, '2024-07-05 12:00:00'),
(22, 91, '2024-07-05 12:05:00'),
(3, 82, '2024-07-05 12:10:00'),
(17, 5, '2024-07-05 12:15:00'),
(10, 54, '2024-07-05 12:20:00'),
(94, 36, '2024-07-05 12:25:00'),
(89, 11, '2024-07-05 12:30:00'),
(23, 80, '2024-07-05 12:35:00'),
(29, 96, '2024-07-05 12:40:00'),
(45, 49, '2024-07-05 12:45:00'),
(67, 41, '2024-07-05 12:50:00'),
(53, 92, '2024-07-05 12:55:00'),
(28, 57, '2024-07-05 13:00:00'),
(6, 10, '2024-07-05 13:05:00'),
(5, 21, '2024-07-05 13:10:00'),
(75, 1, '2024-07-05 13:15:00'),
(40, 12, '2024-07-05 13:20:00'),
(86, 3, '2024-07-05 13:25:00'),
(34, 15, '2024-07-05 13:30:00'),
(98, 2, '2024-07-05 13:35:00'),
(12, 14, '2024-07-05 13:40:00'),
(66, 32, '2024-07-05 13:45:00'),
(83, 77, '2024-07-05 13:50:00'),
(79, 17, '2024-07-05 13:55:00'),
(9, 64, '2024-07-05 14:00:00'),
(72, 90, '2024-07-05 14:05:00'),
(88, 86, '2024-07-05 14:10:00'),
(36, 43, '2024-07-05 14:15:00'),
(81, 60, '2024-07-05 14:20:00'),
(42, 84, '2024-07-05 14:25:00'),
(63, 37, '2024-07-05 14:30:00'),
(38, 95, '2024-07-05 14:35:00'),
(84, 8, '2024-07-05 14:40:00'),
(97, 34, '2024-07-05 14:45:00'),
(85, 47, '2024-07-05 14:50:00'),
(60, 45, '2024-07-05 14:55:00'),
(91, 58, '2024-07-05 15:00:00'),
(65, 76, '2024-07-05 15:05:00'),
(54, 38, '2024-07-05 15:10:00'),
(19, 87, '2024-07-05 15:15:00'),
(13, 61, '2024-07-05 15:20:00'),
(50, 31, '2024-07-05 15:25:00'),
(49, 29, '2024-07-05 15:30:00'),
(57, 33, '2024-07-05 15:35:00'),
(43, 73, '2024-07-05 15:40:00'),
(15, 27, '2024-07-05 15:45:00'),
(18, 20, '2024-07-05 15:50:00'),
(59, 70, '2024-07-05 15:55:00'),
(87, 85, '2024-07-05 16:00:00'),
(4, 30, '2024-07-05 16:05:00'),
(77, 88, '2024-07-05 16:10:00'),
(48, 66, '2024-07-05 16:15:00'),
(31, 94, '2024-07-05 16:20:00'),
(41, 99, '2024-07-05 16:25:00'),
(52, 50, '2024-07-05 16:30:00'),
(44, 24, '2024-07-05 16:35:00'),
(25, 19, '2024-07-05 16:40:00'),
(1, 39, '2024-07-05 16:45:00'),
(20, 40, '2024-07-05 16:50:00'),
(14, 62, '2024-07-05 16:55:00'),
(32, 42, '2024-07-05 17:00:00'),
(26, 13, '2024-07-05 17:05:00'),
(11, 7, '2024-07-05 17:10:00'),
(99, 44, '2024-07-05 17:15:00'),
(95, 52, '2024-07-05 17:20:00'),
(76, 23, '2024-07-05 17:25:00'),
(55, 72, '2024-07-05 17:30:00'),
(35, 71, '2024-07-05 17:35:00'),
(16, 25, '2024-07-05 17:40:00'),
(24, 6, '2024-07-05 17:45:00'),
(30, 9, '2024-07-05 17:50:00'),
(51, 18, '2024-07-05 17:55:00'),
(56, 75, '2024-07-05 18:00:00'),
(27, 53, '2024-07-05 18:05:00'),
(68, 28, '2024-07-05 18:10:00'),
(37, 22, '2024-07-05 18:15:00'),
(2, 67, '2024-07-05 18:20:00'),
(64, 56, '2024-07-05 18:25:00'),
(70, 48, '2024-07-05 18:30:00'),
(46, 74, '2024-07-05 18:35:00'),
(33, 98, '2024-07-05 18:40:00'),
(7, 68, '2024-07-05 18:45:00'),
(62, 69, '2024-07-05 18:50:00'),
(61, 79, '2024-07-05 18:55:00'),
(21, 4, '2024-07-05 19:00:00'),
(8, 100, '2024-07-05 19:05:00'),
(58, 59, '2024-07-05 19:10:00'),
(47, 55, '2024-07-05 19:15:00'),
(39, 83, '2024-07-05 19:20:00'),
(69, 35, '2024-07-05 19:25:00'),
(93, 16, '2024-07-05 19:30:00'),
(71, 78, '2024-07-05 19:35:00'),
(74, 63, '2024-07-05 19:40:00'),
(92, 93, '2024-07-05 19:45:00'),
(96, 46, '2024-07-05 19:50:00'),
(90, 81, '2024-07-05 19:55:00'),
(82, 97, '2024-07-05 20:00:00'),
(73, 89, '2024-07-05 20:05:00'),
(100, 50, '2024-07-05 20:10:00');





INSERT INTO Downloads (User_ID, Song_ID, Timestamp) VALUES
(1, 45, '2024-07-05 12:00:00'),
(2, 78, '2024-07-05 12:05:00'),
(3, 12, '2024-07-05 12:10:00'),
(4, 34, '2024-07-05 12:15:00'),
(5, 67, '2024-07-05 12:20:00'),
(6, 89, '2024-07-05 12:25:00'),
(7, 23, '2024-07-05 12:30:00'),
(8, 56, '2024-07-05 12:35:00'),
(9, 15, '2024-07-05 12:40:00'),
(10, 92, '2024-07-05 12:45:00'),
(11, 27, '2024-07-05 12:50:00'),
(12, 39, '2024-07-05 12:55:00'),
(13, 81, '2024-07-05 13:00:00'),
(14, 47, '2024-07-05 13:05:00'),
(15, 5, '2024-07-05 13:10:00'),
(16, 76, '2024-07-05 13:15:00'),
(17, 53, '2024-07-05 13:20:00'),
(18, 2, '2024-07-05 13:25:00'),
(19, 88, '2024-07-05 13:30:00'),
(20, 31, '2024-07-05 13:35:00'),
(21, 65, '2024-07-05 13:40:00'),
(22, 21, '2024-07-05 13:45:00'),
(23, 97, '2024-07-05 13:50:00'),
(24, 49, '2024-07-05 13:55:00'),
(25, 8, '2024-07-05 14:00:00'),
(26, 63, '2024-07-05 14:05:00'),
(27, 30, '2024-07-05 14:10:00'),
(28, 77, '2024-07-05 14:15:00'),
(29, 10, '2024-07-05 14:20:00'),
(30, 69, '2024-07-05 14:25:00'),
(31, 26, '2024-07-05 14:30:00'),
(32, 50, '2024-07-05 14:35:00'),
(33, 94, '2024-07-05 14:40:00'),
(34, 17, '2024-07-05 14:45:00'),
(35, 66, '2024-07-05 14:50:00'),
(36, 38, '2024-07-05 14:55:00'),
(37, 70, '2024-07-05 15:00:00'),
(38, 6, '2024-07-05 15:05:00'),
(39, 93, '2024-07-05 15:10:00'),
(40, 14, '2024-07-05 15:15:00'),
(41, 55, '2024-07-05 15:20:00'),
(42, 43, '2024-07-05 15:25:00'),
(43, 25, '2024-07-05 15:30:00'),
(44, 85, '2024-07-05 15:35:00'),
(45, 9, '2024-07-05 15:40:00'),
(46, 62, '2024-07-05 15:45:00'),
(47, 4, '2024-07-05 15:50:00'),
(48, 99, '2024-07-05 15:55:00'),
(49, 48, '2024-07-05 16:00:00'),
(50, 20, '2024-07-05 16:05:00'),
(51, 71, '2024-07-05 16:10:00'),
(52, 11, '2024-07-05 16:15:00'),
(53, 54, '2024-07-05 16:20:00'),
(54, 41, '2024-07-05 16:25:00'),
(55, 7, '2024-07-05 16:30:00'),
(56, 83, '2024-07-05 16:35:00'),
(57, 24, '2024-07-05 16:40:00'),
(58, 98, '2024-07-05 16:45:00'),
(59, 32, '2024-07-05 16:50:00'),
(60, 1, '2024-07-05 16:55:00'),
(61, 80, '2024-07-05 17:00:00'),
(62, 33, '2024-07-05 17:05:00'),
(63, 52, '2024-07-05 17:10:00'),
(64, 90, '2024-07-05 17:15:00'),
(65, 35, '2024-07-05 17:20:00'),
(66, 60, '2024-07-05 17:25:00'),
(67, 22, '2024-07-05 17:30:00'),
(68, 74, '2024-07-05 17:35:00'),
(69, 18, '2024-07-05 17:40:00'),
(70, 95, '2024-07-05 17:45:00'),
(71, 42, '2024-07-05 17:50:00'),
(72, 79, '2024-07-05 17:55:00'),
(73, 3, '2024-07-05 18:00:00'),
(74, 84, '2024-07-05 18:05:00'),
(75, 46, '2024-07-05 18:10:00'),
(76, 16, '2024-07-05 18:15:00'),
(77, 58, '2024-07-05 18:20:00'),
(78, 28, '2024-07-05 18:25:00'),
(79, 37, '2024-07-05 18:30:00'),
(80, 87, '2024-07-05 18:35:00'),
(81, 13, '2024-07-05 18:40:00'),
(82, 100, '2024-07-05 18:45:00'),
(83, 75, '2024-07-05 18:50:00'),
(84, 51, '2024-07-05 18:55:00'),
(85, 19, '2024-07-05 19:00:00'),
(86, 68, '2024-07-05 19:05:00'),
(87, 36, '2024-07-05 19:10:00'),
(88, 40, '2024-07-05 19:15:00'),
(89, 72, '2024-07-05 19:20:00'),
(90, 57, '2024-07-05 19:25:00'),
(91, 29, '2024-07-05 19:30:00'),
(92, 86, '2024-07-05 19:35:00'),
(93, 59, '2024-07-05 19:40:00'),
(94, 44, '2024-07-05 19:45:00'),
(95, 73, '2024-07-05 19:50:00'),
(96, 64, '2024-07-05 19:55:00'),
(97, 82, '2024-07-05 20:00:00'),
(98, 91, '2024-07-05 20:05:00'),
(99, 61, '2024-07-05 20:10:00'),
(100, 96, '2024-07-05 20:15:00');





-- Generating 100 entries for the Track table
INSERT INTO Track (Track_id, Creator, Track_name, Length) VALUES
(1, 2, 'Track 1', '00:05:00'),
(2, 2, 'Track 2', '00:04:30'),
(3, 3, 'Track 3', '00:03:45'),
(4, 4, 'Track 4', '00:04:15'),
(5, 5, 'Track 5', '00:04:00'),
(6, 6, 'Track 6', '00:04:30'),
(7, 7, 'Track 7', '00:05:10'),
(8, 8, 'Track 8', '00:03:20'),
(9, 9, 'Track 9', '00:04:45'),
(10, 10, 'Track 10', '00:04:25'),
(11, 11, 'Track 11', '00:03:55'),
(12, 12, 'Track 12', '00:05:20'),
(13, 13, 'Track 13', '00:04:10'),
(14, 14, 'Track 14', '00:04:40'),
(15, 15, 'Track 15', '00:03:30'),
(16, 16, 'Track 16', '00:05:05'),
(17, 17, 'Track 17', '00:03:55'),
(18, 18, 'Track 18', '00:04:15'),
(19, 19, 'Track 19', '00:04:25'),
(20, 20, 'Track 20', '00:03:45'),
(21, 21, 'Track 21', '00:04:00'),
(22, 22, 'Track 22', '00:04:30'),
(23, 23, 'Track 23', '00:04:10'),
(24, 24, 'Track 24', '00:03:20'),
(25, 25, 'Track 25', '00:04:55'),
(26, 26, 'Track 26', '00:05:30'),
(27, 27, 'Track 27', '00:04:40'),
(28, 28, 'Track 28', '00:03:35'),
(29, 29, 'Track 29', '00:04:25'),
(30, 30, 'Track 30', '00:04:15'),
(31, 31, 'Track 31', '00:03:50'),
(32, 32, 'Track 32', '00:04:05'),
(33, 33, 'Track 33', '00:05:15'),
(34, 34, 'Track 34', '00:03:30'),
(35, 35, 'Track 35', '00:04:20'),
(36, 36, 'Track 36', '00:04:10'),
(37, 37, 'Track 37', '00:03:45'),
(38, 38, 'Track 38', '00:05:00'),
(39, 39, 'Track 39', '00:04:30'),
(40, 40, 'Track 40', '00:04:25'),
(41, 41, 'Track 41', '00:03:55'),
(42, 42, 'Track 42', '00:05:20'),
(43, 43, 'Track 43', '00:04:00'),
(44, 44, 'Track 44', '00:04:45'),
(45, 45, 'Track 45', '00:03:25'),
(46, 46, 'Track 46', '00:04:15'),
(47, 47, 'Track 47', '00:05:05'),
(48, 48, 'Track 48', '00:03:40'),
(49, 49, 'Track 49', '00:04:50'),
(50, 50, 'Track 50', '00:04:35'),
(51, 51, 'Track 51', '00:03:15'),
(52, 52, 'Track 52', '00:05:10'),
(53, 53, 'Track 53', '00:04:20'),
(54, 54, 'Track 54', '00:04:30'),
(55, 55, 'Track 55', '00:03:45'),
(56, 56, 'Track 56', '00:04:25'),
(57, 57, 'Track 57', '00:04:05'),
(58, 58, 'Track 58', '00:03:55'),
(59, 59, 'Track 59', '00:05:00'),
(60, 60, 'Track 60', '00:04:40'),
(61, 61, 'Track 61', '00:03:30'),
(62, 62, 'Track 62', '00:04:15'),
(63, 63, 'Track 63', '00:04:50'),
(64, 64, 'Track 64', '00:03:25'),
(65, 65, 'Track 65', '00:04:35'),
(66, 66, 'Track 66', '00:04:10'),
(67, 67, 'Track 67', '00:04:20'),
(68, 68, 'Track 68', '00:03:40'),
(69, 69, 'Track 69', '00:05:05'),
(70, 70, 'Track 70', '00:03:55'),
(71, 71, 'Track 71', '00:04:25'),
(72, 72, 'Track 72', '00:04:00'),
(73, 73, 'Track 73', '00:03:15'),
(74, 74, 'Track 74', '00:05:30'),
(75, 75, 'Track 75', '00:04:45'),
(76, 76, 'Track 76', '00:03:20'),
(77, 77, 'Track 77', '00:04:40'),
(78, 78, 'Track 78', '00:04:10'),
(79, 79, 'Track 79', '00:03:30'),
(80, 80, 'Track 80', '00:05:00'),
(81, 81, 'Track 81', '00:04:15'),
(82, 82, 'Track 82', '00:04:25'),
(83, 83, 'Track 83', '00:03:55'),
(84, 84, 'Track 84', '00:04:50'),
(85, 85, 'Track 85', '00:03:45'),
(86, 86, 'Track 86', '00:04:35'),
(87, 87, 'Track 87', '00:04:20'),
(88, 88, 'Track 88', '00:03:25'),
(89, 89, 'Track 89', '00:04:05'),
(90, 90, 'Track 90', '00:05:10'),
(91, 91, 'Track 91', '00:03:55'),
(92, 92, 'Track 92', '00:04:30'),
(93, 93, 'Track 93', '00:04:40'),
(94, 94, 'Track 94', '00:03:40'),
(95, 95, 'Track 95', '00:04:20'),
(96, 96, 'Track 96', '00:04:00'),
(97, 97, 'Track 97', '00:03:30'),
(98, 98, 'Track 98', '00:04:45'),
(99, 99, 'Track 99', '00:04:10'),
(100, 100, 'Track 100', '00:05:05');



-- Generating entries for the Contains table
INSERT INTO Contains (Track_ID, Song_ID) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 21),
(11, 22),
(12, 23),
(12, 24),
(13, 25),
(13, 26),
(14, 27),
(14, 28),
(15, 29),
(15, 30),
(16, 31),
(16, 32),
(17, 33),
(17, 34),
(18, 35),
(18, 36),
(19, 37),
(19, 38),
(20, 39),
(20, 40),
(21, 41),
(21, 42),
(22, 43),
(22, 44),
(23, 45),
(23, 46),
(24, 47),
(24, 48),
(25, 49),
(25, 50),
(26, 51),
(26, 52),
(27, 53),
(27, 54),
(28, 55),
(28, 56),
(29, 57),
(29, 58),
(30, 59),
(30, 60),
(31, 61),
(31, 62),
(32, 63),
(32, 64),
(33, 65),
(33, 66),
(34, 67),
(34, 68),
(35, 69),
(35, 70),
(36, 71),
(36, 72),
(37, 73),
(37, 74),
(38, 75),
(38, 76),
(39, 77),
(39, 78),
(40, 79),
(40, 80),
(41, 81),
(41, 82),
(42, 83),
(42, 84),
(43, 85),
(43, 86),
(44, 87),
(44, 88),
(45, 89),
(45, 90),
(46, 91),
(46, 92),
(47, 93),
(47, 94),
(48, 95),
(48, 96),
(49, 97),
(49, 98),
(50, 99),
(50, 100);



-- Generating entries for the Rate table
INSERT INTO Rate (User_ID, Song_ID, Timestamp) VALUES
(15, 82, '2024-07-05 12:00:00'),
(24, 14, '2024-07-05 12:05:00'),
(37, 45, '2024-07-05 12:10:00'),
(81, 3, '2024-07-05 12:15:00'),
(55, 67, '2024-07-05 12:20:00'),
(23, 92, '2024-07-05 12:25:00'),
(67, 8, '2024-07-05 12:30:00'),
(44, 55, '2024-07-05 12:35:00'),
(13, 16, '2024-07-05 12:40:00'),
(76, 98, '2024-07-05 12:45:00'),
(19, 2, '2024-07-05 12:50:00'),
(59, 34, '2024-07-05 12:55:00'),
(88, 71, '2024-07-05 13:00:00'),
(12, 28, '2024-07-05 13:05:00'),
(93, 19, '2024-07-05 13:10:00'),
(41, 60, '2024-07-05 13:15:00'),
(7, 81, '2024-07-05 13:20:00'),
(64, 23, '2024-07-05 13:25:00'),
(31, 49, '2024-07-05 13:30:00'),
(84, 7, '2024-07-05 13:35:00'),
(22, 99, '2024-07-05 13:40:00'),
(97, 15, '2024-07-05 13:45:00'),
(10, 32, '2024-07-05 13:50:00'),
(53, 41, '2024-07-05 13:55:00'),
(29, 56, '2024-07-05 14:00:00'),
(68, 1, '2024-07-05 14:05:00'),
(50, 77, '2024-07-05 14:10:00'),
(35, 36, '2024-07-05 14:15:00'),
(92, 9, '2024-07-05 14:20:00'),
(3, 66, '2024-07-05 14:25:00'),
(75, 18, '2024-07-05 14:30:00'),
(17, 64, '2024-07-05 14:35:00'),
(83, 27, '2024-07-05 14:40:00'),
(5, 70, '2024-07-05 14:45:00'),
(47, 43, '2024-07-05 14:50:00'),
(90, 58, '2024-07-05 14:55:00'),
(26, 4, '2024-07-05 15:00:00'),
(80, 74, '2024-07-05 15:05:00'),
(14, 84, '2024-07-05 15:10:00'),
(62, 25, '2024-07-05 15:15:00'),
(38, 54, '2024-07-05 15:20:00'),
(9, 79, '2024-07-05 15:25:00'),
(85, 31, '2024-07-05 15:30:00'),
(11, 21, '2024-07-05 15:35:00'),
(71, 93, '2024-07-05 15:40:00'),
(16, 40, '2024-07-05 15:45:00'),
(52, 90, '2024-07-05 15:50:00'),
(28, 6, '2024-07-05 15:55:00'),
(60, 12, '2024-07-05 16:00:00'),
(43, 78, '2024-07-05 16:05:00'),
(25, 13, '2024-07-05 16:10:00'),
(79, 50, '2024-07-05 16:15:00'),
(6, 68, '2024-07-05 16:20:00'),
(91, 22, '2024-07-05 16:25:00'),
(20, 86, '2024-07-05 16:30:00'),
(56, 10, '2024-07-05 16:35:00'),
(32, 95, '2024-07-05 16:40:00'),
(74, 17, '2024-07-05 16:45:00'),
(39, 62, '2024-07-05 16:50:00'),
(48, 5, '2024-07-05 16:55:00'),
(95, 69, '2024-07-05 17:00:00'),
(18, 20, '2024-07-05 17:05:00'),
(73, 85, '2024-07-05 17:10:00'),
(27, 3, '2024-07-05 17:15:00'),
(87, 53, '2024-07-05 17:20:00'),
(46, 24, '2024-07-05 17:25:00'),
(8, 75, '2024-07-05 17:30:00'),
(34, 87, '2024-07-05 17:35:00'),
(58, 11, '2024-07-05 17:40:00'),
(21, 33, '2024-07-05 17:45:00'),
(99, 73, '2024-07-05 17:50:00'),
(40, 48, '2024-07-05 17:55:00'),
(77, 26, '2024-07-05 18:00:00'),
(49, 42, '2024-07-05 18:05:00'),
(4, 88, '2024-07-05 18:10:00'),
(66, 19, '2024-07-05 18:15:00'),
(33, 63, '2024-07-05 18:20:00'),
(89, 38, '2024-07-05 18:25:00'),
(42, 51, '2024-07-05 18:30:00'),
(57, 29, '2024-07-05 18:35:00'),
(98, 77, '2024-07-05 18:40:00'),
(70, 1, '2024-07-05 18:45:00'),
(30, 72, '2024-07-05 18:50:00'),
(36, 94, '2024-07-05 18:55:00'),
(63, 46, '2024-07-05 19:00:00'),
(2, 35, '2024-07-05 19:05:00'),
(50, 66, '2024-07-05 19:10:00'),
(100, 12, '2024-07-05 19:15:00'),
(17, 59, '2024-07-05 19:20:00'),
(78, 43, '2024-07-05 19:25:00'),
(1, 6, '2024-07-05 19:30:00'),
(54, 81, '2024-07-05 19:35:00'),
(45, 9, '2024-07-05 19:40:00'),
(61, 27, '2024-07-05 19:45:00'),
(72, 83, '2024-07-05 19:50:00'),
(51, 30, '2024-07-05 19:55:00'),
(85, 61, '2024-07-05 20:00:00'),
(94, 39, '2024-07-05 20:05:00'),
(38, 4, '2024-07-05 20:10:00'),
(69, 70, '2024-07-05 20:15:00'),
(11, 31, '2024-07-05 20:20:00');


INSERT INTO Playlist (Playlist_ID, Creator,Playlist_Name, Privacy_Status, View_count) VALUES
(1, 1, 'Playlist 1', 'Public', 100),
(2, 1, 'Playlist 2', 'Private', 200),
(3, 2, 'Playlist 3', 'Public', 150),
(4, 2, 'Playlist 4', 'Private', 220),
(5, 3, 'Playlist 5', 'Public', 180),
(6, 3, 'Playlist 6', 'Private', 240),
(7, 4, 'Playlist 7', 'Public', 160),
(8, 4, 'Playlist 8', 'Private', 210),
(9, 5, 'Playlist 9', 'Public', 130),
(10, 5, 'Playlist 10', 'Private', 190),
(11, 6, 'Playlist 11', 'Public', 170),
(12, 6, 'Playlist 12', 'Private', 230),
(13, 7, 'Playlist 13', 'Public', 140),
(14, 7, 'Playlist 14', 'Private', 205),
(15, 8, 'Playlist 15', 'Public', 125),
(16, 8, 'Playlist 16', 'Private', 195),
(17, 9, 'Playlist 17', 'Public', 165),
(18, 9, 'Playlist 18', 'Private', 225),
(19, 10, 'Playlist 19', 'Public', 135),
(20, 10, 'Playlist 20', 'Private', 215),
(21, 11, 'Playlist 21', 'Public', 155),
(22, 11, 'Playlist 22', 'Private', 235),
(23, 12, 'Playlist 23', 'Public', 145),
(24, 12, 'Playlist 24', 'Private', 200),
(25, 13, 'Playlist 25', 'Public', 170),
(26, 13, 'Playlist 26', 'Private', 210),
(27, 14, 'Playlist 27', 'Public', 180),
(28, 14, 'Playlist 28', 'Private', 220),
(29, 15, 'Playlist 29', 'Public', 190),
(30, 15, 'Playlist 30', 'Private', 230),
(31, 16, 'Playlist 31', 'Public', 200),
(32, 16, 'Playlist 32', 'Private', 240),
(33, 17, 'Playlist 33', 'Public', 210),
(34, 17, 'Playlist 34', 'Private', 250),
(35, 18, 'Playlist 35', 'Public', 220),
(36, 18, 'Playlist 36', 'Private', 260),
(37, 19, 'Playlist 37', 'Public', 230),
(38, 19, 'Playlist 38', 'Private', 270),
(39, 20, 'Playlist 39', 'Public', 240),
(40, 20, 'Playlist 40', 'Private', 280),
(41, 21, 'Playlist 41', 'Public', 250),
(42, 21, 'Playlist 42', 'Private', 290),
(43, 22, 'Playlist 43', 'Public', 260),
(44, 22, 'Playlist 44', 'Private', 300),
(45, 23, 'Playlist 45', 'Public', 270),
(46, 23, 'Playlist 46', 'Private', 310),
(47, 24, 'Playlist 47', 'Public', 280),
(48, 24, 'Playlist 48', 'Private', 320),
(49, 25, 'Playlist 49', 'Public', 290),
(50, 25, 'Playlist 50', 'Private', 330),
(51, 26, 'Playlist 51', 'Public', 300),
(52, 26, 'Playlist 52', 'Private', 340),
(53, 27, 'Playlist 53', 'Public', 310),
(54, 27, 'Playlist 54', 'Private', 350),
(55, 28, 'Playlist 55', 'Public', 320),
(56, 28, 'Playlist 56', 'Private', 360),
(57, 29, 'Playlist 57', 'Public', 330),
(58, 29, 'Playlist 58', 'Private', 370),
(59, 30, 'Playlist 59', 'Public', 340),
(60, 30, 'Playlist 60', 'Private', 380),
(61, 31, 'Playlist 61', 'Public', 350),
(62, 31, 'Playlist 62', 'Private', 390),
(63, 32, 'Playlist 63', 'Public', 360),
(64, 32, 'Playlist 64', 'Private', 400),
(65, 33, 'Playlist 65', 'Public', 370),
(66, 33, 'Playlist 66', 'Private', 410),
(67, 34, 'Playlist 67', 'Public', 380),
(68, 34, 'Playlist 68', 'Private', 420),
(69, 35, 'Playlist 69', 'Public', 390),
(70, 35, 'Playlist 70', 'Private', 430),
(71, 36, 'Playlist 71', 'Public', 400),
(72, 36, 'Playlist 72', 'Private', 440),
(73, 37, 'Playlist 73', 'Public', 410),
(74, 37, 'Playlist 74', 'Private', 450),
(75, 38, 'Playlist 75', 'Public', 420),
(76, 38, 'Playlist 76', 'Private', 460),
(77, 39, 'Playlist 77', 'Public', 430),
(78, 39, 'Playlist 78', 'Private', 470),
(79, 40, 'Playlist 79', 'Public', 440),
(80, 40, 'Playlist 80', 'Private', 480),
(81, 41, 'Playlist 81', 'Public', 450),
(82, 41, 'Playlist 82', 'Private', 490),
(83, 42, 'Playlist 83', 'Public', 460),
(84, 42, 'Playlist 84', 'Private', 500),
(85, 43, 'Playlist 85', 'Public', 470),
(86, 43, 'Playlist 86', 'Private', 510),
(87, 44, 'Playlist 87', 'Public', 480),
(88, 44, 'Playlist 88', 'Private', 520),
(89, 45, 'Playlist 89', 'Public', 490),
(90, 45, 'Playlist 90', 'Private', 530),
(91, 46, 'Playlist 91', 'Public', 500),
(92, 46, 'Playlist 92', 'Private', 540),
(93, 47, 'Playlist 93', 'Public', 510),
(94, 47, 'Playlist 94', 'Private', 550),
(95, 48, 'Playlist 95', 'Public', 520),
(96, 48, 'Playlist 96', 'Private', 560),
(97, 49, 'Playlist 97', 'Public', 530),
(98, 49, 'Playlist 98', 'Private', 570),
(99, 50, 'Playlist 99', 'Public', 540),
(100, 50, 'Playlist 100', 'Private', 580);



INSERT INTO playlistsContains (Song_ID, Playlist_ID, Date_added, Rank_in_playlist) VALUES
(1, 1, '2024-07-05', 1),
(2, 1, '2024-07-05', 2),
(3, 1, '2024-07-06', 3),
(4, 1, '2024-07-06', 4),
(5, 2, '2024-07-05', 1),
(6, 2, '2024-07-05', 2),
(7, 2, '2024-07-06', 3),
(8, 2, '2024-07-06', 4),
(9, 3, '2024-07-05', 1),
(10, 3, '2024-07-05', 2),
(11, 3, '2024-07-06', 3),
(12, 3, '2024-07-06', 4),
(13, 4, '2024-07-05', 1),
(14, 4, '2024-07-05', 2),
(15, 4, '2024-07-06', 3),
(16, 4, '2024-07-06', 4),
(17, 5, '2024-07-05', 1),
(18, 5, '2024-07-05', 2),
(19, 5, '2024-07-06', 3),
(20, 5, '2024-07-06', 4),
(21, 6, '2024-07-05', 1),
(22, 6, '2024-07-05', 2),
(23, 6, '2024-07-06', 3),
(24, 6, '2024-07-06', 4),
(25, 7, '2024-07-05', 1),
(26, 7, '2024-07-05', 2),
(27, 7, '2024-07-06', 3),
(28, 7, '2024-07-06', 4),
(29, 8, '2024-07-05', 1),
(30, 8, '2024-07-05', 2),
(31, 8, '2024-07-06', 3),
(32, 8, '2024-07-06', 4),
(33, 9, '2024-07-05', 1),
(34, 9, '2024-07-05', 2),
(35, 9, '2024-07-06', 3),
(36, 9, '2024-07-06', 4),
(37, 10, '2024-07-05', 1),
(38, 10, '2024-07-05', 2),
(39, 10, '2024-07-06', 3),
(40, 10, '2024-07-06', 4),
(41, 11, '2024-07-05', 1),
(42, 11, '2024-07-05', 2),
(43, 11, '2024-07-06', 3),
(44, 11, '2024-07-06', 4),
(45, 12, '2024-07-05', 1),
(46, 12, '2024-07-05', 2),
(47, 12, '2024-07-06', 3),
(48, 12, '2024-07-06', 4),
(49, 13, '2024-07-05', 1),
(50, 13, '2024-07-05', 2),
(51, 13, '2024-07-06', 3),
(52, 13, '2024-07-06', 4),
(53, 14, '2024-07-05', 1),
(54, 14, '2024-07-05', 2),
(55, 14, '2024-07-06', 3),
(56, 14, '2024-07-06', 4),
(57, 15, '2024-07-05', 1),
(58, 15, '2024-07-05', 2),
(59, 15, '2024-07-06', 3),
(60, 15, '2024-07-06', 4),
(61, 16, '2024-07-05', 1),
(62, 16, '2024-07-05', 2),
(63, 16, '2024-07-06', 3),
(64, 16, '2024-07-06', 4),
(65, 17, '2024-07-05', 1),
(66, 17, '2024-07-05', 2),
(67, 17, '2024-07-06', 3),
(68, 17, '2024-07-06', 4),
(69, 18, '2024-07-05', 1),
(70, 18, '2024-07-05', 2),
(71, 18, '2024-07-06', 3),
(72, 18, '2024-07-06', 4),
(73, 19, '2024-07-05', 1),
(74, 19, '2024-07-05', 2),
(75, 19, '2024-07-06', 3),
(76, 19, '2024-07-06', 4),
(77, 20, '2024-07-05', 1),
(78, 20, '2024-07-05', 2),
(79, 20, '2024-07-06', 3),
(80, 20, '2024-07-06', 4),
(81, 21, '2024-07-05', 1),
(82, 21, '2024-07-05', 2),
(83, 21, '2024-07-06', 3),
(84, 21, '2024-07-06', 4),
(85, 22, '2024-07-05', 1),
(86, 22, '2024-07-05', 2),
(87, 22, '2024-07-06', 3),
(88, 22, '2024-07-06', 4),
(89, 23, '2024-07-05', 1),
(90, 23, '2024-07-05', 2),
(91, 23, '2024-07-06', 3),
(92, 23, '2024-07-06', 4),
(93, 24, '2024-07-05', 1),
(94, 24, '2024-07-05', 2),
(95, 24, '2024-07-06', 3),
(96, 24, '2024-07-06', 4),
(97, 25, '2024-07-05', 1),
(98, 25, '2024-07-05', 2),
(99, 25, '2024-07-06', 3),
(100, 25, '2024-07-06', 4);



INSERT INTO Follows (Playlist_ID, User_ID, Start_date, End_date) VALUES
(1, 2, '2024-07-05', NULL),
(2, 3, '2024-07-05', '2024-07-15'),
(3, 4, '2024-07-05', NULL),
(4, 5, '2024-07-05', NULL),
(5, 6, '2024-07-05', '2024-07-20'),
(6, 7, '2024-07-05', NULL),
(7, 8, '2024-07-05', NULL),
(8, 9, '2024-07-05', NULL),
(9, 10, '2024-07-05', NULL),
(10, 11, '2024-07-05', '2024-08-01'),
(11, 12, '2024-07-05', NULL),
(12, 13, '2024-07-05', NULL),
(13, 14, '2024-07-05', '2024-07-25'),
(14, 15, '2024-07-05', NULL),
(15, 16, '2024-07-05', NULL),
(16, 17, '2024-07-05', NULL),
(17, 18, '2024-07-05', NULL),
(18, 19, '2024-07-05', NULL),
(19, 20, '2024-07-05', '2024-07-30'),
(20, 21, '2024-07-05', NULL),
(21, 22, '2024-07-05', NULL),
(22, 23, '2024-07-05', NULL),
(23, 24, '2024-07-05', NULL),
(24, 25, '2024-07-05', NULL),
(25, 26, '2024-07-05', NULL),
(26, 27, '2024-07-05', '2024-07-28'),
(27, 28, '2024-07-05', NULL),
(28, 29, '2024-07-05', NULL),
(29, 30, '2024-07-05', NULL),
(30, 31, '2024-07-05', NULL),
(31, 32, '2024-07-05', '2024-07-22'),
(32, 33, '2024-07-05', NULL),
(33, 34, '2024-07-05', NULL),
(34, 35, '2024-07-05', NULL),
(35, 36, '2024-07-05', NULL),
(36, 37, '2024-07-05', '2024-08-05'),
(37, 38, '2024-07-05', NULL),
(38, 39, '2024-07-05', NULL),
(39, 40, '2024-07-05', NULL),
(40, 41, '2024-07-05', NULL),
(41, 42, '2024-07-05', NULL),
(42, 43, '2024-07-05', NULL),
(43, 44, '2024-07-05', NULL),
(44, 45, '2024-07-05', NULL),
(45, 46, '2024-07-05', '2024-08-10'),
(46, 47, '2024-07-05', NULL),
(47, 48, '2024-07-05', NULL),
(48, 49, '2024-07-05', NULL),
(49, 50, '2024-07-05', '2024-07-27'),
(50, 51, '2024-07-05', NULL),
(51, 52, '2024-07-05', NULL),
(52, 53, '2024-07-05', NULL),
(53, 54, '2024-07-05', NULL),
(54, 55, '2024-07-05', NULL),
(55, 56, '2024-07-05', NULL),
(56, 57, '2024-07-05', NULL),
(57, 58, '2024-07-05', NULL),
(58, 59, '2024-07-05', '2024-08-03'),
(59, 60, '2024-07-05', NULL),
(60, 61, '2024-07-05', NULL),
(61, 62, '2024-07-05', NULL),
(62, 63, '2024-07-05', NULL),
(63, 64, '2024-07-05', NULL),
(64, 65, '2024-07-05', '2024-07-26'),
(65, 66, '2024-07-05', NULL),
(66, 67, '2024-07-05', NULL),
(67, 68, '2024-07-05', NULL),
(68, 69, '2024-07-05', NULL),
(69, 70, '2024-07-05', NULL),
(70, 71, '2024-07-05', NULL),
(71, 72, '2024-07-05', NULL),
(72, 73, '2024-07-05', NULL),
(73, 74, '2024-07-05', NULL),
(74, 75, '2024-07-05', NULL),
(75, 76, '2024-07-05', '2024-08-07'),
(76, 77, '2024-07-05', NULL),
(77, 78, '2024-07-05', NULL),
(78, 79, '2024-07-05', NULL),
(79, 80, '2024-07-05', NULL),
(80, 81, '2024-07-05', NULL),
(81, 82, '2024-07-05', '2024-08-01'),
(82, 83, '2024-07-05', NULL),
(83, 84, '2024-07-05', NULL),
(84, 85, '2024-07-05', NULL),
(85, 86, '2024-07-05', NULL),
(86, 87, '2024-07-05', NULL),
(87, 88, '2024-07-05', NULL),
(88, 89, '2024-07-05', '2024-07-28'),
(89, 90, '2024-07-05', NULL),
(90, 91, '2024-07-05', NULL),
(91, 92, '2024-07-05', NULL),
(92, 93, '2024-07-05', NULL),
(93, 94, '2024-07-05', NULL),
(94, 95, '2024-07-05', '2024-07-20'),
(95, 96, '2024-07-05', NULL),
(96, 97, '2024-07-05', NULL),
(97, 98, '2024-07-05', NULL),
(98, 99, '2024-07-05', NULL),
(99, 100, '2024-07-05', NULL),
(100, 1, '2024-07-05', '2024-08-05');


-- Song 1 (Sunshine Dream)
UPDATE Songs
SET Music_notes = '../music2/Sunshine_Dream.pdf',
    Lyrics = '../music2/Sunshine_Dream.txt'
WHERE Song_ID = 1;

-- Song 2 (Tears of Yesterday)
UPDATE Songs
SET Music_notes = '../music2/Tears_of_Yesterday.pdf',
    Lyrics = '../music2/Tears_of_Yesterday.txt'
WHERE Song_ID = 2;

-- Song 3 (Dancing in the Rain)
UPDATE Songs
SET Music_notes = '../music2/Dancing_in_the_Rain.pdf',
    Lyrics = '../music2/Dancing_in_the_Rain.txt'
WHERE Song_ID = 3;

-- Song 4 (Midnight Blues)
UPDATE Songs
SET Music_notes = '../music2/Midnight_Blues.pdf',
    Lyrics = '../music2/Midnight_Blues.txt'
WHERE Song_ID = 4;

-- Song 5 (Echoes of Silence)
UPDATE Songs
SET Music_notes = '../music2/Echoes_of_Silence.pdf',
    Lyrics = '../music2/Echoes_of_Silence.txt'
WHERE Song_ID = 5;

-- Song 6 (Electric Waves)
UPDATE Songs
SET Music_notes = '../music2/Electric_Waves.pdf',
    Lyrics = '../music2/Electric_Waves.txt'
WHERE Song_ID = 6;

-- Song 7 (Lost in the Forest)
UPDATE Songs
SET Music_notes = '../music2/Lost_in_the_Forest.pdf',
    Lyrics = '../music2/Lost_in_the_Forest.txt'
WHERE Song_ID = 7;

-- Song 8 (Rising Sun)
UPDATE Songs
SET Music_notes = '../music2/Rising_Sun.pdf',
    Lyrics = '../music2/Rising_Sun.txt'
WHERE Song_ID = 8;

-- Song 9 (Ocean Waves)
UPDATE Songs
SET Music_notes = '../music2/Ocean_Waves.pdf',
    Lyrics = '../music2/Ocean_Waves.txt'
WHERE Song_ID = 9;

-- Song 10 (Fire and Ice)
UPDATE Songs
SET Music_notes = '../music2/Fire_and_Ice.pdf',
    Lyrics = '../music2/Fire_and_Ice.txt'
WHERE Song_ID = 10;

-- Song 11 (Silent Whisper)
UPDATE Songs
SET Music_notes = '../music2/Silent_Whisper.pdf',
    Lyrics = '../music2/Silent_Whisper.txt'
WHERE Song_ID = 11;

-- Song 12 (Galactic Journey)
UPDATE Songs
SET Music_notes = '../music2/Galactic_Journey.pdf',
    Lyrics = '../music2/Galactic_Journey.txt'
WHERE Song_ID = 12;

-- Song 13 (City Lights)
UPDATE Songs
SET Music_notes = '../music2/City_Lights.pdf',
    Lyrics = '../music2/City_Lights.txt'
WHERE Song_ID = 13;

-- Song 14 (Mystic River)
UPDATE Songs
SET Music_notes = '../music2/Mystic_River.pdf',
    Lyrics = '../music2/Mystic_River.txt'
WHERE Song_ID = 14;

-- Song 15 (Thunderstorm)
UPDATE Songs
SET Music_notes = '../music2/Thunderstorm.pdf',
    Lyrics = '../music2/Thunderstorm.txt'
WHERE Song_ID = 15;

-- Song 16 (Broken Dreams)
UPDATE Songs
SET Music_notes = '../music2/Broken_Dreams.pdf',
    Lyrics = '../music2/Broken_Dreams.txt'
WHERE Song_ID = 16;

-- Song 17 (Crystal Clear)
UPDATE Songs
SET Music_notes = '../music2/Crystal_Clear.pdf',
    Lyrics = '../music2/Crystal_Clear.txt'
WHERE Song_ID = 17;

-- Song 18 (Wild Heart)
UPDATE Songs
SET Music_notes = '../music2/Wild_Heart.pdf',
    Lyrics = '../music2/Wild_Heart.txt'
WHERE Song_ID = 18;

-- Song 19 (Starry Night)
UPDATE Songs
SET Music_notes = '../music2/Starry_Night.pdf',
    Lyrics = '../music2/Starry_Night.txt'
WHERE Song_ID = 19;

-- Song 20 (Fireworks)
UPDATE Songs
SET Music_notes = '../music2/Fireworks.pdf',
    Lyrics = '../music2/Fireworks.txt'
WHERE Song_ID = 20;

-- Song 21 (Moonlight Sonata)
UPDATE Songs
SET Music_notes = '../music2/Moonlight_Sonata.pdf',
    Lyrics = '../music2/Moonlight_Sonata.txt'
WHERE Song_ID = 21;

-- Song 22 (Savannah Dreams)
UPDATE Songs
SET Music_notes = '../music2/Savannah_Dreams.pdf',
    Lyrics = '../music2/Savannah_Dreams.txt'
WHERE Song_ID = 22;

-- Song 23 (Raging Fire)
UPDATE Songs
SET Music_notes = '../music2/Raging_Fire.pdf',
    Lyrics = '../music2/Raging_Fire.txt'
WHERE Song_ID = 23;

-- Song 24 (Frozen Lake)
UPDATE Songs
SET Music_notes = '../music2/Frozen_Lake.pdf',
    Lyrics = '../music2/Frozen_Lake.txt'
WHERE Song_ID = 24;

-- Song 25 (Electric Dreams)
UPDATE Songs
SET Music_notes = '../music2/Electric_Dreams.pdf',
    Lyrics = '../music2/Electric_Dreams.txt'
WHERE Song_ID = 25;

-- Song 26 (Whispers in the Dark)
UPDATE Songs
SET Music_notes = '../music2/Whispers_in_the_Dark.pdf',
    Lyrics = '../music2/Whispers_in_the_Dark.txt'
WHERE Song_ID = 26;

-- Song 27 (Golden Sunset)
UPDATE Songs
SET Music_notes = '../music2/Golden_Sunset.pdf',
    Lyrics = '../music2/Golden_Sunset.txt'
WHERE Song_ID = 27;

-- Song 28 (Crystal Rain)
UPDATE Songs
SET Music_notes = '../music2/Crystal_Rain.pdf',
    Lyrics = '../music2/Crystal_Rain.txt'
WHERE Song_ID = 28;

-- Song 29 (Dreamland)
UPDATE Songs
SET Music_notes = '../music2/Dreamland.pdf',
    Lyrics = '../music2/Dreamland.txt'
WHERE Song_ID = 29;

-- Song 30 (Midnight City)
UPDATE Songs
SET Music_notes = '../music2/Midnight_City.pdf',
    Lyrics = '../music2/Midnight_City.txt'
WHERE Song_ID = 30;





-- Song 31 
UPDATE Songs
SET Music_notes = '../music2/Northern_Lights.pdf',
    Lyrics = '../music2/Northern_Lights.txt'
WHERE Song_ID = 31;

-- Song 32
UPDATE Songs
SET Music_notes = '../music2/Heartbeat.pdf',
    Lyrics = '../music2/Heartbeat.txt'
WHERE Song_ID = 32;

-- Song 33
UPDATE Songs
SET Music_notes = '../music2/Whispering_Pines.pdf',
    Lyrics = '../music2/Whispering_Pines.txt'
WHERE Song_ID = 33;

-- Song 34
UPDATE Songs
SET Music_notes = '../music2/Lost_Horizon.pdf',
    Lyrics = '../music2/Lost_Horizon.txt'
WHERE Song_ID = 34;

-- Song 35
UPDATE Songs
SET Music_notes = '../music2/Eternal_Flame.pdf',
    Lyrics = '../music2/Eternal_Flame.txt'
WHERE Song_ID = 35;

-- Song 36
UPDATE Songs
SET Music_notes = '../music2/Rainbow_Serenade.pdf',
    Lyrics = '../music2/Rainbow_Serenade.txt'
WHERE Song_ID = 36;

-- Song 37
UPDATE Songs
SET Music_notes = '../music2/Morning_Dew.pdf',
    Lyrics = '../music2/Morning_Dew.txt'
WHERE Song_ID = 37;

-- Song 38
UPDATE Songs
SET Music_notes = '../music2/Phoenix_Rising.pdf',
    Lyrics = '../music2/Phoenix_Rising.txt'
WHERE Song_ID = 38;

-- Song 39
UPDATE Songs
SET Music_notes = '../music2/Silent_Echoes.pdf',
    Lyrics = '../music2/Silent_Echoes.txt'
WHERE Song_ID = 39;

-- Song 40
UPDATE Songs
SET Music_notes = '../music2/Sapphire_Skies.pdf',
    Lyrics = '../music2/Sapphire_Skies.txt'
WHERE Song_ID = 40;

-- Song 41
UPDATE Songs
SET Music_notes = '../music2/Moonlit_Whispers.pdf',
    Lyrics = '../music2/Moonlit_Whispers.txt'
WHERE Song_ID = 41;

-- Song 42
UPDATE Songs
SET Music_notes = '../music2/Dancing_Starlight.pdf',
    Lyrics = '../music2/Dancing_Starlight.txt'
WHERE Song_ID = 42;

-- Song 43
UPDATE Songs
SET Music_notes = '../music2/Lost_in_Translation.pdf',
    Lyrics = '../music2/Lost_in_Translation.txt'
WHERE Song_ID = 43;

-- Song 44
UPDATE Songs
SET Music_notes = '../music2/Rising_Phoenix.pdf',
    Lyrics = '../music2/Rising_Phoenix.txt'
WHERE Song_ID = 44;

-- Song 45
UPDATE Songs
SET Music_notes = '../music2/Serenity_Falls.pdf',
    Lyrics = '../music2/Serenity_Falls.txt'
WHERE Song_ID = 45;

-- Song 46
UPDATE Songs
SET Music_notes = '../music2/Golden_Dreams.pdf',
    Lyrics = '../music2/Golden_Dreams.txt'
WHERE Song_ID = 46;

-- Song 47
UPDATE Songs
SET Music_notes = '../music2/Whispering_Winds.pdf',
    Lyrics = '../music2/Whispering_Winds.txt'
WHERE Song_ID = 47;

-- Song 48
UPDATE Songs
SET Music_notes = '../music2/Ethereal_Journey.pdf',
    Lyrics = '../music2/Ethereal_Journey.txt'
WHERE Song_ID = 48;

-- Song 49
UPDATE Songs
SET Music_notes = '../music2/Starlight_Sonata.pdf',
    Lyrics = '../music2/Starlight_Sonata.txt'
WHERE Song_ID = 49;

-- Song 50
UPDATE Songs
SET Music_notes = '../music2/Enchanted_Garden.pdf',
    Lyrics = '../music2/Enchanted_Garden.txt'
WHERE Song_ID = 50;



-- Song 51
UPDATE Songs
SET Music_notes = '../music2/Echoes_of_Spring.pdf',
    Lyrics = '../music2/Echoes_of_Spring.txt'
WHERE Song_ID = 51;

-- Song 52
UPDATE Songs
SET Music_notes = '../music2/Whispering_Sands.pdf',
    Lyrics = '../music2/Whispering_Sands.txt'
WHERE Song_ID = 52;

-- Song 53
UPDATE Songs
SET Music_notes = '../music2/Silver_Lining.pdf',
    Lyrics = '../music2/Silver_Lining.txt'
WHERE Song_ID = 53;

-- Song 54
UPDATE Songs
SET Music_notes = '../music2/Ocean_Breeze.pdf',
    Lyrics = '../music2/Ocean_Breeze.txt'
WHERE Song_ID = 54;

-- Song 55
UPDATE Songs
SET Music_notes = '../music2/Mystic_Sands.pdf',
    Lyrics = '../music2/Mystic_Sands.txt'
WHERE Song_ID = 55;

-- Song 56
UPDATE Songs
SET Music_notes = '../music2/Dreamers_Waltz.pdf',
    Lyrics = '../music2/Dreamers_Waltz.txt'
WHERE Song_ID = 56;

-- Song 57
UPDATE Songs
SET Music_notes = '../music2/Epic_Odyssey.pdf',
    Lyrics = '../music2/Epic_Odyssey.txt'
WHERE Song_ID = 57;

-- Song 58
UPDATE Songs
SET Music_notes = '../music2/Crimson_Sunset.pdf',
    Lyrics = '../music2/Crimson_Sunset.txt'
WHERE Song_ID = 58;

-- Song 59
UPDATE Songs
SET Music_notes = '../music2/Solitude.pdf',
    Lyrics = '../music2/Solitude.txt'
WHERE Song_ID = 59;

-- Song 60 (Duplicate)
UPDATE Songs
SET Music_notes = '../music2/Echoes_of_Autumn.pdf',
    Lyrics = '../music2/Echoes_of_Autumn.txt'
WHERE Song_ID = 60;

-- Song 61
UPDATE Songs
SET Music_notes = '../music2/Celestial_Serenade.pdf',
    Lyrics = '../music2/Celestial_Serenade.txt'
WHERE Song_ID = 61;

-- Song 62
UPDATE Songs
SET Music_notes = '../music2/Whispers_of_Love.pdf',
    Lyrics = '../music2/Whispers_of_Love.txt'
WHERE Song_ID = 62;

-- Song 63
UPDATE Songs
SET Music_notes = '../music2/Aurora_Borealis.pdf',
    Lyrics = '../music2/Aurora_Borealis.txt'
WHERE Song_ID = 63;

-- Song 64
UPDATE Songs
SET Music_notes = '../music2/Eternal_Journey.pdf',
    Lyrics = '../music2/Eternal_Journey.txt'
WHERE Song_ID = 64;

-- Song 65
UPDATE Songs
SET Music_notes = '../music2/Sapphire_Dreams.pdf',
    Lyrics = '../music2/Sapphire_Dreams.txt'
WHERE Song_ID = 65;

-- Song 66
UPDATE Songs
SET Music_notes = '../music2/Echoes_of_Winter.pdf',
    Lyrics = '../music2/Echoes_of_Winter.txt'
WHERE Song_ID = 66;

-- Song 67
UPDATE Songs
SET Music_notes = '../music2/Whispering_Brook.pdf',
    Lyrics = '../music2/Whispering_Brook.txt'
WHERE Song_ID = 67;

-- Song 68
UPDATE Songs
SET Music_notes = '../music2/Celestial_Symphony.pdf',
    Lyrics = '../music2/Celestial_Symphony.txt'
WHERE Song_ID = 68;

-- Song 69
UPDATE Songs
SET Music_notes = '../music2/Echoes_of_Hope.pdf',
    Lyrics = '../music2/Echoes_of_Hope.txt'
WHERE Song_ID = 69;

-- Song 70
UPDATE Songs
SET Music_notes = '../music2/Ethereal_Waters.pdf',
    Lyrics = '../music2/Ethereal_Waters.txt'
WHERE Song_ID = 70;

-- Song 71
UPDATE Songs
SET Music_notes = '../music2/Serenity.pdf',
    Lyrics = '../music2/Serenity.txt'
WHERE Song_ID = 71;

-- Song 72
UPDATE Songs
SET Music_notes = '../music2/Dreamscape.pdf',
    Lyrics = '../music2/Dreamscape.txt'
WHERE Song_ID = 72;

-- Song 73
UPDATE Songs
SET Music_notes = '../music2/Crimson_Horizon.pdf',
    Lyrics = '../music2/Crimson_Horizon.txt'
WHERE Song_ID = 73;

-- Song 74
UPDATE Songs
SET Music_notes = '../music2/Whispering_Dreams.pdf',
    Lyrics = '../music2/Whispering_Dreams.txt'
WHERE Song_ID = 74;

-- Song 75
UPDATE Songs
SET Music_notes = '../music2/Eternal_Serenade.pdf',
    Lyrics = '../music2/Eternal_Serenade.txt'
WHERE Song_ID = 75;





-- Song 76 (Moonlit Mirage)
UPDATE Songs
SET Music_notes = '../music2/Moonlit_Mirage.pdf',
    Lyrics = '../music2/Moonlit_Mirage.txt'
WHERE Song_ID = 76;

-- Song 77 (Starry Night)
UPDATE Songs
SET Music_notes = '../music2/Starry_Night.pdf',
    Lyrics = '../music2/Starry_Night.txt'
WHERE Song_ID = 77;

-- Song 78 (Whispers of Hope)
UPDATE Songs
SET Music_notes = '../music2/Whispers_of_Hope.pdf',
    Lyrics = '../music2/Whispers_of_Hope.txt'
WHERE Song_ID = 78;

-- Song 79 (Ethereal Symphony)
UPDATE Songs
SET Music_notes = '../music2/Ethereal_Symphony.pdf',
    Lyrics = '../music2/Ethereal_Symphony.txt'
WHERE Song_ID = 79;

-- Song 80 (Celestial Dreams)
UPDATE Songs
SET Music_notes = '../music2/Celestial_Dreams.pdf',
    Lyrics = '../music2/Celestial_Dreams.txt'
WHERE Song_ID = 80;

-- Song 81 (Sapphire Horizon)
UPDATE Songs
SET Music_notes = '../music2/Sapphire_Horizon.pdf',
    Lyrics = '../music2/Sapphire_Horizon.txt'
WHERE Song_ID = 81;

-- Song 82 (Tranquil Echoes)
UPDATE Songs
SET Music_notes = '../music2/Tranquil_Echoes.pdf',
    Lyrics = '../music2/Tranquil_Echoes.txt'
WHERE Song_ID = 82;

-- Song 83 (Whispering Shadows)
UPDATE Songs
SET Music_notes = '../music2/Whispering_Shadows.pdf',
    Lyrics = '../music2/Whispering_Shadows.txt'
WHERE Song_ID = 83;

-- Song 84 (Eternal Symphony)
UPDATE Songs
SET Music_notes = '../music2/Eternal_Symphony.pdf',
    Lyrics = '../music2/Eternal_Symphony.txt'
WHERE Song_ID = 84;

-- Song 85 (Moonlit Echoes)
UPDATE Songs
SET Music_notes = '../music2/Moonlit_Echoes.pdf',
    Lyrics = '../music2/Moonlit_Echoes.txt'
WHERE Song_ID = 85;

-- Song 86 (Stellar Serenade)
UPDATE Songs
SET Music_notes = '../music2/Stellar_Serenade.pdf',
    Lyrics = '../music2/Stellar_Serenade.txt'
WHERE Song_ID = 86;

-- Song 87 (Whispers of Serenity)
UPDATE Songs
SET Music_notes = '../music2/Whispers_of_Serenity.pdf',
    Lyrics = '../music2/Whispers_of_Serenity.txt'
WHERE Song_ID = 87;

-- Song 88 (Ethereal Dreams)
UPDATE Songs
SET Music_notes = '../music2/Ethereal_Dreams.pdf',
    Lyrics = '../music2/Ethereal_Dreams.txt'
WHERE Song_ID = 88;

-- Song 89 (Sapphire Serenade)
UPDATE Songs
SET Music_notes = '../music2/Sapphire_Serenade.pdf',
    Lyrics = '../music2/Sapphire_Serenade.txt'
WHERE Song_ID = 89;

-- Song 90 (Whispering Waves)
UPDATE Songs
SET Music_notes = '../music2/Whispering_Waves.pdf',
    Lyrics = '../music2/Whispering_Waves.txt'
WHERE Song_ID = 90;

-- Song 91 (Eternal Echoes)
UPDATE Songs
SET Music_notes = '../music2/Eternal_Echoes.pdf',
    Lyrics = '../music2/Eternal_Echoes.txt'
WHERE Song_ID = 91;

-- Song 92 (Moonlit Melodies)
UPDATE Songs
SET Music_notes = '../music2/Moonlit_Melodies.pdf',
    Lyrics = '../music2/Moonlit_Melodies.txt'
WHERE Song_ID = 92;

-- Song 93 (Stellar Symphony)
UPDATE Songs
SET Music_notes = '../music2/Stellar_Symphony.pdf',
    Lyrics = '../music2/Stellar_Symphony.txt'
WHERE Song_ID = 93;

-- Song 94 (Whispers of Stardust)
UPDATE Songs
SET Music_notes = '../music2/Whispers_of_Stardust.pdf',
    Lyrics = '../music2/Whispers_of_Stardust.txt'
WHERE Song_ID = 94;

-- Song 95 (Ethereal Serenade)
UPDATE Songs
SET Music_notes = '../music2/Ethereal_Serenade.pdf',
    Lyrics = '../music2/Ethereal_Serenade.txt'
WHERE Song_ID = 95;

-- Song 96 (Sapphire Symphony)
UPDATE Songs
SET Music_notes = '../music2/Sapphire_Symphony.pdf',
    Lyrics = '../music2/Sapphire_Symphony.txt'
WHERE Song_ID = 96;

-- Song 97 (Whispering Starlight)
UPDATE Songs
SET Music_notes = '../music2/Whispering_Starlight.pdf',
    Lyrics = '../music2/Whispering_Starlight.txt'
WHERE Song_ID = 97;

-- Song 98 (Stellar Serenity)
UPDATE Songs
SET Music_notes = '../music2/Stellar_Serenity.pdf',
    Lyrics = '../music2/Stellar_Serenity.txt'
WHERE Song_ID = 98;

-- Song 99 (Eternal Echo)
UPDATE Songs
SET Music_notes = '../music2/Eternal_Echo.pdf',
    Lyrics = '../music2/Eternal_Echo.txt'
WHERE Song_ID = 99;

-- Song 100 (Moonlit Serenade)
UPDATE Songs
SET Music_notes = '../music2/Moonlit_Serenade.pdf',
    Lyrics = '../music2/Moonlit_Serenade.txt'
WHERE Song_ID = 100;

ALTER TABLE Playlist
ADD Theme VARCHAR(255);

UPDATE Playlist
SET Theme = CASE
    WHEN Playlist_ID = 1 THEN 'Road Trip'
    WHEN Playlist_ID = 2 THEN 'Study Session'
    WHEN Playlist_ID = 3 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 4 THEN 'Workout'
    WHEN Playlist_ID = 5 THEN 'Chill'
    WHEN Playlist_ID = 6 THEN 'Party'
    WHEN Playlist_ID = 7 THEN 'Focus'
    WHEN Playlist_ID = 8 THEN 'Sleep'
    WHEN Playlist_ID = 9 THEN 'Morning Routine'
    WHEN Playlist_ID = 10 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 11 THEN 'Road Trip'
    WHEN Playlist_ID = 12 THEN 'Study Session'
    WHEN Playlist_ID = 13 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 14 THEN 'Workout'
    WHEN Playlist_ID = 15 THEN 'Chill'
    WHEN Playlist_ID = 16 THEN 'Party'
    WHEN Playlist_ID = 17 THEN 'Focus'
    WHEN Playlist_ID = 18 THEN 'Sleep'
    WHEN Playlist_ID = 19 THEN 'Morning Routine'
    WHEN Playlist_ID = 20 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 21 THEN 'Road Trip'
    WHEN Playlist_ID = 22 THEN 'Study Session'
    WHEN Playlist_ID = 23 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 24 THEN 'Workout'
    WHEN Playlist_ID = 25 THEN 'Chill'
    WHEN Playlist_ID = 26 THEN 'Party'
    WHEN Playlist_ID = 27 THEN 'Focus'
    WHEN Playlist_ID = 28 THEN 'Sleep'
    WHEN Playlist_ID = 29 THEN 'Morning Routine'
    WHEN Playlist_ID = 30 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 31 THEN 'Road Trip'
    WHEN Playlist_ID = 32 THEN 'Study Session'
    WHEN Playlist_ID = 33 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 34 THEN 'Workout'
    WHEN Playlist_ID = 35 THEN 'Chill'
    WHEN Playlist_ID = 36 THEN 'Party'
    WHEN Playlist_ID = 37 THEN 'Focus'
    WHEN Playlist_ID = 38 THEN 'Sleep'
    WHEN Playlist_ID = 39 THEN 'Morning Routine'
    WHEN Playlist_ID = 40 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 41 THEN 'Road Trip'
    WHEN Playlist_ID = 42 THEN 'Study Session'
    WHEN Playlist_ID = 43 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 44 THEN 'Workout'
    WHEN Playlist_ID = 45 THEN 'Chill'
    WHEN Playlist_ID = 46 THEN 'Party'
    WHEN Playlist_ID = 47 THEN 'Focus'
    WHEN Playlist_ID = 48 THEN 'Sleep'
    WHEN Playlist_ID = 49 THEN 'Morning Routine'
    WHEN Playlist_ID = 50 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 51 THEN 'Road Trip'
    WHEN Playlist_ID = 52 THEN 'Study Session'
    WHEN Playlist_ID = 53 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 54 THEN 'Workout'
    WHEN Playlist_ID = 55 THEN 'Chill'
    WHEN Playlist_ID = 56 THEN 'Party'
    WHEN Playlist_ID = 57 THEN 'Focus'
    WHEN Playlist_ID = 58 THEN 'Sleep'
    WHEN Playlist_ID = 59 THEN 'Morning Routine'
    WHEN Playlist_ID = 60 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 61 THEN 'Road Trip'
    WHEN Playlist_ID = 62 THEN 'Study Session'
    WHEN Playlist_ID = 63 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 64 THEN 'Workout'
    WHEN Playlist_ID = 65 THEN 'Chill'
    WHEN Playlist_ID = 66 THEN 'Party'
    WHEN Playlist_ID = 67 THEN 'Focus'
    WHEN Playlist_ID = 68 THEN 'Sleep'
    WHEN Playlist_ID = 69 THEN 'Morning Routine'
    WHEN Playlist_ID = 70 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 71 THEN 'Road Trip'
    WHEN Playlist_ID = 72 THEN 'Study Session'
    WHEN Playlist_ID = 73 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 74 THEN 'Workout'
    WHEN Playlist_ID = 75 THEN 'Chill'
    WHEN Playlist_ID = 76 THEN 'Party'
    WHEN Playlist_ID = 77 THEN 'Focus'
    WHEN Playlist_ID = 78 THEN 'Sleep'
    WHEN Playlist_ID = 79 THEN 'Morning Routine'
    WHEN Playlist_ID = 80 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 81 THEN 'Road Trip'
    WHEN Playlist_ID = 82 THEN 'Study Session'
    WHEN Playlist_ID = 83 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 84 THEN 'Workout'
    WHEN Playlist_ID = 85 THEN 'Chill'
    WHEN Playlist_ID = 86 THEN 'Party'
    WHEN Playlist_ID = 87 THEN 'Focus'
    WHEN Playlist_ID = 88 THEN 'Sleep'
    WHEN Playlist_ID = 89 THEN 'Morning Routine'
    WHEN Playlist_ID = 90 THEN 'Evening Relaxation'
    WHEN Playlist_ID = 91 THEN 'Road Trip'
    WHEN Playlist_ID = 92 THEN 'Study Session'
    WHEN Playlist_ID = 93 THEN 'Holiday Celebration'
    WHEN Playlist_ID = 94 THEN 'Workout'
    WHEN Playlist_ID = 95 THEN 'Chill'
    WHEN Playlist_ID = 96 THEN 'Party'
    WHEN Playlist_ID = 97 THEN 'Focus'
    WHEN Playlist_ID = 98 THEN 'Sleep'
    WHEN Playlist_ID = 99 THEN 'Morning Routine'
    WHEN Playlist_ID = 100 THEN 'Evening Relaxation'
END;

