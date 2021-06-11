create database [Music Management System]
use [Music Management System]

-------Tables-------

create table Song (
Song_id int primary key, 
Title varchar(30), 
Song_length float, 
Share_permit varchar(5), 
Download_permit varchar(5),
album_id int
)

create table Sung_By (
artist_id int, 
song_id int, 
constraint SungBy_pk primary key(artist_id,song_id)
)

create table Artist (
artist_id int primary key, 
artist_name varchar(50), 
total_songs int, 
total_albums int, 
Bio varchar(500)
)

create table Album (
album_id int primary key,
album_name varchar(30), 
total_tracks int, 
album_length float, 
release_date date, 
artist_name varchar(50), 
song_id int, 
genre_id int, 
label_id int
)
 
create table PerformedBy (
album_id int, 
artist_id int,  
constraint PerformedBy_pk primary key(album_id,artist_id)
)

create table Genre (
genre_id int primary key, 
Name varchar(20)
)

create table Label (
label_id int primary key, 
Name varchar(30)
)

create table Lyrics (
lyrics_id int primary key, 
lyrics_desc varchar(1000), 
song_id int, 
album_id int
)

create table Users (
users_id int primary key, 
UserName varchar(30), 
Gender varchar(10)
)

create table UserLogin (
userLogin_id int primary key, 
users_id int, 
UserName varchar(30), 
userPassword varchar(30)
)

create table PlayList (
playlist_id int primary key, 
users_id int, 
album_name varchar(50)
)

create table Includes (
song_id int, 
playlist_id int, 
constraint Includes_pk primary key(playlist_id,song_id)
)

create table UserSong (
song_id int, 
users_id int, 
constraint UserSong_pk primary key(song_id,users_id)
)

create table Top_Favourite (
TFSong_id int primary key,
song_id int,
title varchar(30)
)

create table FavSong (
users_id int,
TFSong_id int,
constraint FavSong_pk primary key(users_id,TFSong_id)
)
                                                             -------Relationships----------

-------Relationship from SungBy to Song---------

alter table Sung_By
add constraint Sing_By_fk foreign key (song_id) references Song(song_id);

-------Relationship from SungBy to Artist---------

alter table Sung_By
add constraint Song_By_fk foreign key (artist_id) references Artist(Artist_id);

-------Relationship from PerformedBy to Album---------

alter table PerformedBy
add constraint perform_By_fk foreign key (album_id) references Album(album_id);

-------Relationship of PerformedBy to Artist---------

alter table PerformedBy
add constraint performs_By_fk foreign key (artist_id) references Artist(Artist_id);

-------Relationship from Includes to Song---------

alter table Includes
add constraint include_fk foreign key (song_id) references Song(song_id);

-------Relationship from Includes to Playlist---------

alter table Includes
add constraint incld_fk foreign key (playlist_id) references Playlist(playlist_id);

-------Relationship from UserSong to Song---------

alter table UserSong
add constraint user_By_fk foreign key (song_id) references Song(song_id);

-------Relationship from UserSong to Users---------

alter table UserSong
add constraint usr_By_fk foreign key (users_id) references Users(users_id);

-------Relationship from Song to Album---------

alter table Song add constraint Song_album_id_fk
foreign key (album_id) references album(album_id) 

-------Relationship from Album to Song---------

alter table Album add constraint Album_song_id_fk
foreign key (song_id) references Song(song_id)

-------Relationship from Album to Genre---------

alter table Album add constraint Album_genre_id_fk
foreign key (genre_id) references Genre(genre_id)

-------Relationship from Album to Label---------

alter table Album add constraint Album_label_id_fk
foreign key (label_id) references Label(label_id)

-------Relationship from Lyrics to Song---------

alter table Lyrics add constraint Lyrics_song_id_fk
foreign key (song_id) references Song(song_id)

-------Relationship from Lyrics to Album---------

alter table Lyrics add constraint Lyrics_album_id_fk
foreign key (album_id) references Album(album_id)

-------Relationship from UserLogin to User---------

alter table UserLogin add constraint UserLogin_users_id_fk
foreign key (users_id) references Users(users_id)

--------Relationship from User to Playlist---------

alter table Playlist add constraint Playlist_users_id_fk
foreign key (users_id) references Users(users_id)

---------Relationship from TopFav to Song-----------

alter table Top_Favourite add constraint Top_Favourite_song_id_fk
foreign key (song_id) references Song(song_id)

---------Relationship from FavSong to Users----------

alter table FavSong add constraint FavSong_users_id_fk
foreign key (users_id) references Users(users_id)

---------Relationship from FavSong to Top_Favourite------

alter table FavSong add constraint FavSong_TFSong_id_fk
foreign key (TFSong_id) references Top_Favourite(TFSong_id)


                                                        ---------Data Entry---------

---------Genre--------

insert into Genre(genre_id, Name) values (1,'Classical')
insert into Genre(genre_id, Name) values (2,'Folk')
insert into Genre(genre_id, Name) values (3,'Semi Classical')
insert into Genre(genre_id, Name) values (4,'Pop Music')
insert into Genre(genre_id, Name) values (5,'Rock Music')
insert into Genre(genre_id, Name) values (6,'Dance Music')
insert into Genre(genre_id, Name) values (7,'Art Music')
insert into Genre(genre_id, Name) values (8,'Hip Hop')
insert into Genre(genre_id, Name) values (9,'Electro')
insert into Genre(genre_id, Name) values (10,'Jazz')
insert into Genre(genre_id, Name) values (11,'Instrumental')
insert into Genre(genre_id, Name) values (12,'Orchestra')
insert into Genre(genre_id, Name) values (13,'Soul Music')
insert into Genre(genre_id, Name) values (14,'Funk')
insert into Genre(genre_id, Name) values (15,'Disco')
insert into Genre(genre_id, Name) values (16,'Drum and Bass')
insert into Genre(genre_id, Name) values (17,'Breakbeat')
insert into Genre(genre_id, Name) values (18,'Indie Rock')
insert into Genre(genre_id, Name) values (19,'World Music')
insert into Genre(genre_id, Name) values (20,'Trance Music')
insert into Genre(genre_id, Name) values (21,'Pop Rock')
insert into Genre(genre_id, Name) values (22, 'Geet')
insert into Genre(genre_id, Name) values (23, 'Ghazal')


-------Label------

insert into Label(label_id, Name) values (1,'Sony Music Entertainment')
insert into Label(label_id, Name) values (2,'Universal Records Pakistan')
insert into Label(label_id, Name) values (3,'Sony Music Entertainment')
insert into Label(label_id, Name) values (4,'Oriental Star Companies ')
insert into Label(label_id, Name) values (5,'Pepsi Pakistan')
insert into Label(label_id, Name) values (6,'Fire Records')
insert into Label(label_id, Name) values (7,'EMI Pakistan')
insert into Label(label_id, Name) values (8,'Empire Music Limited')
insert into Label(label_id, Name) values (9,'Coke Studio')
insert into Label(label_id, Name) values (10,'Real World Records')
insert into Label(label_id, Name) values (11,'T-Series')
insert into Label(label_id, Name) values (12,'Karavan Music')
insert into Label(label_id, Name) values (13,'Capitol')
insert into Label(label_id, Name) values (14,'Sony Music Pakistan')
insert into Label(label_id, Name) values (15,'BIY Noori Records Pakistan')
insert into Label(label_id, Name) values (16,'Studio 5')
insert into Label(label_id, Name) values (17,'Virgin Records')
insert into Label(label_id, Name) values (18,'Saregama')
insert into Label(label_id, Name) values (19,'LM Music')
insert into Label(label_id, Name) values (20,'Tips')
insert into Label(label_id, Name) values (21,'Venus Records')
insert into Label(label_id, Name) values (22,'Sony Music India')
insert into Label(label_id, Name) values (23,'Main Stage Productions')
insert into Label(label_id, Name) values (24, 'Music Today')
insert into Label(label_id, Name) values (25, 'Digital Music World')
insert into Label(label_id, Name) values (26, 'Sound Master')

------Album-------

insert into Album(album_id, album_name, artist_name, total_tracks,album_length, genre_id, label_id, release_date) values (1, 'Unki Gali Mein', 'Nusrat Fateh Ali Khan', 5, 20.34, 4, 23, ('2017-3-20'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (2, 'Sajda', 'Lata Mangeshker', 13, 70.43, 1, 18, ('1991-1-1'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (3, 'Tabeer', 'Shafqat Amanat Ali', 9, 50.56, 22, 24, ('2008-9-9'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (4, 'Kyun Dooriyan', 'Shafqat Amanat Ali', 11, 65.56, 22, 24, ('2010-3-2'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (5, 'Adaa', 'Lata Mangeshker', 10, 62.01, 23, 21, ('1998-1-10'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (6, 'Teenage Dream', 'Katty Perry', 3, 12.34, 21 ,13, ('2010-7-24'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (7, 'Saadgi', 'Lata Mangeshker', 8, 50.20,22, 11, ('2007-1-21'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (8, 'Dill chahta hai', 'Sonu Nigham', 11, 50.34, 22, 11, ('2001-6-22'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (9, 'Meri Pasand', 'Mehdi Hassan', 6, 60.34, 23, 7, ('1983-3-1'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (10, 'Kabhi khushi kabhi gham', 'Sonu Nigham', 11, 68.56, 22, 1, ('2008-11-20'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (11, 'Sohni Lagdi', 'Sajjad Ali', 10, 50.34, 4, 26, ('1999-6-21'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (12, 'Huqa Pani', 'Ali Zafar', 10, 45.50, 4, 8, ('2001-6-22'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (13, 'Heer Ranjha', 'Fariha Pervez', 10, 65.18, 22, 25, ('2013-11-15'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (14, 'Doorie', 'Atif Aslam', 18, 70.34, 4, 20, ('2006-12-22'))
insert into Album(album_id, album_name, artist_name, total_tracks, album_length,genre_id, label_id, release_date) values (15, '1989', 'Taylor Swift', 13, 70.34, 21, 11, ('2014-10-27'))

--------Song-------

insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (1, 'Duur By Sir Nadeem Zafar', 3.01, 'Yes', 'Yes', 1)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (2,'Sanu ik pall chain na aavay', 4.02,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (3,'Yaad to aati hogi', 4.02,'Yes', 'Yes', 11 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (4,'yeh dill tum bin', 4.02,'Yes', 'Yes', 2 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (5,'Baazi', 4.02,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (6,'Shikwa', 4.02,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (7,'Dill Moum ka diya', 4.02,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (8,'Chan kithan guzari aayi', 4.02,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (9,'Tere ishq Nachaya', 4.02, 'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (10,'Loey loey Aaja Mahi',6.32 ,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (11,'Menu yaadan teriyan', 7.34,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (12,'Sari Sari raat teri yaad', 8.12 ,'Yes', 'Yes', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (13,'Chithi Yaar di',5.05 ,'Yes', 'No', 1 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (14,'kabhi youn bhi aa', 5.09 ,'Yes', 'Yes', 2 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (15,'Dill hi to hai',7.04 ,'Yes', 'Yes', 2 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (16,'Dhoop mein  niklo',7.04 ,'Yes', 'Yes', 2 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (17,'Mili Hawaon mein',7.04 ,'Yes', 'Yes', 2 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (18,'Mausam ko isharon se',7.04 ,'Yes', 'Yes', 2 )
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (19, 'Kheriyan de naal', 4.05, 'Yes', 'Yes', 3)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (20, 'Naina', 5.06, 'Yes', 'Yes', 3)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (21, 'Damm Ali Ali Damm', 6.02, 'Yes', 'No',3)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (22, 'Rohi', 5.09, 'Yes', 'Yes', 3)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (23, 'Kya Haal Sunawan dill da', 4.05, 'Yes', 'Yes', 4)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (24, 'Mahiya', 5.10, 'Yes', 'Yes', 4)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (25, 'Tu hi sanam', 6.13, 'Yes', 'No',4)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (26, 'jayein kahan', 4.56, 'Yes', 'Yes', 4)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (27, 'Ya to mitt jaye', 4.05, 'Yes', 'Yes', 5)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (28, 'jab kisi se koi gila rakhna', 5.06, 'Yes', 'Yes', 5)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (29, 'main naseeb hun', 6.02, 'Yes', 'No',5)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (30, 'tum saaz chero', 5.09, 'Yes', 'Yes', 5)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (31, 'Fire Works', 3.48, 'Yes', 'Yes',6)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (32, 'Teenage Dream', 3.48, 'Yes', 'Yes', 6)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (33, 'E.T', 3.20, 'Yes', 'Yes',6)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (34, 'Mujhy Khabar thi', 5.01, 'Yes', 'Yes', 7)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (35, 'Phir kahin door se', 4.02, 'Yes','Yes', 7)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (36, 'Andhe Khawbon ko', 6.01,'Yes','Yes', 7)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (37, 'Janay kyun log pyar', 3.13, 'Yes', 'Yes',8)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (38, 'Dill chahta hai', 4.50, 'Yes', 'Yes', 8)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (39, 'Koi kahay kehta rahay', 3.13, 'Yes', 'Yes',8)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (40, 'woh larki hai kahan', 4.50, 'Yes', 'Yes', 8)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (41, 'Muhabbat kerne walay ', 13.13, 'Yes', 'Yes',9)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (42, 'Gulon mein rang bharay', 14.50, 'Yes', 'Yes', 9)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (43, 'dunya kisi k pyar mein', 10.13, 'Yes', 'Yes',9)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (44, 'Na siyo hont ', 7.50, 'Yes', 'Yes', 9)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (45, 'Kabhi khushi kabhi gham', 4.05, 'Yes', 'Yes', 10)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (46, 'bolay chooriyan', 5.10, 'Yes', 'Yes', 10)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (47, 'you are my sonia', 6.13, 'Yes', 'No',10)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (48, 'suraj hwa madham', 4.56, 'Yes', 'Yes', 10)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (49, 'Sohni lagdi o menu', 4.01, 'Yes', 'Yes',11)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (50, 'Laari Adda', 5.09, 'Yes', 'Yes', 11)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (51, 'Tumse Pyar', 4.52, 'Yes', 'Yes',11)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (52, 'Chief Saab', 3.16, 'Yes', 'Yes', 11)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (53, 'Channo', 4.44, 'Yes', 'Yes', 12)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (54, 'Huqa Pani', 4.44, 'Yes', 'Yes', 12)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (55, 'Chal dill mere', 4.20, 'Yes', 'Yes',12)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (56, 'Rangeen', 4.35, 'Yes', 'Yes', 12)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (57, 'Vey mein tere larr', 5.00, 'Yes', 'Yes',13)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (58, 'Channa ve Channa', 3.49, 'Yes', 'Yes', 13)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (59, 'Aaja ve mahi', 4.38, 'Yes', 'Yes',13)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (60, 'Koi mere dill dahaal na janay', 6.42, 'Yes', 'Yes', 13)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (61, 'Doorie Sahi jaye na', 4.47, 'Yes', 'Yes',14)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (62, 'Hum kis gali ja rahay hain', 4.46, 'Yes', 'Yes', 14)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (63, 'Kuch is tarah', 5.09, 'Yes', 'Yes',14)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (64, 'O re piya', 4.25, 'Yes', 'Yes', 14)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (65, 'Blank Space', 3.59, 'Yes', 'Yes',15)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (66, 'Welcome to new york ', 4.30, 'Yes', 'Yes', 15)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (67, 'Wildest Dreams', 5.56, 'Yes', 'Yes',15)
insert into Song (Song_id, Title, Song_length, Share_permit, Download_permit, album_id) values (68, 'I wish i would', 3.18, 'Yes', 'Yes', 15)

-------Lyrics-------

insert into Lyrics (lyrics_id, lyrics_desc, song_id, album_id) values (1, 'Durrr Durrr Durrr
Duur Say Koi Aaye
Kahin Chupkay Say Woh
Dil Main Sama Jaaye
Saajana...
...saajanaa...
Duur... duuur... duur... duuur
Duur Say Koi Aaye
Kahin Chupkay Say Woh
Dil Main Sama Jaaye
Saajana...
Duur... durr... durr... saajaan... duur... duur...
Duur Say Koi Aaye
Kahin Chupkay Say Woh
Dil Main Sama Jaaye
Saajana... aan
Duur... saajana... duuur... saajana... duur... duuur
Dekhain Mujhay Jab Woh Aankhain
Main Kho Jaoon
In Aankhon Kay Rastay
Main Us Kay Dil Main Samaoon
Kuch Keh Na Paoon Usay Main
Kuch Sunn Na Paoon
Us Kay Bina Mera Jeevan
Jesay Koi Soona Gaon(village)
Duur... duuur... duur... duuur...
Sooraj Ki Kirnon Say Banta Hai
Chehra Tumhara
Ik Yehi Chehra
Hai Mera Jeevan Sahara
Aankhain Teri…', 1, 1)

insert into Lyrics (lyrics_id, lyrics_desc, song_id, album_id) values (2, 'Sanu ik pal chain naa aave, sajjna
tere bina
ho saada kalleyan g nai lagna,
sajjna tere bina.. .sajna tere
kise daa yaaar na pardes jaaave...
vichhoda naa kise de pesh aave
ho sanu ek pal chain na aaye
Rog vijog te sog hazaara... sajna tere naaal
ho naa bhaave roj kayamat...bichhde yaar jinna de.... ho sanoo ik pal chain...
Hoke, haade, hijar te athroo...de gya yaar sogaatan
mud naa aaye dil te mehram...beet gaiya barsaata....sanu ik pal chain naa aave
beet gaiya…', 2,1)

insert into Lyrics (lyrics_id, lyrics_desc, song_id, album_id) values (3, 'Jaania... Haania... Jaania Haania Tu Vi Sikh Ke De Dukh Sukh
Pholna
Tere Bin, Tere Bin Nahi Lagda Dil Mera Dholna
Tere Bin Nahi Lagda Dil Mera Dholna
Tere Bin Nahi Lagda Dil Mera Dholna
Tere Bin Nahi Lagda Dil Mera Dholna
Jaania Haania Tu Vi Sikh Ke De Dukh Sukh Pholna
Tere Bin, Tere Bin Nahi Lagda Dil Mera Dholna
Tere Bin Nahi Lagda Dil Mera Dholna
Puchh kaale baddlan to Seene Vich Ag Lage Lang Gaya Kayee
Barsatan
Puchh kaale baddlan to Seene Vich Ag Lage Lang Gaya Kayee
Barsatan

Tur Gayo Sajna Neendran Kho Ke Jaag Ke Katiyan Rataan
Avija Na Sata Wasta Pyaar Ae ruttan Sohniya Murr Nai Aaniya
Tere Bin, Tere Bin Nahi Lagda Dil Mera Dholna
Tere Bin Nahi Lagda Dil Mera Dholna
Tere Bin Nahi Lagda Dil Mera Dholna
Ma Ga Ne Da Ga Ne Ga Re..', 3,1)

insert into Lyrics (lyrics_id, lyrics_desc, song_id, album_id) values (4,'Do you ever feel like a plastic bag
Drifting thought the wind
Wanting to start again
Do you ever feel, feel so paper thin
Like a house of cards
One blow from caving in
Do you ever feel already buried deep
Six feet under scream
But no one seems to hear a thing
Do you know that there still a chance you a spark in you
You just gotta ignite the light
And let it shine
Just own the night
Like the Fourth  July', 31,6)

insert into Lyrics (lyrics_id, lyrics_desc, song_id, album_id) values (5, 'Yaad To Aati Hogi
Dil Dukhati Hogi

Yaad To Aati Hogi
Dil Dukhati Hogi

Meri Tasveer Tumhe

♫♫♪♫♫♪♫♫

Meri Tasveer Tumhe
Roz Rulati Hogi

Yaad To Aati Hogi
Dil Dukhati Hogi

Yaad To Ati Hogi
Dil Dukhati Hogi

💜 You Are Rocking 💜
💜 Hope.! Liking My Track ?
➳ Dont 4Get 2 Rate ➹

Bewafai Ki Tumhe
Tees To Uthti Hogi

Din Me Hasti Ho To Kia
Raat Me Roti Hogi

♫♫♪♫♫♪♫♫

Bewafai Ki Tumhe
Tees To Uthti Hogi

Din Main Hasti Ho To Kya
Raat Main Roti Hogi

Neend Bhi Roz Tumhe

♫♫♪♫♫♪♫♫

Neend Bhi Roz Tumhe
Dair Se Aati Hogi

Yaad To Ati Hogi
Dil Dukhati Hogi

Yaad To Ati Hogi
Dil Dukhati Hogi

✪ Track Uploaded By ✪
D͟͞a͟͞N͟͞i͟͞S͟͞h͟͞J͟͞a͟͞M͟͞a͟͞L͟͞i®
➳ Dont 4Get 2 Follow ➹

Tumne Samjha Hi Nahi
Ek Deewane Ko

Khoon Se Maine Likha
Apne Afsaane Ko', 3,11)

-------Artist------

insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (1, 'Sajjad Ali', 100, 50,'Sajjad Ali is a Pakistani semi-classical, pop and rock singer, poet, actor, film director and film producer from Karachi, Pakistan')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (2, 'Nusrat fateh Ali khan', 200, 100,'Nusrat Fateh Ali Khan, born Pervaiz Ali Khan, was a Pakistani vocalist and musician, primarily a singer of Qawwali, a form of Sufi Islamic devotional music')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (3, 'Lata Mangeshker', 1000, 100,'Lata Mangeshkar is an Indian playback singer and music director. She is one of the best-known and most respected playback singers in South Asia, especially India')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (4, 'Sonu Nigham', 300, 70,'Sonu Nigam is an Indian playback singer, live performer, host and actor. He sings predominantly in Hindi and Kannada language films.')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (5, 'Shafqat amanat', 200, 50,'Shafqat Amanat Ali Khan, is a Pakistani classical singer belonging to Patiala Gharana lineage. He was the lead vocalist of the Pakistani rock band Fuzön.')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (6, 'katty Perry', 500, 100,'Katheryn Elizabeth Hudson, known professionally as Katy Perry, is an American singer, songwriter, and television personality.')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (7, 'Tailor swift', 100, 50,'Taylor Alison Swift is an American singer-songwriter. As one of the worlds leading contemporary recording artists, she known narrative songs about her personal life, which has received widespread media coverage.')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (8, 'Ali zafar', 250, 50,'Ali Zafar is a Pakistani singer-songwriter, model, actor, producer, screenwriter and painter. Zafar started out on Pakistani TV before becoming a popular musician.')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (9, 'Atif aslam', 700, 100,'Muhammad Atif Aslam is a Pakistani singer-songwriter and actor. His movie debut was the 2011 social drama Bol. He has recorded numerous chart-topping songs and is known for his vocal belting technique. ')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (10,'Fariha Pervez', 200, 20,'Fariha Pervez is a prolific and versatile Pakistani female singer. She is specially known for the rendition of various popular and famous Ghazals.')
insert into Artist (artist_id, artist_name, total_songs, total_albums, Bio) values (11,'Mehdi Hassan' , 300, 30,'Mehdi Hasan Khan, was a Pakistani ghazal singer and playback singer for Lollywood. One of the greatest and most influential figures in the history of ghazal singing, ')

-------SungBy-----

insert into Sung_By (song_id, artist_id) values (1,2)
insert into Sung_By (song_id, artist_id) values (2,2)
insert into Sung_By (song_id, artist_id) values (3,1)
insert into Sung_By (song_id, artist_id) values (4,3)
insert into Sung_By (song_id, artist_id) values (5,2)
insert into Sung_By (song_id, artist_id) values (6,2)
insert into Sung_By (song_id, artist_id) values (7,2)
insert into Sung_By (song_id, artist_id) values (8,3)
insert into Sung_By (song_id, artist_id) values (9,2)
insert into Sung_By (song_id, artist_id) values (10,2)
insert into Sung_By (song_id, artist_id) values (11,2)
insert into Sung_By (song_id, artist_id) values (12,1)
insert into Sung_By (song_id, artist_id) values (13,3)
insert into Sung_By (song_id, artist_id) values (14,3)
insert into Sung_By (song_id, artist_id) values (15,3)
insert into Sung_By (song_id, artist_id) values (16,3)
insert into Sung_By (song_id, artist_id) values (17,5)
insert into Sung_By (song_id, artist_id) values (18,5)
insert into Sung_By (song_id, artist_id) values (19,5)
insert into Sung_By (song_id, artist_id) values (20,5)
insert into Sung_By (song_id, artist_id) values (21,5)
insert into Sung_By (song_id, artist_id) values (22,5)
insert into Sung_By (song_id, artist_id) values (23,2)
insert into Sung_By (song_id, artist_id) values (24,2)
insert into Sung_By (song_id, artist_id) values (25,2)
insert into Sung_By (song_id, artist_id) values (26,3)
insert into Sung_By (song_id, artist_id) values (27,3)
insert into Sung_By (song_id, artist_id) values (28,3)
insert into Sung_By (song_id, artist_id) values (29,3)
insert into Sung_By (song_id, artist_id) values (30,3)
insert into Sung_By (song_id, artist_id) values (31,6)
insert into Sung_By (song_id, artist_id) values (32,6)
insert into Sung_By (song_id, artist_id) values (33,6)
insert into Sung_By (song_id, artist_id) values (34,3)
insert into Sung_By (song_id, artist_id) values (35,3)
insert into Sung_By (song_id, artist_id) values (36,3)
insert into Sung_By (song_id, artist_id) values (37,4)
insert into Sung_By (song_id, artist_id) values (38,4)
insert into Sung_By (song_id, artist_id) values (39,4)
insert into Sung_By (song_id, artist_id) values (40,4)
insert into Sung_By (song_id, artist_id) values (41,11)
insert into Sung_By (song_id, artist_id) values (42,11)
insert into Sung_By (song_id, artist_id) values (43,11)
insert into Sung_By (song_id, artist_id) values (44,11)
insert into Sung_By (song_id, artist_id) values (45,4)
insert into Sung_By (song_id, artist_id) values (46,4)
insert into Sung_By (song_id, artist_id) values (47,4)
insert into Sung_By (song_id, artist_id) values (48,4)
insert into Sung_By (song_id, artist_id) values (49,1)
insert into Sung_By (song_id, artist_id) values (50,1)
insert into Sung_By (song_id, artist_id) values (51,1)
insert into Sung_By (song_id, artist_id) values (52,1)
insert into Sung_By (song_id, artist_id) values (53,8)
insert into Sung_By (song_id, artist_id) values (54,8)
insert into Sung_By (song_id, artist_id) values (55,8)
insert into Sung_By (song_id, artist_id) values (56,8)
insert into Sung_By (song_id, artist_id) values (57,10)
insert into Sung_By (song_id, artist_id) values (58,10)
insert into Sung_By (song_id, artist_id) values (59,10)
insert into Sung_By (song_id, artist_id) values (60,10)
insert into Sung_By (song_id, artist_id) values (61,9)
insert into Sung_By (song_id, artist_id) values (62,9)
insert into Sung_By (song_id, artist_id) values (63,9)
insert into Sung_By (song_id, artist_id) values (64,9)
insert into Sung_By (song_id, artist_id) values (65,7)
insert into Sung_By (song_id, artist_id) values (66,7)
insert into Sung_By (song_id, artist_id) values (67,7)
insert into Sung_By (song_id, artist_id) values (68,7)

-------Performed BY----------

insert into PerformedBy (album_id, artist_id) values (1,1)
insert into PerformedBy (album_id, artist_id) values (2,2)
insert into PerformedBy (album_id, artist_id) values (3,3)
insert into PerformedBy (album_id, artist_id) values (4,5)
insert into PerformedBy (album_id, artist_id) values (5,5)
insert into PerformedBy (album_id, artist_id) values (6,6)
insert into PerformedBy (album_id, artist_id) values (7,3)
insert into PerformedBy (album_id, artist_id) values (8,4)
insert into PerformedBy (album_id, artist_id) values (9,11)
insert into PerformedBy (album_id, artist_id) values (10,4)
insert into PerformedBy (album_id, artist_id) values (11,1)
insert into PerformedBy (album_id, artist_id) values (12,8)
insert into PerformedBy (album_id, artist_id) values (13,10)
insert into PerformedBy (album_id, artist_id) values (14,9)
insert into PerformedBy (album_id, artist_id) values (15,7)

-------Users-------

insert into Users (users_id, UserName, Gender) values (1, 'Saqib Ejaz', 'Male')
insert into Users (users_id, UserName, Gender) values (2, 'Iqra Hussain', 'Female')
insert into Users (users_id, UserName, Gender) values (3, 'Hassaan Farooq', 'Male')
insert into Users (users_id, UserName, Gender) values (4, 'Taha Hussain', 'Female')
insert into Users (users_id, UserName, Gender) values (5, 'Sohaib Ahmed', 'Male')
insert into Users (users_id, UserName, Gender) values (6, 'Qamar Hussain', 'Male')
insert into Users (users_id, UserName, Gender) values (7, 'Celina Saqib', 'Female')
insert into Users (users_id, UserName, Gender) values (8, 'Aimen Saeed', 'Female')
insert into Users (users_id, UserName, Gender) values (9, 'Peter', 'Male')
insert into Users (users_id, UserName, Gender) values (10, 'Katty', 'Female')
insert into Users (users_id, UserName, Gender) values (11, 'Cai', 'Male')
insert into Users (users_id, UserName, Gender) values (12, 'Emily', 'Female')
insert into Users (users_id, UserName, Gender) values (13, 'Ross', 'Female')
insert into Users (users_id, UserName, Gender) values (14, 'Pheobs', 'Female')
insert into Users (users_id, UserName, Gender) values (15, 'Joey', 'Male')
insert into Users (users_id, UserName, Gender) values (16, 'Chandler', 'Male')
insert into Users (users_id, UserName, Gender) values (17, 'Abdul Basit', 'Male')
insert into Users (users_id, UserName, Gender) values (18, 'Khizer Hashmi', 'Male')
insert into Users (users_id, UserName, Gender) values (19, 'Ahmed', 'Male')
insert into Users (users_id, UserName, Gender) values (20, 'Azka Zia', 'Female')

------User LogIn-----

insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (1, 'hwdjqiue721728309831d', 1, 'Saqib Ejaz')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (2, 'uqyweiujqiue721728309831d', 2, 'Iqra Hussain')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (3, 'hwdj\qiue72sjhdhq1d', 3, 'Hassaan Farooq')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (4, 'hamadjqiue721728309831d', 4, 'Taha Hussain')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (5, 'lkajqiue7217qwuhd831d', 5, 'Sohaib Ahmed')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (6, 'mishjqiupqoiw28309831d', 6, 'Qamar Hussain')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (7, 'miahalyw7323830hsdhfd', 7, 'celina Saqib')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (8, 'pqowpqop89272%^&*d', 8, 'aimen Saeed')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (9, 'hwdjqiue^&9ngfu1d', 9, 'peter')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (10, 'ksuheoiqu8%^&%^&1d', 10, 'Katty')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (11, 'lkal897@345d', 11, 'Cai')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (12, 'Ahmedshah718', 12, 'Emily')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (13, 'saqib.oinaline', 13, 'Ross')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (14, 'iqra.iuyqee2e21', 14, 'Pheobs')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (15, 'specialfrme.', 15, 'Joey')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (16, 'likewhatekjqos', 16, 'Chandler')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (17, '**jkjdj309831d', 17, 'Abdul Basit')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (18, 'KJqhouwepjdmfi', 18, 'Khizar hashmi')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (19, 'hweque8u3e1', 19, 'Ahmed')
insert into UserLogin (userLogin_id, userPassword, users_id, UserName) values (20, '981hndiuhwoej', 20, 'Azka zia')

----------PlayList---------

insert into PlayList (playlist_id, users_id) values (1, 1)
insert into PlayList (playlist_id, users_id) values (2, 2)
insert into PlayList (playlist_id, users_id) values (3, 3)
insert into PlayList (playlist_id, users_id) values (4, 4)
insert into PlayList (playlist_id, users_id) values (5, 5)
insert into PlayList (playlist_id, users_id) values (6, 6)
insert into PlayList (playlist_id, users_id) values (7, 7)
insert into PlayList (playlist_id, users_id) values (8, 8)
insert into PlayList (playlist_id, users_id) values (9, 9)
insert into PlayList (playlist_id, users_id) values (10, 10)
insert into PlayList (playlist_id, users_id) values (11, 11)
insert into PlayList (playlist_id, users_id) values (12, 12)
insert into PlayList (playlist_id, users_id) values (13, 13)
insert into PlayList (playlist_id, users_id) values (14, 14)
insert into PlayList (playlist_id, users_id) values (15, 15)
insert into PlayList (playlist_id, users_id) values (16, 16)
insert into PlayList (playlist_id, users_id) values (17, 17)
insert into PlayList (playlist_id, users_id) values (18, 18)
insert into PlayList (playlist_id, users_id) values (19, 19)
insert into PlayList (playlist_id, users_id) values (20, 20)

----------Includes----------

insert into Includes (playlist_id, song_id) values (1,1)
insert into Includes (playlist_id, song_id) values (1,2)
insert into Includes (playlist_id, song_id) values (1,3)
insert into Includes (playlist_id, song_id) values (1,4)
insert into Includes (playlist_id, song_id) values (1,7)
insert into Includes (playlist_id, song_id) values (2,56)
insert into Includes (playlist_id, song_id) values (2,23)
insert into Includes (playlist_id, song_id) values (2,17)
insert into Includes (playlist_id, song_id) values (2,18)
insert into Includes (playlist_id, song_id) values (2,23)
insert into Includes (playlist_id, song_id) values (2,67)
insert into Includes (playlist_id, song_id) values (3,20)
insert into Includes (playlist_id, song_id) values (3,1)
insert into Includes (playlist_id, song_id) values (3,4)
insert into Includes (playlist_id, song_id) values (3,3)
insert into Includes (playlist_id, song_id) values (3,6)
insert into Includes (playlist_id, song_id) values (3,8)
insert into Includes (playlist_id, song_id) values (4,65)
insert into Includes (playlist_id, song_id) values (4,32)
insert into Includes (playlist_id, song_id) values (4,12)
insert into Includes (playlist_id, song_id) values (5,34)
insert into Includes (playlist_id, song_id) values (5,12)
insert into Includes (playlist_id, song_id) values (5,8)
insert into Includes (playlist_id, song_id) values (6,56)
insert into Includes (playlist_id, song_id) values (6,43)
insert into Includes (playlist_id, song_id) values (6,21)
insert into Includes (playlist_id, song_id) values (7,45)
insert into Includes (playlist_id, song_id) values (7,43)
insert into Includes (playlist_id, song_id) values (8,47)
insert into Includes (playlist_id, song_id) values (9,16)
insert into Includes (playlist_id, song_id) values (9,19)
insert into Includes (playlist_id, song_id) values (10,6)
insert into Includes (playlist_id, song_id) values (10,26)
insert into Includes (playlist_id, song_id) values (11,34)
insert into Includes (playlist_id, song_id) values (11,67)
insert into Includes (playlist_id, song_id) values (12,13)
insert into Includes (playlist_id, song_id) values (12,14)
insert into Includes (playlist_id, song_id) values (13,23)
insert into Includes (playlist_id, song_id) values (14,15)
insert into Includes (playlist_id, song_id) values (14,16)
insert into Includes (playlist_id, song_id) values (15,52)
insert into Includes (playlist_id, song_id) values (15,12)
insert into Includes (playlist_id, song_id) values (16,34)
insert into Includes (playlist_id, song_id) values (16,56)
insert into Includes (playlist_id, song_id) values (17,59)
insert into Includes (playlist_id, song_id) values (17,60)
insert into Includes (playlist_id, song_id) values (18,23)
insert into Includes (playlist_id, song_id) values (18,34)
insert into Includes (playlist_id, song_id) values (19,57)
insert into Includes (playlist_id, song_id) values (19,68)
insert into Includes (playlist_id, song_id) values (20,16)
insert into Includes (playlist_id, song_id) values (20,9)

-------TopFav Songs-----

insert into Top_Favourite (TFSong_id, song_id) values (1,23)
insert into Top_Favourite (TFSong_id, song_id) values (2,45)
insert into Top_Favourite (TFSong_id, song_id) values (3,12)
insert into Top_Favourite (TFSong_id, song_id) values (4,56)
insert into Top_Favourite (TFSong_id, song_id) values (5,34)
insert into Top_Favourite (TFSong_id, song_id) values (6,12)
insert into Top_Favourite (TFSong_id, song_id) values (7,45)
insert into Top_Favourite (TFSong_id, song_id) values (8,12)
insert into Top_Favourite (TFSong_id, song_id) values (9,13)
insert into Top_Favourite (TFSong_id, song_id) values (10,67)

-------------FavSongs--------

insert into FavSong (TFSong_id, users_id) values (3,12)
insert into FavSong (TFSong_id, users_id) values (5,20)
insert into FavSong (TFSong_id, users_id) values (8,12)
insert into FavSong (TFSong_id, users_id) values (10,9)
insert into FavSong (TFSong_id, users_id) values (3,6)
insert into FavSong (TFSong_id, users_id) values (9,7)
insert into FavSong (TFSong_id, users_id) values (6,15)
insert into FavSong (TFSong_id, users_id) values (7,18)
insert into FavSong (TFSong_id, users_id) values (5,9)
insert into FavSong (TFSong_id, users_id) values (1,12)
insert into FavSong (TFSong_id, users_id) values (9,20)

----------User Song---------

insert into UserSong (users_id, song_id) values (1,23)
insert into UserSong (users_id, song_id) values (2,32)
insert into UserSong (users_id, song_id) values (3,36)
insert into UserSong (users_id, song_id) values (4,48)
insert into UserSong (users_id, song_id) values (5,15)
insert into UserSong (users_id, song_id) values (5,56)
insert into UserSong (users_id, song_id) values (4,29)
insert into UserSong (users_id, song_id) values (8,10)
insert into UserSong (users_id, song_id) values (10,67)
insert into UserSong (users_id, song_id) values (12,29)
insert into UserSong (users_id, song_id) values (13,27)
insert into UserSong (users_id, song_id) values (19,10)
insert into UserSong (users_id, song_id) values (20,26)
insert into UserSong (users_id, song_id) values (11,37)
insert into UserSong (users_id, song_id) values (12,67)
