CREATE SCHEMA `bdsistemapedidos`;

CREATE TABLE IF NOT EXISTS `bdsistemapedidos`.`cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(15) NOT NULL UNIQUE KEY,
  `nome` VARCHAR(30) NOT NULL,
  `sobrenome` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  INDEX `uk01` (`cpf` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bdsistemapedidos`.`produto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,  
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bdsistemapedidos`.`pedido` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `data` VARCHAR(10) NOT NULL,
  `id_cliente` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk01_idx` (`id_cliente` ASC),
  CONSTRAINT `fk01`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `bdsistemapedidos`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bdsistemapedidos`.`item_do_pedido` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` INT(11) NOT NULL,
  `id_produto` INT(11) NOT NULL,
  `qtdade` INT(11) NOT NULL,
  INDEX `fk_item_do_pedido_produto1_idx` (`id_produto` ASC),
  INDEX `fk_item_do_pedido_pedido1_idx` (`id_pedido` ASC),
  PRIMARY KEY (`id`, `id_pedido`, `id_produto`),
  CONSTRAINT `fk_item_do_pedido_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `bdsistemapedidos`.`produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_do_pedido_pedido1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `bdsistemapedidos`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

