USE ticketdatabase;

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO venue(venue_name, occupancy, address, type)
VALUES('Blue Note', 835 , '17 North Ninth St. Columbia, MO 65201', 'rock hall'),
	  ('The Pageant', 2300 , '6161 Delmar Blvd. Saint Louis, MO 63112' , 'rock hall'),
	  ('Rose Music Hall', 1000 , '1013 Park Ave. Columbia, MO 65201' , 'amphitheatre'),
	  ('Mizzou Arena', 15061 , '1 Champions Dr #200. Columbia, MO 65201', 'stadium'),
	  ('Kauffman Center' , 1800 ,'6161 Delmar Blvd. Saint Louis, MO 63112', 'opera house');

INSERT INTO artist(artist_name, act_type)
VALUES	('Kansas City Symphony', 'Orchestra'),
		('Carly Pearce', 'Country'),
		('Lyle Lovett', 'Country'), 
		('Cherub', 'Electronic'), 
		('The Werks', 'Electronic'),
		('Mike Stud', 'Hip-Hop'), 
		('Riley Green', 'Country'), 
		('The Native Howl', 'Alternative'), 
		('Koe Wetzel', 'Country'), 
		('Dillon Francis', 'Electronic'), 
		('Interpol', 'Alternative'), 
		('Jon Pardi', 'Country'), 
		('Dr. Dog', 'Alternative'), 
		('Kenny Chesney', 'Country'); 
 
INSERT INTO concert(concert_number, tickets_sold)
VALUES  ( 01, 1167),
		( 02, 366),
		( 03, 847),
		( 04, 2230),
		( 05, 606),
		( 06, 2400),
		( 07, 808),
		( 08, 582),
		( 09, 822),
		( 10, 2200),
		( 11, 2020),
		( 12, 6880),
		( 13, 1804),
		( 14, 5689);

INSERT INTO ticket( Concert_Number, Ticket_Number, Seat_Number, Price)
VALUES	( 1, 0101, 'A01', 60.50),	( 1, 0102, 'A02', 60.50),
		( 1, 0103, 'A03', 60.50),	( 1, 0104, 'A04', 55.00),
        ( 2, 0201, 'B01', 25.00),	( 2, 0202, 'B02', 25.00),
        ( 2, 0203, 'B03', 25.00),	( 2, 0204, 'B04', 15.50),
        ( 3, 0301, 'C01', 25.00),	( 3, 0302, 'C02', 25.00),
        ( 3, 0303, 'C03', 25.00),	( 3, 0304, 'C04', 25.00),        
        ( 4, 0401, 'D01', 25.00),	( 4, 0402, 'D02', 25.00),
        ( 4, 0403, 'D03', 25.00),	( 4, 0404, 'D04', 25.00),
        ( 5, 0501, 'E01', 25.00),	( 5, 0502, 'E02', 25.00),
        ( 5, 0503, 'E03', 25.00),	( 5, 0504, 'E04', 25.00),
        ( 6, 0601, 'F01', 25.00),	( 6, 0602, 'F02', 25.00),
        ( 6, 0603, 'F03', 25.00),	( 6, 0604, 'F04', 25.00),
        ( 7, 0701, 'G01', 25.00),	( 7, 0702, 'G02', 25.00),
        ( 7, 0703, 'G03', 25.00),	( 7, 0704, 'G04', 25.00),
        ( 8, 0801, 'H01', 25.00),	( 8, 0802, 'H02', 25.00),
        ( 8, 0803, 'H03', 25.00),	( 8, 0804, 'H04', 25.00),
        ( 9, 0901, 'I01', 25.00),	( 9, 0902, 'I02', 25.00),
        ( 9, 0903, 'I03', 25.00),	( 9, 0904, 'I04', 25.00),
        ( 10, 1001, 'J01', 25.00),	( 10, 1002, 'J02', 25.00),
        ( 10, 1003, 'J03', 25.00),	( 10, 1004, 'J04', 25.00),
        ( 11, 1101, 'K01', 25.00),	( 11, 1102, 'K02', 25.00),
        ( 11, 1103, 'K03', 25.00),	( 11, 1104, 'K04', 25.00),
        ( 12, 1201, 'L01', 25.00),	( 12, 1202, 'L02', 25.00),
        ( 12, 1203, 'L03', 25.00),	( 12, 1204, 'L04', 25.00),
        ( 13, 1301, 'M01', 25.00),	( 13, 1302, 'M02', 25.00),
        ( 13, 1303, 'M03', 25.00),	( 13, 1304, 'M04', 25.00),
        ( 14, 1401, 'N01', 25.00),	( 14, 1402, 'N02', 25.00),
        ( 14, 1403, 'N03', 25.00),	( 14, 1404, 'N04', 25.00);

INSERT INTO opera_house( venue_name, orchestra_type)
VALUES( 'Kauffman Center' , ' Sinfonia');

INSERT INTO rock_hall( venue_name, music_genre)
VALUES( 'Blue Note' , 'Rock'),
	  ( 'The Pageant' , 'Hip-Hop');

INSERT INTO stadium( venue_name, view_position)
VALUES ('Mizzou Arena' , 'stadium seating');

INSERT INTO ampitheatre( venue_name, set_type)
VALUES ('Rose Music Hall' , 'Musical Performance'); 

INSERT INTO hosts( concert_number, artist_name, venue_name, date)
VALUES 	( 01 , 'Kansas City Symphony', 'Kauffman Center' , "2019-01-04"),
		    ( 02 , 'Carly Pearce', 'Blue Note', "2019-01-17"),
       	( 03 , 'Lyle Lovett', 'Kauffman Center', "2019-01-18"),
       	( 04 , 'Cherub', 'The Pageant' , "2019-01-19"),
       	( 05 , 'The Werks', 'Rose Music Hall', "2019-01-22"),
       	( 06 , 'Mike Stud', 'The Pageant' , "2019-01-23"),	
       	( 07 , 'Riley Green', 'The Pageant' , "2019-01-24"),
       	( 08 , 'The Native Howl', 'Rose Music Hall' , "2019-01-29"),
       	( 09 , 'Koe Wetzel', 'Blue Note' , "2019-02-01"),
       	( 10 , 'Dillon Francis', 'The Pageant' , "2019-02-04"),
       	( 11 , 'Interpol', 'The Pageant' , "2019-02-09"),
       	( 12 , 'Jon Pardi', 'Mizzou Arena' , "2019-02-23"),
       	( 13 , 'Dr. Dog', 'The Pageant' , "2019-02-25"),
       	( 14 , 'Kenny Chesney', 'Mizzou Arena' , "2019-05-02");
       
INSERT INTO schedules( artist_name, venue_name)
VALUES ('Kansas City Symphony' ,'Kauffman Center'),
	   ('Carly Pearce' ,'Blue Note'),
       ('Lyle Lovett' ,'Kauffman Center'),
       ('Cherub' ,'The Pageant'),
       ('The Werks' ,'Rose Music Hall'),
       ('Mike Stud' ,'The Pageant'),
       ('Riley Green' ,'The Pageant'),
       ('The Native Howl' ,'Rose Music Hall'),
       ('Koe Wetzel' ,'Blue Note'),
       ('Dillon Francis' ,'The Pageant'),
       ('Interpol' ,'The Pageant'),
       ('Jon Pardi' ,'Mizzou Arena'),
       ('Dr. Dog' ,'The Pageant'),
       ('Kenny Chesney' ,'Mizzou Arena');
       
INSERT INTO has( concert_number, ticket_number, seat_number)
VALUES (01, 0101, 'A01'),	(01, 0102, 'A02'),	(01, 0103, 'A03'),	(01, 0104, 'A04'),

	     (02, 0201, 'B01'),	(02, 0202, 'B02'),	(02, 0203, 'B03'),	(02, 0204, 'B04'),
       
       (03, 0301, 'C01'),	(03, 0302, 'C02'),	(03, 0303, 'C03'),	(03, 0304, 'C04'),
       
       (04, 0401, 'D01'),	(04, 0402, 'D02'),	(04, 0403, 'D03'),	(04, 0404, 'D04'),
       
       (05, 0501, 'E01'),	(05, 0502, 'E02'),	(05, 0503, 'E03'),	(05, 0504, 'E04'),
       
       (06, 0601, 'F01'),	(06, 0602, 'F02'),	(06, 0603, 'F03'),	(06, 0604, 'F04'),
       
       (07, 0701, 'G01'),	(07, 0702, 'G02'),	(07, 0703, 'G03'),	(07, 0704, 'G04'),
	   
       (08, 0801, 'H01'),	(08, 0802, 'H02'),	(08, 0803, 'H03'),	(08, 0804, 'H04'),
       
       (09, 0901, 'I01'),	(09, 0902, 'I02'),	(09, 0903, 'I03'),	(09, 0904, 'I04'),
       
       (10, 1001, 'J01'),	(10, 1002, 'J02'),	(10, 1003, 'J03'),	(10, 1004, 'J04'),
       
       (11, 1101, 'K01'),	(11, 1102, 'K02'),	(11, 1103, 'K03'),	(11, 1104, 'K04'),
		
       (12, 1201, 'L01'),	(12, 1202, 'L02'),	(12, 1203, 'L03'),	(12, 1204, 'L04'),
       
       (13, 1301, 'M01'),	(13, 1302, 'M02'),	(13, 1303, 'M03'),	(13, 1304, 'M04'),
       
       (14, 1401, 'N01'),	(14, 1402, 'N02'),	(14, 1403, 'N03'),	(14, 1404, 'N04');
	   
INSERT INTO sells( venue_name, concert_number, ticket_number, seat_number)
VALUES ('Kauffman Center', 01, 0101, 'A01'),	('Kauffman Center', 01, 0102, 'A02'),
	   ('Kauffman Center', 01, 0103, 'A03'),	('Kauffman Center', 01, 0104, 'A04'),
       ('Blue Note', 02, 0201, 'B01'),	('Blue Note', 02, 0202, 'B02'),
       ('Blue Note', 02, 0203, 'B03'),	('Blue Note', 02, 0204, 'B04'),
       ('Kauffman Center', 03, 0301, 'C01'),	('Kauffman Center', 03, 0302, 'C02'),
       ('Kauffman Center', 03, 0303, 'C03'),	('Kauffman Center', 03, 0304, 'C04'),
       ('The Pageant', 04, 0401, 'D01'),	('The Pageant', 04, 0402, 'D02'),
       ('The Pageant', 04, 0403, 'D03'),	('The Pageant', 04, 0404, 'D04'),
       ('Rose Music Hall', 05, 0501, 'E01'),	('Rose Music Hall', 05, 0502, 'E02'),
       ('Rose Music Hall', 05, 0503, 'E03'),	('Rose Music Hall', 05, 0504, 'E04'),
       ('The Pageant', 06, 0601, 'F01'),	('The Pageant', 06, 0602, 'F02'),
       ('The Pageant', 06, 0603, 'F03'),	('The Pageant', 06, 0604, 'F04'),
       ('The Pageant', 07, 0701, 'G01'),	('The Pageant', 07, 0702, 'G02'),
       ('The Pageant', 07, 0703, 'G03'),	('The Pageant', 07, 0704, 'G04'),
       ('Rose Music Hall', 08, 0801, 'H01'),	('Rose Music Hall', 08, 0802, 'H02'),
       ('Rose Music Hall', 08, 0803, 'H03'),	('Rose Music Hall', 08, 0804, 'H04'),
       ('Blue Note', 09, 0901, 'I01'),	('Blue Note', 09, 0902, 'I02'),
       ('Blue Note', 09, 0903, 'I03'),	('Blue Note', 09, 0904, 'I04'),       
       ('The Pageant', 10, 1001, 'J01'), ('The Pageant', 10, 1002, 'J02'),
       ('The Pageant', 10, 1003, 'J03'), ('The Pageant', 10, 1004, 'J04'),
       ('The Pageant', 11, 1101, 'K01'), ('The Pageant', 11, 1102, 'K02'),
       ('The Pageant', 11, 1103, 'K03'), ('The Pageant', 11, 1104, 'K04'),
       ('Mizzou Arena', 12, 1201, 'L01'),	('Mizzou Arena', 12, 1202, 'L02'),
       ('Mizzou Arena', 12, 1203, 'L03'),	('Mizzou Arena', 12, 1204, 'L04'),
       ('The Pageant', 13, 1301, 'M01'),	('The Pageant', 13, 1302, 'M02'),
       ('The Pageant', 13, 1303, 'M03'),	('The Pageant', 13, 1304, 'M04'),
       ('Mizzou Arena', 14, 1401, 'N01'),	('Mizzou Arena', 14, 1402, 'N02'),
       ('Mizzou Arena', 14, 1403, 'N03'),	('Mizzou Arena', 14, 1404, 'N04');

INSERT INTO customer(customer_id , fname, lname)
VALUES ( 00001, 'John', 'Doe'),        ( 00010, 'Jane', 'Doe'),         ( 00011, 'Joesph', 'Doe'),
	   ( 00100, 'Elvis', 'Presley'),   ( 00101, 'Muhammad', 'Ali'),     ( 00110, 'Marilyn', 'Monroe'),
       ( 00111, 'Michael', 'Jackson'), ( 01000, 'Bruce', 'Lee'),        ( 01001, 'Michael', 'Jordan'),
       ( 01010, 'Neil', 'Armstrong'),  ( 01011, 'Babe', 'Ruth'),        ( 01100, 'John F.', 'Kennedy'),
       ( 01101, 'Albert', 'Einstein'), ( 01110, 'Harrison', 'Ford'),    ( 01111, 'John', 'Wayne'),
       ( 10000, 'Hugh', 'Hefner'),     ( 10001, 'Ernest', 'Hemingway'), ( 10010, 'Arnold', 'Schwarzenegger'),
       ( 10011, 'Joe', 'DiMaggio'),    ( 10100, 'Walt', 'Disney'),      ( 10101, 'Paul', 'Bunyon'),
       ( 10110, 'George', 'Halas'),    ( 10111, 'Vince', 'Lombardi'),   ( 11000, 'Mike', 'Ditka');

INSERT INTO purchases(customer_id, concert_number, ticket_number)
VALUES  ( 00000, 01, 0101), ( 00001, 01, 0102), ( 00010, 01, 0103), ( 00011, 02, 0201), 
		( 00100, 02, 0202), ( 00101, 02, 0203), ( 00110, 03, 0301), ( 00111, 03, 0302), 
		( 01000, 03, 0303), ( 01001, 04, 0401), ( 01010, 04, 0402), ( 01100, 05, 0501), 
		( 01101, 05, 0502), ( 01111, 05, 0503), ( 10000, 06, 0601), ( 10001, 06, 0602), 
		( 10010, 06, 0603), ( 10011, 07, 0701), ( 10100, 07, 0702), ( 10101, 07, 0703), 
		( 10110, 08, 0801), ( 10111, 08, 0802), ( 11000, 08, 0803);
       
SET FOREIGN_KEY_CHECKS=1;