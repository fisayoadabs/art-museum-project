DROP DATABASE IF EXISTS ARTMUSEUM;
CREATE DATABASE ARTMUSEUM;
USE ARTMUSEUM;


DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST (
	Artist_name		VARCHAR(40)		NOT NULL	DEFAULT 'Artist Unknown',
	Date_born 		DECIMAL(4)					DEFAULT NULL,
	Date_died		DECIMAL(4)					DEFAULT NULL,
	Origin_country 	VARCHAR(25),
	Epoch			VARCHAR(20),
	Main_style		VARCHAR(25),
	Descript		VARCHAR(60),
CONSTRAINT ARTISTPK 	PRIMARY KEY (Artist_name));


DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT (
	Id_no			DECIMAL(4)		NOT NULL,
	Year_made		DECIMAL(4)					DEFAULT NULL,
	Title			VARCHAR(50)		NOT NULL,
	Descript		VARCHAR(70),
	Style			VARCHAR(25),
	Origin 			VARCHAR(20),
	Epoch			VARCHAR(20),
	Artist			VARCHAR(40)		NOT NULL	DEFAULT 'Artist Unknown',
CONSTRAINT ARTPK	PRIMARY KEY (Id_no));



DROP TABLE IF EXISTS EXHIBITIONS;
CREATE TABLE EXHIBITIONS (
	Exh_Id			DECIMAL(5)		NOT NULL,
	Exh_name		VARCHAR(80)		NOT NULL,
	Start_date		DATE,
	End_date		DATE,
PRIMARY KEY (Exh_Id));


DROP TABLE IF EXISTS DISPLAYS;
CREATE TABLE DISPLAYS (
	Exhibition_Id	DECIMAL(5)		NOT NULL,
	AId_num			DECIMAL(4)		NOT NULL,
PRIMARY KEY (Exhibition_Id, AId_num),
FOREIGN KEY (Exhibition_Id) REFERENCES EXHIBITIONS(Ex_Id),
FOREIGN KEY (AId_num) REFERENCES ART_OBJECT(Id_no));


DROP TABLE IF EXISTS PAINTINGS;
CREATE TABLE PAINTINGS (
	AId_num			DECIMAL(4)		NOT NULL,
	Paint_type		VARCHAR(15),
	Drawn_on 		VARCHAR(15),
PRIMARY KEY (AId_num),
FOREIGN KEY (AId_num) REFERENCES ART_OBJECT(Id_no));


DROP TABLE IF EXISTS SCULPTURE_STATUE;
CREATE TABLE SCULPTURE_STATUE (
	AId_num			DECIMAL(4)		NOT NULL,
	Material		VARCHAR(25),
	Height 			VARCHAR(15),
	Weight			VARCHAR(15),
PRIMARY KEY (AId_num),
FOREIGN KEY (AId_num) REFERENCES ART_OBJECT(Id_no));


DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER (
	AId_num			DECIMAL(4)		NOT NULL,
	Other_type		VARCHAR(50),
PRIMARY KEY (AId_num),
FOREIGN KEY (AId_num) REFERENCES ART_OBJECT(Id_no));


DROP TABLE IF EXISTS PERMANENT_COLLECTION;
CREATE TABLE PERMANENT_COLLECTION (
	AId_num			DECIMAL(4)		NOT NULL,
	Date_acquired	DATE,
	Art_Status		VARCHAR(15),
	Art_cost		INT,
PRIMARY KEY (AId_num),
FOREIGN KEY (AId_num) REFERENCES ART_OBJECT(Id_no));


DROP TABLE IF EXISTS COLLECTIONS;
CREATE TABLE COLLECTIONS (
	Coll_Name		VARCHAR(50) 	NOT NULL,
	Coll_type		VARCHAR(15),
	Descript 		VARCHAR(50),
	Address			VARCHAR(60),
	Phone_num		VARCHAR(20),
	Contact_person	VARCHAR(25)		NOT NULL,
PRIMARY KEY (Coll_Name));


DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED (
	AId_num			DECIMAL(4)		NOT NULL,
	Date_borrowed	DATE,
	Date_returned	DATE,
	CName			VARCHAR(50)		NOT NULL,
PRIMARY KEY (AId_num),
FOREIGN KEY (AId_num) REFERENCES ART_OBJECT(Id_no),
FOREIGN KEY (Cname) REFERENCES COLLECTIONS(Coll_Name));

ALTER TABLE ART_OBJECT
 ADD CONSTRAINT MAKER	FOREIGN KEY (ARTIST) REFERENCES ARTIST(Artist_name)		ON DELETE SET DEFAULT			ON UPDATE CASCADE;
	
INSERT INTO ARTIST (Artist_name, Date_born, Date_died, Origin_country, Epoch, Main_style, Descript)
VALUES		('Benedetto da Rovezzano', '1474', '1552', 'Italy', 'Renaissance', 'Sculpting', 'An Italian architect and sculptor'),
			('George Gower', '1540', '1596', 'England', 'Renaissance', 'Painting', 'An English portrait painter'),
			('Hans Eworth', '1520', '1574', 'Belgium', 'Renaissance', 'Painting', 'A Flemish painter'),
			('Jacques Androuet Du Cerceau', '1510', '1585', 'France', 'Renaissance', 'Designer', 'A French architect and furniture designer'),
			('Hans Holbein the Younger', '1497', '1543', 'Germany', 'Renaissance', 'Painting', 'A German portrait painter and printmaker'),
			('Theaster Gates', '1973', NULL, 'United States', 'Modern', 'Sculpting', 'An American installation artist and sculptor'),
			('Simone Leigh', '1967', NULL, 'United States', 'Modern', 'Sculpting', 'An American installation artist and sculptor'),
			('Woody de Othello', '1991', NULL, 'United States', 'Modern', 'Ceramics', 'An American painter and ceramicist'),
			('Antonio Leonelli', '1438', '1525', 'Italy', 'Renaissance', 'Painting', 'An Italian still-life painter'),
			('Juan Fernández el Labrador', NULL, '1657', 'Spain', 'Renaissance', 'Painting', 'A Spanish still-life painter'),
			('Pablo Picasso', '1881', '1973', 'Spain', 'Early Modern', 'Painting', 'A Spanish painter, sculptor, printmaker, and ceramist'),
			('Jean Etienne Liotard', '1702', '1789', 'Switzerland', 'Reformation', 'Painting', 'A Swiss painter'),
			('John James Audubon', '1785', '1851', 'Haiti', 'Early Modern', 'Painting', 'An Haitian-American bird painter'),
			('Michelangelo', '1475', '1564', 'Italy', 'Renaissance', 'Sculpting', 'An Italian sculptor and painter'),			
			('Guillaume Coustou the Elder', '1677', '1746', 'France', 'Early Modern', 'Sculpting', 'A French sculptor'),			
			('François Barois', '1665', '1726', 'France', 'Early Modern', 'Sculpting', 'A French sculptor'),
			('Édouard-Henri-Théophile Pingret', '1788', '1875', 'France', 'Early Modern', 'Painting', 'A French painter'),
			('William Michael Harnett', '1848', '1892', 'Ireland', 'Early Modern', 'Painting', "An Irish-American trompe-l'oeil still life painter"),
            ('Artist Unknown', NULL, NULL, NULL, NULL, NULL, NULL);

	
INSERT INTO ART_OBJECT (Id_no, Year_made, Title, Descript, Style, Origin, Epoch, Artist)
VALUES		(0001, 1529, 'Angel Bearing CandleStick', 'Sculpture - Angel carrying a candlestick','Verrocchiesque', 'Italian', 'Renaissance', 'Benedetto da Rovezzano'),
			(0002, 1505, 'John the Evangelist', 'Sculpture - John the Evangelist', 'Drapery', NULL, 'Renaissance',DEFAULT),
			(0003, 1567, 'Elizabeth I (The Hampden Portrait)', 'Painting - Queen Elizabeth I', 'Portrait', 'British', 'Renaissance', 'George Gower'),
			(0004, 1554, 'Mary I', 'Painting - Mary I', 'Portrait', 'Flemish', 'Renaissance', 'Hans Eworth'),
			(0005, 1575, 'The "Sea-Dog" Table', 'Furniture - Wooden Table', 'Furniture', 'French', 'Renaissance', 'Jacques Androuet Du Cerceau'),
			(0006, 1536, 'Basin', 'Utensils - Basin', 'Utensils', 'German', 'Renaissance', 'Hans Holbein the Younger'),
			(0007, 2020, 'Signature Study', 'High fire stoneware with glaze', 'Abstract', 'American', 'Modern', 'Theaster Gates'),
			(0008, 2022, 'Large Jug', 'Glazed stoneware', 'Abstract', 'American', 'Modern', 'Simone Leigh'),
			(0009, 2021, 'Applying Pressure', 'Creation using ceramic, glaze and red oak wood', 'Abstract', 'American', 'Modern', 'Woody de Othello'),
			(0010, 1500, 'Bowl', 'A bowl made with earthenware', 'Utensils', NULL, 'American', DEFAULT),
			(0011, 1510, 'Still Life with Grapes and a Bird', 'A still life painting with a bird and grapes', 'Still Life', 'Italian', 'Renaissance', 'Antonio Leonelli'),
			(0012, 1636, 'Still Life with Four Bunches of Grapes', 'A still life painting with 4 bunches of grapes', 'Still Life', 'Spanish', 'Reformation', 'Juan Fernández el Labrador'),
			(0013, 1912, 'Still Life with Chair Caning', 'A still life painting depicting a cafe and newspaper', 'Still Life', 'Spanish', 'Counter-Reformation', 'Pablo Picasso'),
			(0014, 1771, "Trompe l'Oeil", 'A painting that appears to be a sculpture', 'Illusion', 'Swiss', 'Reformation', 'Jean Etienne Liotard'),
			(0015, 1827, 'Carolina Parrot', 'A painting with parrots on a tree', 'Bird Art', 'American', 'Early Modern', 'John James Audubon'),
			(0016, 1515, 'Rebel Slave', 'Statue - A rebel slave', 'Subtractive Marble', 'Italian', 'Renaissance', 'Michelangelo'),
			(0017, 1745, 'Horse Restrained by a Groom', 'Statue - A horse restrained by a man', 'Draped Marble', 'French', 'Early Modern', 'Guillaume Coustou the Elder'),
			(0018, -2650, 'The Crouching Scribe', 'Statue - A scribe seated cross-legged', 'Sculpture in the Round', 'Egyptian', 'Ancient', DEFAULT),
			(0019, 1700, 'Dying Cleopatra', 'Statuette - Depiction of Queen Cleopatra dying', 'Draped Marble', 'French', 'Early Modern', 'François Barois'),
			(0020, -1353, 'Statue of Tiy and Amenhotep III', 'Statue - A King and Queen', 'Sculpture in the Round', 'Egyptian', 'Ancient', DEFAULT),
			(0021, 1846, 'Queen Victoria', 'A portrait of Queen Victoria', 'Portrait', 'French', 'Imperialist', 'Édouard-Henri-Théophile Pingret'),
			(0022, 1912, 'Violin and Grapes', "Analytic Cubism mixed with Renaissance trompe l'oeil style", 'Illusionist Cubism','Spanish','Early Modern','Pablo Picasso'),
			(0023, 1834, 'Louisiana Heron', 'A painting of a heron near a lake', 'Bird Art', 'American', 'Early Modern', 'John James Audubon'),
			(0024, 1888, 'Still Life—Violin and Music', 'A still life painting of a violin among other items', 'Still Life', 'American', 'Early Modern', 'William Michael Harnett');

INSERT INTO EXHIBITIONS (Ex_Id, Exh_name, Start_date, End_date)
VALUES		(00001, 'The Tudors: Art and Majesty in Renaissance England', '2022-10-10','2023-01-08'),
			(00002, 'Cubism and the Trompe l’Oeil Tradition', '2022-10-20','2023-01-22'),
			(00003, 'Hear Me Now: The Black Potters of Old Edgefield, South Carolina', '2022-09-09', '2023-02-05'),
			(00004, 'Still Life: Captured in Time', '2022-11-05', '2023-01-14');
			

INSERT INTO DISPLAYS (Exhibition_Id, AId_num)
VALUES		(00001, 0001),
			(00001, 0002),
			(00001, 0003),
			(00001, 0004),
			(00001, 0005),
			(00001, 0006),
			(00003, 0007),
			(00003, 0008),
			(00003, 0009),
			(00003, 0010),
			(00002, 0011),
			(00002, 0012),
			(00002, 0013),
			(00002, 0014),
			(00002, 0022),
			(00002, 0024),
			(00004, 0011),
			(00004, 0012),
			(00004, 0013),
			(00004, 0024);			


INSERT INTO PAINTINGS (AId_num, Paint_type, Drawn_on)
VALUES		(0003, 'Oil', 'Canvas'),
			(0004, 'Oil', 'Panel (Wooden)'),
			(0011, 'Oil', 'Canvas'),
			(0012, 'Oil', 'Canvas'),
			(0013, 'Oil', 'Canvas'),
			(0014, 'Oil', 'Silk'),
			(0015, 'Watercolour', 'Paper'),
			(0021, 'Graphite', 'Paper'),
			(0022, 'Oil','Canvas'),
			(0023, 'Watercolour', 'Paper'),
			(0024, 'Oil', 'Canvas');
			
INSERT INTO SCULPTURE_STATUE (AId_num, Material, Height, Weight)
VALUES		(0001, 'Bronze', '101 cm', '141 kg'),
			(0002, 'Terracotta', '48 cm', '100 kg'),
			(0016, 'Marble', '215 cm', '916 kg'),
			(0017, 'Marble', '340 cm', '1000 kg'),
			(0018, 'Limestone', '54 cm', '750 kg'),
			(0019, 'Marble', '48.5 cm', '103 kg'),
			(0020, 'Enamelled Steatite', '29 cm', '0.003947 kg');


INSERT INTO OTHER (AId_num, Other_type)
VALUES		(0005, 'Wooden Furniture'),
			(0006, 'Utensil - Basin'), 
			(0007, 'Ceramic Art'),
			(0008, 'Ceramic Art'),
			(0009, 'Ceramic Art'),
			(0010, 'Ceramic Art');
			

INSERT INTO PERMANENT_COLLECTION (AId_num, Date_acquired, Art_Status, Art_cost)
VALUES		(0001, '2022-01-01', 'On loan', 10000),
			(0002, '2022-01-02', 'On loan', 7500),
			(0003, '2022-01-03', 'On loan', 5500),
			(0004, '2022-01-04', 'On display', 5600),
			(0005, '2022-01-05', 'On display', 1500),
			(0006, '2022-01-06', 'On display', 500),
			(0007, '2022-01-07', 'On loan', 300),
			(0008, '2022-01-08', 'On loan', 350),
			(0009, '2022-01-09', 'On loan', 400),
			(0010, '2022-01-10', 'On display', 200),
			(0011, '2022-01-11', 'On display', 8500),
			(0012, '2022-01-12', 'On display', 8500),
			(0013, '2022-01-13', 'On loan', 8500),
			(0014, '2022-01-14', 'On loan', 7000),
			(0015, '2022-01-15', 'stored', 9000),
			(0022,'2022-01-16','On loan', 8500),
			(0023, '2022-01-17', 'stored', 9100),
			(0024, '2022-01-18', 'On display', 10000);
			

INSERT INTO COLLECTIONS (Coll_Name, Coll_type, Descript, Address, Phone_num, Contact_person)
VALUES		('MASTERPIECES OF THE LOUVRE', 'Museum', 'Recovered art from Germany, returned to France', ' Rue de Rivoli, 75001 Paris, France', '33140205050', 'Laurence de Cars'),
			('QUEENS, KINGS AND EMPERORS', 'Museum', 'Royalty portrayed through artwork', ' Rue de Rivoli, 75001 Paris, France', '33140205050', 'Laurence de Cars');


INSERT INTO BORROWED (AId_num, Date_borrowed, Date_returned, CName)
VALUES		(0016, '2022-01-01', '2023-02-01', 'MASTERPIECES OF THE LOUVRE'),
			(0017, '2022-01-01', '2023-02-01', 'MASTERPIECES OF THE LOUVRE'),
			(0018, '2022-01-01', '2023-02-01', 'MASTERPIECES OF THE LOUVRE'),
			(0019, '2022-02-01', '2023-04-01', 'QUEENS, KINGS AND EMPERORS'),
			(0020, '2022-02-01', '2023-04-01', 'QUEENS, KINGS AND EMPERORS'),
			(0021, '2022-02-01', '2023-04-01', 'QUEENS, KINGS AND EMPERORS');


DROP ROLE IF EXISTS db_admin@localhost, dataentryuser@localhost, enduser@localhost;
CREATE ROLE db_admin@localhost, dataentryuser@localhost, enduser@localhost;
GRANT ALL PRIVILEGES ON ARTMUSEUM.* TO db_admin@localhost;
GRANT Select, INSERT, UPDATE, DELETE ON ARTMUSEUM.* TO dataentryuser@localhost;
GRANT Select ON ARTMUSEUM.* TO enduser@localhost;

DROP USER IF EXISTS boss@localhost;
DROP USER IF EXISTS employee@localhost;
DROP USER IF EXISTS guest@localhost;

CREATE USER boss@localhost IDENTIFIED WITH mysql_native_password BY 'adminpassword';
CREATE USER employee@localhost IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER guest@localhost;

GRANT db_admin@localhost TO boss@localhost;
GRANT dataentryuser@localhost TO employee@localhost;
GRANT enduser@localhost TO guest@localhost;

SET DEFAULT ROLE ALL TO boss@localhost;
SET DEFAULT ROLE ALL TO employee@localhost;
SET DEFAULT ROLE ALL TO guest@localhost;