-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2a` ;
USE `Exercici2a` ;

-- -----------------------------------------------------
-- Table `Exercici2a`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2a`.`PACIENT` (
  `idPACIENT` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(13) NULL,
  `Adresa` VARCHAR(100) NULL,
  `Número_SS` VARCHAR(45) NULL,
  PRIMARY KEY (`idPACIENT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = ascii;


-- -----------------------------------------------------
-- Table `Exercici2a`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2a`.`METGE` (
  `idMETGE` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Número_colegiat` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Especialitat` VARCHAR(45) NULL,
  `Càrrec` VARCHAR(45) NULL,
  PRIMARY KEY (`idMETGE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2a`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2a`.`CONSULTA` (
  `idCONSULTA` INT NOT NULL,
  `Pacient` VARCHAR(45) NULL,
  `Metge` VARCHAR(45) NULL,
  `Data` VARCHAR(45) NULL,
  `Llit` VARCHAR(45) NULL,
  `Planta` VARCHAR(45) NULL,
  `Diagnòstic` VARCHAR(45) NULL,
  `METGE_idMETGE` INT NOT NULL,
  `PACIENT_idPACIENT` INT NOT NULL,
  PRIMARY KEY (`idCONSULTA`),
  INDEX `fk_CONSULTA_METGE1_idx` (`METGE_idMETGE` ASC) VISIBLE,
  INDEX `fk_CONSULTA_PACIENT1_idx` (`PACIENT_idPACIENT` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_idMETGE`)
    REFERENCES `Exercici2a`.`METGE` (`idMETGE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_PACIENT1`
    FOREIGN KEY (`PACIENT_idPACIENT`)
    REFERENCES `Exercici2a`.`PACIENT` (`idPACIENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
