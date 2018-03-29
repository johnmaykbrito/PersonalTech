-- MySQL Script generated by MySQL Workbench
-- Thu Mar 29 11:27:47 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TB_PERSONAL_TRAINER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_PERSONAL_TRAINER` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_NOME` VARCHAR(50) NOT NULL,
  `DATE_DATA_NASCIMENTO` DATE NOT NULL,
  `TXT_SEXO` VARCHAR(1) NOT NULL COMMENT 'M - MASCULINO\nF- FEMININO',
  `TXT_LOGIN` VARCHAR(50) NOT NULL,
  `TXT_SENHA` VARCHAR(50) NOT NULL,
  `TXT_EMAIL` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `TXT_LOGIN_UNIQUE` (`TXT_LOGIN` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_ALUNO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_NOME` VARCHAR(50) NOT NULL,
  `DATE_DATA_NASCIMENTO` DATE NOT NULL,
  `TXT_SEXO` VARCHAR(1) NOT NULL COMMENT 'M - Masculino\nF - Feminino',
  `TXT_LOGIN` VARCHAR(50) NOT NULL,
  `TXT_SENHA` VARCHAR(50) NOT NULL,
  `TXT_EMAIL` VARCHAR(50) NOT NULL,
  `TB_PERSONAL_TRAINER_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `TXT_LOGIN_UNIQUE` (`TXT_LOGIN` ASC),
  INDEX `fk_TB_ALUNO_TB_PERSONAL_TRAINER1_idx` (`TB_PERSONAL_TRAINER_ID` ASC),
  CONSTRAINT `fk_TB_ALUNO_TB_PERSONAL_TRAINER1`
    FOREIGN KEY (`TB_PERSONAL_TRAINER_ID`)
    REFERENCES `mydb`.`TB_PERSONAL_TRAINER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_END_ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_END_ALUNO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_RUA` VARCHAR(100) NOT NULL,
  `NUM_NUMERO` INT NOT NULL,
  `TXT_BAIRRO` VARCHAR(100) NOT NULL,
  `TXT_COMPLEMENTO` VARCHAR(100) NOT NULL,
  `TXT_CIDADE` VARCHAR(100) NOT NULL,
  `TXT_CEP` VARCHAR(100) NOT NULL,
  `TXT_ESTADO` VARCHAR(100) NOT NULL,
  `ID_TB_ALUNO` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Aluno_matricula_idx` (`ID_TB_ALUNO` ASC),
  CONSTRAINT `ID_TB_ALUNO`
    FOREIGN KEY (`ID_TB_ALUNO`)
    REFERENCES `mydb`.`TB_ALUNO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_TELEFONE_ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_TELEFONE_ALUNO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_TELEFONE` VARCHAR(50) NOT NULL,
  `ID_TB_ALUNO` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_TB_ALUNO_idx` (`ID_TB_ALUNO` ASC),
  CONSTRAINT `ID_TB_ALUNO`
    FOREIGN KEY (`ID_TB_ALUNO`)
    REFERENCES `mydb`.`TB_ALUNO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_TELEFONE_PT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_TELEFONE_PT` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_TELEFONE` VARCHAR(50) NOT NULL,
  `ID_TB_PT` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_TB_PT_idx` (`ID_TB_PT` ASC),
  CONSTRAINT `ID_TB_PT`
    FOREIGN KEY (`ID_TB_PT`)
    REFERENCES `mydb`.`TB_PERSONAL_TRAINER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_END_PT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_END_PT` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_RUA` VARCHAR(100) NOT NULL,
  `NUM_NUMERO` INT NOT NULL,
  `TXT_BAIRRO` VARCHAR(100) NOT NULL,
  `TXT_COMPLEMENTO` VARCHAR(100) NOT NULL,
  `TXT_CIDADE` VARCHAR(100) NOT NULL,
  `TXT_CEP` VARCHAR(100) NOT NULL,
  `TXT_ESTADO` VARCHAR(100) NOT NULL,
  `ID_TB_PT` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_TB_PT_idx` (`ID_TB_PT` ASC),
  CONSTRAINT `ID_TB_PT`
    FOREIGN KEY (`ID_TB_PT`)
    REFERENCES `mydb`.`TB_PERSONAL_TRAINER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_EXERCICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_EXERCICIO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_TIPO_EXERCICIO` VARCHAR(50) NOT NULL,
  `TXT_NOME_EXERCICIO` VARCHAR(50) NOT NULL,
  `TB_ALUNO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_TB_EXERCICIO_TB_ALUNO1_idx` (`TB_ALUNO_ID` ASC),
  CONSTRAINT `fk_TB_EXERCICIO_TB_ALUNO1`
    FOREIGN KEY (`TB_ALUNO_ID`)
    REFERENCES `mydb`.`TB_ALUNO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_AVALIACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_AVALIACAO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_TB_PT` INT NOT NULL,
  `ID_TB_ALUNO` INT NOT NULL,
  `DATE_DATA_AVA` DATE NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_TB_ALUNO_idx` (`ID_TB_ALUNO` ASC),
  INDEX `ID_TB_PT_idx` (`ID_TB_PT` ASC),
  UNIQUE INDEX `DATE_DATA_AVA_UNIQUE` (`DATE_DATA_AVA` ASC),
  CONSTRAINT `ID_TB_ALUNO`
    FOREIGN KEY (`ID_TB_ALUNO`)
    REFERENCES `mydb`.`TB_ALUNO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_TB_PT`
    FOREIGN KEY (`ID_TB_PT`)
    REFERENCES `mydb`.`TB_PERSONAL_TRAINER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_PERGUNTA_AVALICAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_PERGUNTA_AVALICAO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_PERGUNTA` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_RESP_AVAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_RESP_AVAL` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TXT_RESPOSTA` VARCHAR(1000) NOT NULL,
  `TB_PERGUNTA_AVALICAO_ID` INT NOT NULL,
  `TB_AVALIACAO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_TB_RESP_AVAL_TB_PERGUNTA_AVALICAO1_idx` (`TB_PERGUNTA_AVALICAO_ID` ASC),
  INDEX `fk_TB_RESP_AVAL_TB_AVALIACAO1_idx` (`TB_AVALIACAO_ID` ASC),
  CONSTRAINT `fk_TB_RESP_AVAL_TB_PERGUNTA_AVALICAO1`
    FOREIGN KEY (`TB_PERGUNTA_AVALICAO_ID`)
    REFERENCES `mydb`.`TB_PERGUNTA_AVALICAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_RESP_AVAL_TB_AVALIACAO1`
    FOREIGN KEY (`TB_AVALIACAO_ID`)
    REFERENCES `mydb`.`TB_AVALIACAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
