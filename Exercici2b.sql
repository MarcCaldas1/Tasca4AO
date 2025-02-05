-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2b` ;
USE `Exercici2b` ;

-- -----------------------------------------------------
-- Table `Exercici2b`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2b`.`CINE` (
  `idCINE` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(13) NULL,
  `Població` VARCHAR(45) NULL,
  `Núm. sales` VARCHAR(45) NULL,
  PRIMARY KEY (`idCINE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2b`.`PROJECCIÓ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2b`.`PROJECCIÓ` (
  `idPROJECCIÓ` INT NOT NULL,
  `Cine` VARCHAR(45) NULL,
  `Pel·lícula` VARCHAR(45) NULL,
  `Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Sala` VARCHAR(45) NULL,
  PRIMARY KEY (`idPROJECCIÓ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2b`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2b`.`TARIFA` (
  `idTARIFA` INT NOT NULL,
  `Cine` VARCHAR(45) NULL,
  `Tipus` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  PRIMARY KEY (`idTARIFA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2b`.`PEL·LÍCULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2b`.`PEL·LÍCULA` (
  `idPEL·LÍCULA` INT NOT NULL,
  `Títol` VARCHAR(45) NULL,
  `Classificació` VARCHAR(45) NULL,
  `Gènere` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Durada` VARCHAR(45) NULL,
  `CINE_idCINE` INT NOT NULL,
  `PROJECCIÓ_idPROJECCIÓ` INT NOT NULL,
  `TARIFA_idTARIFA` INT NOT NULL,
  PRIMARY KEY (`idPEL·LÍCULA`),
  INDEX `fk_PEL·LÍCULA_CINE_idx` (`CINE_idCINE` ASC) VISIBLE,
  INDEX `fk_PEL·LÍCULA_PROJECCIÓ1_idx` (`PROJECCIÓ_idPROJECCIÓ` ASC) VISIBLE,
  INDEX `fk_PEL·LÍCULA_TARIFA1_idx` (`TARIFA_idTARIFA` ASC) VISIBLE,
  CONSTRAINT `fk_PEL·LÍCULA_CINE`
    FOREIGN KEY (`CINE_idCINE`)
    REFERENCES `Exercici2b`.`CINE` (`idCINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEL·LÍCULA_PROJECCIÓ1`
    FOREIGN KEY (`PROJECCIÓ_idPROJECCIÓ`)
    REFERENCES `Exercici2b`.`PROJECCIÓ` (`idPROJECCIÓ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEL·LÍCULA_TARIFA1`
    FOREIGN KEY (`TARIFA_idTARIFA`)
    REFERENCES `Exercici2b`.`TARIFA` (`idTARIFA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
