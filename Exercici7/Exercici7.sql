-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici7` ;
USE `Exercici7` ;

-- -----------------------------------------------------
-- Table `Exercici7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Client` (
  `idClient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL DEFAULT NULL,
  `Cognoms` VARCHAR(45) NULL DEFAULT NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Exercici7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `Nom` VARCHAR(45) NULL DEFAULT NULL,
  `Cognom` VARCHAR(45) NULL DEFAULT NULL,
  `Adresa` VARCHAR(45) NULL DEFAULT NULL,
  `DataNaixement` VARCHAR(45) NULL DEFAULT NULL,
  `Telefon` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Exercici7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Producte` (
  `idProducte` INT NOT NULL,
  `Nom` VARCHAR(45) NULL DEFAULT NULL,
  `Descripcio` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `CodiBarres` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducte`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Exercici7`.`Tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Tickets` (
  `idTickets` INT NOT NULL,
  `NumFac` VARCHAR(15) NULL DEFAULT NULL,
  `Data` VARCHAR(20) NULL DEFAULT NULL,
  `HoraVenta` VARCHAR(10) NULL DEFAULT NULL,
  `Client_idClient` INT NOT NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  PRIMARY KEY (`idTickets`),
  INDEX `fk_Tickets_Client_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Tickets_Empleat1_idx` (`Empleat_idEmpleat` ASC) VISIBLE,
  CONSTRAINT `fk_Tickets_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Exercici7`.`Client` (`idClient`),
  CONSTRAINT `fk_Tickets_Empleat1`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `Exercici7`.`Empleat` (`idEmpleat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Exercici7`.`LiniaTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`LiniaTicket` (
  `idLiniaTicket` INT NOT NULL,
  `Descompte` VARCHAR(45) NULL DEFAULT NULL,
  `Import` VARCHAR(45) NULL DEFAULT NULL,
  `Tickets_idTickets` INT NOT NULL,
  `Producte_idProducte` INT NOT NULL,
  PRIMARY KEY (`idLiniaTicket`),
  INDEX `fk_LiniaTicket_Tickets1_idx` (`Tickets_idTickets` ASC) VISIBLE,
  INDEX `fk_LiniaTicket_Producte1_idx` (`Producte_idProducte` ASC) VISIBLE,
  CONSTRAINT `fk_LiniaTicket_Producte1`
    FOREIGN KEY (`Producte_idProducte`)
    REFERENCES `Exercici7`.`Producte` (`idProducte`),
  CONSTRAINT `fk_LiniaTicket_Tickets1`
    FOREIGN KEY (`Tickets_idTickets`)
    REFERENCES `Exercici7`.`Tickets` (`idTickets`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
