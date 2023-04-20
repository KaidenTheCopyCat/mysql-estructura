-- MySQL Workbench Synchronization
-- Generated: 2023-04-19 11:38
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Usuario

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Optica`.`Proveidors` (
  `Proveidors_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom_Proveidors` VARCHAR(45) NOT NULL,
  `Telefon_Proveidor` VARCHAR(45) NOT NULL,
  `Fax_Proveidor` VARCHAR(45) NOT NULL,
  `NIf_Proveidor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Proveidors_id`),
  INDEX `Nom` (`Nom_Proveidors` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Adreça` (
  `Adreça_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Carrer` INT(11) NOT NULL,
  `Numero` INT(11) NOT NULL,
  `Pis` INT(11) NULL DEFAULT NULL,
  `Porta` INT(11) NULL DEFAULT NULL,
  `Ciutat` VARCHAR(45) NOT NULL,
  `CodiPostal` INT(11) NULL DEFAULT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Adreça_id`),
  INDEX `cp` (`CodiPostal` ASC) VISIBLE,
  INDEX `ciutat` (`Ciutat` ASC) INVISIBLE,
  INDEX `pais` (`Pais` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Client` (
  `Client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom_client` VARCHAR(45) NOT NULL,
  `Telefon_Client` VARCHAR(45) NOT NULL,
  `Correu_electronic` VARCHAR(45) NOT NULL,
  `Data_registre` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Client_id`),
  INDEX `nom` (`Nom_client` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Ulleres` (
  `Ulleres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(45) NOT NULL,
  `Graduacio_VD` DECIMAL NOT NULL,
  `Graduacio_VE` DECIMAL NOT NULL,
  `Tipus_Montura` VARCHAR(45) NOT NULL COMMENT 'Valors Possibles:\nFlotants\nPasta\nMetalica',
  `Color_Montura` VARCHAR(45) NOT NULL,
  `Color_VD` VARCHAR(45) NOT NULL,
  `Color_VE` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL NOT NULL,
  PRIMARY KEY (`Ulleres_id`, `Marca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Proveidor_te_Ulleres` (
  `Proveidor_te_Ulleres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Proveidors_Proveidors_id` INT(11) NOT NULL,
  `Ulleres_Ulleres_id` INT(11) NOT NULL,
  `Ulleres_Marca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Proveidor_te_Ulleres_id`, `Proveidors_Proveidors_id`, `Ulleres_Ulleres_id`, `Ulleres_Marca`),
  INDEX `fk_Proveidor_te_Ulleres_Proveidors1_idx` (`Proveidors_Proveidors_id` ASC) VISIBLE,
  INDEX `fk_Proveidor_te_Ulleres_Ulleres1_idx` (`Ulleres_Ulleres_id` ASC, `Ulleres_Marca` ASC) VISIBLE,
  CONSTRAINT `fk_Proveidor_te_Ulleres_Proveidors1`
    FOREIGN KEY (`Proveidors_Proveidors_id`)
    REFERENCES `Optica`.`Proveidors` (`Proveidors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Proveidor_te_Ulleres_Ulleres1`
    FOREIGN KEY (`Ulleres_Ulleres_id` , `Ulleres_Marca`)
    REFERENCES `Optica`.`Ulleres` (`Ulleres_id` , `Marca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Proveidor_te_Adreça` (
  `Proveidor_te_Adreça_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Proveidors_Proveidors_id` INT(11) NOT NULL,
  `Adreça_Adreça_id` INT(11) NOT NULL,
  PRIMARY KEY (`Proveidor_te_Adreça_id`, `Proveidors_Proveidors_id`),
  INDEX `fk_Proveidor_te_Adreça_Proveidors1_idx` (`Proveidors_Proveidors_id` ASC) VISIBLE,
  INDEX `fk_Proveidor_te_Adreça_Adreça1_idx` (`Adreça_Adreça_id` ASC) VISIBLE,
  CONSTRAINT `fk_Proveidor_te_Adreça_Proveidors1`
    FOREIGN KEY (`Proveidors_Proveidors_id`)
    REFERENCES `Optica`.`Proveidors` (`Proveidors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Proveidor_te_Adreça_Adreça1`
    FOREIGN KEY (`Adreça_Adreça_id`)
    REFERENCES `Optica`.`Adreça` (`Adreça_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Client_te_Adreça` (
  `Client_te_Adreça_id` INT(11) NOT NULL,
  `Client_Client_id` INT(11) NOT NULL,
  `Adreça_Adreça_id` INT(11) NOT NULL,
  PRIMARY KEY (`Client_te_Adreça_id`, `Client_Client_id`),
  INDEX `fk_Client_te_Adreça_Client1_idx` (`Client_Client_id` ASC) VISIBLE,
  INDEX `fk_Client_te_Adreça_Adreça1_idx` (`Adreça_Adreça_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_te_Adreça_Client1`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `Optica`.`Client` (`Client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Client_te_Adreça_Adreça1`
    FOREIGN KEY (`Adreça_Adreça_id`)
    REFERENCES `Optica`.`Adreça` (`Adreça_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Client_Recomenat` (
  `Clients_Recomenats_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Client_Client_id` INT(11) NOT NULL COMMENT 'Client nou',
  `Client_Client_id1` INT(11) NOT NULL COMMENT 'Client que li ha recomenat',
  PRIMARY KEY (`Clients_Recomenats_id`),
  INDEX `fk_Clients_Recomenats_Client1_idx` (`Client_Client_id1` ASC) VISIBLE,
  CONSTRAINT `fk_Recomenats_Client1`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `Optica`.`Client` (`Client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Clients_Recomenats_Client1`
    FOREIGN KEY (`Client_Client_id1`)
    REFERENCES `Optica`.`Client` (`Client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
