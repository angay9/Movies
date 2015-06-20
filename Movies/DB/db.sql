-- --------------------------------------------------------
-- Host:                         .\SQLEXPRESS
-- Server version:               Microsoft SQL Server 2008 R2 (SP2) - 10.50.4000.0
-- Server OS:                    Windows NT 6.2 <X64> (Build 9200: )
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for movies
CREATE DATABASE IF NOT EXISTS "movies";
USE "movies";


-- Dumping structure for table movies.AspNetRoles
CREATE TABLE IF NOT EXISTS "AspNetRoles" (
	"Id" NVARCHAR(128) NOT NULL,
	"Name" NVARCHAR(max) NOT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table movies.AspNetRoles: 0 rows
/*!40000 ALTER TABLE "AspNetRoles" DISABLE KEYS */;
/*!40000 ALTER TABLE "AspNetRoles" ENABLE KEYS */;


-- Dumping structure for table movies.AspNetUserClaims
CREATE TABLE IF NOT EXISTS "AspNetUserClaims" (
	"Id" INT(10,0) NOT NULL,
	"ClaimType" NVARCHAR(max) NULL DEFAULT NULL,
	"ClaimValue" NVARCHAR(max) NULL DEFAULT NULL,
	"User_Id" NVARCHAR(128) NOT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table movies.AspNetUserClaims: 0 rows
/*!40000 ALTER TABLE "AspNetUserClaims" DISABLE KEYS */;
/*!40000 ALTER TABLE "AspNetUserClaims" ENABLE KEYS */;


-- Dumping structure for table movies.AspNetUserLogins
CREATE TABLE IF NOT EXISTS "AspNetUserLogins" (
	"UserId" NVARCHAR(128) NOT NULL,
	"LoginProvider" NVARCHAR(128) NOT NULL,
	"ProviderKey" NVARCHAR(128) NOT NULL,
	PRIMARY KEY ("UserId","LoginProvider","ProviderKey")
);

-- Dumping data for table movies.AspNetUserLogins: 0 rows
/*!40000 ALTER TABLE "AspNetUserLogins" DISABLE KEYS */;
/*!40000 ALTER TABLE "AspNetUserLogins" ENABLE KEYS */;


-- Dumping structure for table movies.AspNetUserRoles
CREATE TABLE IF NOT EXISTS "AspNetUserRoles" (
	"UserId" NVARCHAR(128) NOT NULL,
	"RoleId" NVARCHAR(128) NOT NULL,
	PRIMARY KEY ("UserId","RoleId")
);

-- Dumping data for table movies.AspNetUserRoles: 0 rows
/*!40000 ALTER TABLE "AspNetUserRoles" DISABLE KEYS */;
/*!40000 ALTER TABLE "AspNetUserRoles" ENABLE KEYS */;


-- Dumping structure for table movies.AspNetUsers
CREATE TABLE IF NOT EXISTS "AspNetUsers" (
	"Id" NVARCHAR(128) NOT NULL,
	"UserName" NVARCHAR(max) NULL DEFAULT NULL,
	"PasswordHash" NVARCHAR(max) NULL DEFAULT NULL,
	"SecurityStamp" NVARCHAR(max) NOT NULL,
	"Discriminator" NVARCHAR(128) NOT NULL,
	"Role" INT(10,0) NULL DEFAULT ('0'),
	PRIMARY KEY ("Id")
);

-- Dumping data for table movies.AspNetUsers: 3 rows
/*!40000 ALTER TABLE "AspNetUsers" DISABLE KEYS */;
INSERT INTO "AspNetUsers" ("Id", "UserName", "PasswordHash", "SecurityStamp", "Discriminator", "Role") VALUES
	('31c40b08-9c0a-45a1-a8ed-7b8f0e36f559', 'admin', 'AMTqJ2RniU9f41eGgI49Q/qnBzTBx/3PwBTAw9mZAEJt772lOJ0YOteM0lQgY8UqlQ==', '8651a225-4cac-41ae-a68c-c90067212ba3', 'ApplicationUser', 1),
	('4501a83a-0681-4da5-8057-57acc6f9b4b6', 'user', 'ACHnXmqxtQSW4u6SnhpboRPBkj9PCKRygDMtV8Yi766tYxgL8/DFTMZvBVCEWF34fw==', '70af22b2-5078-47a9-85d5-a4aed1cd0c6a', 'ApplicationUser', 0),
	('aee762c3-6d1d-47f7-a3ca-33edab68fe07', 'user1', 'ALtvidEra/jvBJLBq8bvY0qSZ9aKM6pDlICKbfXDl+rcrl2GsFarMh6y0lwAmB6MJA==', 'eeba97ae-1fe1-48cc-bc40-0b30e5b221c6', 'ApplicationUser', 0);
/*!40000 ALTER TABLE "AspNetUsers" ENABLE KEYS */;


-- Dumping structure for table movies.Feedback
CREATE TABLE IF NOT EXISTS "Feedback" (
	"id" INT(10,0) NOT NULL,
	"UserId" NVARCHAR(128) NULL DEFAULT NULL,
	"MovieId" INT(10,0) NULL DEFAULT NULL,
	"Comment" TEXT(2147483647) NULL DEFAULT NULL,
	"Rating" INT(10,0) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table movies.Feedback: 3 rows
/*!40000 ALTER TABLE "Feedback" DISABLE KEYS */;
INSERT INTO "Feedback" ("id", "UserId", "MovieId", "Comment", "Rating") VALUES
	(3, '4501a83a-0681-4da5-8057-57acc6f9b4b6', 9, 'Great!', 9),
	(4, 'aee762c3-6d1d-47f7-a3ca-33edab68fe07', 5, 'Super', 8),
	(5, '4501a83a-0681-4da5-8057-57acc6f9b4b6', 5, 'Quite good', 5);
/*!40000 ALTER TABLE "Feedback" ENABLE KEYS */;


-- Dumping structure for table movies.Movies
CREATE TABLE IF NOT EXISTS "Movies" (
	"Id" INT(10,0) NOT NULL,
	"Title" VARCHAR(50) NULL DEFAULT NULL,
	"Year" INT(10,0) NULL DEFAULT NULL,
	"Released" DATETIME(3) NULL DEFAULT NULL,
	"Runtime" INT(10,0) NULL DEFAULT NULL,
	"Director" VARCHAR(100) NULL DEFAULT NULL,
	"Writer" VARCHAR(100) NULL DEFAULT NULL,
	"Actors" TEXT(2147483647) NULL DEFAULT NULL,
	"Language" VARCHAR(20) NULL DEFAULT NULL,
	"Country" VARCHAR(100) NULL DEFAULT NULL,
	"Awards" VARCHAR(255) NULL DEFAULT NULL,
	"Poster" VARCHAR(255) NULL DEFAULT NULL,
	"ImdbRating" DECIMAL(2,1) NULL DEFAULT NULL,
	"ImdbVotes" INT(10,0) NULL DEFAULT NULL,
	"ImdbId" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table movies.Movies: 5 rows
/*!40000 ALTER TABLE "Movies" DISABLE KEYS */;
INSERT INTO "Movies" ("Id", "Title", "Year", "Released", "Runtime", "Director", "Writer", "Actors", "Language", "Country", "Awards", "Poster", "ImdbRating", "ImdbVotes", "ImdbId") VALUES
	(3, 'Britney Spears Live from Las Vegas', 2002, '2001-11-18 00:00:00.000', 90, 'Marty Callner', 'N/A', 'Britney Spears, Skip Dorsey, Jon Voight, Slam Hammett', 'English', 'USA', 'N/A', 'http://ia.media-imdb.com/images/M/MV5BMTQwMjE3Mjk1MV5BMl5BanBnXkFtZTcwODExNjEyMQ@@._V1_SX300.jpg', 6.7, 724, 'tt0299591'),
	(5, 'The Adventures of Rocky & Bullwinkle', 2000, '2000-06-30 00:00:00.000', 92, 'Des McAnuff', 'Jay Ward (characters), Kenneth Lonergan', 'Rene Russo, Jason Alexander, Piper Perabo, Randy Quaid', 'English', 'USA, Germany', '2 wins & 4 nominations.', 'http://ia.media-imdb.com/images/M/MV5BMzI0Mzk2NzcwNV5BMl5BanBnXkFtZTcwNjYyNTkxMQ@@._V1_SX300.jpg', 4.1, 15758, 'tt0131704'),
	(9, 'Hercules Reborn', 2014, '2014-08-07 00:00:00.000', 95, 'Nick Lyon', 'Jim Hemphill (screenplay), Jose Montesinos (story)', 'John Hennigan, Christian Oliver, Marcus Shirock, James Duval', 'English', 'USA', 'N/A', 'http://ia.media-imdb.com/images/M/MV5BMTA1MzA3ODQzOTleQTJeQWpwZ15BbWU4MDM0ODgzOTEx._V1_SX300.jpg', 4.2, 4950, 'tt3499424'),
	(10, 'Harry Potter and the Deathly Hallows: Part 2', 2011, '2011-07-15 00:00:00.000', 130, 'David Yates', 'Steve Kloves (screenplay), J.K. Rowling (novel)', 'Ralph Fiennes, Michael Gambon, Alan Rickman, Daniel Radcliffe', 'English', 'USA, UK', 'Nominated for 3 Oscars. Another 48 wins & 76 nominations.', 'http://ia.media-imdb.com/images/M/MV5BMTY2MTk3MDQ1N15BMl5BanBnXkFtZTcwMzI4NzA2NQ@@._V1_SX300.jpg', 8.1, 447901, 'tt1201607'),
	(11, 'The Warrior', 2001, '2001-09-07 00:00:00.000', 158, 'Sung-su Kim', 'Sung-su Kim', 'Woo-sung Jung', 'Mandarin, Korean', 'South Korea, China', '2 wins & 1 nomination.', 'http://ia.media-imdb.com/images/M/MV5BNzMxNDE1ODQ4OV5BMl5BanBnXkFtZTcwMzA3MTIzMQ@@._V1_SX300.jpg', 7.2, 9767, 'tt0275083');
/*!40000 ALTER TABLE "Movies" ENABLE KEYS */;


-- Dumping structure for table movies.Orders
CREATE TABLE IF NOT EXISTS "Orders" (
	"id" INT(10,0) NOT NULL,
	"UserId" NVARCHAR(128) NULL DEFAULT (NULL),
	"MovieId" INT(10,0) NULL DEFAULT (NULL),
	"Returned" BIT NOT NULL DEFAULT ((0)),
	PRIMARY KEY ("id")
);

-- Dumping data for table movies.Orders: 3 rows
/*!40000 ALTER TABLE "Orders" DISABLE KEYS */;
INSERT INTO "Orders" ("id", "UserId", "MovieId", "Returned") VALUES
	(2, '4501a83a-0681-4da5-8057-57acc6f9b4b6', 9, 'True'),
	(3, 'aee762c3-6d1d-47f7-a3ca-33edab68fe07', 5, 'True'),
	(4, '4501a83a-0681-4da5-8057-57acc6f9b4b6', 5, 'True');
/*!40000 ALTER TABLE "Orders" ENABLE KEYS */;


-- Dumping structure for table movies.__MigrationHistory
CREATE TABLE IF NOT EXISTS "__MigrationHistory" (
	"MigrationId" NVARCHAR(150) NOT NULL,
	"ContextKey" NVARCHAR(300) NOT NULL,
	"Model" VARBINARY(max) NOT NULL,
	"ProductVersion" NVARCHAR(32) NOT NULL,
	PRIMARY KEY ("MigrationId","ContextKey")
);

-- Dumping data for table movies.__MigrationHistory: 1 rows
/*!40000 ALTER TABLE "__MigrationHistory" DISABLE KEYS */;
INSERT INTO "__MigrationHistory" ("MigrationId", "ContextKey", "Model", "ProductVersion") VALUES
	('201506132049226_InitialCreate', 'Movies.Models.ApplicationDbContext', ‹      Ý\ÛrÛ6}ïLÿÃ§¤3mç%õHÉ8²ÝzÙ™ÈÉk&!Sd	È•¿­ý¤þBÞI\^tq^<¹Ø]ì,nGþïŸ§¶o=Á˜ ÏìÓÉ‰mAì†Âë™½¡«7ïìïþizå[ë[.÷–Ë±–˜ÌìGJ£sÇ!î# ™ÈC®èÄx¡svrò«szê@¦Âfº,kúeƒ)
`ò…}‡Ø…Ý zÐ'Ùsöf™hµnA I\8³á‚d’
ÚÖ… sb	ý•mŒC
(sñü+K‡x½ŒØàß?GÉ­€O`æúy)nÚ‹“3Þ§lØ+
vÑ?ÖÃ+	úÌÝKz9³o<˜<úú°*Édÿ€ÏµìÑç8Œ`Ì¤áªho[N½ÓlX4«´á.°@Ò˜¥Þ¶`û	â5}d 8{g[×h½üIÅ¯1¤°F4Þ°¯·ß>,Þ;Z›ü¯Æ*û8ÜêÔ)Ã«úEùÈMRÊÛÖG@`æƒÖ$OJúÒ1J —û ûÏâ¦oÏ$±©%cøÄ0zŸ¥0Æ¥ómÙK:ÆBKß€¿Ù©[ð„ÖI<FÓ<~ò’<¢H„Ä³ï©èu|ÄJÒŸH|_†›Øå]µb÷ ^CÚÅ5”þÀ¥ƒ÷o¤ò¡7ôòw{¿ò¸scKènb–½%A´G¬'è#ã¢=‡qÚóAaêê§pp»«‰˜ÖÕRBëjE¬««\Y»§\Jëh! õ³”’¹Ù«~$]ïSDxc±HEìñòšÓª¢E.Ì<é^ªrÏö]®ÝÜ·ùZÌvn|Ø”Úiäê¦TÉ <$ú®È;Œn¢Ï,|(hçþVIRŒÊl*©)³É¨J)¦ƒ¿ÃdÐêegä_º(qO5|—¬+¯°g™Rùf*f¬ÅÆ§ˆoÁØã™ý‹ØV3Åì¨Ú³Õ-œÚÍ±x‡/¡)´.ÜôD`ˆ<‰,~^ý	¾0æ¶€?gÉ¥1@˜ŠcaEÀ7êG£µáj{WØi¾¹„ÄÜ¨Q¾LPÖ5§°Õ][¤¦N†æè,‡·	j$c]š´`ôƒ¦X*$FdŽ™B7öL!W&öå“è¡pi\4%Õ}G¸|ùSèÆ!pùbëee+o‚Ù)–4éqgOhÊŽöMe@ÓEKe)€±xl|ùÀ_Â-BÊ.!­Ÿ”‹0éœ ¬®D›Nc%1Ô¶iì¤,?·ÑjÌ–‚Ô¶Å²,–¥•$kÎÖâaýŽµ	BãµqÑGyÔ„za¼V(tÖ`ÏÄ;F«²½ÒK±Pë°TSô(C‚a¤ÄÅYE­TÕ2A“bÅÐaÍ0^€¤ê!³>Rª9¬Ë,¦èT^Qƒ%™·FˆV¾O/¦œòRÜIoÅóÛsGq}>]€(Bx]¹NÏžXËô.}þfÙý;Hu8.‘ÜcÞ–hƒ5l¼e¦™§×(&ôPð ø‰ÏÜ±.ln²:ÏŠÌ§Š\šN[Ô˜õùX\ÝeÍ¯Yç¾DL®S%i—7·8³ø –\¦ÍC`õŠUÝ:½«¶OŸˆ¦NÃaE*JX6Õ£n”“úXèŸ›æm}ÿôÈ›NCª‡’Åwrq-áTÕ\"âÆ(@0/w‘®–àÞþùnõJ>¸Ã¯/ÆÒÖÜ–8Ê§æšêW¿Umõ7æ÷»U•W{G€:ñÇ—walÕw%{X#ÔÁl±1N¶$t£Î)SèØÍx­ÐˆªJ*;êÊˆB‚²ìùQB ÛçÉ½}g(tèŠnª³.µ–Æ-yUYO@­³võ]«ájÁ‘€b¬õ«üâº3$º­cÇAD~Ž_Õ¢:Ûß}Îê;µ–‚žmakv&ß¹.ó-©Pu[S1lFU=Q!?»®xÐÛ9å!zï)GíWsÏ-&[Øz7E
¨[ðÆV{šm{ÛéìÂ>8±­¼B±Åá3¡0˜pÉò/î#ÃR`0ZABïÃ?!žÙl›þ®A‹ïAQwñücæ©ã'» É&hè¹ÒWØ¾‹Z~XRîhq*÷P-±êË«¤PÊ¤±±wÍ^X9ÐO¯-­?èá×ƒR#þ"`ºbnÛŽx’íhåGÊ¡M»„"»O¼béh¯óFGŽõ¨TÆÃd47¼C©”ƒ¹7!'¾,‚9!1½5?7P}ó;x6`Š£Š“¹~dbá1•°CãëÌ_GS¿:	`ÓmAñÅALuñ#Ç˜â$ot5ŽÑòí›@ýPŽËšÚˆ“éñÙÌöB‚téxA¢[Hå¼.•±½JcÙq­Ò˜œí£3–!Sk1“Ñ›•³—Úé™fìL½m9c±•ÃiDáÔ[–g÷<O%¬¡SÏ}	DÎj†EnTJ¢–ÝøR(›Ãq±ïPì”9<µº©¸4Û	ëR¼âa3eåÿ±ùš u©‚W0tksd!sƒWa>W7<ÊE'(HÇ&Ð‹˜¢p){íBB’ßßfÄ˜«àz7ønC£e]†Áƒ_;ÑãS¾Î~B-­û<½‹’_°ŽÑæ&b]€wøãù^á÷µä¨G¡‚¯%²sjžKÊÏ«×Ï…¦Û*ÊÂW,îaùL¹ÃKðÕ¾µÇ°±é%ë$ÓQ¶g_ü¼`ûþ°²º_™K  , '6.0.0-20911');
/*!40000 ALTER TABLE "__MigrationHistory" ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
