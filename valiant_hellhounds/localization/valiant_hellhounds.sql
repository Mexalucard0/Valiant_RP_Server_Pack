USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_hellhounds', 'Hellhounds', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_hellhounds', 'Hellhounds', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('hellhounds', 'Hellhounds')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (hellhounds, 0, 'prospect', 'Prospect', 100, '{}', '{}'),
  (hellhounds, 1, 'enforcer', 'Enforcer', 20, '{}', '{}'),
  (hellhounds, 2, 'officer', 'Officer', 200, '{}', '{}'),
  (hellhounds, 3, 'tailgunner', 'Tail Gunner', 200, '{}', '{}'),
  (hellhounds, 4, 'treasurer', 'Treasurer', 200, '{}', '{}'),
  (hellhounds, 5, 'secretary', 'Secretary', 200, '{}', '{}'),
  (hellhounds, 6, 'roadcpt', 'Road Captain', 200, '{}', '{}'),  
  (hellhounds, 7, 'sgtatarms', 'Sgt. at Arms', 250, '{}', '{}'),
  (hellhounds, 8, 'boss', 'Vice President', 275, '{}', '{}'),
  (hellhounds, 9, 'boss', 'President', 275, '{}', '{}'),
  (hellhounds, 10, 'boss', 'Founder', 275, '{}', '{}'), 

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
