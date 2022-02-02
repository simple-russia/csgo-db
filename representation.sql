-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`collection` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`color` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `hex` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`weapon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`weapon` (
  `id` INT NOT NULL,
  `style` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `imageurl` VARCHAR(45) NOT NULL,
  `collection_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_weapon_collection1_idx` (`collection_id` ASC) VISIBLE,
  INDEX `fk_weapon_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_weapon_color1_idx` (`color_id` ASC) VISIBLE,
  CONSTRAINT `fk_weapon_collection1`
    FOREIGN KEY (`collection_id`)
    REFERENCES `mydb`.`collection` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_weapon_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `mydb`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_weapon_color1`
    FOREIGN KEY (`color_id`)
    REFERENCES `mydb`.`color` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`description` (
  `id` INT NOT NULL,
  `text` TEXT(500) NOT NULL,
  `language` VARCHAR(5) NOT NULL,
  `weapon_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_description_weapon1_idx` (`weapon_id` ASC) VISIBLE,
  CONSTRAINT `fk_description_weapon1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `mydb`.`weapon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`case` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(9,2) NOT NULL,
  `img` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`case_has_weapon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`case_has_weapon` (
  `case_id` INT NOT NULL,
  `weapon_id` INT NOT NULL,
  PRIMARY KEY (`case_id`, `weapon_id`),
  INDEX `fk_case_has_weapon_weapon1_idx` (`weapon_id` ASC) VISIBLE,
  INDEX `fk_case_has_weapon_case_idx` (`case_id` ASC) VISIBLE,
  CONSTRAINT `fk_case_has_weapon_case`
    FOREIGN KEY (`case_id`)
    REFERENCES `mydb`.`case` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_has_weapon_weapon1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `mydb`.`weapon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
