-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema DBTMM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBTMM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBTMM` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `DBTMM` ;

-- -----------------------------------------------------
-- Table `DBTMM`.`Parola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTMM`.`Parola` (
  `Parola_pk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `Lingua` SET('IT', 'EN') NOT NULL,
  PRIMARY KEY (`Parola_pk`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBTMM`.`ScritturaGenerale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTMM`.`ScritturaGenerale` (
  `ScritturaGenerale` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `Parola_fk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  UNIQUE INDEX `SG_Parola&ScritturaGenerale_UNIQUE` (`ScritturaGenerale` ASC, `Parola_fk` ASC) VISIBLE,
  UNIQUE INDEX `SG_Parola_fk_INIQUE` (`Parola_fk` ASC) VISIBLE,
  INDEX `SG_Parola_fk_idx` (`Parola_fk` ASC) VISIBLE,
  CONSTRAINT `SG_Parola_fk`
    FOREIGN KEY (`Parola_fk`)
    REFERENCES `DBTMM`.`Parola` (`Parola_pk`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `DBTMM`.`Descrizione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTMM`.`Descrizione` (
  `Parola_fk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `Descrizione` TEXT CHARACTER SET 'utf8' NOT NULL,
  `LinguaDesc` SET('IT', 'EN') NOT NULL,
  `ScritturaGenerale_fk` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  UNIQUE INDEX `DE_Parola&testo_UNIQUE` (`Parola_fk` ASC, `Descrizione`(500) ASC) VISIBLE,
  INDEX `DE_Parola_fk_idx` (`Parola_fk` ASC) VISIBLE,
  INDEX `DE_ScritturaGenerale_fk_idx` (`ScritturaGenerale_fk` ASC) VISIBLE,
  CONSTRAINT `DE_Parola_fk`
    FOREIGN KEY (`Parola_fk`)
    REFERENCES `DBTMM`.`Parola` (`Parola_pk`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DE_ScritturaGenerale_fk`
    FOREIGN KEY (`ScritturaGenerale_fk`)
    REFERENCES `DBTMM`.`ScritturaGenerale` (`ScritturaGenerale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBTMM`.`Esempi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTMM`.`Esempi` (
  `Parola_fk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `Esempio` TEXT CHARACTER SET 'utf8' NOT NULL,
  `LinguaEsempio` SET('IT', 'EN') NOT NULL,
  `ScritturaGenerale_fk` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  UNIQUE INDEX `ES_Parola&Esempio_UNIQUE` (`Parola_fk` ASC, `Esempio`(500) ASC) VISIBLE,
  INDEX `ES_Parola_fk_idx` (`Parola_fk` ASC) VISIBLE,
  INDEX `ES_ScritturaGenerale_fk_idx` (`ScritturaGenerale_fk` ASC) VISIBLE,
  CONSTRAINT `ES_Parola_fk`
    FOREIGN KEY (`Parola_fk`)
    REFERENCES `DBTMM`.`Parola` (`Parola_pk`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ES_ScritturaGenerale_fk`
    FOREIGN KEY (`ScritturaGenerale_fk`)
    REFERENCES `DBTMM`.`ScritturaGenerale` (`ScritturaGenerale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBTMM`.`Sinonimi(P-P)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTMM`.`Sinonimi(P-P)` (
  `SI_ParolaA_fk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `SI_ParolaB_fk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  UNIQUE INDEX `SI_ParolaA&ParolaB_UNIQUE` (`SI_ParolaA_fk` ASC, `SI_ParolaB_fk` ASC) VISIBLE,
  INDEX `SI_ParolaA_fk_idx` (`SI_ParolaA_fk` ASC) VISIBLE,
  INDEX `SI_ParolaB_fk_idx` (`SI_ParolaB_fk` ASC) VISIBLE,
  CONSTRAINT `SI_ParolaA_fk`
    FOREIGN KEY (`SI_ParolaA_fk`)
    REFERENCES `DBTMM`.`Parola` (`Parola_pk`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `SI_ParolaB_fk`
    FOREIGN KEY (`SI_ParolaB_fk`)
    REFERENCES `DBTMM`.`Parola` (`Parola_pk`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DBTMM`.`Traduzione(P-P)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTMM`.`Traduzione(P-P)` (
  `TR_ParolaIT_fk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `TR_ParolaEN_fk` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  UNIQUE INDEX `TR_ParolaIT&ParolaEN_UNIQUE` (`TR_ParolaIT_fk` ASC, `TR_ParolaEN_fk` ASC) VISIBLE,
  INDEX `TR_ParolaIT_fk_idx` (`TR_ParolaIT_fk` ASC) VISIBLE,
  INDEX `TR_ParolaEN_fk_idx` (`TR_ParolaEN_fk` ASC) VISIBLE,
  CONSTRAINT `TR_ParolaEN_fk`
    FOREIGN KEY (`TR_ParolaEN_fk`)
    REFERENCES `DBTMM`.`Parola` (`Parola_pk`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `TR_ParolaIT_fk`
    FOREIGN KEY (`TR_ParolaIT_fk`)
    REFERENCES `DBTMM`.`Parola` (`Parola_pk`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `DBTMM`;

DELIMITER $$
USE `DBTMM`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `DBTMM`.`Parola_AFTER_INSERT`
AFTER INSERT ON `DBTMM`.`Parola`
FOR EACH ROW
BEGIN
IF new.Lingua = "IT" THEN
	INSERT IGNORE INTO `DBTMM`.`ScritturaGenerale`(`Parola_fk`, `ScritturaGenerale`) VALUES
	(new.Parola_pk, new.Parola_pk);
END IF;
END$$

USE `DBTMM`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `DBTMM`.`Parola_BEFORE_INSERT`
BEFORE INSERT ON `DBTMM`.`Parola`
FOR EACH ROW
BEGIN
SET new.Parola_pk = UPPER(new.Parola_pk);
END$$

USE `DBTMM`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `DBTMM`.`Sinonimi(P-P)_BEFORE_INSERT`
BEFORE INSERT ON `DBTMM`.`Sinonimi(P-P)`
FOR EACH ROW
BEGIN
IF (new.SI_ParolaA_fk = new.SI_ParolaB_fk) THEN
	SET new.SI_ParolaA_fk = NULL,
		new.SI_ParolaB_fk = NULL;
END IF;
END$$

USE `DBTMM`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `DBTMM`.`Traduzione(P-P)_BEFORE_INSERT`
BEFORE INSERT ON `DBTMM`.`Traduzione(P-P)`
FOR EACH ROW
BEGIN

IF((SELECT `Parola`.`Lingua` FROM `Parola` WHERE `Parola_pk` = new.TR_ParolaIT_fk) <> 'IT') THEN
    SET new.TR_ParolaIT_fk = NULL;
ELSEIF((SELECT `Parola`.`Lingua` FROM `Parola` WHERE `Parola_pk` = new.TR_ParolaEN_fk) <> 'EN') THEN
	SET new.TR_ParolaEN_fk = NULL;
END IF;

END$$


DELIMITER ;
