-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`tbl_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`tbl_author` (
  `authorId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `authorName` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`authorId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`tbl_publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`tbl_publisher` (
  `publisherId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `publisherName` VARCHAR(45) NOT NULL COMMENT '',
  `publisherAddress` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `publisherPhone` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`publisherId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`tbl_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`tbl_book` (
  `bookId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NOT NULL COMMENT '',
  `authId` INT(11) NULL DEFAULT NULL COMMENT '',
  `pubId` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`bookId`)  COMMENT '',
  INDEX `fk_author_idx` (`authId` ASC)  COMMENT '',
  INDEX `fk_publisher_idx` (`pubId` ASC)  COMMENT '',
  CONSTRAINT `fk_publisher`
    FOREIGN KEY (`pubId`)
    REFERENCES `library`.`tbl_publisher` (`publisherId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_author`
    FOREIGN KEY (`authId`)
    REFERENCES `library`.`tbl_author` (`authorId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`tbl_library_branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`tbl_library_branch` (
  `branchId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `branchName` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `branchAddress` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`branchId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`tbl_book_copies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`tbl_book_copies` (
  `bookId` INT(11) NOT NULL COMMENT '',
  `branchId` INT(11) NOT NULL COMMENT '',
  `noOfCopies` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`bookId`, `branchId`)  COMMENT '',
  INDEX `fk_bc_book_idx` (`bookId` ASC)  COMMENT '',
  INDEX `fk_bc_branch_idx` (`branchId` ASC)  COMMENT '',
  CONSTRAINT `fk_bc_branch`
    FOREIGN KEY (`branchId`)
    REFERENCES `library`.`tbl_library_branch` (`branchId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bc_book`
    FOREIGN KEY (`bookId`)
    REFERENCES `library`.`tbl_book` (`bookId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`tbl_borrower`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`tbl_borrower` (
  `cardNo` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `address` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `phone` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`cardNo`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`tbl_book_loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`tbl_book_loans` (
  `bookId` INT(11) NOT NULL COMMENT '',
  `branchId` INT(11) NOT NULL COMMENT '',
  `cardNo` INT(11) NOT NULL COMMENT '',
  `dateOut` DATETIME NULL DEFAULT NULL COMMENT '',
  `dueDate` DATETIME NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`bookId`, `branchId`, `cardNo`)  COMMENT '',
  INDEX `fk_bl_book_idx` (`bookId` ASC)  COMMENT '',
  INDEX `fk_bl_branch_idx` (`branchId` ASC)  COMMENT '',
  INDEX `fk_bl_borrower_idx` (`cardNo` ASC)  COMMENT '',
  CONSTRAINT `fk_bl_branch`
    FOREIGN KEY (`branchId`)
    REFERENCES `library`.`tbl_library_branch` (`branchId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_book`
    FOREIGN KEY (`bookId`)
    REFERENCES `library`.`tbl_book` (`bookId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_borrower`
    FOREIGN KEY (`cardNo`)
    REFERENCES `library`.`tbl_borrower` (`cardNo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
