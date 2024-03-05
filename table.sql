CREATE TABLE Artist
(
    ArtistId int primary key,
	Name text
);

CREATE TABLE Album
(
    AlbumId int primary key,
	Title text,
    ArtistId int,
    foreign key(ArtistId) references Artist(ArtistId)
);

CREATE TABLE Genre
(
    GenreId int primary key,
	Name text
);

CREATE TABLE MediaType
(
    MediaTypeId int primary key,
	Name text
);

CREATE TABLE Track
(
    TrackId int primary key,
	Name text,
    AlbumId int,
    foreign key(AlbumId) references Album(AlbumId),
    MediaTypeId int,
    foreign key(MediaTypeId) references MediaType(MediaTypeId),
    GenreId int,
    foreign key(GenreId) references Genre(GenreId),
    Composer text,
    Milliseconds int,
    Bytes int,
    UnitPrice int
);


CREATE TABLE Playlist(
    PlaylistId int primary key,
    name text
);


CREATE TABLE PlaylistTrack(
    PlaylistId int,
    foreign key(PlaylistId) references Playlist(PlaylistId),
    TrackId int,
    foreign key(TrackId) references Track(TrackId)
);

insert into artist (artistid, name)
values
    (0, 'A1'),
    (1, 'A2');

insert into album (albumid, title, artistid)
values
    (0, 'Al1', 0),
    (1, 'Al2', 1);

insert into genre(genreid, name)
values
    (0, 'G1'),
    (1, 'G2');

insert into mediatype (mediatypeid, name)
values (0, 'M1'),
       (1, 'M2');

insert into track (trackid, name, albumid, mediatypeid, genreid)
values
    (0, 'T1', 0, 0, 1),
    (1, 'T2', 0, 0, 0),
    (2, 'T1', 1, 1, 1),
    (3, 'T2', 1, 1, 0);

insert into playlist (playlistid, name)
values
    (0, 'P1'),
    (1, 'P2'),
    (2, 'P3');

insert into playlisttrack (playlistid, trackid)
values
    (0, 0),
    (1, 1),
    (2, 2),
    (1, 3);

create view new_view as
select ar.name as "Artist", al.title as "Album", tr.name as "Track", g.name as "Genre"
from artist ar
         join album al
              on ar.artistId = al.artistId
         join track tr
              on tr.albumId = al.albumid
         join genre g
              on tr.genreId = g.genreid