-- MySQL Script generated by MySQL Workbench
-- 07/25/16 10:47:03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hydb` ;

-- -----------------------------------------------------
-- Schema hydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hydb` DEFAULT CHARACTER SET utf8 ;
USE `hydb` ;

-- -----------------------------------------------------
-- Table `hydb`.`m_department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hydb`.`m_department` ;

CREATE TABLE IF NOT EXISTS `hydb`.`m_department` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hydb`.`t_position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hydb`.`t_position` ;

CREATE TABLE IF NOT EXISTS `hydb`.`t_position` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `department_id` BIGINT NOT NULL COMMENT '部门ID',
  `name` VARCHAR(45) NOT NULL COMMENT '职位名称',
  `address` VARCHAR(45) NOT NULL COMMENT '工作地址',
  `duty` TEXT NOT NULL COMMENT '职责',
  `recruitment` TEXT NOT NULL COMMENT '招聘条件',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `fk_t_position_m_department_idx` (`department_id` ASC),
  CONSTRAINT `fk_t_position_m_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `hydb`.`m_department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hydb`.`t_news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hydb`.`t_news` ;

CREATE TABLE IF NOT EXISTS `hydb`.`t_news` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(200) NOT NULL COMMENT '图片',
  `title` VARCHAR(100) NOT NULL COMMENT '标题',
  `content` TEXT NOT NULL,
  `type` INT NOT NULL COMMENT '1:公司，2行业',
  `create_time` DATETIME NOT NULL,
  `update_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hydb`.`t_banner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hydb`.`t_banner` ;

CREATE TABLE IF NOT EXISTS `hydb`.`t_banner` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(85) NOT NULL COMMENT '图片地址',
  `title` VARCHAR(45) NULL COMMENT '标题',
  `content` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hydb`.`t_home`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hydb`.`t_home` ;

CREATE TABLE IF NOT EXISTS `hydb`.`t_home` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `create_time` DATETIME NOT NULL,
  `update_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
