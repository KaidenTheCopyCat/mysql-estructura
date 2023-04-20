-- MySQL Workbench Synchronization
-- Generated: 2023-04-20 13:30
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Usuario

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Client` (
  `Client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `codi_Postal` VARCHAR(45) NOT NULL,
  `Localitat` VARCHAR(45) NOT NULL,
  `Provincia` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Client_id`),
  INDEX `nom` (`Nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Comanda` (
  `Comanda_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Data/hora` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `preu` DECIMAL NOT NULL,
  `domicili/botiga` VARCHAR(45) NOT NULL,
  `Quantitat_productes` VARCHAR(45) NOT NULL,
  `Client_Client_id` INT(11) NOT NULL,
  `Botiga_Botiga_id` INT(11) NOT NULL,
  PRIMARY KEY (`Comanda_id`, `Client_Client_id`, `Botiga_Botiga_id`),
  INDEX `fk_Comanda_Client_idx` (`Client_Client_id` ASC) VISIBLE,
  INDEX `fk_Comanda_Botiga1_idx` (`Botiga_Botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_Client`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `Pizzeria`.`Client` (`Client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda_Botiga1`
    FOREIGN KEY (`Botiga_Botiga_id`)
    REFERENCES `Pizzeria`.`Botiga` (`Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Begudes` (
  `Productes_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `preu` DECIMAL NOT NULL,
  PRIMARY KEY (`Productes_id`),
  INDEX `nom` (`nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Botiga` (
  `Botiga_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Adreça` VARCHAR(45) NOT NULL,
  `Codi_postal` VARCHAR(45) NOT NULL,
  `Localitat` VARCHAR(45) NOT NULL,
  `Provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Botiga_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Categoria` (
  `Categoria_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Categoria_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Empleat` (
  `Empleat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `Nif` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Botiga_Botiga_id` INT(11) NOT NULL,
  PRIMARY KEY (`Empleat_id`, `Botiga_Botiga_id`),
  INDEX `fk_Empleat_Botiga1_idx` (`Botiga_Botiga_id` ASC) VISIBLE,
  INDEX `nom` (`nom` ASC) INVISIBLE,
  INDEX `nif` (`Nif` ASC) VISIBLE,
  CONSTRAINT `fk_Empleat_Botiga1`
    FOREIGN KEY (`Botiga_Botiga_id`)
    REFERENCES `Pizzeria`.`Botiga` (`Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Repartidor` (
  `Repartidor_id` INT(11) NOT NULL,
  `Empleat_Empleat_id` INT(11) NOT NULL,
  PRIMARY KEY (`Repartidor_id`, `Empleat_Empleat_id`),
  INDEX `fk_Repartidor_Empleat1_idx` (`Empleat_Empleat_id` ASC) VISIBLE,
  CONSTRAINT `fk_Repartidor_Empleat1`
    FOREIGN KEY (`Empleat_Empleat_id`)
    REFERENCES `Pizzeria`.`Empleat` (`Empleat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Hamburguesa` (
  `Productes_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `preu` DECIMAL NOT NULL,
  PRIMARY KEY (`Productes_id`),
  INDEX `nom` (`nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pizza` (
  `Productes_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `preu` DECIMAL NOT NULL,
  `Categoria_Categoria_id` INT(11) NOT NULL,
  PRIMARY KEY (`Productes_id`, `Categoria_Categoria_id`),
  INDEX `fk_Pizza_Categoria1_idx` (`Categoria_Categoria_id` ASC) VISIBLE,
  INDEX `nom` (`nom` ASC) VISIBLE,
  CONSTRAINT `fk_Pizza_Categoria1`
    FOREIGN KEY (`Categoria_Categoria_id`)
    REFERENCES `Pizzeria`.`Categoria` (`Categoria_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Comanda_has_Begudes` (
  `Comanda_Comanda_id` INT(11) NOT NULL,
  `Comanda_Client_Client_id` INT(11) NOT NULL,
  `Comanda_Botiga_Botiga_id` INT(11) NOT NULL,
  `Begudes_Productes_id` INT(11) NOT NULL,
  PRIMARY KEY (`Comanda_Comanda_id`, `Comanda_Client_Client_id`, `Comanda_Botiga_Botiga_id`, `Begudes_Productes_id`),
  INDEX `fk_Comanda_has_Begudes_Begudes1_idx` (`Begudes_Productes_id` ASC) VISIBLE,
  INDEX `fk_Comanda_has_Begudes_Comanda1_idx` (`Comanda_Comanda_id` ASC, `Comanda_Client_Client_id` ASC, `Comanda_Botiga_Botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_has_Begudes_Comanda1`
    FOREIGN KEY (`Comanda_Comanda_id` , `Comanda_Client_Client_id` , `Comanda_Botiga_Botiga_id`)
    REFERENCES `Pizzeria`.`Comanda` (`Comanda_id` , `Client_Client_id` , `Botiga_Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda_has_Begudes_Begudes1`
    FOREIGN KEY (`Begudes_Productes_id`)
    REFERENCES `Pizzeria`.`Begudes` (`Productes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Comanda_has_Hamburguesa` (
  `Comanda_Comanda_id` INT(11) NOT NULL,
  `Comanda_Client_Client_id` INT(11) NOT NULL,
  `Comanda_Botiga_Botiga_id` INT(11) NOT NULL,
  `Hamburguesa_Productes_id` INT(11) NOT NULL,
  PRIMARY KEY (`Comanda_Comanda_id`, `Comanda_Client_Client_id`, `Comanda_Botiga_Botiga_id`, `Hamburguesa_Productes_id`),
  INDEX `fk_Comanda_has_Hamburguesa_Hamburguesa1_idx` (`Hamburguesa_Productes_id` ASC) VISIBLE,
  INDEX `fk_Comanda_has_Hamburguesa_Comanda1_idx` (`Comanda_Comanda_id` ASC, `Comanda_Client_Client_id` ASC, `Comanda_Botiga_Botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_has_Hamburguesa_Comanda1`
    FOREIGN KEY (`Comanda_Comanda_id` , `Comanda_Client_Client_id` , `Comanda_Botiga_Botiga_id`)
    REFERENCES `Pizzeria`.`Comanda` (`Comanda_id` , `Client_Client_id` , `Botiga_Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda_has_Hamburguesa_Hamburguesa1`
    FOREIGN KEY (`Hamburguesa_Productes_id`)
    REFERENCES `Pizzeria`.`Hamburguesa` (`Productes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Comanda_has_Pizza` (
  `Comanda_Comanda_id` INT(11) NOT NULL,
  `Comanda_Client_Client_id` INT(11) NOT NULL,
  `Comanda_Botiga_Botiga_id` INT(11) NOT NULL,
  `Pizza_Productes_id` INT(11) NOT NULL,
  `Pizza_Categoria_Categoria_id` INT(11) NOT NULL,
  PRIMARY KEY (`Comanda_Comanda_id`, `Comanda_Client_Client_id`, `Comanda_Botiga_Botiga_id`, `Pizza_Productes_id`, `Pizza_Categoria_Categoria_id`),
  INDEX `fk_Comanda_has_Pizza_Pizza1_idx` (`Pizza_Productes_id` ASC, `Pizza_Categoria_Categoria_id` ASC) VISIBLE,
  INDEX `fk_Comanda_has_Pizza_Comanda1_idx` (`Comanda_Comanda_id` ASC, `Comanda_Client_Client_id` ASC, `Comanda_Botiga_Botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_has_Pizza_Comanda1`
    FOREIGN KEY (`Comanda_Comanda_id` , `Comanda_Client_Client_id` , `Comanda_Botiga_Botiga_id`)
    REFERENCES `Pizzeria`.`Comanda` (`Comanda_id` , `Client_Client_id` , `Botiga_Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda_has_Pizza_Pizza1`
    FOREIGN KEY (`Pizza_Productes_id` , `Pizza_Categoria_Categoria_id`)
    REFERENCES `Pizzeria`.`Pizza` (`Productes_id` , `Categoria_Categoria_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Comanda_has_Repartidor` (
  `Comanda_Comanda_id` INT(11) NOT NULL,
  `Comanda_Client_Client_id` INT(11) NOT NULL,
  `Comanda_Botiga_Botiga_id` INT(11) NOT NULL,
  `Repartidor_Repartidor_id` INT(11) NOT NULL,
  `Repartidor_Empleat_Empleat_id` INT(11) NOT NULL,
  `Comanda_entrega` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Comanda_Comanda_id`, `Comanda_Client_Client_id`, `Comanda_Botiga_Botiga_id`, `Repartidor_Repartidor_id`, `Repartidor_Empleat_Empleat_id`),
  INDEX `fk_Comanda_has_Repartidor_Repartidor1_idx` (`Repartidor_Repartidor_id` ASC, `Repartidor_Empleat_Empleat_id` ASC) VISIBLE,
  INDEX `fk_Comanda_has_Repartidor_Comanda1_idx` (`Comanda_Comanda_id` ASC, `Comanda_Client_Client_id` ASC, `Comanda_Botiga_Botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_has_Repartidor_Comanda1`
    FOREIGN KEY (`Comanda_Comanda_id` , `Comanda_Client_Client_id` , `Comanda_Botiga_Botiga_id`)
    REFERENCES `Pizzeria`.`Comanda` (`Comanda_id` , `Client_Client_id` , `Botiga_Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda_has_Repartidor_Repartidor1`
    FOREIGN KEY (`Repartidor_Repartidor_id` , `Repartidor_Empleat_Empleat_id`)
    REFERENCES `Pizzeria`.`Repartidor` (`Repartidor_id` , `Empleat_Empleat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
