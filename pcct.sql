-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 31, 2022 at 03:06 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pcct`
--

-- --------------------------------------------------------

--
-- Table structure for table `Aluno`
--

CREATE TABLE `Aluno` (
  `id_Aluno` int(11) NOT NULL,
  `nome` varchar(32) NOT NULL,
  `matricula` int(11) NOT NULL,
  `rfid` int(8) NOT NULL,
  `numcel` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Aluno`
--

INSERT INTO `Aluno` (`id_Aluno`, `nome`, `matricula`, `rfid`, `numcel`) VALUES
(1, 'DAVI ALMEIDA', 2020330025, 123456, 991215815),
(2, 'FELIPE SANTOS', 2020330026, 1234, 991234567),
(3, 'WALTER CLAUDINO', 0, 12345, 93196070),
(6, 'Pedro Candido Cardoso Neto', 2020330029, 12344, 991215815);

-- --------------------------------------------------------

--
-- Table structure for table `AlunoTurma`
--

CREATE TABLE `AlunoTurma` (
  `id_Turma` int(11) NOT NULL,
  `id_Aluno` int(11) NOT NULL,
  `id_AlunoTurma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `AlunoTurma`
--

INSERT INTO `AlunoTurma` (`id_Turma`, `id_Aluno`, `id_AlunoTurma`) VALUES
(1, 2, 1),
(1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `DiaLetivo`
--

CREATE TABLE `DiaLetivo` (
  `id_DiaLetivo` int(11) NOT NULL,
  `data` date NOT NULL,
  `feriado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `DiaLetivo`
--

INSERT INTO `DiaLetivo` (`id_DiaLetivo`, `data`, `feriado`) VALUES
(1, '2006-03-13', 'FERIADO'),
(2, '2006-03-14', 'NÃO FERIADO'),
(3, '2006-03-18', 'NÃO FERIADO'),
(4, '2006-03-19', 'NÃO FERIADO');

-- --------------------------------------------------------

--
-- Table structure for table `Refeicao`
--

CREATE TABLE `Refeicao` (
  `id_Refeicao` int(11) NOT NULL,
  `fk_Aluno` int(11) NOT NULL,
  `turno` varchar(20) NOT NULL,
  `status` int(10) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Refeicao`
--

INSERT INTO `Refeicao` (`id_Refeicao`, `fk_Aluno`, `turno`, `status`, `data`) VALUES
(1, 1, 'INTEGRAL', 0, '2006-03-17'),
(2, 2, 'MATUTINO', 0, '2006-03-13'),
(3, 1, 'matutino', 0, '2022-07-05'),
(4, 2, 'matutino', 0, '2022-07-05'),
(5, 3, 'matutino', 0, '2022-07-06');

-- --------------------------------------------------------

--
-- Table structure for table `Turma`
--

CREATE TABLE `Turma` (
  `id_Turma` int(11) NOT NULL,
  `curso` varchar(50) NOT NULL,
  `ano` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Turma`
--

INSERT INTO `Turma` (`id_Turma`, `curso`, `ano`) VALUES
(1, 'JOGOS', '3');

-- --------------------------------------------------------

--
-- Table structure for table `TurmaDia`
--

CREATE TABLE `TurmaDia` (
  `id_TurmaDia` int(11) NOT NULL,
  `fk_Turma` int(11) NOT NULL,
  `fk_DiaLetivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TurmaDia`
--

INSERT INTO `TurmaDia` (`id_TurmaDia`, `fk_Turma`, `fk_DiaLetivo`) VALUES
(1, 1, 1),
(2, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Aluno`
--
ALTER TABLE `Aluno`
  ADD PRIMARY KEY (`id_Aluno`);

--
-- Indexes for table `AlunoTurma`
--
ALTER TABLE `AlunoTurma`
  ADD PRIMARY KEY (`id_AlunoTurma`),
  ADD KEY `id_Aluno` (`id_Aluno`),
  ADD KEY `id_Turma` (`id_Turma`);

--
-- Indexes for table `DiaLetivo`
--
ALTER TABLE `DiaLetivo`
  ADD PRIMARY KEY (`id_DiaLetivo`);

--
-- Indexes for table `Refeicao`
--
ALTER TABLE `Refeicao`
  ADD PRIMARY KEY (`id_Refeicao`),
  ADD KEY `fk_Aluno` (`fk_Aluno`);

--
-- Indexes for table `Turma`
--
ALTER TABLE `Turma`
  ADD PRIMARY KEY (`id_Turma`);

--
-- Indexes for table `TurmaDia`
--
ALTER TABLE `TurmaDia`
  ADD PRIMARY KEY (`id_TurmaDia`),
  ADD KEY `fk_Turma` (`fk_Turma`),
  ADD KEY `fk_DiaLetivo` (`fk_DiaLetivo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Aluno`
--
ALTER TABLE `Aluno`
  MODIFY `id_Aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `AlunoTurma`
--
ALTER TABLE `AlunoTurma`
  MODIFY `id_AlunoTurma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `DiaLetivo`
--
ALTER TABLE `DiaLetivo`
  MODIFY `id_DiaLetivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Refeicao`
--
ALTER TABLE `Refeicao`
  MODIFY `id_Refeicao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Turma`
--
ALTER TABLE `Turma`
  MODIFY `id_Turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `TurmaDia`
--
ALTER TABLE `TurmaDia`
  MODIFY `id_TurmaDia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AlunoTurma`
--
ALTER TABLE `AlunoTurma`
  ADD CONSTRAINT `AlunoTurma_ibfk_1` FOREIGN KEY (`id_Aluno`) REFERENCES `Aluno` (`id_Aluno`),
  ADD CONSTRAINT `AlunoTurma_ibfk_2` FOREIGN KEY (`id_Turma`) REFERENCES `Turma` (`id_Turma`);

--
-- Constraints for table `Refeicao`
--
ALTER TABLE `Refeicao`
  ADD CONSTRAINT `Refeicao_ibfk_1` FOREIGN KEY (`fk_Aluno`) REFERENCES `Aluno` (`id_Aluno`);

--
-- Constraints for table `TurmaDia`
--
ALTER TABLE `TurmaDia`
  ADD CONSTRAINT `TurmaDia_ibfk_1` FOREIGN KEY (`fk_Turma`) REFERENCES `Turma` (`id_Turma`),
  ADD CONSTRAINT `TurmaDia_ibfk_2` FOREIGN KEY (`fk_DiaLetivo`) REFERENCES `DiaLetivo` (`id_DiaLetivo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
