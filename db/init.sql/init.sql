-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 13, 2022 alle 11:24
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

CREATE DATABASE IF NOT EXISTS pose;
USE pose;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pose_app`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `level`
--

INSERT INTO `level` (`id`, `name`, `description`) VALUES
(1, 'Partita 1 vs 1', '\"Due giocatori dovranno sfidarsi cercando di replicare la posa dell\'opera\r\nd\'arte.\"');

-- --------------------------------------------------------

--
-- Struttura della tabella `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `picture`
--

INSERT INTO `picture` (`id`, `path`, `level_id`, `description`) VALUES
(1, '\\static\\assets\\id2.jpeg', 1, 'Giocatore 1 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata.'),
(2, '\\static\\assets\\id2.jpeg', 1, 'Giocatore 2 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata.'),
(3, '\\static\\assets\\img0.jpeg', 1, 'San Giovanni Battista è un dipinto a olio su tavola di noce di Leonardo, indossa una pelliccia come erano soliti fare gli eremiti; tale abbigliamento è come se invitasse lo spettatore a spogliarsi degli orpelli per raggiungere la vera spiritualità.'),
(4, '\\static\\assets\\img1.jpeg', 1, 'La Nascita di Venere è un dipinto a tempera su tela di lino di Sandro Botticelli, la composizione raffigura più precisamente l’approdo sull’isola di Cipro della dea dell’amore e della bellezza, nata dalla spuma del mare e sospinta dai venti Zefiro.'),
(5, '\\static\\assets\\img2.jpeg', 1, 'Facente parte di una collezione privata parigina, il quadro è un ritratto di Jeanne Hébuterne, una donna che ebbe un\'intensa relazione sentimentale con l\'artista, tanto da morire suicida due giorni dopo la morte di Modigliani.'),
(6, '\\static\\assets\\img3.jpeg', 1, 'La Gioconda, nota anche come Monna Lisa, è un dipinto a olio su tavola di legno di pioppo realizzato da Leonardo da Vinci, il mistero della Gioconda sull’identità della donna ritratta nel dipinto è in realtà un infondato luogo comune.'),
(7, '\\static\\assets\\img4.jpeg', 1, 'Il Ritratto di Agnolo Doni è un dipinto a olio su tavola, Raffaello dipinge il ritratto agli inizi della sua carriera. Gli studiosi considerano il dipinto un capolavoro per via dell’impostazione spontanea ma monumentale.'),
(8, '\\static\\assets\\img5.jpeg', 1, 'La Dama con l\'ermellino è un dipinto a olio su tavola di Leonardo da Vinci, La paternità della Dama con l’ermellino a Leonardo è un evento recente. Fino al Novecento l’opera era attribuita a diversi pittori leonardeschi.'),
(9, '\\static\\assets\\img6.jpeg', 1, 'La Maddalena penitente è un dipinto a olio su tavola di Tiziano conservato nella Galleria Palatina di Firenze; Tiziano ci presenta Maria Maddalena che, secondo i vangeli, era una ex prostituta convertita al cristianesimo. '),
(10, '\\static\\assets\\img7.jpeg', 1, 'Il Salvator mundi è un dipinto a olio su tavola attribuito, al fine di facilitarne la vendita, a Leonardo da Vinci, in latino significa il Salvatore del mondo. Nell\'iconografia e nell\'arte sta a rappresentare Gesù Salvatore.'),
(11, '\\static\\assets\\img8.jpeg', 1, 'Il Bacchino malato è un dipinto a olio su tela, realizzato dal pittore italiano Caravaggio, l\'aggettivo malato viene dal colorito non proprio sano di Bacco. In realtà il viso del dio altro non è che un autoritratto di Michelangelo Merisi.'),
(12, '\\static\\assets\\img9.jpeg', 1, 'Ragazzo con pipa è un dipinto realizzato dal pittore spagnolo Pablo Picasso ed appartiene al cosiddetto periodo rosa dell\'artista. Nonostante le domande effettuate al pittore, egli non ha mai rivelato l’identità di questo ragazzo.'),
(13, '\\static\\assets\\img10.jpeg', 1, 'Gli autoritratti di Paul Gauguin sono dipinti di natura espressionista che il pittore francese Paul Gauguin ha realizzato durante la sua carriera artistica e che ripropongono alcuni periodi storici e psicologici della sua vita.'),
(14, '\\static\\assets\\img11.jpeg', 1, 'Ritratto di Maria Antonietta con la rosa è il ritratto più famoso di Maria Antonietta, regina di Francia, realizzato da Élisabeth Vigée Le Brun. Il dipinto valse alla pittrice molte commissioni, affermandola come iniziatore di un nuovo tipo di ritratto.'),
(15, '\\static\\assets\\img12.jpeg', 1, 'Bambina che si sistema i capelli è un dipinto realizzato dalla pittrice Mary Cassatt. Alla morte di Degas le sue opere vennero messe in vendita. Poiché tra le altre figurava anche quest\'ultima, l\'opera fu inizialmente attribuita a lui anziché alla Cassat.'),
(16, '\\static\\assets\\img13.jpeg', 1, 'Si tratta di un dipinto tipicamente caravaggesco quello di Artemisia Gentileschi in cui viene raffigurata Santa Caterina d\'Alessandria a mezzo busto mentre emerge da un fondo buio, si pensa che a posare per il dipinto sia stata una modella vera.');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
