-- springuser table
CREATE TABLE `scott`.`springuser` (
  `id` INT NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- board table 