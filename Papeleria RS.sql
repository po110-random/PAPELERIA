CREATE database Papeleria;
USE Papeleria;

-- DROP database Papeleria;

CREATE TABLE Usuario (
  usr_cve_id 		INT 						NOT NULL		auto_increment 		primary key,
  usr_nick 			VARCHAR(45) 				NOT NULL,
  usr_contraseña 	VARCHAR(45) 				NOT NULL,
  usr_nombreR 		VARCHAR(50) 				NOT NULL,
  usr_ap_pat 		VARCHAR(50) 				NOT NULL,
  usr_ap_mat 		VARCHAR(50) 				NOT NULL,
  usr_rol 			ENUM('1', '2', '3', '4') 	DEFAULT NULL,
  usr_telefono 		BIGINT 						NOT NULL,
  usr_direccion 	VARCHAR(200) 				NOT NULL,
  usr_correo 		VARCHAR(100) 				NOT NULL
);

CREATE TABLE Producto (
  prod_cve_id 				INT 												NOT NULL			auto_increment 		primary key,
  prod_nombre 				VARCHAR(45) 										NOT NULL,
  prod_marca 				VARCHAR(45) 										NOT NULL,
  prod_precio_unitario 		FLOAT 												NOT NULL,
  prod_categoria 			ENUM('Papeleria', 'Comestible') 					NOT NULL,
  prod_color 				VARCHAR(45) 										NOT NULL,
  prod_tamaño 				INT 												NOT NULL,
  prod_unidad_medida 		ENUM('KG', 'G', 'Pieza', 'L', 'ml', 'cm', 'm') 		DEFAULT NULL,
  prod_caducidad 			DATE 												NULL,
  prod_descripción 			VARCHAR(150) 										NOT NULL
);

CREATE TABLE IF NOT EXISTS Reporte (
  rep_cve_id 				INT 				NOT NULL			auto_increment 		primary key,
  rep_concepto 				ENUM('1', '2') 		DEFAULT NULL,
  rep_fecha 				DATE 				NOT NULL,
  rep_fecha_vencimiento 	DATE 				NOT NULL,
  rep_cantidad 				INT 				NOT NULL,
  rep_total 				FLOAT 				NOT NULL,
  rep_precio 				FLOAT 				NOT NULL,
  prod_cve_id 				INT 				NOT NULL,
  usr_cve_id 				INT 				NOT NULL,
  
  foreign key (prod_cve_id) references producto(prod_cve_id),
  foreign key (usr_cve_id) references usuario(usr_cve_id)
);
  
CREATE TABLE Ventas (
  ven_cve_id 		INT 		NOT NULL		auto_increment		primary key,
  ven_fecha 		DATE 		NOT NULL,
  ven_total 		FLOAT 		NOT NULL
);

CREATE TABLE VenXRep (
	vxr_cve_id		INT			NOT NULL		auto_increment			primary key,
    rep_cve_id		INT			NOT NULL,
    ven_cve_id		int			NOT NULL,
    
    foreign key (rep_cve_id) references Reporte(rep_cve_id),
    foreign key (ven_cve_id) references Ventas(ven_cve_id)
);

CREATE TABLE Proveedor (
  prov_cve_id 		INT 			NOT NULL		auto_increment			primary key,
  prov_nombre 		VARCHAR(45) 	NOT NULL,
  prov_correo 		VARCHAR(45) 	NOT NULL,
  prov_tel 			BIGINT 			NOT NULL,
  prov_dirección 	VARCHAR(150) 	NOT NULL
);

CREATE TABLE Entrada (
  entr_cve_id 						INT 		NOT NULL		auto_increment		primary key,
  entr_fecha 						DATE 		NOT NULL,
  entr_precio_unitario_original 	FLOAT 		NOT NULL,
  entr_total 						INT 		NOT NULL,
  entr_existencia 					INT 		NOT NULL,
  entr_max 							INT 		NOT NULL,
  entr_min 							INT 		NOT NULL,
  prod_cve_id 						INT 		NOT NULL,
  usr_cve_id 						INT 		NOT NULL,
  prov_cve_id 						INT 		NOT NULL,
  
  foreign key (prod_cve_id) references Producto(prod_cve_id),
  foreign key (usr_cve_id) references Usuario(usr_cve_id),
  foreign key (prov_cve_id) references Proveedor(prov_cve_id)
);

CREATE TABLE Clientes (
  cl_cve_id 		INT 			NOT NULL		auto_increment 			primary key,
  cl_nombre 		VARCHAR(45) 	NOT NULL,
  cl_apellidoP 		VARCHAR(45) 	NOT NULL,
  cl_apellidoM 		VARCHAR(45) 	NOT NULL,
  cl_telefono 		VARCHAR(45) 	NOT NULL,
  cl_correo 		VARCHAR(45) 	NOT NULL,
  cl_direccion 		VARCHAR(150) 	NOT NULL
);