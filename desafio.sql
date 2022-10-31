-- Criando o banco de dados com MySql Workbench
DROP DATABASE `oficina`;
CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`));


-- -----------------------------------------------------
-- Table `oficina`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `montadora` VARCHAR(45) NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `idCliente`),
  CONSTRAINT `fk_Veiculo_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `oficina`.`Cliente` (`idCliente`));


-- -----------------------------------------------------
-- Table `oficina`.`Ordem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Ordem` (
  `idOrdem` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `data_emissao` DATE NOT NULL,
  `valor` FLOAT NOT NULL,
  `numero` INT NOT NULL,
  `data_conclusao` DATE NULL,
  PRIMARY KEY (`idOrdem`, `idCliente`),
  CONSTRAINT `fk_Ordem_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `oficina`.`Cliente` (`idCliente`));


-- -----------------------------------------------------
-- Table `oficina`.`Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMecanico`));


-- -----------------------------------------------------
-- Table `oficina`.`Ordem por Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`ordem_por_mecanico` (
  `idOrdem` INT NOT NULL,
  `idMecanico` INT NOT NULL,
  PRIMARY KEY (`idOrdem`, `idMecanico`),
  CONSTRAINT `fk_Ordem_has_Mecanico_Ordem`
    FOREIGN KEY (`idOrdem`)
    REFERENCES `oficina`.`Ordem` (`idOrdem`),
  CONSTRAINT `fk_Ordem_has_Mecanico_Mecanico`
    FOREIGN KEY (`idMecanico`)
    REFERENCES `oficina`.`Mecanico` (`idMecanico`));


-- -----------------------------------------------------
-- Table `oficina`.`Veiculo por Ordem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`veiculo_por_ordem` (
  `idVeiculo` INT NOT NULL,
  `idOrdem` INT NOT NULL,
  PRIMARY KEY (`idOrdem`, `idVeiculo`),
  CONSTRAINT `fk_Veiculo_has_Ordem_Veiculo`
    FOREIGN KEY (`idVeiculo`)
    REFERENCES `oficina`.`Veiculo` (`idVeiculo`),
  CONSTRAINT `fk_Veiculo_has_Ordem_Ordem`
    FOREIGN KEY (`idOrdem`)
    REFERENCES `oficina`.`Ordem` (`idOrdem`));


-- -----------------------------------------------------
-- Table `oficina`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Servico` (
  `idServicos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idServicos`));


-- -----------------------------------------------------
-- Table `oficina`.`Servico por Ordem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`servico_por_ordem` (
  `idServicos` INT NOT NULL,
  `idOrdem` INT NOT NULL,
  PRIMARY KEY (`idServicos`, `idOrdem`),
  CONSTRAINT `fk_Servico_has_Ordem_Servico`
    FOREIGN KEY (`idServicos`)
    REFERENCES `oficina`.`Servico` (`idServicos`),
  CONSTRAINT `fk_Servico_has_Ordem_Ordem`
    FOREIGN KEY (`idOrdem`)
    REFERENCES `oficina`.`Ordem` (`idOrdem`));


-- -----------------------------------------------------
-- Table `oficina`.`Peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeca`));


-- -----------------------------------------------------
-- Table `oficina`.`Peca por Ordem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`peca_por_ordem` (
  `idPeca` INT NOT NULL,
  `idOrdem` INT NOT NULL,
  PRIMARY KEY (`idPeca`, `idOrdem`),
  CONSTRAINT `fk_Peca_has_Ordem_Peca`
    FOREIGN KEY (`idPeca`)
    REFERENCES `oficina`.`Peca` (`idPeca`),
  CONSTRAINT `fk_Peca_has_Ordem_Ordem`
    FOREIGN KEY (`idOrdem`)
    REFERENCES `oficina`.`Ordem` (`idOrdem`));


-- -----------------------------------------------------
-- Table `oficina`.`Servico por Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`servico_por_mecanico` (
  `idServicos` INT NOT NULL,
  `idMecanico` INT NOT NULL,
  PRIMARY KEY (`idServicos`, `idMecanico`),
  CONSTRAINT `fk_Servico_has_Mecanico_Servico`
    FOREIGN KEY (`idServicos`)
    REFERENCES `oficina`.`Servico` (`idServicos`),
  CONSTRAINT `fk_Servico_has_Mecanico_Mecanico`
    FOREIGN KEY (`idMecanico`)
    REFERENCES `oficina`.`Mecanico` (`idMecanico`));
