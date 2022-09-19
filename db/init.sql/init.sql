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
VALUES (1, "Game 1 vs 1", "Two players will have to challenge each other trying to replicate the pose of the artwork");
--
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
(1, "\\static\\assets\\id2.jpg", 1, "f", "Giocatore 1 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata."),

(2, "\\static\\assets\\id1.jpg", 1, "f", "Giocatore 2 posizionati davanti alla webcam in modo che siano visibili entrambe le braccia allungate e il corpo dal busto in su. Resta nella stessa posizione durante la partita e repilca poi la posa sopra raffigurata."),

(3, '\\static\\assets\\img0.jpeg', 1, "San Giovanni Battista", "San Giovanni Battista; Leonardo Da Vinci. The young man with his right hand points at the crucifix he is holding and at the sky, inviting the observer to a meditation on the coming of Christ."),

(4, '\\static\\assets\\img1.jpeg', 1, "The Birth of Venus", "The Birth of Venus; Sandro Botticelli. The goddess pose, comes from the classic style of 'Venus pudica' (i.e.  she cover her breasts and womb with her arms) and Anadyomene (i.e. 'emerging' or rising from the sea foam)."),

(5, '\\static\\assets\\img19.jpg', 1, "Christ the Redeemer", "Christ the Redeemer; Paul Landowski, Gheorghe Leonida, Heitor da Silva Costa, Albert Irenée Caquot. Christ the Redeemer of Rio represents Jesus Christ embracing in an ideal gesture the  entire city of Rio de Janeiro with open and outstretched arms."),

(6, '\\static\\assets\\img2.jpeg', 1, "Jeanne Hébuterne", "Jeanne Hébuterne; Modigliani. The frame portraits Jeanne Hébuterne, a woman who had an intense romantic relationship with the artist, she is portrayed sitting with her arms outstretched in a pose of total naturalness."),

(7, '\\static\\assets\\img16.jpeg', 1, "Capuan Venus", "Capuan Venus; Lisippo (restored in 1820 by Augusto Brunelli). Portrayed half-naked and wrapped, starting at the waist, only by a himation, the Venus presents extraordinary plasticity of form and elegance in movement. "),

(8, '\\static\\assets\\img3.jpeg', 1, "Mona Lisa", "Mona Lisa (italian: Gioconda); Leonardo da Vinci. The woman is framed by three quartes, with her bust slightly turned to her right. The hands are crossed in the foreground, and with her arm she leans against a what looks like the armrest of a chair."),

(9, '\\static\\assets\\img14.jpeg', 1, "Statue of Liberty", "Statua della libertà, Gustave Eiffel, Maurice Koechlin. The left arm is bent towards the body so that it can hold up a table. However the right one, exposed, is raised and holds a torch lit to witness freedom and justice."),

(10, '\\static\\assets\\img12.jpeg', 1, "Girl Arranging Her Hair", "Girl Arranging Her Hair; Mary Cassatt. The frame portrays a young girl in petticoats, with her elbow raised and her face slightly facing up, whilst arranging her pigtail."),

(11, '\\static\\assets\\img17.jpeg', 1, "Discobolus", "Discobolus; Mirone. The athlete in his right hand wields the disk and seems caught in the moment when he is about to make a strong rotation before hurling it. The left arm is resting almost vertically on the right knee."),

(12, '\\static\\assets\\img20.jpg', 1, "The Thinker", "The Thinker; Auguste Rodin. The thinker had to portray Dante in front of the gates of Hell, while meditating on his great poem, the statue is naked, as Rodin wanted a heroic figure of Michelangelo style."),

(13, '\\static\\assets\\img5.jpeg', 1, "Lady with an Ermine", "Lady with an Ermine; Leonardo da Vinci. The main character of the portrait poses with her bust turned to the left while her face is facing right. In her arms she hold an ermine which shows a serene but determined expression."),

(14, '\\static\\assets\\img6.jpeg', 1, "Penitent Magdalene", "Penitent Magdalene (Napoli); Tiziano. The pose depicts the saint addressing God directly by looking up to heaven and touching one shoulder with her right hand in a very simple robe."),

(15, '\\static\\assets\\img7.jpeg', 1, "Portrait of Lorenzo the Magnificent", "Portrait of Lorenzo the Magnificent; Giorgio Vasari. Lorenzo's pose mirrors that of Pontormo's portrait by Cosimo the Elder, the bust is rotated towards the viewer and is elongated."),

(16, '\\static\\assets\\img18.jpeg', 1, "Perseus with the Head of Medusa", "Perseus with the Head of Medusa; Benvenuto Cellini. The hero stands in a graceful and elegant pose; he is depicted standing. With his right hand clutches the hilt of his saber and with his left lifts the Medusa's head."),

(17, '\\static\\assets\\img9.jpeg', 1, "Garçon à la Pipe", "Garçon à la Pipe; Pablo Picasso. The protagonist is a young man who has a tobacco pipe in his hands, while looking at the spectator he is resting on the ground with his legs slightly separated, with an ornate wall behind him."),

(18, '\\static\\assets\\img10.jpeg', 1, "Boy Peeling Fruit", "Boy Peeling Fruit (italian: Ragazzo che monda un frutto); Caravaggio. The work represents a young boy intent on peeling an unidentified fruit, he seems to be sitting and has both elbows on the table."),

(19, '\\static\\assets\\img15.jpeg', 1, "Vittoria alata di Brescia", "Vittoria alata di Brescia; Maestro Greco (rielaborated after in the Roman imperial period). The posture is now incomplete due to the loss of some elements; the left foot rested on a helmet, the left arm held a shield."),

(20, '\\static\\assets\\img11.jpeg', 1, "Portrait of Maria Antonietta with a rose", "Portrait of Maria Antonietta with a rose; Élisabeth Vigée Le Brun. The pose depicted is rigid, the queen holds in her hands, in the foreground, a small bouquet of wildflowers, constrained in a light ribbon."),

(21, '\\static\\assets\\img4.jpeg', 1, "Portrait of Agnolo Doni", "Portrait of Agnolo Doni; Raffaello Sanzio. It is considered a prototype of a natural portrait due to Agnolo Doni's casual pose, which, however, does not deprive the image of monumentality.");

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
