-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Jun-2023 às 20:55
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoquedupla`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `chave`
--

CREATE TABLE `chave` (
  `id_chave` int(11) NOT NULL,
  `sala` varchar(180) DEFAULT NULL,
  `pessoaRetirada` varchar(180) DEFAULT NULL,
  `dataRetirada` date DEFAULT NULL,
  `estado` varchar(180) DEFAULT NULL,
  `pessoaResponsavel` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucao`
--

CREATE TABLE `devolucao` (
  `id_devolucao` int(11) NOT NULL,
  `dataDev` date DEFAULT NULL,
  `prodDev` varchar(180) DEFAULT NULL,
  `unidadeDev` varchar(180) DEFAULT NULL,
  `qntdDev` int(11) DEFAULT NULL,
  `categoriaDev` varchar(200) DEFAULT NULL,
  `motivoDevo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produ_baixa`
--

CREATE TABLE `produ_baixa` (
  `id_baixa` int(11) NOT NULL,
  `id_prodU` int(11) NOT NULL,
  `materialU` varchar(100) NOT NULL,
  `quantidade_baixa` int(11) NOT NULL,
  `data_baixa` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_retornavel`
--

CREATE TABLE `prod_retornavel` (
  `id_prodR` int(11) NOT NULL,
  `dataEntradaR` date DEFAULT NULL,
  `materialR` varchar(180) DEFAULT NULL,
  `unidadeR` varchar(180) DEFAULT NULL,
  `quantidadeR` int(11) DEFAULT NULL,
  `categoriaR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_unico`
--

CREATE TABLE `prod_unico` (
  `id_prodU` int(11) NOT NULL,
  `dataEntradaU` date DEFAULT NULL,
  `materialU` varchar(180) DEFAULT NULL,
  `unidadeU` varchar(180) DEFAULT NULL,
  `quantidadeU` int(11) DEFAULT NULL,
  `categoriaU` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(180) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `senha` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `chave`
--
ALTER TABLE `chave`
  ADD PRIMARY KEY (`id_chave`);

--
-- Índices para tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD PRIMARY KEY (`id_devolucao`);

--
-- Índices para tabela `produ_baixa`
--
ALTER TABLE `produ_baixa`
  ADD PRIMARY KEY (`id_baixa`),
  ADD KEY `id_prodU` (`id_prodU`);

--
-- Índices para tabela `prod_retornavel`
--
ALTER TABLE `prod_retornavel`
  ADD PRIMARY KEY (`id_prodR`);

--
-- Índices para tabela `prod_unico`
--
ALTER TABLE `prod_unico`
  ADD PRIMARY KEY (`id_prodU`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `chave`
--
ALTER TABLE `chave`
  MODIFY `id_chave` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `devolucao`
--
ALTER TABLE `devolucao`
  MODIFY `id_devolucao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produ_baixa`
--
ALTER TABLE `produ_baixa`
  MODIFY `id_baixa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `prod_retornavel`
--
ALTER TABLE `prod_retornavel`
  MODIFY `id_prodR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `prod_unico`
--
ALTER TABLE `prod_unico`
  MODIFY `id_prodU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produ_baixa`
--
ALTER TABLE `produ_baixa`
  ADD CONSTRAINT `produ_baixa_ibfk_1` FOREIGN KEY (`id_prodU`) REFERENCES `prod_unico` (`id_prodU`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
