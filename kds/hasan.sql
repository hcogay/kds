-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 05 Oca 2022, 17:02:37
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hasan`
--

DELIMITER $$
--
-- Yordamlar
--
DROP PROCEDURE IF EXISTS `kutu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `kutu` (IN `sayi` INT(255))  NO SQL
SELECT cop_kutusu.cop_kutusu ,round((SUM(cop_kutusu.kapasite_id) /12),2) AS cop_kutusu_orani 
FROM cop_kutusu
WHERE cop_kutusu.cop_kutusu= sayi$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `araba_kullanici`
--

DROP TABLE IF EXISTS `araba_kullanici`;
CREATE TABLE IF NOT EXISTS `araba_kullanici` (
  `araba_id` int(4) NOT NULL,
  `Kullanici_yetki_id` int(8) NOT NULL,
  KEY `araba_id` (`araba_id`),
  KEY `Kullanici_yetki_id` (`Kullanici_yetki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `araba_kullanici`
--

INSERT INTO `araba_kullanici` (`araba_id`, `Kullanici_yetki_id`) VALUES
(1, 4),
(2, 2),
(3, 3),
(4, 5),
(5, 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `araba_tip`
--

DROP TABLE IF EXISTS `araba_tip`;
CREATE TABLE IF NOT EXISTS `araba_tip` (
  `arac_tip_id` int(2) NOT NULL,
  `arac_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`arac_tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `araba_tip`
--

INSERT INTO `araba_tip` (`arac_tip_id`, `arac_ad`) VALUES
(1, 'Ön Yükleme'),
(2, 'Arka Yükleme'),
(3, 'Yan Yükleme'),
(4, 'Havalı Yükleme'),
(5, 'Kepçe Yükleme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cop_arabasi`
--

DROP TABLE IF EXISTS `cop_arabasi`;
CREATE TABLE IF NOT EXISTS `cop_arabasi` (
  `araba_id` int(4) NOT NULL,
  `mahalle_id` int(2) NOT NULL,
  `arac_tip_id` int(2) NOT NULL,
  PRIMARY KEY (`araba_id`),
  KEY `mahalle_id` (`mahalle_id`),
  KEY `arac_tip` (`arac_tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cop_arabasi`
--

INSERT INTO `cop_arabasi` (`araba_id`, `mahalle_id`, `arac_tip_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 3),
(4, 5, 4),
(5, 31, 5),
(6, 7, 2);

--
-- Tetikleyiciler `cop_arabasi`
--
DROP TRIGGER IF EXISTS `eski_araba_bilgileri`;
DELIMITER $$
CREATE TRIGGER `eski_araba_bilgileri` AFTER DELETE ON `cop_arabasi` FOR EACH ROW INSERT INTO eski_arac_bilgileri
 VALUES(old.araba_id,old.mahalle_id,old.arac_tip_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cop_kutusu`
--

DROP TABLE IF EXISTS `cop_kutusu`;
CREATE TABLE IF NOT EXISTS `cop_kutusu` (
  `cop_kutusu_id` int(8) NOT NULL AUTO_INCREMENT,
  `cop_kutusu` int(255) NOT NULL,
  `kapasite_id` int(2) NOT NULL,
  `mahalle_id` int(2) NOT NULL,
  `tarih` date DEFAULT NULL,
  PRIMARY KEY (`cop_kutusu_id`),
  KEY `kapasite_id` (`kapasite_id`),
  KEY `mahalle_id` (`mahalle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cop_kutusu`
--

INSERT INTO `cop_kutusu` (`cop_kutusu_id`, `cop_kutusu`, `kapasite_id`, `mahalle_id`, `tarih`) VALUES
(1, 1, 1, 1, '2022-01-04'),
(2, 1, 2, 1, '2022-01-04'),
(3, 1, 3, 1, '2022-02-04'),
(4, 1, 1, 1, '2022-03-04'),
(5, 1, 3, 1, '2022-04-04'),
(6, 1, 1, 1, '2022-05-05'),
(7, 1, 2, 1, '2022-06-04'),
(8, 1, 3, 1, '2022-07-04'),
(9, 1, 4, 1, '2022-08-04'),
(10, 1, 1, 1, '2022-08-04'),
(11, 1, 2, 1, '2022-09-05'),
(12, 1, 1, 1, '2022-10-04'),
(13, 2, 1, 2, '2022-01-04'),
(14, 2, 2, 2, '2022-02-04'),
(15, 2, 3, 2, '2022-03-04'),
(16, 2, 3, 2, '2022-04-04'),
(17, 2, 3, 2, '2022-05-05'),
(18, 2, 4, 2, '2022-06-04'),
(19, 2, 3, 2, '2022-07-04'),
(20, 2, 4, 2, '2022-08-04'),
(21, 2, 3, 2, '2022-09-05'),
(22, 2, 2, 2, '2022-10-04'),
(23, 2, 1, 2, '2022-11-04'),
(24, 2, 1, 2, '2022-12-05'),
(25, 3, 2, 3, '2022-01-04'),
(26, 3, 2, 3, '2022-02-04'),
(27, 3, 1, 3, '2022-03-04'),
(28, 3, 3, 3, '2022-04-04'),
(29, 3, 4, 3, '2022-05-05'),
(30, 3, 1, 3, '2022-06-04'),
(31, 3, 1, 3, '2022-07-04'),
(32, 3, 2, 3, '2022-08-04'),
(33, 3, 1, 3, '2022-09-04'),
(34, 3, 2, 3, '2022-10-05'),
(35, 3, 2, 3, '2022-11-04'),
(36, 3, 4, 3, '2022-12-04'),
(37, 4, 1, 5, '2022-01-04'),
(38, 4, 1, 5, '2022-02-04'),
(39, 4, 1, 5, '2022-03-04'),
(40, 4, 1, 5, '2022-04-04'),
(41, 4, 1, 5, '2022-05-05'),
(42, 4, 2, 5, '2022-06-04'),
(43, 4, 3, 5, '2022-07-04'),
(44, 4, 2, 5, '2022-08-04'),
(45, 4, 3, 5, '2022-09-04'),
(46, 4, 2, 5, '2022-10-05'),
(47, 4, 2, 5, '2022-11-04'),
(48, 4, 4, 5, '2022-12-04'),
(49, 5, 1, 7, '2022-01-04'),
(50, 5, 4, 7, '2022-02-04'),
(51, 5, 1, 7, '2022-03-04'),
(52, 5, 2, 7, '2022-04-04'),
(53, 5, 1, 7, '2022-05-05'),
(54, 5, 2, 7, '2022-06-04'),
(55, 5, 4, 7, '2022-07-04'),
(56, 5, 3, 7, '2022-08-04'),
(57, 5, 2, 7, '2022-09-04'),
(58, 5, 4, 7, '2022-10-05'),
(59, 5, 1, 7, '2022-11-04'),
(60, 5, 1, 7, '2022-12-04'),
(61, 6, 4, 31, '2022-01-04'),
(62, 6, 1, 31, '2022-02-04'),
(63, 6, 2, 31, '2022-03-04'),
(64, 6, 4, 31, '2022-04-04'),
(65, 6, 3, 31, '2022-05-05'),
(66, 6, 1, 31, '2022-06-04'),
(67, 6, 2, 31, '2022-07-04'),
(68, 6, 2, 31, '2022-08-04'),
(69, 6, 1, 31, '2022-09-04'),
(70, 6, 3, 31, '2022-10-05'),
(71, 6, 4, 31, '2022-11-04'),
(72, 6, 1, 31, '2022-12-04'),
(73, 1, 2, 1, '2022-01-04'),
(74, 1, 3, 1, '2022-02-04'),
(75, 1, 3, 1, '2022-11-04'),
(76, 1, 1, 1, '2022-02-04'),
(77, 1, 1, 1, NULL),
(78, 2, 2, 2, NULL),
(79, 2, 3, 2, '2022-03-04'),
(80, 4, 2, 5, '2022-01-04'),
(81, 5, 2, 1, '2022-02-04'),
(82, 3, 3, 3, '2022-03-04'),
(83, 2, 2, 2, '2022-04-04'),
(84, 1, 1, 1, '2022-05-05'),
(85, 4, 2, 5, '2022-06-04'),
(86, 4, 1, 5, '2022-07-04'),
(87, 4, 4, 5, '2022-08-04'),
(88, 3, 2, 3, '2022-09-04'),
(89, 1, 2, 1, '2022-10-05'),
(90, 4, 1, 5, '2022-10-04'),
(91, 1, 2, 1, '2022-11-04'),
(92, 1, 3, 1, '2022-11-04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `eski_arac_bilgileri`
--

DROP TABLE IF EXISTS `eski_arac_bilgileri`;
CREATE TABLE IF NOT EXISTS `eski_arac_bilgileri` (
  `araba_İd` int(4) NOT NULL,
  `mahalle_id` int(2) NOT NULL,
  `arac_tip_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `eski_arac_bilgileri`
--

INSERT INTO `eski_arac_bilgileri` (`araba_İd`, `mahalle_id`, `arac_tip_id`) VALUES
(6, 7, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kapasite`
--

DROP TABLE IF EXISTS `kapasite`;
CREATE TABLE IF NOT EXISTS `kapasite` (
  `kapasite_id` int(2) NOT NULL,
  `kapasite` int(255) NOT NULL COMMENT '%',
  PRIMARY KEY (`kapasite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kapasite`
--

INSERT INTO `kapasite` (`kapasite_id`, `kapasite`) VALUES
(1, 25),
(2, 50),
(3, 75),
(4, 100);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
CREATE TABLE IF NOT EXISTS `kullanicilar` (
  `Kullanici_yetki_id` int(8) NOT NULL,
  `Yetki_id` int(255) NOT NULL,
  `Kullanici_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `eposta` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Kullanici_yetki_id`),
  KEY `Yetki_id` (`Yetki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`Kullanici_yetki_id`, `Yetki_id`, `Kullanici_adi`, `eposta`, `sifre`) VALUES
(1, 1, 'Hasan Çoğay', 'hasan@gmail.com', '123'),
(2, 2, 'Mehmet Üner', 'mehmet@gmail.com', '1234'),
(3, 2, 'Bedirhan Çelikdoğan', 'bedirhan@gmail.com', '123'),
(4, 2, 'Gürkan İyisabancı', 'gurkan@gmail.com', '123'),
(5, 2, 'Şinasi Engin Işlar', 'engin@gmail.com', '123'),
(6, 2, 'Baran Ersoy', 'baran@gmail.com', '123'),
(7, 2, 'Yavuz Yalçın', 'yavuz@gmail.com', '123'),
(8, 2, 'Can Cam', 'can@gmail.com', '123');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mahalle`
--

DROP TABLE IF EXISTS `mahalle`;
CREATE TABLE IF NOT EXISTS `mahalle` (
  `mahalle_id` int(2) NOT NULL,
  `mahalle_ad` varchar(16) COLLATE utf8_turkish_ci DEFAULT NULL,
  `enlem` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `boylam` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`mahalle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mahalle`
--

INSERT INTO `mahalle` (`mahalle_id`, `mahalle_ad`, `enlem`, `boylam`) VALUES
(1, 'ADATEPE', '38,38578014', '27,17959129'),
(2, 'AKINCILAR', '38,38609388', '27,14484293'),
(3, 'ATATÜRK', '38,38023395', '27,17862622'),
(4, 'MURATHAN', '38,40271455', '27,19867328'),
(5, 'BARIŞ', '38,39425505', '27,16040546'),
(6, 'BELENBAŞI', '38,3102147', '27,28116881'),
(7, 'BUCA KOOP', '38,36902396', '27,18878949'),
(8, 'CUMHURİYET', '38,39395562', '27,19395697'),
(9, 'ÇAĞDAŞ', '38,39765569', '27,19140997'),
(10, 'ÇALDIRAN', '38,40220315', '27,14934822'),
(11, 'ÇAMLIK', '38,40214391', '27,15679939'),
(12, 'ÇAMLIKULE', '38,37465514', '27,16872534'),
(13, 'ÇAMLIPINAR', '38,36945812', '27,16436733'),
(14, 'DİCLE', '38,40065407', '27,16181908'),
(15, 'DOĞANCILAR', '38,30137266', '27,34156503'),
(16, 'DUMLUPINAR', '38,38499594', '27,17341635'),
(17, 'EFELER', '38,38665563', '27,15485443'),
(18, 'FIRAT', '38,37657329', '27,14713959'),
(19, 'GAZİLER', '38,39281178', '27,18289934'),
(20, 'GÖKSU', '38,36605256', '27,14757401'),
(21, 'GÜVEN', '38,39263472', '27,15146548'),
(22, 'HÜRRİYET', '38,3968578', '27,14515034'),
(23, 'İNKILAP', '38,39205452', '27,14749506'),
(24, 'İNÖNÜ', '38,36015502', '27,14638046'),
(25, 'İZKENT', '38,39900626', '27,18945951'),
(26, 'KARACAAĞAÇ', '38,28768432', '27,28284425'),
(27, 'KARANFİL', '38,38997592', '27,18686421'),
(28, 'KAYNAKLAR MERKEZ', '38,36388756', '27,28297493'),
(29, 'KIRKLAR', '38,31835325', '27,31806031'),
(30, 'KOZAĞAÇ', '38,38191931', '27,16899536'),
(31, 'KURUÇEŞME', '38,36977', '27,19283014'),
(32, 'LALELİ', '38,39864794', '27,15368636'),
(33, 'MENDERES', '38,39257053', '27,17024076'),
(34, 'MURATHAN', '38,39996595', '27,19431794'),
(35, 'MUSTAFA KEMAL', '38,36227429', '27,14973983'),
(36, 'SEYHAN', '38,37907727', '27,1434643'),
(37, 'ŞİRİNKAPI', '38,39653844', '27,18000126'),
(38, 'UFUK', '38,40318946', '27,16592347'),
(39, 'VALİ RAHMİ BEY', '38,3892942', '27,1647347'),
(40, 'YAYLACIK', '38,38911824', '27,17662081'),
(41, 'YENİGÜN', '38,37661868', '27,16321965'),
(42, 'YEŞİLBAĞLAR', '38,37061521', '27,14815434'),
(43, 'YILDIZ', '38,37436002', '27,17851484'),
(44, 'YILDIZLAR', '38,31635967', '27,23433095'),
(45, 'YİĞİTLER', '38,39432228', '27,15609737'),
(46, 'ZAFER', '38,35388448', '27,22773879'),
(47, '29.Eki', '38,36480502', '27,27171204');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetki`
--

DROP TABLE IF EXISTS `yetki`;
CREATE TABLE IF NOT EXISTS `yetki` (
  `Yetki_id` int(255) NOT NULL,
  `Yetki` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`Yetki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yetki`
--

INSERT INTO `yetki` (`Yetki_id`, `Yetki`) VALUES
(1, 'Yönetici'),
(2, 'Çalışan');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `araba_kullanici`
--
ALTER TABLE `araba_kullanici`
  ADD CONSTRAINT `araba_kisiti` FOREIGN KEY (`araba_id`) REFERENCES `cop_arabasi` (`araba_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kullanici_kisiti` FOREIGN KEY (`Kullanici_yetki_id`) REFERENCES `kullanicilar` (`Kullanici_yetki_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `cop_arabasi`
--
ALTER TABLE `cop_arabasi`
  ADD CONSTRAINT `arac_kisit` FOREIGN KEY (`arac_tip_id`) REFERENCES `araba_tip` (`arac_tip_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mahalle` FOREIGN KEY (`mahalle_id`) REFERENCES `mahalle` (`mahalle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `cop_kutusu`
--
ALTER TABLE `cop_kutusu`
  ADD CONSTRAINT `kapasite_kisiti` FOREIGN KEY (`kapasite_id`) REFERENCES `kapasite` (`kapasite_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mahalle_kisiti` FOREIGN KEY (`mahalle_id`) REFERENCES `mahalle` (`mahalle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD CONSTRAINT `kullanicilar_ibfk_1` FOREIGN KEY (`Yetki_id`) REFERENCES `yetki` (`Yetki_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
