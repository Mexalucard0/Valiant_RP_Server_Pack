USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanicb', 'Benny's', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mechanicb', 'Benny's', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mechanicb', 'Benny's')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanicb',0,'parttime','Benny's PartT',100,'{}','{}'),
	('mechanicb',1,'fulltime','Benny's FullTime',135,'{}','{}'),
	('mechanicb',1,'shoplead','Benny's Shop Lead',175,'{}','{}'),
	('mechanicb',3,'boss',"Benny's Manager",200,'{}','{}'),
	('mechanicb',4,'boss','Benny's Owner',300,'{}','{}')
;

INSERT INTO `items` (name, label, `limit`) VALUES
	('gazbottle', 'Botella de gas', 11),
	('fixtool', 'Herramientas de reparacion', 6),
	('carotool', 'Herramientas de carroceria', 4),
	('blowpipe', 'Soplete', 10),
	('fixkit', 'Kit de ReparaciÃ³n', 5),
	('carokit', 'Kit de carroceria', 3),
	('wheel_tools', 'Soporte para Neumaticos', 3),
	('wheel', 'Neumatico', 3),
;
