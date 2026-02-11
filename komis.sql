-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 09, 2023 at 02:21 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `komis`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres_klienta`
--

CREATE TABLE `adres_klienta` (
  `Id_adresu` int(11) NOT NULL,
  `Miejscowosc` varchar(30) NOT NULL,
  `Kod_pocztowy` varchar(6) NOT NULL,
  `Ulica` varchar(30) NOT NULL,
  `Nr_domu` varchar(6) NOT NULL,
  `Nr_mieszkania` varchar(6) DEFAULT NULL,
  `PESEL` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `adres_klienta`
--

INSERT INTO `adres_klienta` (`Id_adresu`, `Miejscowosc`, `Kod_pocztowy`, `Ulica`, `Nr_domu`, `Nr_mieszkania`, `PESEL`) VALUES
(1, 'Warszawa', '00-001', 'Powstańców', '12', '4', '10111213141'),
(2, 'Kraków', '30-123', 'Główna', '45', '2B', '11121314151'),
(3, 'Wrocław', '50-456', 'Słoneczna', '7', NULL, '12131415161'),
(4, 'Gdańsk', '80-999', 'Długa', '34', '10', '12345678901'),
(5, 'Poznań', '61-789', 'Ogrodowa', '56', NULL, '13141516171'),
(6, 'Łódź', '90-234', 'Piotrkowska', '78', '5', '14151617181'),
(7, 'Szczecin', '70-111', 'Wolności', '3', NULL, '15161718191'),
(8, 'Warszawa', '20-333', 'Spacerowa', '20', '3A', '23456789012'),
(9, 'Katowice', '40-555', 'Mikołowska', '15', NULL, '34567890123'),
(10, 'Rzeszów', '35-678', 'Krakowska', '1', '9', '45678901234'),
(11, 'Białystok', '15-999', 'Lipowa', '67', NULL, '56789012345'),
(12, 'Bydgoszcz', '85-777', 'Toruńska', '21', '4B', '67890123456'),
(13, 'Opole', '45-111', 'Opolska', '10', NULL, '78901234567'),
(14, 'Kielce', '25-333', 'Warszawska', '8', '2C', '89012345678'),
(15, 'Częstochowa', '42-555', 'Sienkiewicza', '3', NULL, '90123456789'),
(16, 'Łęczyca', '99-100', 'Belwederska', '44', NULL, '22233311143'),
(17, 'Łęczyca', '99-100', 'Belwederska', '11', '22', '22233311555');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesci`
--

CREATE TABLE `czesci` (
  `Id_czesci` int(11) NOT NULL,
  `Nazwa` varchar(40) NOT NULL,
  `Koszt` float NOT NULL,
  `Id_naprawy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `czesci`
--

INSERT INTO `czesci` (`Id_czesci`, `Nazwa`, `Koszt`, `Id_naprawy`) VALUES
(1, 'Filtr oleju', 20, 1),
(2, 'Klocki hamulcowe', 50, 2),
(3, 'Alternator', 120, 3),
(4, 'Rozrusznik', 80, 5),
(5, 'Amortyzatory', 70, 6),
(6, 'Tarcze hamulcowe', 40, 7),
(7, 'Skrzynia biegów', 250, 8),
(8, 'Klimatyzacja', 90, 9),
(9, 'Układ wydechowy', 150, 10),
(10, 'Filtr powietrza', 15, 11),
(11, 'Zawór EGR', 60, 12),
(12, 'Rozrząd', 45, 13),
(13, 'Układ chłodzenia', 30, 14),
(14, 'Żarówka', 25, 15),
(15, 'Akumulator', 500, 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `informacje_transakcja`
--

CREATE TABLE `informacje_transakcja` (
  `Id_informacji` int(11) NOT NULL,
  `Id_transakcji` int(11) NOT NULL,
  `PESEL` varchar(11) NOT NULL,
  `Data_transakcji` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `informacje_transakcja`
--

INSERT INTO `informacje_transakcja` (`Id_informacji`, `Id_transakcji`, `PESEL`, `Data_transakcji`) VALUES
(1, 1, '10111213141', '2023-10-12'),
(2, 2, '11121314151', '2023-10-28'),
(3, 3, '12131415161', '2023-10-28'),
(4, 4, '12345678901', '2023-10-28'),
(5, 5, '13141516171', '2023-10-23'),
(6, 6, '14151617181', '2023-10-28'),
(7, 7, '15161718191', '2023-10-22'),
(8, 8, '23456789012', '2023-10-25'),
(9, 9, '34567890123', '2023-10-28'),
(10, 10, '45678901234', '2023-10-11'),
(11, 11, '56789012345', '2023-10-28'),
(12, 12, '67890123456', '2023-10-28'),
(13, 13, '78901234567', '2023-10-28'),
(14, 14, '89012345678', '2023-10-28'),
(15, 15, '90123456789', '2023-10-20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `PESEL` varchar(11) NOT NULL,
  `Imie` varchar(20) NOT NULL,
  `Nazwisko` varchar(20) NOT NULL,
  `Data_urodzenia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`PESEL`, `Imie`, `Nazwisko`, `Data_urodzenia`) VALUES
('10111213141', 'Karolina', 'Krawczyk', '1995-07-27'),
('11121314151', 'Marcin', 'Michalski', '1986-02-08'),
('12131415161', 'Monika', 'Wojciechowska', '1988-09-03'),
('12345678901', 'Jan', 'Kowalski', '1980-05-15'),
('13141516171', 'Wojciech', 'Nowicki', '1983-12-16'),
('14151617181', 'Izabela', 'Kowalczyk', '1990-04-21'),
('15161718191', 'Grzegorz', 'Pawlak', '1979-10-13'),
('22233311143', 'Piotr', 'Stasiak', '1994-10-20'),
('22233311555', 'Piotr', 'Zawadzki', '1994-12-21'),
('23456789012', 'Anna', 'Nowak', '1985-12-10'),
('34567890123', 'Piotr', 'Wójcik', '1990-08-20'),
('45678901234', 'Katarzyna', 'Lewandowska', '1982-04-05'),
('56789012345', 'Marek', 'Dąbrowski', '1978-11-30'),
('67890123456', 'Magdalena', 'Kaczmarek', '1992-03-25'),
('78901234567', 'Adam', 'Jankowski', '1977-09-18'),
('89012345678', 'Agnieszka', 'Witkowska', '1987-01-12'),
('90123456789', 'Tomasz', 'Zając', '1984-06-22');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiegowi`
--

CREATE TABLE `ksiegowi` (
  `PESEL` varchar(11) NOT NULL,
  `Czy_pracuje_w_innej_firmie` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ksiegowi`
--

INSERT INTO `ksiegowi` (`PESEL`, `Czy_pracuje_w_innej_firmie`) VALUES
('98765432105', 0),
('98765432106', 1),
('98765432107', 0),
('98765432108', 1),
('98765432109', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `marki`
--

CREATE TABLE `marki` (
  `Id_marki` int(11) NOT NULL,
  `Nazwa_marki` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `marki`
--

INSERT INTO `marki` (`Id_marki`, `Nazwa_marki`) VALUES
(6, 'Audi'),
(5, 'BMW'),
(13, 'Chevrolet'),
(14, 'Citroen'),
(2, 'Ford'),
(11, 'Hyundai'),
(10, 'Kia'),
(15, 'Mazda'),
(7, 'Mercedes-Benz'),
(9, 'Nissan'),
(8, 'Opel'),
(16, 'Peugeot'),
(4, 'Renault'),
(12, 'Skoda'),
(3, 'Toyota'),
(1, 'Volkswagen');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `naprawy`
--

CREATE TABLE `naprawy` (
  `Id_naprawy` int(11) NOT NULL,
  `Koszt` float NOT NULL,
  `Opis` text NOT NULL,
  `PESEL_serwisanta` varchar(11) NOT NULL,
  `VIN` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `naprawy`
--

INSERT INTO `naprawy` (`Id_naprawy`, `Koszt`, `Opis`, `PESEL_serwisanta`, `VIN`) VALUES
(1, 500, 'Zamiana oleju i filtrów', '98765432101', '1HGCM82633A123456'),
(2, 1200, 'Naprawa układu hamulcowego', '98765432101', '1HGCP2F4XCA123456'),
(3, 800, 'Wymiana alternatora', '98765432102', '1N4AL2AP7AN123456'),
(4, 700, 'Naprawa silnika', '98765432103', '2C3CDXBG6CH123456'),
(5, 600, 'Wymiana rozrusznika', '98765432104', '2HGCM82633A123456'),
(6, 350, 'Naprawa zawieszenia', '98765432102', 'JHMGE8H27CC123456'),
(7, 900, 'Wymiana tarcz hamulcowych', '98765432101', 'JM1BK32F123456789'),
(8, 750, 'Naprawa skrzyni biegów', '98765432102', 'JTNBB46K473123456'),
(9, 400, 'Wymiana klimatyzacji', '98765432103', 'WAUZZZ8P1CA123456'),
(10, 1100, 'Naprawa układu wydechowego', '98765432104', 'WBAPH77559E123456'),
(11, 420, 'Wymiana filtru powietrza', '98765432104', 'WDBRF61J34A123456'),
(12, 880, 'Naprawa zaworu EGR', '98765432101', 'WDDGF8FB5AR123456'),
(13, 650, 'Wymiana rozrządu', '98765432102', 'WVWZZZ6RZAY123456'),
(14, 480, 'Naprawa układu chłodzenia', '98765432103', '1HGCM82633A123456'),
(15, 720, 'Wymiana świateł', '98765432104', '1HGCP2F4XCA123456');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nr_telefonu`
--

CREATE TABLE `nr_telefonu` (
  `Nr_telefonu` int(11) NOT NULL,
  `PESEL` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `nr_telefonu`
--

INSERT INTO `nr_telefonu` (`Nr_telefonu`, `PESEL`) VALUES
(123456789, '10111213141'),
(234567890, '11121314151'),
(345678901, '12131415161'),
(432109876, '90123456789'),
(456789012, '12345678901'),
(543210987, '89012345678'),
(567890123, '13141516171'),
(600700333, '10111213141'),
(654321098, '78901234567'),
(678901234, '14151617181'),
(765432109, '67890123456'),
(789012345, '15161718191'),
(876543210, '56789012345'),
(890123456, '23456789012'),
(901234567, '34567890123'),
(987654321, '45678901234');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `PESEL` varchar(11) NOT NULL,
  `Imie` varchar(20) NOT NULL,
  `Nazwisko` varchar(20) NOT NULL,
  `Wyksztalcenie` varchar(50) NOT NULL,
  `Data_urodzenia` date NOT NULL,
  `PESEL_przelozonego` varchar(11) DEFAULT NULL,
  `Zarobki` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`PESEL`, `Imie`, `Nazwisko`, `Wyksztalcenie`, `Data_urodzenia`, `PESEL_przelozonego`, `Zarobki`) VALUES
('22233311555', 'Piotr', 'Zawadzki', 'Magister farmacji', '1994-12-21', NULL, 4100),
('98765432100', 'Maria', 'Nowak', 'Inżynier mechaniki', '1990-03-12', '98765432113', 5000),
('98765432101', 'Andrzej', 'Kowalski', 'Inżynier elektroniki', '1985-07-21', NULL, 3500),
('98765432102', 'Monika', 'Wiśniewska', 'Magister mechaniki', '1978-01-01', '98765432104', 4000),
('98765432103', 'Adam', 'Dąbrowski', 'Technik samochodowy', '1992-04-30', NULL, 3700),
('98765432104', 'Katarzyna', 'Lewandowska', 'Inżynier informatyki', '1983-09-14', NULL, 5200),
('98765432105', 'Robert', 'Kaczmarek', 'Magister inżynierii samochodowej', '1991-05-25', NULL, 7000),
('98765432106', 'Agnieszka', 'Zielińska', 'Technik elektryk', '1980-11-09', NULL, 4100),
('98765432107', 'Marek', 'Szymański', 'Inżynier budownictwa', '1993-02-18', NULL, 5100),
('98765432108', 'Ewa', 'Wojcik', 'Inżynier architektury', '1986-06-03', NULL, 3200),
('98765432109', 'Tomasz', 'Nowakowski', 'Inżynier środowiska', '1979-08-28', NULL, 4000),
('98765432110', 'Izabela', 'Kaczmarek', 'Magister zarządzania', '1994-01-05', NULL, 3900),
('98765432111', 'Paweł', 'Witkowski', 'Inżynier mechaniki', '1981-10-01', '98765432105', 3600),
('98765432112', 'Karolina', 'Piotrowska', 'Technik elektroradiologii', '1995-04-17', '98765432105', 3600),
('98765432113', 'Mariusz', 'Jankowski', 'Inżynier automatyki', '1982-12-09', NULL, 5300),
('98765432114', 'Alicja', 'Kowalczyk', 'Magister ekonomii', '1987-03-26', '98765432100', 4500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `VIN` varchar(17) NOT NULL,
  `Rocznik` date NOT NULL,
  `Model` varchar(15) NOT NULL,
  `Kolor` varchar(10) NOT NULL,
  `Przebieg` float NOT NULL,
  `Id_marki` int(11) NOT NULL,
  `Id_silnika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `samochody`
--

INSERT INTO `samochody` (`VIN`, `Rocznik`, `Model`, `Kolor`, `Przebieg`, `Id_marki`, `Id_silnika`) VALUES
('1HGCM82633A123456', '2010-10-20', 'Accord', 'Czarny', 90000, 2, 2),
('1HGCP2F4XCA123456', '2012-12-15', 'Accord', 'Biały', 90000, 2, 12),
('1N4AL2AP7AN123456', '2010-09-20', 'Altima', 'Srebrny', 105000, 9, 10),
('2C3CDXBG6CH123456', '2013-07-02', 'Charger', 'Czarny', 75000, 4, 11),
('2HGCM82633A123456', '2015-03-10', 'Camry', 'Srebrny', 70000, 9, 15),
('2HGFB2E59CH123456', '2012-12-05', 'Civic', 'Niebieski', 65000, 2, 5),
('3D73Y4HL3BG123456', '2011-05-30', 'Ram 3500', 'Czerwony', 115000, 8, 13),
('JHMGE8H27CC123456', '2012-03-01', 'Fit', 'Biały', 80000, 3, 3),
('JM1BK32F123456789', '2015-09-10', 'Mazda3', 'Czerwony', 55000, 15, 4),
('JTNBB46K473123456', '2007-08-05', 'Corolla', 'Biały', 120000, 3, 14),
('WAUZZZ8P1CA123456', '2012-05-15', 'A4', 'Srebrny', 120000, 6, 1),
('WBAPH77559E123456', '2011-04-30', '3 Series', 'Srebrny', 95000, 5, 7),
('WDBRF61J34A123456', '2007-06-12', 'E-Class', 'Czarny', 140000, 7, 9),
('WDDGF8FB5AR123456', '2010-08-15', 'C-Class', 'Czarny', 110000, 7, 6),
('WVWZZZ6RZAY123456', '2009-11-25', 'Golf', 'Czerwony', 85000, 1, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `serwisanci`
--

CREATE TABLE `serwisanci` (
  `PESEL` varchar(11) NOT NULL,
  `Specjalizacja` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `serwisanci`
--

INSERT INTO `serwisanci` (`PESEL`, `Specjalizacja`) VALUES
('98765432100', 'Ogólna'),
('98765432101', 'Elektryk'),
('98765432102', 'Lakiernik'),
('98765432103', 'Elektronik'),
('98765432104', 'Ogólna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `silniki`
--

CREATE TABLE `silniki` (
  `Id_silnika` int(11) NOT NULL,
  `Rodzaj_paliwa` varchar(10) NOT NULL,
  `Pojemnosc` float DEFAULT NULL,
  `Moc` int(11) NOT NULL,
  `Moment_obrotowy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `silniki`
--

INSERT INTO `silniki` (`Id_silnika`, `Rodzaj_paliwa`, `Pojemnosc`, `Moc`, `Moment_obrotowy`) VALUES
(1, 'Diesel', 2, 150, 300),
(2, 'Benzyna', 1.6, 120, 200),
(3, 'Benzyna', 2.4, 180, 250),
(4, 'Diesel', 1.8, 140, 280),
(5, 'Benzyna', 2, 160, 240),
(6, 'Diesel', 2.2, 170, 290),
(7, 'Benzyna', 1.4, 100, 180),
(8, 'Diesel', 2.5, 190, 310),
(9, 'Benzyna', 2.2, 165, 255),
(10, 'Diesel', 1.6, 130, 270),
(11, 'Benzyna', 2, 150, 220),
(12, 'Diesel', 2.8, 200, 320),
(13, 'Benzyna', 1.8, 125, 190),
(14, 'Diesel', 2.2, 160, 280),
(15, 'Benzyna', 2.5, 175, 270);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedawcy`
--

CREATE TABLE `sprzedawcy` (
  `PESEL` varchar(11) NOT NULL,
  `Czy_skupuje` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `sprzedawcy`
--

INSERT INTO `sprzedawcy` (`PESEL`, `Czy_skupuje`) VALUES
('22233311555', 0),
('98765432110', 1),
('98765432111', 1),
('98765432112', 1),
('98765432113', 1),
('98765432114', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transakcje`
--

CREATE TABLE `transakcje` (
  `Id_transakcji` int(11) NOT NULL,
  `PESEL_sprzedawcy` varchar(11) NOT NULL,
  `VIN` varchar(17) NOT NULL,
  `Rodzaj_transakcji` varchar(15) NOT NULL,
  `Koszt` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `transakcje`
--

INSERT INTO `transakcje` (`Id_transakcji`, `PESEL_sprzedawcy`, `VIN`, `Rodzaj_transakcji`, `Koszt`) VALUES
(1, '98765432110', '1HGCM82633A123456', 'Sprzedaż', 15000),
(2, '98765432111', '1HGCP2F4XCA123456', 'Sprzedaż', 17000),
(3, '98765432112', '1N4AL2AP7AN123456', 'Sprzedaż', 13500),
(4, '98765432113', '2C3CDXBG6CH123456', 'Sprzedaż', 19000),
(5, '98765432114', '2HGCM82633A123456', 'Kupno', 8000),
(6, '98765432110', '2HGFB2E59CH123456', 'Kupno', 9500),
(7, '98765432111', '3D73Y4HL3BG123456', 'Sprzedaż', 22000),
(8, '98765432112', 'JHMGE8H27CC123456', 'Kupno', 6000),
(9, '98765432113', 'JM1BK32F123456789', 'Kupno', 7500),
(10, '98765432114', 'JTNBB46K473123456', 'Sprzedaż', 15500),
(11, '98765432110', 'WAUZZZ8P1CA123456', 'Sprzedaż', 18000),
(12, '98765432111', 'WBAPH77559E123456', 'Kupno', 11000),
(13, '98765432112', 'WDBRF61J34A123456', 'Sprzedaż', 13500),
(14, '98765432113', 'WDDGF8FB5AR123456', 'Sprzedaż', 16000),
(15, '98765432114', 'WVWZZZ6RZAY123456', 'Kupno', 8500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyposazenie`
--

CREATE TABLE `wyposazenie` (
  `Id_wyposazenia` int(11) NOT NULL,
  `VIN` varchar(17) NOT NULL,
  `Klimatyzacja` tinyint(1) NOT NULL,
  `Typ_skrzyni_biegow` varchar(15) NOT NULL,
  `Eleky_szyby` tinyint(1) NOT NULL,
  `Rodzaj_tapicerki` varchar(20) NOT NULL,
  `Rodzaj_radia` varchar(15) NOT NULL,
  `Inne` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `wyposazenie`
--

INSERT INTO `wyposazenie` (`Id_wyposazenia`, `VIN`, `Klimatyzacja`, `Typ_skrzyni_biegow`, `Eleky_szyby`, `Rodzaj_tapicerki`, `Rodzaj_radia`, `Inne`) VALUES
(1, '1HGCM82633A123456', 1, 'Automatyczna', 1, 'Skóra', 'CD', 'Podgrzewane fotele'),
(2, '1HGCP2F4XCA123456', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'System nawigacji'),
(3, '1N4AL2AP7AN123456', 1, 'Manualna', 0, 'Materiałowa', 'Brak radia', 'Dodatkowe informacje 3'),
(4, '2C3CDXBG6CH123456', 1, 'Automatyczna', 1, 'Skóra', 'CD', 'Czujniki parkowania'),
(5, '2HGCM82633A123456', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'System nagłośnienia'),
(6, '2HGFB2E59CH123456', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'Podgrzewane lusterka'),
(7, '3D73Y4HL3BG123456', 1, 'Manualna', 0, 'Skóra', 'CD', 'Czujnik deszczu'),
(8, 'JHMGE8H27CC123456', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'System start-stop'),
(9, 'JM1BK32F123456789', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'Podgrzewane siedzenia'),
(10, 'JTNBB46K473123456', 0, 'Automatyczna', 1, 'Skóra', 'CD', 'Kamera cofania'),
(11, 'WAUZZZ8P1CA123456', 1, 'Manualna', 0, 'Skóra', 'CD', 'System nawigacji'),
(12, 'WBAPH77559E123456', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'Podgrzewane fotele'),
(13, 'WDBRF61J34A123456', 1, 'Manualna', 0, 'Skóra', 'CD', 'Czujniki parkowania'),
(14, 'WDDGF8FB5AR123456', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'System nagłośnienia'),
(15, 'WVWZZZ6RZAY123456', 1, 'Automatyczna', 1, 'Materiałowa', 'Radio FM', 'Podgrzewane siedzenia');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres_klienta`
--
ALTER TABLE `adres_klienta`
  ADD PRIMARY KEY (`Id_adresu`),
  ADD UNIQUE KEY `PESEL_2` (`PESEL`),
  ADD KEY `PESEL` (`PESEL`);

--
-- Indeksy dla tabeli `czesci`
--
ALTER TABLE `czesci`
  ADD PRIMARY KEY (`Id_czesci`),
  ADD KEY `Id_naprawy` (`Id_naprawy`);

--
-- Indeksy dla tabeli `informacje_transakcja`
--
ALTER TABLE `informacje_transakcja`
  ADD PRIMARY KEY (`Id_informacji`),
  ADD UNIQUE KEY `Id_transakcji` (`Id_transakcji`),
  ADD KEY `PESEL` (`PESEL`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`PESEL`);

--
-- Indeksy dla tabeli `ksiegowi`
--
ALTER TABLE `ksiegowi`
  ADD PRIMARY KEY (`PESEL`),
  ADD KEY `PESEL` (`PESEL`);

--
-- Indeksy dla tabeli `marki`
--
ALTER TABLE `marki`
  ADD PRIMARY KEY (`Id_marki`),
  ADD UNIQUE KEY `Nazwa_marki` (`Nazwa_marki`);

--
-- Indeksy dla tabeli `naprawy`
--
ALTER TABLE `naprawy`
  ADD PRIMARY KEY (`Id_naprawy`),
  ADD KEY `PESEL_serwisanta` (`PESEL_serwisanta`),
  ADD KEY `VIN` (`VIN`);

--
-- Indeksy dla tabeli `nr_telefonu`
--
ALTER TABLE `nr_telefonu`
  ADD PRIMARY KEY (`Nr_telefonu`,`PESEL`),
  ADD KEY `PESEL` (`PESEL`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`PESEL`),
  ADD KEY `PESEL_PRZELOZONEGO` (`PESEL_przelozonego`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`VIN`),
  ADD UNIQUE KEY `Id_silnika_3` (`Id_silnika`),
  ADD KEY `Id_marki` (`Id_marki`),
  ADD KEY `Id_silnika` (`Id_silnika`),
  ADD KEY `Id_silnika_2` (`Id_silnika`);

--
-- Indeksy dla tabeli `serwisanci`
--
ALTER TABLE `serwisanci`
  ADD PRIMARY KEY (`PESEL`),
  ADD KEY `PESEL` (`PESEL`);

--
-- Indeksy dla tabeli `silniki`
--
ALTER TABLE `silniki`
  ADD PRIMARY KEY (`Id_silnika`);

--
-- Indeksy dla tabeli `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  ADD PRIMARY KEY (`PESEL`),
  ADD KEY `PESEL` (`PESEL`);

--
-- Indeksy dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  ADD PRIMARY KEY (`Id_transakcji`),
  ADD KEY `Id_pracownika` (`PESEL_sprzedawcy`),
  ADD KEY `VIN` (`VIN`),
  ADD KEY `VIN_2` (`VIN`);

--
-- Indeksy dla tabeli `wyposazenie`
--
ALTER TABLE `wyposazenie`
  ADD PRIMARY KEY (`Id_wyposazenia`),
  ADD UNIQUE KEY `VIN_2` (`VIN`),
  ADD KEY `VIN` (`VIN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `czesci`
--
ALTER TABLE `czesci`
  ADD CONSTRAINT `czesci_ibfk_1` FOREIGN KEY (`Id_naprawy`) REFERENCES `naprawy` (`Id_naprawy`);

--
-- Constraints for table `informacje_transakcja`
--
ALTER TABLE `informacje_transakcja`
  ADD CONSTRAINT `informacje_transakcja_ibfk_2` FOREIGN KEY (`Id_transakcji`) REFERENCES `transakcje` (`Id_transakcji`),
  ADD CONSTRAINT `informacje_transakcja_ibfk_3` FOREIGN KEY (`PESEL`) REFERENCES `klienci` (`PESEL`);

--
-- Constraints for table `ksiegowi`
--
ALTER TABLE `ksiegowi`
  ADD CONSTRAINT `ksiegowi_ibfk_1` FOREIGN KEY (`PESEL`) REFERENCES `pracownicy` (`PESEL`);

--
-- Constraints for table `naprawy`
--
ALTER TABLE `naprawy`
  ADD CONSTRAINT `naprawy_ibfk_1` FOREIGN KEY (`VIN`) REFERENCES `samochody` (`VIN`),
  ADD CONSTRAINT `naprawy_ibfk_2` FOREIGN KEY (`PESEL_serwisanta`) REFERENCES `serwisanci` (`PESEL`);

--
-- Constraints for table `nr_telefonu`
--
ALTER TABLE `nr_telefonu`
  ADD CONSTRAINT `nr_telefonu_ibfk_1` FOREIGN KEY (`PESEL`) REFERENCES `klienci` (`PESEL`);

--
-- Constraints for table `samochody`
--
ALTER TABLE `samochody`
  ADD CONSTRAINT `samochody_ibfk_1` FOREIGN KEY (`Id_silnika`) REFERENCES `silniki` (`Id_silnika`),
  ADD CONSTRAINT `samochody_ibfk_2` FOREIGN KEY (`Id_marki`) REFERENCES `marki` (`Id_marki`);

--
-- Constraints for table `serwisanci`
--
ALTER TABLE `serwisanci`
  ADD CONSTRAINT `serwisanci_ibfk_1` FOREIGN KEY (`PESEL`) REFERENCES `pracownicy` (`PESEL`);

--
-- Constraints for table `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  ADD CONSTRAINT `sprzedawcy_ibfk_1` FOREIGN KEY (`PESEL`) REFERENCES `pracownicy` (`PESEL`);

--
-- Constraints for table `transakcje`
--
ALTER TABLE `transakcje`
  ADD CONSTRAINT `transakcje_ibfk_2` FOREIGN KEY (`VIN`) REFERENCES `samochody` (`VIN`),
  ADD CONSTRAINT `transakcje_ibfk_3` FOREIGN KEY (`PESEL_sprzedawcy`) REFERENCES `sprzedawcy` (`PESEL`);

--
-- Constraints for table `wyposazenie`
--
ALTER TABLE `wyposazenie`
  ADD CONSTRAINT `wyposazenie_ibfk_1` FOREIGN KEY (`VIN`) REFERENCES `samochody` (`VIN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
