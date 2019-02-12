CREATE DATABASE IF NOT EXISTS TicketDatabase;
USE TicketDatabase;

-- --------------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`venue` (
  `venue_name` VARCHAR(255) NOT NULL,
  `occupancy` INT(6) NULL,
  `address` VARCHAR(255) NULL,
  `type` VARCHAR(255) NULL,
  PRIMARY KEY (`venue_name`))
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`artist` (
  `artist_name` VARCHAR(100) NOT NULL,
  `act_type` VARCHAR(45) NULL,
  PRIMARY KEY (`artist_name`))
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`concert` (
  `concert_number` INT(3) NOT NULL,
  `tickets_sold` INT NULL,
  PRIMARY KEY (`concert_number`))
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`customer` (
  `customer_id` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`ticket` (
  `concert_number` INT(3) NOT NULL,
  `ticket_number` INT(4) NOT NULL,
  `seat_number` VARCHAR(3) NOT NULL UNIQUE,
  `price` DOUBLE NULL,
  PRIMARY KEY (`ticket_number`, `concert_number`),
  UNIQUE INDEX `seat_number_UNIQUE` (`seat_number` ASC))
ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`ampitheatre` (
  `venue_name` VARCHAR(255) NOT NULL,
  `set_type` VARCHAR(45) NULL,
  PRIMARY KEY (`venue_name`),
  CONSTRAINT `venue_name_fk_amp`
    FOREIGN KEY (`venue_name`)
    REFERENCES `TicketDatabase`.`venue` (`venue_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`opera_house` (
  `venue_name` VARCHAR(255) NOT NULL,
  `orchestra_type` VARCHAR(45) NULL,
  PRIMARY KEY (`venue_name`),
  CONSTRAINT `venue_name_fk_opera`
    FOREIGN KEY (`venue_name`)
    REFERENCES `TicketDatabase`.`venue` (`venue_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`rock_hall` (
  `venue_name` VARCHAR(255) NOT NULL,
  `music_genre` VARCHAR(45) NULL,
  PRIMARY KEY (`venue_name`),
  CONSTRAINT `venue_name_fk_rock`
    FOREIGN KEY (`venue_name`)
    REFERENCES `TicketDatabase`.`venue` (`venue_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`stadium` (
  `venue_name` VARCHAR(255) NOT NULL,
  `view_position` VARCHAR(45) NULL,
  PRIMARY KEY (`venue_name`),
  CONSTRAINT `venue_name_fk_stadium`
    FOREIGN KEY (`venue_name`)
    REFERENCES `TicketDatabase`.`venue` (`venue_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`hosts` (
  `concert_number` INT(3) NOT NULL,
  `artist_name` VARCHAR(100) NOT NULL,
  `venue_name` VARCHAR(255) NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`concert_number`, `venue_name`),
  INDEX `venue_name_idx` (`venue_name` ASC),
  CONSTRAINT `venue_name_fk_hosts`
    FOREIGN KEY (`venue_name`)
    REFERENCES `TicketDatabase`.`venue` (`venue_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `concert_number_fk_hosts`
    FOREIGN KEY (`concert_number`)
    REFERENCES `TicketDatabase`.`concert` (`concert_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `artist_name_fk_hosts` 
    FOREIGN KEY (`artist_name`) 
    REFERENCES `TicketDatabase`.`artist` (`artist_name`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`purchases` (
  `customer_id` VARCHAR(45) NOT NULL,
  `concert_number` INT(3) NULL,
  `ticket_number` INT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `concert_name_idx` (`concert_number` ASC),
  INDEX `ticket_number_idx` (`ticket_number` ASC),
  CONSTRAINT `concert_name_fk_purchases`
    FOREIGN KEY (`concert_number`)
    REFERENCES `TicketDatabase`.`concert` (`concert_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ticket_number_fk_purchases`
    FOREIGN KEY (`ticket_number`)
    REFERENCES `TicketDatabase`.`ticket` (`ticket_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`schedules` (
  `artist_name` VARCHAR(100) NOT NULL,
  `venue_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`artist_name`, `venue_name`),
  INDEX `venue_name_idx` (`venue_name` ASC),
  CONSTRAINT `artist_name_fk_schedules`
    FOREIGN KEY (`artist_name`)
    REFERENCES `TicketDatabase`.`artist` (`artist_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `venue_name_fk_schedules`
    FOREIGN KEY (`venue_name`)
    REFERENCES `TicketDatabase`.`venue` (`venue_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TicketDatabase`.`sells` (
  `venue_name` VARCHAR(255) NOT NULL,
  `concert_number` INT(3) NOT NULL,
  `ticket_number` INT NOT NULL,
  `seat_number` VARCHAR(3) NOT NULL UNIQUE,
  PRIMARY KEY (`venue_name`, `concert_number`, `ticket_number`),
  INDEX `concert_number_idx` (`concert_number` ASC),
  INDEX `ticket_number_idx` (`ticket_number` ASC),
  INDEX `seat_number_idx` (`seat_number` ASC),
  CONSTRAINT `venue_name_fk_sells`
    FOREIGN KEY (`venue_name`)
    REFERENCES `TicketDatabase`.`venue` (`venue_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `concert_number_fk_sells`
    FOREIGN KEY (`concert_number`)
    REFERENCES `TicketDatabase`.`concert` (`concert_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ticket_number_fk_sells`
    FOREIGN KEY (`ticket_number`)
    REFERENCES `TicketDatabase`.`ticket` (`ticket_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `seat_number_fk_sells`
    FOREIGN KEY (`seat_number`)
    REFERENCES `TicketDatabase`.`ticket` (`seat_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `TicketDatabase`.`has` (
  `concert_number` INT(3) NOT NULL,
  `ticket_number` INT NOT NULL,
  `seat_number` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`concert_number`, `ticket_number`, `seat_number`),
  INDEX `ticket_number_idx` (`ticket_number` ASC),
  INDEX `seat_number_idx` (`seat_number` ASC),
  CONSTRAINT `concert_number_fk_has`
    FOREIGN KEY (`concert_number`)
    REFERENCES `TicketDatabase`.`concert` (`concert_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ticket_number_fk_has`
    FOREIGN KEY (`ticket_number`)
    REFERENCES `TicketDatabase`.`ticket` (`ticket_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `seat_number_fk_has`
    FOREIGN KEY (`seat_number`)
    REFERENCES `TicketDatabase`.`ticket` (`seat_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

SET FOREIGN_KEY_CHECKS=1;



