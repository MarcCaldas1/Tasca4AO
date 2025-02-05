-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2c` ;
USE `Exercici2c` ;

-- -----------------------------------------------------
-- Table `Exercici2c`.`ASSIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2c`.`ASSIGNATURA` (
  `idASSIGNATURA` INT NOT NULL,
  `Professor` VARCHAR(45) NULL,
  `Departament` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idASSIGNATURA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2c`.`DEPARTAMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2c`.`DEPARTAMENT` (
  `idDEPARTAMENT` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idDEPARTAMENT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2c`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2c`.`PROFESSOR` (
  `idPROFESSOR` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Titulacio` VARCHAR(45) NULL,
  `Departament` VARCHAR(45) NULL,
  `DEPARTAMENT_idDEPARTAMENT` INT NOT NULL,
  PRIMARY KEY (`idPROFESSOR`),
  INDEX `fk_PROFESSOR_DEPARTAMENT1_idx` (`DEPARTAMENT_idDEPARTAMENT` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_DEPARTAMENT1`
    FOREIGN KEY (`DEPARTAMENT_idDEPARTAMENT`)
    REFERENCES `Exercici2c`.`DEPARTAMENT` (`idDEPARTAMENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2c`.`ALUMNE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2c`.`ALUMNE` (
  `idALUMNE` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idALUMNE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2c`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2c`.`MATRICULA` (
  `idMATRICULA` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Alumne` VARCHAR(45) NULL,
  `Assignatura` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `ALUMNE_idALUMNE` INT NOT NULL,
  PRIMARY KEY (`idMATRICULA`),
  INDEX `fk_MATRICULA_ALUMNE1_idx` (`ALUMNE_idALUMNE` ASC) VISIBLE,
  CONSTRAINT `fk_MATRICULA_ALUMNE1`
    FOREIGN KEY (`ALUMNE_idALUMNE`)
    REFERENCES `Exercici2c`.`ALUMNE` (`idALUMNE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2c`.`MAP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2c`.`MAP` (
  `idMAP` INT NOT NULL,
  `Num. hores` VARCHAR(45) NULL,
  `ASSIGNATURA_idASSIGNATURA` INT NOT NULL,
  `PROFESSOR_idPROFESSOR` INT NOT NULL,
  `MATRICULA_idMATRICULA` INT NOT NULL,
  PRIMARY KEY (`idMAP`),
  INDEX `fk_MAP_ASSIGNATURA_idx` (`ASSIGNATURA_idASSIGNATURA` ASC) VISIBLE,
  INDEX `fk_MAP_PROFESSOR1_idx` (`PROFESSOR_idPROFESSOR` ASC) VISIBLE,
  INDEX `fk_MAP_MATRICULA1_idx` (`MATRICULA_idMATRICULA` ASC) VISIBLE,
  CONSTRAINT `fk_MAP_ASSIGNATURA`
    FOREIGN KEY (`ASSIGNATURA_idASSIGNATURA`)
    REFERENCES `Exercici2c`.`ASSIGNATURA` (`idASSIGNATURA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAP_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_idPROFESSOR`)
    REFERENCES `Exercici2c`.`PROFESSOR` (`idPROFESSOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAP_MATRICULA1`
    FOREIGN KEY (`MATRICULA_idMATRICULA`)
    REFERENCES `Exercici2c`.`MATRICULA` (`idMATRICULA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
