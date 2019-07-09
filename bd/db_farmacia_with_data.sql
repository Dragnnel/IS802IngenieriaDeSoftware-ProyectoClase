-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2019 a las 06:37:32
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidad`
--

CREATE TABLE `cantidad` (
  `idCantidad` int(11) NOT NULL,
  `cantidadCaja` int(11) DEFAULT NULL,
  `precioVentaCaja` float DEFAULT NULL,
  `cantidadBlister` int(11) DEFAULT NULL,
  `precioVentaBlister` float DEFAULT NULL,
  `cantidadUnidad` int(11) DEFAULT NULL,
  `precioVentaUnidad` float DEFAULT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidadentrante`
--

CREATE TABLE `cantidadentrante` (
  `idCantidad` int(11) NOT NULL,
  `cantidadCaja` int(11) DEFAULT NULL,
  `precioCostoCaja` float DEFAULT NULL,
  `cantidaBlister` int(11) DEFAULT NULL,
  `precioCostoBlister` float DEFAULT NULL,
  `cantidadUnidad` int(11) DEFAULT NULL,
  `precioCostoUnidad` float DEFAULT NULL,
  `idProveedor` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idTipoCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicionespecial`
--

CREATE TABLE `condicionespecial` (
  `idCondicionEspecial` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cubiculo`
--

CREATE TABLE `cubiculo` (
  `idcubiculo` int(11) NOT NULL,
  `nombreCubiculo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `idDescuento` int(11) NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje del descuento que se va a dar.',
  `idTipoDescuento` int(11) NOT NULL,
  `fechaEmision` date DEFAULT NULL,
  `fechaExpiro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento_has_factura`
--

CREATE TABLE `descuento_has_factura` (
  `idDescuento` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idTipoEmpleado` int(11) NOT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contrasenia` varchar(45) DEFAULT NULL,
  `direccionImagen` varchar(10000) DEFAULT NULL,
  `Empleadocol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estante`
--

CREATE TABLE `estante` (
  `idEstante` int(11) NOT NULL,
  `numeroEstante` varchar(45) DEFAULT NULL,
  `cubiculo_idcubiculo` int(11) NOT NULL,
  `Sucursal_idSucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `subTotal` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `impuesto` float DEFAULT NULL,
  `Total` float NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idImpuesto` int(11) NOT NULL,
  `RTN` varchar(45) DEFAULT NULL,
  `idEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_has_formapago`
--

CREATE TABLE `factura_has_formapago` (
  `idFactura` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `cantidadPago` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_has_producto`
--

CREATE TABLE `factura_has_producto` (
  `Factura_idFactura` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `cantidadCaja` int(11) DEFAULT NULL,
  `cantidadBlister` int(11) DEFAULT NULL,
  `cantidadUnidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

CREATE TABLE `formapago` (
  `idFormaPago` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

CREATE TABLE `impuesto` (
  `idImpuesto` int(11) NOT NULL,
  `impuesto` float NOT NULL COMMENT 'Porcentaje del impuesto establecido.',
  `fechaVigencia` date DEFAULT NULL,
  `fechaExpiracion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idInventario`, `idSucursal`, `descripcion`) VALUES
(1, 1, 'Inventario x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `idMedicamento` int(11) NOT NULL,
  `indicacion` varchar(1000) DEFAULT NULL,
  `elaboracion` varchar(1000) DEFAULT NULL COMMENT 'Campo para describir con que materiales/quimicos fue hecho el producto.',
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento_has_salida`
--

CREATE TABLE `medicamento_has_salida` (
  `idMedicamento` int(11) NOT NULL,
  `idSalida` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `idMovimientos` int(11) NOT NULL,
  `fechaHora` datetime DEFAULT NULL,
  `cantidadPuntos` int(11) DEFAULT NULL,
  `idTarjetaAcumulacion` int(11) NOT NULL,
  `idTipoMovimiento` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `pnombre` varchar(45) NOT NULL,
  `snombre` varchar(45) DEFAULT NULL,
  `papellido` varchar(45) NOT NULL,
  `sapellido` varchar(45) DEFAULT NULL,
  `identidad` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `idCondicionEspecial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `fechaElaboracion` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `precioVenta` float NOT NULL,
  `precioCosto` float NOT NULL,
  `direccionImagen` varchar(10000) DEFAULT NULL,
  `idInventario` int(11) NOT NULL,
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `fechaElaboracion`, `fechaVencimiento`, `serie`, `lote`, `precioVenta`, `precioCosto`, `direccionImagen`, `idInventario`, `fechaRegistro`) VALUES
(1, 'Loratsuydsujh', '2019-07-08', '2019-07-08', 'Serie 1', 'Lote 1', 600, 20, 'imagen1.jpg', 1, '2019-07-08'),
(2, 'Aspirina', '2019-07-08', '2019-07-08', 'Serie 1', 'Lote 1', 20, 20, 'imagen32', 1, '2019-07-08'),
(3, 'Vitaflenaco', '2019-07-02', '2019-07-30', 'serie3', 'Lote 2', 21, 16, 'imagen3.jpg', 1, '2019-07-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosvarios`
--

CREATE TABLE `productosvarios` (
  `idProductosVarios` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_categoria`
--

CREATE TABLE `producto_has_categoria` (
  `Producto_idProducto` int(11) NOT NULL,
  `Categoria_idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_cubiculo`
--

CREATE TABLE `producto_has_cubiculo` (
  `Producto_idProducto` int(11) NOT NULL,
  `cubiculo_idcubiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `RTN` varchar(45) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `direccion` varchar(1000) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_has_medicamento`
--

CREATE TABLE `proveedor_has_medicamento` (
  `Proveedor_idProveedor` int(11) NOT NULL,
  `Medicamento_idMedicamento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaIngreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `idSalida` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `observacion` varchar(3000) DEFAULT NULL,
  `idSucursalLlegada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(1000) NOT NULL,
  `telefono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idSucursal`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Santa Monica UNAH', 'Santa Monica UNAH', '9999-9999');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetaacumulacion`
--

CREATE TABLE `tarjetaacumulacion` (
  `idTarjetaAcumulacion` int(11) NOT NULL,
  `fechaEmision` date DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `idTipoTarjeta` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `idTelefono` int(11) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `tipoTelefono` varchar(45) DEFAULT NULL COMMENT 'El numero de telefono puede ser:\n-Empresarial: Tigo o Claro\n-Casa\n-Trabajo\n-Personal',
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocliente`
--

CREATE TABLE `tipocliente` (
  `idTipoCliente` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL COMMENT '-Normal\n-especial\n-etc...'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodescuento`
--

CREATE TABLE `tipodescuento` (
  `idTipoDescuento` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

CREATE TABLE `tipoempleado` (
  `idTipoEmpleado` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL COMMENT '-Gerente\n-Farmaceutico\n-Conserje\n-etc...'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomovimiento`
--

CREATE TABLE `tipomovimiento` (
  `idTipoMovimiento` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotarjeta`
--

CREATE TABLE `tipotarjeta` (
  `idTipoTarjeta` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  ADD PRIMARY KEY (`idCantidad`),
  ADD KEY `fk_Cantidad_Producto1` (`idProducto`);

--
-- Indices de la tabla `cantidadentrante`
--
ALTER TABLE `cantidadentrante`
  ADD PRIMARY KEY (`idCantidad`),
  ADD KEY `fk_CantidadEntrante_Proveedor_has_Medicamento1` (`idProveedor`,`idMedicamento`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_Cliente_Persona1` (`idPersona`),
  ADD KEY `fk_Cliente_TipoCliente1` (`idTipoCliente`);

--
-- Indices de la tabla `condicionespecial`
--
ALTER TABLE `condicionespecial`
  ADD PRIMARY KEY (`idCondicionEspecial`);

--
-- Indices de la tabla `cubiculo`
--
ALTER TABLE `cubiculo`
  ADD PRIMARY KEY (`idcubiculo`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`idDescuento`),
  ADD KEY `fk_Descuento_TipoDescuento1` (`idTipoDescuento`);

--
-- Indices de la tabla `descuento_has_factura`
--
ALTER TABLE `descuento_has_factura`
  ADD PRIMARY KEY (`idDescuento`,`idFactura`),
  ADD KEY `fk_Descuento_has_Factura_Factura1` (`idFactura`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `fk_Empleado_Persona1` (`idPersona`),
  ADD KEY `fk_Empleado_TipoEmpleado1` (`idTipoEmpleado`),
  ADD KEY `fk_Empleado_Sucursal1` (`idSucursal`);

--
-- Indices de la tabla `estante`
--
ALTER TABLE `estante`
  ADD PRIMARY KEY (`idEstante`),
  ADD KEY `fk_Estante_cubiculo1` (`cubiculo_idcubiculo`),
  ADD KEY `fk_Estante_Sucursal1` (`Sucursal_idSucursal`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `fk_Factura_Cliente1` (`idCliente`),
  ADD KEY `fk_Factura_Impuesto1` (`idImpuesto`),
  ADD KEY `fk_Factura_Empleado1` (`idEmpleado`);

--
-- Indices de la tabla `factura_has_formapago`
--
ALTER TABLE `factura_has_formapago`
  ADD PRIMARY KEY (`idFactura`,`idFormaPago`),
  ADD KEY `fk_Factura_has_FormaPago_FormaPago1` (`idFormaPago`);

--
-- Indices de la tabla `factura_has_producto`
--
ALTER TABLE `factura_has_producto`
  ADD PRIMARY KEY (`Factura_idFactura`,`Producto_idProducto`),
  ADD KEY `fk_Factura_has_Producto_Producto1` (`Producto_idProducto`);

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`idFormaPago`);

--
-- Indices de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  ADD PRIMARY KEY (`idImpuesto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `fk_Inventario_Sucursal1` (`idSucursal`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`idMedicamento`),
  ADD KEY `fk_Medicamento_Producto1` (`idProducto`);

--
-- Indices de la tabla `medicamento_has_salida`
--
ALTER TABLE `medicamento_has_salida`
  ADD PRIMARY KEY (`idMedicamento`,`idSalida`),
  ADD KEY `fk_Medicamento_has_Salida_Salida1` (`idSalida`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`idMovimientos`),
  ADD KEY `fk_Movimientos_TarjetaAcumulacion1` (`idTarjetaAcumulacion`),
  ADD KEY `fk_Movimientos_TipoMovimiento1` (`idTipoMovimiento`),
  ADD KEY `fk_Movimientos_Empleado1` (`idEmpleado`),
  ADD KEY `fk_Movimientos_Factura1` (`idFactura`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `fk_Persona_CondicionEspecial1` (`idCondicionEspecial`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_Producto_Inventario1` (`idInventario`);

--
-- Indices de la tabla `productosvarios`
--
ALTER TABLE `productosvarios`
  ADD PRIMARY KEY (`idProductosVarios`),
  ADD KEY `fk_ProductosVarios_Producto1` (`idProducto`);

--
-- Indices de la tabla `producto_has_categoria`
--
ALTER TABLE `producto_has_categoria`
  ADD PRIMARY KEY (`Producto_idProducto`,`Categoria_idCategoria`),
  ADD KEY `fk_Producto_has_Categoria_Categoria1` (`Categoria_idCategoria`);

--
-- Indices de la tabla `producto_has_cubiculo`
--
ALTER TABLE `producto_has_cubiculo`
  ADD PRIMARY KEY (`Producto_idProducto`,`cubiculo_idcubiculo`),
  ADD KEY `fk_Producto_has_cubiculo_cubiculo1` (`cubiculo_idcubiculo`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `proveedor_has_medicamento`
--
ALTER TABLE `proveedor_has_medicamento`
  ADD PRIMARY KEY (`Proveedor_idProveedor`,`Medicamento_idMedicamento`),
  ADD KEY `fk_Proveedor_has_Medicamento_Medicamento1` (`Medicamento_idMedicamento`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`idSalida`),
  ADD KEY `fk_Salida_Sucursal1` (`idSucursalLlegada`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idSucursal`);

--
-- Indices de la tabla `tarjetaacumulacion`
--
ALTER TABLE `tarjetaacumulacion`
  ADD PRIMARY KEY (`idTarjetaAcumulacion`),
  ADD KEY `fk_TarjetaAcumulacion_TipoTarjeta1` (`idTipoTarjeta`),
  ADD KEY `fk_TarjetaAcumulacion_Cliente1` (`idCliente`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`idTelefono`),
  ADD KEY `fk_Telefono_Persona` (`idPersona`);

--
-- Indices de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  ADD PRIMARY KEY (`idTipoCliente`);

--
-- Indices de la tabla `tipodescuento`
--
ALTER TABLE `tipodescuento`
  ADD PRIMARY KEY (`idTipoDescuento`);

--
-- Indices de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  ADD PRIMARY KEY (`idTipoEmpleado`);

--
-- Indices de la tabla `tipomovimiento`
--
ALTER TABLE `tipomovimiento`
  ADD PRIMARY KEY (`idTipoMovimiento`);

--
-- Indices de la tabla `tipotarjeta`
--
ALTER TABLE `tipotarjeta`
  ADD PRIMARY KEY (`idTipoTarjeta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  MODIFY `idCantidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cantidadentrante`
--
ALTER TABLE `cantidadentrante`
  MODIFY `idCantidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `condicionespecial`
--
ALTER TABLE `condicionespecial`
  MODIFY `idCondicionEspecial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `idDescuento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estante`
--
ALTER TABLE `estante`
  MODIFY `idEstante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formapago`
--
ALTER TABLE `formapago`
  MODIFY `idFormaPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  MODIFY `idImpuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `idMovimientos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idSucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tarjetaacumulacion`
--
ALTER TABLE `tarjetaacumulacion`
  MODIFY `idTarjetaAcumulacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `idTelefono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  MODIFY `idTipoCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodescuento`
--
ALTER TABLE `tipodescuento`
  MODIFY `idTipoDescuento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  MODIFY `idTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipotarjeta`
--
ALTER TABLE `tipotarjeta`
  MODIFY `idTipoTarjeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cantidad`
--
ALTER TABLE `cantidad`
  ADD CONSTRAINT `fk_Cantidad_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cantidadentrante`
--
ALTER TABLE `cantidadentrante`
  ADD CONSTRAINT `fk_CantidadEntrante_Proveedor_has_Medicamento1` FOREIGN KEY (`idProveedor`,`idMedicamento`) REFERENCES `proveedor_has_medicamento` (`Proveedor_idProveedor`, `Medicamento_idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Cliente_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cliente_TipoCliente1` FOREIGN KEY (`idTipoCliente`) REFERENCES `tipocliente` (`idTipoCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `fk_Descuento_TipoDescuento1` FOREIGN KEY (`idTipoDescuento`) REFERENCES `tipodescuento` (`idTipoDescuento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `descuento_has_factura`
--
ALTER TABLE `descuento_has_factura`
  ADD CONSTRAINT `fk_Descuento_has_Factura_Descuento1` FOREIGN KEY (`idDescuento`) REFERENCES `descuento` (`idDescuento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Descuento_has_Factura_Factura1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Empleado_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Empleado_Sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Empleado_TipoEmpleado1` FOREIGN KEY (`idTipoEmpleado`) REFERENCES `tipoempleado` (`idTipoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estante`
--
ALTER TABLE `estante`
  ADD CONSTRAINT `fk_Estante_Sucursal1` FOREIGN KEY (`Sucursal_idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Estante_cubiculo1` FOREIGN KEY (`cubiculo_idcubiculo`) REFERENCES `cubiculo` (`idcubiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_Impuesto1` FOREIGN KEY (`idImpuesto`) REFERENCES `impuesto` (`idImpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura_has_formapago`
--
ALTER TABLE `factura_has_formapago`
  ADD CONSTRAINT `fk_Factura_has_FormaPago_Factura1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_has_FormaPago_FormaPago1` FOREIGN KEY (`idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura_has_producto`
--
ALTER TABLE `factura_has_producto`
  ADD CONSTRAINT `fk_Factura_has_Producto_Factura1` FOREIGN KEY (`Factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_has_Producto_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_Inventario_Sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `fk_Medicamento_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medicamento_has_salida`
--
ALTER TABLE `medicamento_has_salida`
  ADD CONSTRAINT `fk_Medicamento_has_Salida_Medicamento1` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Medicamento_has_Salida_Salida1` FOREIGN KEY (`idSalida`) REFERENCES `salida` (`idSalida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `fk_Movimientos_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimientos_Factura1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimientos_TarjetaAcumulacion1` FOREIGN KEY (`idTarjetaAcumulacion`) REFERENCES `tarjetaacumulacion` (`idTarjetaAcumulacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimientos_TipoMovimiento1` FOREIGN KEY (`idTipoMovimiento`) REFERENCES `tipomovimiento` (`idTipoMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_Persona_CondicionEspecial1` FOREIGN KEY (`idCondicionEspecial`) REFERENCES `condicionespecial` (`idCondicionEspecial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Inventario1` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productosvarios`
--
ALTER TABLE `productosvarios`
  ADD CONSTRAINT `fk_ProductosVarios_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_categoria`
--
ALTER TABLE `producto_has_categoria`
  ADD CONSTRAINT `fk_Producto_has_Categoria_Categoria1` FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_Categoria_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_cubiculo`
--
ALTER TABLE `producto_has_cubiculo`
  ADD CONSTRAINT `fk_Producto_has_cubiculo_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_cubiculo_cubiculo1` FOREIGN KEY (`cubiculo_idcubiculo`) REFERENCES `cubiculo` (`idcubiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor_has_medicamento`
--
ALTER TABLE `proveedor_has_medicamento`
  ADD CONSTRAINT `fk_Proveedor_has_Medicamento_Medicamento1` FOREIGN KEY (`Medicamento_idMedicamento`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proveedor_has_Medicamento_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `fk_Salida_Sucursal1` FOREIGN KEY (`idSucursalLlegada`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarjetaacumulacion`
--
ALTER TABLE `tarjetaacumulacion`
  ADD CONSTRAINT `fk_TarjetaAcumulacion_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TarjetaAcumulacion_TipoTarjeta1` FOREIGN KEY (`idTipoTarjeta`) REFERENCES `tipotarjeta` (`idTipoTarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `fk_Telefono_Persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
