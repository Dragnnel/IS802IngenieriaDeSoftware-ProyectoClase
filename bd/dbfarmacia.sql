-- MySQL Script generated by MySQL Workbench
-- Wed Jun 26 23:02:57 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbfarmacia
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbfarmacia` ;

-- -----------------------------------------------------
-- Schema dbfarmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfarmacia` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `dbfarmacia` ;

-- -----------------------------------------------------
-- Table `dbfarmacia`.`Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Laboratorio` (
  `codigoLaboratorio` INT NOT NULL AUTO_INCREMENT,
  `nombreLaboratorio` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoLaboratorio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Sucursal` (
  `codigoSucursal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoSucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Estante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Estante` (
  `codigoEstante` INT NOT NULL AUTO_INCREMENT,
  `nombreEstante` VARCHAR(45) NULL,
  `codigoSucursal` INT NOT NULL,
  PRIMARY KEY (`codigoEstante`),
  CONSTRAINT `fk_Estante_Sucursal`
    FOREIGN KEY (`codigoSucursal`)
    REFERENCES `dbfarmacia`.`Sucursal` (`codigoSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Estante_Sucursal_idx` ON `dbfarmacia`.`Estante` (`codigoSucursal` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`CategoriaProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`CategoriaProducto` (
  `codigoCategoria` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Producto` (
  `codigoProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `precioCosto` DOUBLE NULL,
  `precioVenta` DOUBLE NULL,
  `fechaElaboracion` DATE NULL,
  `fechaVencimiento` DATE NULL,
  `fechaRegistro` DATETIME NULL,
  `lote` VARCHAR(45) NULL,
  `imagen` VARCHAR(45) NULL,
  `codigoCategoria` INT NOT NULL,
  PRIMARY KEY (`codigoProducto`),
  CONSTRAINT `fk_Producto_CategoriaProducto1`
    FOREIGN KEY (`codigoCategoria`)
    REFERENCES `dbfarmacia`.`CategoriaProducto` (`codigoCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Producto_CategoriaProducto1_idx` ON `dbfarmacia`.`Producto` (`codigoCategoria` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Medicamento` (
  `codigoMedicamento` INT NOT NULL AUTO_INCREMENT,
  `codigoLaboratorio` INT NOT NULL,
  `codigoProducto` INT NOT NULL,
  PRIMARY KEY (`codigoMedicamento`),
  CONSTRAINT `fk_Medicamento_Laboratorio1`
    FOREIGN KEY (`codigoLaboratorio`)
    REFERENCES `dbfarmacia`.`Laboratorio` (`codigoLaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicamento_Producto1`
    FOREIGN KEY (`codigoProducto`)
    REFERENCES `dbfarmacia`.`Producto` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Medicamento_Laboratorio1_idx` ON `dbfarmacia`.`Medicamento` (`codigoLaboratorio` ASC) VISIBLE;

CREATE INDEX `fk_Medicamento_Producto1_idx` ON `dbfarmacia`.`Medicamento` (`codigoProducto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Estante_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Estante_Medicamento` (
  `cubiculo` INT NULL,
  `codigoEstante` INT NOT NULL,
  `codigoMedicamento` INT NOT NULL,
  CONSTRAINT `fk_Estante_Medicamento_Estante1`
    FOREIGN KEY (`codigoEstante`)
    REFERENCES `dbfarmacia`.`Estante` (`codigoEstante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estante_Medicamento_Medicamento1`
    FOREIGN KEY (`codigoMedicamento`)
    REFERENCES `dbfarmacia`.`Medicamento` (`codigoMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Estante_Medicamento_Estante1_idx` ON `dbfarmacia`.`Estante_Medicamento` (`codigoEstante` ASC) VISIBLE;

CREATE INDEX `fk_Estante_Medicamento_Medicamento1_idx` ON `dbfarmacia`.`Estante_Medicamento` (`codigoMedicamento` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Persona` (
  `codigoPersona` INT NOT NULL AUTO_INCREMENT,
  `pnombre` VARCHAR(45) NOT NULL,
  `snombre` VARCHAR(45) NULL,
  `papellido` VARCHAR(45) NOT NULL,
  `sapellido` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `correoElectronico` VARCHAR(45) NULL,
  `numeroIdentidad` VARCHAR(45) NULL,
  `genero` VARCHAR(1) NULL,
  PRIMARY KEY (`codigoPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Empleado` (
  `codigoEmpleado` INT NOT NULL AUTO_INCREMENT,
  `fechaContratacion` DATETIME NULL,
  `codigoPersona` INT NOT NULL,
  PRIMARY KEY (`codigoEmpleado`))
ENGINE = EXAMPLE;

CREATE INDEX `fk_Empleado_Persona1_idx` ON `dbfarmacia`.`Empleado` (`codigoPersona` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Salida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Salida` (
  `codigoSalida` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `codigoSucursal` INT NOT NULL,
  `codigoEmpleado` INT NOT NULL,
  PRIMARY KEY (`codigoSalida`),
  CONSTRAINT `fk_Salida_Sucursal1`
    FOREIGN KEY (`codigoSucursal`)
    REFERENCES `dbfarmacia`.`Sucursal` (`codigoSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Salida_Empleado1`
    FOREIGN KEY (`codigoEmpleado`)
    REFERENCES `dbfarmacia`.`Empleado` (`codigoEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Salida_Sucursal1_idx` ON `dbfarmacia`.`Salida` (`codigoSucursal` ASC) VISIBLE;

CREATE INDEX `fk_Salida_Empleado1_idx` ON `dbfarmacia`.`Salida` (`codigoEmpleado` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`ProductoSalida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`ProductoSalida` (
  `cantidad` DOUBLE NULL,
  `codigoSalida` INT NOT NULL,
  `codigoProducto` INT NOT NULL,
  PRIMARY KEY (`codigoSalida`, `codigoProducto`),
  CONSTRAINT `fk_ProductoSalida_Salida1`
    FOREIGN KEY (`codigoSalida`)
    REFERENCES `dbfarmacia`.`Salida` (`codigoSalida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoSalida_Producto1`
    FOREIGN KEY (`codigoProducto`)
    REFERENCES `dbfarmacia`.`Producto` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ProductoSalida_Producto1_idx` ON `dbfarmacia`.`ProductoSalida` (`codigoProducto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Entrada` (
  `codigoEntrada` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `codigoEmpleado` INT NOT NULL,
  PRIMARY KEY (`codigoEntrada`),
  CONSTRAINT `fk_Entrada_Empleado1`
    FOREIGN KEY (`codigoEmpleado`)
    REFERENCES `dbfarmacia`.`Empleado` (`codigoEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Entrada_Empleado1_idx` ON `dbfarmacia`.`Entrada` (`codigoEmpleado` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`ProductoEntrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`ProductoEntrada` (
  `cantidad` DOUBLE NULL,
  `codigoProducto` INT NOT NULL,
  `codigoEntrada` INT NOT NULL,
  PRIMARY KEY (`codigoProducto`, `codigoEntrada`),
  CONSTRAINT `fk_ProductoEntrada_Producto1`
    FOREIGN KEY (`codigoProducto`)
    REFERENCES `dbfarmacia`.`Producto` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoEntrada_Entrada1`
    FOREIGN KEY (`codigoEntrada`)
    REFERENCES `dbfarmacia`.`Entrada` (`codigoEntrada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ProductoEntrada_Producto1_idx` ON `dbfarmacia`.`ProductoEntrada` (`codigoProducto` ASC) VISIBLE;

CREATE INDEX `fk_ProductoEntrada_Entrada1_idx` ON `dbfarmacia`.`ProductoEntrada` (`codigoEntrada` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`FormaPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`FormaPago` (
  `codigoFormaPago` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `estado` VARCHAR(1) NULL,
  PRIMARY KEY (`codigoFormaPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Descuento` (
  `codigoDescuento` INT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `valor` DOUBLE NULL,
  `estado` VARCHAR(1) NULL,
  PRIMARY KEY (`codigoDescuento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Cliente` (
  `codigoCliente` INT NOT NULL AUTO_INCREMENT,
  `fechaRegistro` DATETIME NULL,
  `codigoPersona` INT NOT NULL,
  PRIMARY KEY (`codigoCliente`),
  CONSTRAINT `fk_Cliente_Persona1`
    FOREIGN KEY (`codigoPersona`)
    REFERENCES `dbfarmacia`.`Persona` (`codigoPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_Persona1_idx` ON `dbfarmacia`.`Cliente` (`codigoPersona` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Factura` (
  `codigoFactura` INT NOT NULL,
  `fecha` DATE NULL,
  `observaciones` VARCHAR(45) NULL,
  `codigoFormaPago` INT NOT NULL,
  `codigoCliente` INT NOT NULL,
  PRIMARY KEY (`codigoFactura`),
  CONSTRAINT `fk_Factura_FormaPago1`
    FOREIGN KEY (`codigoFormaPago`)
    REFERENCES `dbfarmacia`.`FormaPago` (`codigoFormaPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Cliente1`
    FOREIGN KEY (`codigoCliente`)
    REFERENCES `dbfarmacia`.`Cliente` (`codigoCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Factura_FormaPago1_idx` ON `dbfarmacia`.`Factura` (`codigoFormaPago` ASC) VISIBLE;

CREATE INDEX `fk_Factura_Cliente1_idx` ON `dbfarmacia`.`Factura` (`codigoCliente` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`FacturaDetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`FacturaDetalle` (
  `cantidad` DOUBLE NULL,
  `codigoProducto` INT NOT NULL,
  `codigoFactura` INT NOT NULL,
  CONSTRAINT `fk_FacturaDetalle_Producto1`
    FOREIGN KEY (`codigoProducto`)
    REFERENCES `dbfarmacia`.`Producto` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaDetalle_Factura1`
    FOREIGN KEY (`codigoFactura`)
    REFERENCES `dbfarmacia`.`Factura` (`codigoFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FacturaDetalle_Producto1_idx` ON `dbfarmacia`.`FacturaDetalle` (`codigoProducto` ASC) VISIBLE;

CREATE INDEX `fk_FacturaDetalle_Factura1_idx` ON `dbfarmacia`.`FacturaDetalle` (`codigoFactura` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Factura_Descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Factura_Descuento` (
  `codigoFactura` INT NOT NULL,
  `codigoDescuento` INT NOT NULL,
  CONSTRAINT `fk_Factura_has_Descuento_Factura1`
    FOREIGN KEY (`codigoFactura`)
    REFERENCES `dbfarmacia`.`Factura` (`codigoFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Descuento_Descuento1`
    FOREIGN KEY (`codigoDescuento`)
    REFERENCES `dbfarmacia`.`Descuento` (`codigoDescuento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Factura_has_Descuento_Descuento1_idx` ON `dbfarmacia`.`Factura_Descuento` (`codigoDescuento` ASC) VISIBLE;

CREATE INDEX `fk_Factura_has_Descuento_Factura1_idx` ON `dbfarmacia`.`Factura_Descuento` (`codigoFactura` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`TarjetaAcumulacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`TarjetaAcumulacion` (
  `codigoTarjetaAcumulacion` INT NOT NULL AUTO_INCREMENT,
  `fechaRegistro` DATETIME NULL,
  `puntos` DOUBLE NULL,
  `Cliente_codigoCliente` INT NOT NULL,
  PRIMARY KEY (`codigoTarjetaAcumulacion`),
  CONSTRAINT `fk_TarjetaAcumulacion_Cliente1`
    FOREIGN KEY (`Cliente_codigoCliente`)
    REFERENCES `dbfarmacia`.`Cliente` (`codigoCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_TarjetaAcumulacion_Cliente1_idx` ON `dbfarmacia`.`TarjetaAcumulacion` (`Cliente_codigoCliente` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`TipoMovimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`TipoMovimiento` (
  `codigoTipoMovimiento` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoTipoMovimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfarmacia`.`Movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfarmacia`.`Movimiento` (
  `codigoMovimiento` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `monto` DOUBLE NULL,
  `codigoTipoMovimiento` INT NOT NULL,
  `codigoTarjetaAcumulacion` INT NOT NULL,
  PRIMARY KEY (`codigoMovimiento`),
  CONSTRAINT `fk_Movimiento_TipoMovimiento1`
    FOREIGN KEY (`codigoTipoMovimiento`)
    REFERENCES `dbfarmacia`.`TipoMovimiento` (`codigoTipoMovimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimiento_TarjetaAcumulacion1`
    FOREIGN KEY (`codigoTarjetaAcumulacion`)
    REFERENCES `dbfarmacia`.`TarjetaAcumulacion` (`codigoTarjetaAcumulacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Movimiento_TipoMovimiento1_idx` ON `dbfarmacia`.`Movimiento` (`codigoTipoMovimiento` ASC) VISIBLE;

CREATE INDEX `fk_Movimiento_TarjetaAcumulacion1_idx` ON `dbfarmacia`.`Movimiento` (`codigoTarjetaAcumulacion` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
