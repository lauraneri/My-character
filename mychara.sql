-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/02/2021 às 23:56
-- Versão do servidor: 10.4.14-MariaDB
-- Versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mychara`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `capitulo`
--

CREATE TABLE `capitulo` (
  `Historia` int(11) NOT NULL,
  `NumSequencial` int(11) NOT NULL,
  `texto` text NOT NULL,
  `titulo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chat_grupo`
--

CREATE TABLE `chat_grupo` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chat_privado`
--

CREATE TABLE `chat_privado` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comenta/comentario_capitulo`
--

CREATE TABLE `comenta/comentario_capitulo` (
  `id_usuario` int(11) NOT NULL,
  `id_historia` int(11) NOT NULL,
  `numCapitulo` int(11) NOT NULL,
  `DataHora` datetime NOT NULL,
  `conteudo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comenta/comentario_post`
--

CREATE TABLE `comenta/comentario_post` (
  `id_usuario` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `DataHora` datetime NOT NULL,
  `conteudo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comunica-se/ comunicacao`
--

CREATE TABLE `comunica-se/ comunicacao` (
  `id_usuario` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `DataHora_Mensagem` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historia`
--

CREATE TABLE `historia` (
  `id_Historia` int(11) NOT NULL,
  `capa` text NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `sinopse` text NOT NULL,
  `idadeIndicativa` enum('L','10','12','14','16','18') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historia_pertence_genero`
--

CREATE TABLE `historia_pertence_genero` (
  `id_historia` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historia_pertence_personagem`
--

CREATE TABLE `historia_pertence_personagem` (
  `id_historia` int(11) NOT NULL,
  `id_personagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `DataHora` datetime NOT NULL,
  `texto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia mensagem`
--

CREATE TABLE `midia mensagem` (
  `DataHora` datetime NOT NULL,
  `Mensagem` datetime NOT NULL,
  `NumSequencial` int(11) NOT NULL,
  `tipo` enum('texto','foto','citacao','link','dialogo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia post`
--

CREATE TABLE `midia post` (
  `id_Post` int(11) NOT NULL,
  `NumSequencial` int(11) NOT NULL,
  `tipo` enum('texto','foto','citacao','link','dialogo','audio','video') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia post_personagem`
--

CREATE TABLE `midia post_personagem` (
  `id` int(11) NOT NULL,
  `NumSequencial` int(11) NOT NULL,
  `tipo` enum('texto','foto','citacao','link','dialogo','audio','video') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagem`
--

CREATE TABLE `personagem` (
  `id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `FotoPerfil` text NOT NULL,
  `Descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pode_comentar`
--

CREATE TABLE `pode_comentar` (
  `id_usuario` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pode_criarpersonagens`
--

CREATE TABLE `pode_criarpersonagens` (
  `id_usuario` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pode_escreverhistorias`
--

CREATE TABLE `pode_escreverhistorias` (
  `id_usuario` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pode_fazerposts`
--

CREATE TABLE `pode_fazerposts` (
  `id_usuario` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post`
--

CREATE TABLE `post` (
  `id_Post` int(11) NOT NULL,
  `conteudo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post personagem`
--

CREATE TABLE `post personagem` (
  `id` int(11) NOT NULL,
  `conteudo` text NOT NULL,
  `id_personagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `publicacao`
--

CREATE TABLE `publicacao` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `DataHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `segue/seguidor`
--

CREATE TABLE `segue/seguidor` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo de usuario`
--

CREATE TABLE `tipo de usuario` (
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tipo de usuario`
--

INSERT INTO `tipo de usuario` (`Nome`) VALUES
('Comum');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `FotoPerfil` text NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Sobrenome` varchar(50) NOT NULL,
  `NomeUsuario` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `Nome_Tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`Id`, `FotoPerfil`, `Nome`, `Sobrenome`, `NomeUsuario`, `descricao`, `email`, `senha`, `Nome_Tipo`) VALUES
(2, 'C:\\xampp\\htdocs\\MyCharacter_bdd\\we did it.jpg', 'Dora', 'Aventureira', '@Dora_Aventureira', 'Sou Dora e adoro uma aventura', 'Aventureira@gmail.com', 'naopegueraposo', 'Comum'),
(3, 'C:\\Users\\User\\Documents\\random', 'umaru', '-chan', '@himouto', 'sou uma catastrofe', 'onii-chan@gmail.com', 'amomeuirmao', 'Comum');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios_mensagem`
--

CREATE TABLE `usuarios_mensagem` (
  `id_chat` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_curte_historia`
--

CREATE TABLE `usuario_curte_historia` (
  `id_usuario` int(11) NOT NULL,
  `id_historia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_segue_personagem`
--

CREATE TABLE `usuario_segue_personagem` (
  `id_usuario` int(11) NOT NULL,
  `id_personagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `capitulo`
--
ALTER TABLE `capitulo`
  ADD PRIMARY KEY (`NumSequencial`,`Historia`),
  ADD UNIQUE KEY `id_Historia` (`Historia`);

--
-- Índices de tabela `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `chat_grupo`
--
ALTER TABLE `chat_grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_chatGrupo` (`id`);

--
-- Índices de tabela `chat_privado`
--
ALTER TABLE `chat_privado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_chatprivado` (`id`);

--
-- Índices de tabela `comenta/comentario_capitulo`
--
ALTER TABLE `comenta/comentario_capitulo`
  ADD PRIMARY KEY (`id_usuario`,`id_historia`,`numCapitulo`,`DataHora`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `Id_historia, numCapitulo` (`id_historia`,`numCapitulo`);

--
-- Índices de tabela `comenta/comentario_post`
--
ALTER TABLE `comenta/comentario_post`
  ADD PRIMARY KEY (`id_usuario`,`id_post`,`DataHora`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_Post` (`id_post`);

--
-- Índices de tabela `comunica-se/ comunicacao`
--
ALTER TABLE `comunica-se/ comunicacao`
  ADD PRIMARY KEY (`id_usuario`,`id_chat`,`DataHora_Mensagem`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_chat` (`id_chat`) USING BTREE,
  ADD KEY `DataHora_Mensagem` (`DataHora_Mensagem`);

--
-- Índices de tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`id_Historia`),
  ADD KEY `id_Historia` (`id_Historia`);

--
-- Índices de tabela `historia_pertence_genero`
--
ALTER TABLE `historia_pertence_genero`
  ADD PRIMARY KEY (`id_historia`,`id_genero`),
  ADD KEY `id_historia` (`id_historia`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Índices de tabela `historia_pertence_personagem`
--
ALTER TABLE `historia_pertence_personagem`
  ADD PRIMARY KEY (`id_historia`,`id_personagem`),
  ADD KEY `id_historia` (`id_historia`),
  ADD KEY `id_personagem` (`id_personagem`);

--
-- Índices de tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD PRIMARY KEY (`DataHora`);

--
-- Índices de tabela `midia mensagem`
--
ALTER TABLE `midia mensagem`
  ADD PRIMARY KEY (`NumSequencial`,`DataHora`),
  ADD KEY `DataHora_Mensagem` (`Mensagem`);

--
-- Índices de tabela `midia post`
--
ALTER TABLE `midia post`
  ADD PRIMARY KEY (`NumSequencial`,`id_Post`),
  ADD KEY `id_Post` (`id_Post`);

--
-- Índices de tabela `midia post_personagem`
--
ALTER TABLE `midia post_personagem`
  ADD PRIMARY KEY (`NumSequencial`,`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `personagem`
--
ALTER TABLE `personagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pode_comentar`
--
ALTER TABLE `pode_comentar`
  ADD PRIMARY KEY (`id_usuario`,`valor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `pode_criarpersonagens`
--
ALTER TABLE `pode_criarpersonagens`
  ADD PRIMARY KEY (`id_usuario`,`valor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `pode_escreverhistorias`
--
ALTER TABLE `pode_escreverhistorias`
  ADD PRIMARY KEY (`id_usuario`,`valor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `pode_fazerposts`
--
ALTER TABLE `pode_fazerposts`
  ADD PRIMARY KEY (`valor`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_Post`),
  ADD KEY `id_Post` (`id_Post`);

--
-- Índices de tabela `post personagem`
--
ALTER TABLE `post personagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_personagem` (`id_personagem`);

--
-- Índices de tabela `publicacao`
--
ALTER TABLE `publicacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `segue/seguidor`
--
ALTER TABLE `segue/seguidor`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `tipo de usuario`
--
ALTER TABLE `tipo de usuario`
  ADD PRIMARY KEY (`Nome`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Nome_Tipo_fk` (`Nome_Tipo`);

--
-- Índices de tabela `usuarios_mensagem`
--
ALTER TABLE `usuarios_mensagem`
  ADD PRIMARY KEY (`id_chat`,`id_usuario`),
  ADD KEY `id_chat` (`id_chat`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `usuario_curte_historia`
--
ALTER TABLE `usuario_curte_historia`
  ADD PRIMARY KEY (`id_usuario`,`id_historia`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_historia` (`id_historia`);

--
-- Índices de tabela `usuario_segue_personagem`
--
ALTER TABLE `usuario_segue_personagem`
  ADD PRIMARY KEY (`id_usuario`,`id_personagem`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_personagem` (`id_personagem`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `capitulo`
--
ALTER TABLE `capitulo`
  MODIFY `NumSequencial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `midia mensagem`
--
ALTER TABLE `midia mensagem`
  MODIFY `NumSequencial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `midia post`
--
ALTER TABLE `midia post`
  MODIFY `NumSequencial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `midia post_personagem`
--
ALTER TABLE `midia post_personagem`
  MODIFY `NumSequencial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personagem`
--
ALTER TABLE `personagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post personagem`
--
ALTER TABLE `post personagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `publicacao`
--
ALTER TABLE `publicacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `capitulo`
--
ALTER TABLE `capitulo`
  ADD CONSTRAINT `Historia` FOREIGN KEY (`Historia`) REFERENCES `historia` (`id_Historia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `chat_grupo`
--
ALTER TABLE `chat_grupo`
  ADD CONSTRAINT `id_chatGrupo` FOREIGN KEY (`id`) REFERENCES `chat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `chat_privado`
--
ALTER TABLE `chat_privado`
  ADD CONSTRAINT `id_chatPrivado` FOREIGN KEY (`id`) REFERENCES `chat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `comenta/comentario_capitulo`
--
ALTER TABLE `comenta/comentario_capitulo`
  ADD CONSTRAINT `Id_historia, numCapitulo` FOREIGN KEY (`id_historia`,`numCapitulo`) REFERENCES `capitulo` (`Historia`, `NumSequencial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `id_Historia` FOREIGN KEY (`id_Historia`) REFERENCES `publicacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `historia_pertence_genero`
--
ALTER TABLE `historia_pertence_genero`
  ADD CONSTRAINT `id_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `midia mensagem`
--
ALTER TABLE `midia mensagem`
  ADD CONSTRAINT `DataHora_Mensagem` FOREIGN KEY (`Mensagem`) REFERENCES `mensagem` (`DataHora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `midia post_personagem`
--
ALTER TABLE `midia post_personagem`
  ADD CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `post personagem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `id_Post` FOREIGN KEY (`id_Post`) REFERENCES `publicacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `post personagem`
--
ALTER TABLE `post personagem`
  ADD CONSTRAINT `id_personagem` FOREIGN KEY (`id_personagem`) REFERENCES `personagem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `publicacao`
--
ALTER TABLE `publicacao`
  ADD CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`Id`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Nome_Tipo_fk` FOREIGN KEY (`Nome_Tipo`) REFERENCES `tipo de usuario` (`Nome`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `usuarios_mensagem`
--
ALTER TABLE `usuarios_mensagem`
  ADD CONSTRAINT `id_chat` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
