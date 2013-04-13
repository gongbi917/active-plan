DROP DATABASE IF EXISTS active_plan; 
CREATE DATABASE active_plan;
USE active_plan;

SET foreign_key_checks=0;

CREATE TABLE user (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL UNIQUE,
  password varchar(45) NOT NULL,
  email varchar(45) NOT NULL UNIQUE,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET foreign_key_checks=1;