-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici6` ;
USE `Exercici6` ;

-- -----------------------------------------------------
-- Table `Exercici6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Passatger` (
  `idPassatgers` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  PRIMARY KEY (`idPassatgers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Avio` (
  `idAvions` INT NOT NULL,
  `Companyia` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` INT NULL,
  PRIMARY KEY (`idAvions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Vol` (
  `idVol` INT NOT NULL,
  `Numero` VARCHAR(7) NULL,
  `Origen` VARCHAR(45) NULL,
  `Desti` VARCHAR(45) NULL,
  `HSortida` VARCHAR(45) NULL,
  `Avio_idAvions` INT NOT NULL,
  PRIMARY KEY (`idVol`),
  INDEX `fk_Vol_Avio1_idx` (`Avio_idAvions` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio1`
    FOREIGN KEY (`Avio_idAvions`)
    REFERENCES `Exercici6`.`Avio` (`idAvions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NULL,
  `Import` INT NULL,
  `Passatger_idPassatgers` INT NOT NULL,
  `Vol_idVol` INT NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Passatger_idx` (`Passatger_idPassatgers` ASC) VISIBLE,
  INDEX `fk_Reserva_Vol1_idx` (`Vol_idVol` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Passatger`
    FOREIGN KEY (`Passatger_idPassatgers`)
    REFERENCES `Exercici6`.`Passatger` (`idPassatgers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_idVol`)
    REFERENCES `Exercici6`.`Vol` (`idVol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
