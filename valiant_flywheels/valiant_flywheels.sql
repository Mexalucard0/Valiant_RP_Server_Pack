USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanicc', 'FlyWheels', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mechanicc', 'FlyWheels', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mechanicc', 'FlyWheels')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanicc',0,'parttime','FlyWheels PartT',100,'{}','{}'),
	('mechanicc',1,'fulltime','FlyWheels FullTime',135,'{}','{}'),
	('mechanicc',1,'shoplead','FlyWheels Shop Lead',175,'{}','{}'),
	('mechanicc',3,'manager',"FlyWheels Manager",200,'{}','{}'),
	('mechanicc',4,'boss','FlyWheels Owner',300,'{}','{}')
;

INSERT INTO `items` (name, label, `limit`) VALUES
	('gazbottle', 'Botella de gas', 11),
	('fixtool', 'Herramientas de reparacion', 6),
	('carotool', 'Herramientas de carroceria', 4),
	('blowpipe', 'Soplete', 10),
	('fixkit', 'Kit de Reparación', 5),
	('carokit', 'Kit de carroceria', 3),
	('wheel_tools', 'Soporte para Neumaticos', 3),
	('wheel', 'Neumatico', 3),
;
