-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 12, 2022 alle 11:46
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
(1, 'Partita 1 vs 1', 'Partita 1 vs 1, 2 giocatori dovranno sfidarsi cercando di replicare la posa dell\'opera d\\\r\nd\'arte');

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
(1, '\\static\\assets\\id1.jpeg', 1, 'posa di prova per identificare il giocatore 1'),
(2, '\\static\\assets\\id2.jpeg', 1, 'posa di prova per identificare il giocatore 2'),
(3, '\\static\\assets\\img0.jpeg', 1, 'San Giovanni Battista è un dipinto a olio su tavola di noce di Leonardo, indossa una pelliccia come erano soliti fare gli eremiti; tale abbigliamento è come se invitasse lo spettatore a spogliarsi degli orpelli per raggiungere la vera spiritualità.'),
(4, '\\static\\assets\\img1.jpeg', 1, 'La Nascita di Venere è un dipinto a tempera su tela di lino di Sandro Botticelli, la composizione raffigura più precisamente l’approdo sull’isola di Cipro della dea dell’amore e della bellezza, nata dalla spuma del mare e sospinta dai venti Zefiro.'),
(5, '\\static\\assets\\img2.jpg', 1, 'Il vecchio chitarrista cieco è un dipinto a olio su tela realizzato dal pittore spagnolo Pablo Picasso appartenente al periodo blu; il chitarrista è affranto ma stringe a sé con determinazione l’imponente chitarra che si oppone alla figura del vecchio.'),
(6, '\\static\\assets\\img3.jpeg', 1, 'La Gioconda, nota anche come Monna Lisa, è un dipinto a olio su tavola di legno di pioppo realizzato da Leonardo da Vinci, il mistero della Gioconda sull’identità della donna ritratta nel dipinto è in realtà un infondato luogo comune.'),
(7, '\\static\\assets\\img4.jpg', 1, 'L\'urlo è il nome assegnato a una serie di famosi dipinti del pittore norvegese Edvard Munch, la forma ovale della bocca è il vero fulcro di tutto il quadro, è proprio da esso che fuoriesce questo grido che si propaga e che agita tutto quanto il quadro.'),
(8, '\\static\\assets\\img5.jpeg', 1, 'La Dama con l\'ermellino è un dipinto a olio su tavola di Leonardo da Vinci, La paternità della Dama con l’ermellino a Leonardo è un evento recente. Fino al Novecento l’opera era attribuita a diversi pittori leonardeschi.'),
(9, '\\static\\assets\\img6.jpg', 1, 'La Maddalena penitente è un dipinto a olio su tavola di Tiziano conservato nella Galleria Palatina di Firenze; Tiziano ci presenta Maria Maddalena che, secondo i vangeli, era una ex prostituta convertita al cristianesimo. '),
(10, '\\static\\assets\\img7.jpg', 1, 'Il Salvator mundi è un dipinto a olio su tavola attribuito, al fine di facilitarne la vendita, a Leonardo da Vinci, in latino significa il Salvatore del mondo. Nell\'iconografia e nell\'arte sta a rappresentare Gesù Salvatore.'),
(11, '\\static\\assets\\img8.jpg', 1, 'Il Bacchino malato è un dipinto a olio su tela, realizzato dal pittore italiano Caravaggio, l\'aggettivo malato viene dal colorito non proprio sano di Bacco. In realtà il viso del dio altro non è che un autoritratto di Michelangelo Merisi.');

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
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `password`, `score`) VALUES
(4, 'aaa@gmail.com', 'overflow3', '$2b$12$9egDM30y5Q8/E1pAuSO6l.wH/zccwFHvyw5kqqf92qZxAtvcERtim', 4),
(5, 'ggg@gmail.com', 'ggg', '$2b$12$/XpbOu.Nq/KBEJP39O9LneT4aBL1kjNFqh9HEy.xXqn39k/3qoqxm', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `video`
--

INSERT INTO `video` (`id`, `path`, `user_id`) VALUES
(1, 'static/videos/bc46ffd5-4f31-44f3-8e5d-d96ae52e1fa8.mp4', 4),
(2, 'static/videos/db318aa5-accd-4db7-922a-873d56b755bf.mp4', 4),
(3, 'static/videos/c981b39a-815f-4d10-ae47-cefed9693578.mp4', 4),
(4, 'static/videos/04f9e160-fc43-4d3a-8933-08fa9acd5e1e.mp4', 4),
(5, 'static/videos/12c3ec06-6521-45dc-97e6-9a3f9a69fc1a.mp4', 4),
(6, 'static/videos/f790266e-da17-49aa-989c-ecf5b50c1938.mp4', 4),
(7, 'static/videos/90f8eabd-eb1a-4ca7-a11c-574bf9f9d26c.mp4', 4),
(8, 'static/videos/68fa68c2-eeee-4e92-a3e3-ec4ccdf4ff99.mp4', 4),
(9, 'static/videos/34c4a1df-dc1f-4ed8-95e5-87e55b03113a.mp4', 4),
(10, 'static/videos/d315c645-75f7-49b6-988a-196c8e52b082.mp4', 4),
(11, 'static/videos/1ad95e51-78d0-4be0-8a5a-436c5825949a.mp4', 4);

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
-- Indici per le tabelle `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`);

--
-- Limiti per la tabella `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
