# --------------------------------------------------------
# DATABASE VERSION 0.0.4
# --------------------------------------------------------
#
# tinyint   1 byte [-128 to 127 | 0 to 255]
# smallint  2 byte [-32,768 to 32,767 | 0 to 65,535]
# mediumint 3 byte [-8,388,608 to 8,388,607 | 0 to 16,777,215]
# int       4 byte [-2,147,483,648 to 2,147,483,647 | 0 to 4,294,967,295]
# bigint    8 byte [-2(E63) to 2(E63) | 0 to 2(E64)]
#
# numeric     4 byte [-1.175(E38) to 3.402(E38)]
# double    8 byte [-2.225(E308) to 1.797(E308)]
#
# char       n byte [0 to 255] fixed-lenght
# varchar    n byte [0 to 255] variable-lenght
#
# tinytext   n byte [0 to 255]
# text       n byte [0 to 65,535]
# mediumtext n byte [0 to 16,777,215]
# longtext   n byte [0 to 4,294,967,295]
#
--
-- Table structure for table `data`
--

CREATE TABLE data (
  Fulldate timestamp NOT NULL default '2000-01-01 00:00:00',
  StationAlarm smallint NOT NULL default '0',
  Id smallint NOT NULL default '0',
  MeanValue numeric default NULL,
  Code smallint default NULL,
  Readings smallint default NULL,
  Min numeric default NULL,
  MinTime time default '00:00:00',
  Max numeric default NULL,
  MaxTime time default '00:00:00',
  StdDev numeric default NULL,
  PRIMARY KEY  (Fulldate,Id)
);

--
-- Dumping data for table `data`
--


--
-- Table structure for table `parameters`
--

CREATE TABLE parameters (
  Id smallint NOT NULL default '0',
  Active TEXT CHECK(Active IN ('Y','N')) NOT NULL default 'N',
  Name text NOT NULL default '--',
  Unit text NOT NULL default '--',
  Decimals smallint NOT NULL default '1',
  Algorithm TEXT CHECK(Algorithm IN ('Mean','Free')) NOT NULL default 'Mean',
  Channel smallint NOT NULL default '1',
  InputRange TEXT CHECK(InputRange IN('0-10','0-5','0-1','10-10','5-5','1-1')) NOT NULL default '0-10',
  LowerPointValue numeric NOT NULL default '0',
  HigherPointValue numeric NOT NULL default '100',
  Span numeric NOT NULL default '1',
  Offset numeric NOT NULL default '0',
  MinReadings smallint NOT NULL default '0',
  PreAlarm numeric NOT NULL default '9999',
  Alarm numeric NOT NULL default '9999',
  MinVariation numeric NOT NULL default '0',
  MaxVariation numeric NOT NULL default '9999',
  MinValue numeric NOT NULL default '-9999',
  MaxValue numeric NOT NULL default '9999'
);

--
-- Dumping data for table `parameters`
--

INSERT INTO parameters VALUES (1,'Y','Tamb','%',1,'Mean',1,'0-10',0,100,1,0,5,80,90,0,90,0,100);
INSERT INTO parameters VALUES (2,'Y','Tcab','°C',2,'Mean',2,'0-10',-30,60,1,0,0,9999,9999,0,9999,-5,65);
INSERT INTO parameters VALUES (8,'N','--','--',1,'Mean',1,'0-10',0,100,1,0,0,9999,9999,0,9999,-9999,9999);
INSERT INTO parameters VALUES (3,'N','--','--',1,'Mean',1,'0-10',0,100,1,0,0,9999,9999,0,9999,-9999,9999);
INSERT INTO parameters VALUES (4,'N','--','--',1,'Mean',1,'0-10',0,100,1,0,0,9999,9999,0,9999,-9999,9999);
INSERT INTO parameters VALUES (5,'N','--','--',1,'Mean',1,'0-10',0,100,1,0,0,9999,9999,0,9999,-9999,9999);
INSERT INTO parameters VALUES (6,'N','--','--',1,'Mean',1,'0-10',0,100,1,0,0,9999,9999,0,9999,-9999,9999);
INSERT INTO parameters VALUES (7,'N','--','--',1,'Mean',1,'0-10',0,100,1,0,0,9999,9999,0,9999,-9999,9999);

--
-- Table structure for table `rawdata`
--

CREATE TABLE rawdata (
  Fulldate timestamp NOT NULL default '2000-01-01 00:00:00',
  Id smallint NOT NULL default '0',
  RawValue numeric default NULL,
  Code smallint default NULL,
  PRIMARY KEY  (Fulldate,Id)
);

--
-- Dumping data for table `rawdata`
--


--
-- Table structure for table `station`
--

CREATE TABLE station (
  id smallint NOT NULL default '1',
  Name text NOT NULL default 'xxxxx',
  Code text NOT NULL default 'xxxxx',
  AcquisitionInterval smallint NOT NULL default '5',
  IntTime smallint NOT NULL default '60',
  ComPort smallint NOT NULL default '1',
  AdamId smallint NOT NULL default '1',
  FtpExport TEXT CHECK(FtpExport IN ('Y','N')) NOT NULL default 'N',
  FtpExportBzip TEXT CHECK(FtpExportBzip IN ('Y','N')) NOT NULL default 'N',
  SaveRawData TEXT CHECK(SaveRawData IN ('Y','N')) NOT NULL default 'N',
  FtpRawData TEXT CHECK(FtpRawData IN ('Y','N')) NOT NULL default 'N',
  PRIMARY KEY (Code)
);

--
-- Dumping data for table `station`
--

INSERT INTO station VALUES (1,'Test GbDas','gbdas',2,1,1,1,'Y','Y','Y','Y');

