-- MySQL Script generated by MySQL Workbench
-- 11/30/17 23:12:10
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tournaments
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tournaments
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tournaments` DEFAULT CHARACTER SET utf8 ;
USE `tournaments` ;

-- -----------------------------------------------------
-- Table `tournaments`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tournaments`.`players` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NULL,
  `email` VARCHAR(100) NOT NULL,
  `status` INT(1) NULL COMMENT '0 - wait ; 1 - active; 2 - inactive; 3 - invitation mail sent;',
  `password` VARCHAR(50) NULL,
  `passhash` VARCHAR(45) NULL,
  `born` INT(4) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tournaments`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tournaments`.`games` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tournaments`.`platforms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tournaments`.`platforms` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tournaments`.`tournaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tournaments`.`tournaments` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `type` INT(1) NULL COMMENT '1 - igraci; 2 - timovi',
  `tournamentgame` INT(5) NULL,
  `platform` INT(5) NULL,
  `tournamenttime` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fktournamentgame_idx` (`tournamentgame` ASC),
  INDEX `fktournamentplatform_idx` (`platform` ASC),
  CONSTRAINT `fktournamentgame`
    FOREIGN KEY (`tournamentgame`)
    REFERENCES `tournaments`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fktournamentplatform`
    FOREIGN KEY (`platform`)
    REFERENCES `tournaments`.`platforms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tournaments`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tournaments`.`team` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `capitan_id` INT(5) NULL,
  PRIMARY KEY (`id`),
  INDEX `fkplayerteam_idx` (`capitan_id` ASC),
  CONSTRAINT `fkplayerteam`
    FOREIGN KEY (`capitan_id`)
    REFERENCES `tournaments`.`players` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tournaments`.`tournament_entry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tournaments`.`tournament_entry` (
  `id` INT(9) NOT NULL AUTO_INCREMENT,
  `playerid` INT(5) NULL,
  `teamid` INT(5) NULL,
  `tournamentid` INT(5) NOT NULL,
  `status` INT(1) NULL COMMENT '0 - wait verification; 1 - accepted',
  PRIMARY KEY (`id`),
  INDEX `fkteamidentry_idx` (`playerid` ASC),
  INDEX `fktournamentidentry_idx` (`tournamentid` ASC),
  INDEX `fkteamidentry_idx1` (`teamid` ASC),
  CONSTRAINT `fkplayeridentry`
    FOREIGN KEY (`playerid`)
    REFERENCES `tournaments`.`players` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fktournamentidentry`
    FOREIGN KEY (`tournamentid`)
    REFERENCES `tournaments`.`tournaments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkteamidentry`
    FOREIGN KEY (`teamid`)
    REFERENCES `tournaments`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tournaments`.`playerteam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tournaments`.`playerteam` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `playerid` INT(5) NULL,
  `teamid` INT(5) NOT NULL,
  INDEX `fkplayerteamteam_idx` (`teamid` ASC),
  INDEX `fkplayerteamplayer_idx` (`playerid` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fkplayerteamteam`
    FOREIGN KEY (`teamid`)
    REFERENCES `tournaments`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkplayerteamplayer`
    FOREIGN KEY (`playerid`)
    REFERENCES `tournaments`.`players` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
