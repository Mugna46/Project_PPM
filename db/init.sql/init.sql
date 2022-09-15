-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2022 at 02:08 PM
-- Server version: 8.0.30-0ubuntu0.20.04.2
-- PHP Version: 7.4.3
CREATE DATABASE IF NOT EXISTS pose;
USE pose;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pose`
--

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `name`, `description`) 
VALUES (1, "Partita 1 vs 1", "Due giocatori dovranno sfidarsi cercando di replicare la posa dell\'opera\r\nd\'arte.");

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `id` int NOT NULL,
  `path` varchar(255) NOT NULL,
  `level_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`id`, `path`, `level_id`, `name`, `description`) VALUES
(1, "\\static\\assets\\id2.jpeg", 1, " f", "Giocatore 1 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata."),
(2, "\\static\\assets\\id2.jpeg", 1, "f ", "Giocatore 2 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata."),
(3, '\\static\\assets\\img0.jpeg', 1, "San Giovanni Battista", "San Giovanni Battista, Leonardo Da Vinci. Il giovane con la mano destra indica la Croce che tiene in mano e il cielo, invitando l'osservatore a una meditazione sulla venuta di Cristo."),
(4, '\\static\\assets\\img1.jpeg', 1, "La Nascita di Venere", "La Nascita di Venere, Sandro Botticelli. La posa della dea, deriva dal modello classico della Venus pudica (cioè che si copre con le braccia il seno e il basso ventre) e Anadiomene (cioè 'emergente' o nascente dalla spuma marina)."),
(5, '\\static\\assets\\img2.jpeg', 1, "Jeanne Hébuterne", "Facente parte di una collezione privata parigina, il quadro è un ritratto di Jeanne Hébuterne, una donna che ebbe un\'intensa relazione sentimentale con l\'artista, tanto da morire suicida due giorni dopo la morte di Modigliani."),
(6, '\\static\\assets\\img3.jpeg', 1, "La Gioconda", "La Gioconda, nota anche come Monna Lisa, è un dipinto a olio su tavola di legno di pioppo realizzato da Leonardo da Vinci, il mistero della Gioconda sull\’identità della donna ritratta nel dipinto è in realtà un infondato luogo comune."),
(7, '\\static\\assets\\img4.jpeg', 1, " f", "Il Ritratto di Agnolo Doni è un dipinto a olio su tavola, Raffaello dipinge il ritratto agli inizi della sua carriera. Gli studiosi considerano il dipinto un capolavoro per via dell\’impostazione spontanea ma monumentale."),
(8, '\\static\\assets\\img5.jpeg', 1, "La Dama con lermellino", "La Dama con lermellino è un dipinto a olio su tavola di Leonardo da Vinci, La paternità della Dama con l\’ermellino a Leonardo è un evento recente. Fino al Novecento l\’opera era attribuita a diversi pittori leonardeschi."),
(9, '\\static\\assets\\img6.jpeg', 1, "La Maddalena penitente", "La Maddalena penitente è un dipinto a olio su tavola di Tiziano conservato nella Galleria Palatina di Firenze; Tiziano ci presenta Maria Maddalena che, secondo i vangeli, era una ex prostituta convertita al cristianesimo. "),
(10, '\\static\\assets\\img7.jpeg', 1, "Il Salvator mundi", "Il Salvator mundi è un dipinto a olio su tavola attribuito, al fine di facilitarne la vendita, a Leonardo da Vinci, in latino significa il Salvatore del mondo. Nell\'iconografia e nell\'arte sta a rappresentare Gesù Salvatore."),
(11, '\\static\\assets\\img8.jpeg', 1, "Il Bacchino malato", "Il Bacchino malato è un dipinto a olio su tela, realizzato dal pittore italiano Caravaggio, l\'aggettivo malato viene dal colorito non proprio sano di Bacco. In realtà il viso del dio altro non è che un autoritratto di Michelangelo Merisi."),
(12, '\\static\\assets\\img9.jpeg', 1, "f", "Ragazzo con pipa è un dipinto realizzato dal pittore spagnolo Pablo Picasso ed appartiene al cosiddetto periodo rosa dell\'artista. Nonostante le domande effettuate al pittore, egli non ha mai rivelato l\’identità di questo ragazzo."),
(13, '\\static\\assets\\img10.jpeg', 1, "f", "Gli autoritratti di Paul Gauguin sono dipinti di natura espressionista che il pittore francese Paul Gauguin ha realizzato durante la sua carriera artistica e che ripropongono alcuni periodi storici e psicologici della sua vita."),
(14, '\\static\\assets\\img11.jpeg', 1, " f", "Ritratto di Maria Antonietta con la rosa è il ritratto più famoso di Maria Antonietta, regina di Francia, realizzato da Élisabeth Vigée Le Brun. Il dipinto valse alla pittrice molte commissioni, affermandola come iniziatore di un nuovo tipo di ritratto."),
(15, '\\static\\assets\\img12.jpeg', 1, " f", "Bambina che si sistema i capelli è un dipinto realizzato dalla pittrice Mary Cassatt. Alla morte di Degas le sue opere vennero messe in vendita. Poiché tra le altre figurava anche quest\'ultima, l\'opera fu inizialmente attribuita a lui anziché alla Cassat."),
(16, '\\static\\assets\\img13.jpeg', 1, " f", "Si tratta di un dipinto tipicamente caravaggesco quello di Artemisia Gentileschi in cui viene raffigurata Santa Caterina d\'Alessandria a mezzo busto mentre emerge da un fondo buio, si pensa che a posare per il dipinto sia stata una modella vera.");

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `level`
--

ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `picture`
--

ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `picture`
--

ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
