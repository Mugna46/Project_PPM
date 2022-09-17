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
(1, "\\static\\assets\\id2.jpeg", 1, "f", "Giocatore 1 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata."),
(2, "\\static\\assets\\id2.jpeg", 1, "f", "Giocatore 2 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata."),
(3, '\\static\\assets\\img0.jpeg', 1, "San Giovanni Battista", "San Giovanni Battista, Leonardo Da Vinci. Il giovane con la mano destra indica la Croce che tiene in mano e il cielo, invitando l'osservatore a una meditazione sulla venuta di Cristo."),
(4, '\\static\\assets\\img1.jpeg', 1, "La Nascita di Venere", "La Nascita di Venere, Sandro Botticelli. La posa della dea, deriva dal modello classico della Venus pudica (cioè che si copre con le braccia il seno e il basso ventre) e Anadiomene (cioè 'emergente' o nascente dalla spuma marina)."),
(5, '\\static\\assets\\img2.jpeg', 1, "Jeanne Hébuterne", "Jeanne Hébuterne, Modigliani. Il quadro è un ritratto di Jeanne Hébuterne, una donna che ebbe un'intensa relazione sentimentale con l'artista, è ritratta seduta con le braccia stese in una posa di totale naturalezza."),
(6, '\\static\\assets\\img3.jpeg', 1, "La Gioconda", "La Gioconda, Leonardo da Vinci. La donna è inquadrata di tre quarti, col busto leggermente girato verso la sua destra. Le mani sono incrociate in primo piano e con le braccia si appoggia a quello che sembra il bracciolo di una sedia."),
(7, '\\static\\assets\\img4.jpeg', 1, "Il Ritratto di Agnolo Doni", "Il Ritratto di Agnolo Doni, Raffaello Sanzio. Viene considerato un prototipo di ritratto naturale per via della posa disinvolta di Agnolo Doni, che non priva però l’immagine di monumentalità."),
(8, '\\static\\assets\\img5.jpeg', 1, "La Dama con l'ermellino", "La Dama con l'ermellino, Leonardo da Vinci. La protagonista del ritratto posa con il busto rivolto a sinistra mentre il viso è orientato a destra. Tra le braccia stringe un ermellino e mostra un'espressione serena ma determinata."),
(9, '\\static\\assets\\img6.jpeg', 1, "La Maddalena penitente", "La Maddalena penitente (Napoli), Tiziano. La posa raffigura la santa che si rivolge direttamente a Dio alzando lo sguardo verso il cielo e toccandosi una spalla con la mano destra con una veste molto semplice."),
(10, '\\static\\assets\\img7.jpeg', 1, "Il Ritratto di Lorenzo il Magnifico", "Il Ritratto di Lorenzo il Magnifico, Giorgio Vasari. La posa di Lorenzo è speculare a quella del ritratto di Cosimo il Vecchio del Pontormo, il busto è ruotato verso lo spettatore ed è allungato."),
(11, '\\static\\assets\\img8.jpeg', 1, "Il Bacchino malato", "Il Bacchino malato, Caravaggio. Bacco cita una posa michelangiolesca: in questo caso, quella della gamba piegata e sollevata o divaricata, che assume il significato di rinascita, ma anche di vittoria e trionfo."),
(12, '\\static\\assets\\img9.jpeg', 1, "Ragazzo con pipa", "Ragazzo con pipa, Pablo Picasso. Il protagonista è un giovane uomo che ha tra le mani una pipa, mentre guarda lo spettatore è appoggiato a terra con le gambe lievemente divaricate, con alle spalle un muro decorato."),
(13, '\\static\\assets\\img10.jpeg', 1, "Ragazzo che monda un frutto", "Ragazzo che monda un frutto, Caravaggio. L'opera rappresenta un giovane ragazzo intento a sbucciare un frutto non ben identificato, sembra essere seduto ed ha entrambi i gomiti sopra la tavola."),
(14, '\\static\\assets\\img11.jpeg', 1, "Ritratto di Maria Antonietta con la rosa", "Ritratto di Maria Antonietta con la rosa, Élisabeth Vigée Le Brun. La posa raffigurata è rigida, la regina ha tra le mani, in primo piano, un piccolo mazzo di fiori di campo, costretto in un nastrino chiaro."),
(15, '\\static\\assets\\img12.jpeg', 1, "Bambina che si sistema i capelli", "Bambina che si sistema i capelli, Mary Cassatt. Il dipinto ritrae una giovane in sottoveste, con il gomito alzato ed il viso leggermente rivolto verso l'alto, mentre si sistema i capelli in una treccia."),
(16, '\\static\\assets\\img13.jpeg', 1, "Autoritratto come Santa Caterina d'Alessandria", "Autoritratto come Santa Caterina d'Alessandria, Artemisia Gentileschi. Il volto della donna non è rivolto verso lo spettatore a differenza degli occhi, le braccia sono quasi incrociate e vicine al corpo.");

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
