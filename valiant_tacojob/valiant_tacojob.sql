INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_vtaco','Vtaco',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_vtaco','Vtaco',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_vtaco', 'Vtaco', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('vtaco', 'Vtaco', 1);

--
-- Unloading data from the table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('vtaco', 1, 'vtaco', 'V-Taco New Hire', 100, '{}', '{}'),
('vtaco', 2, 'vtaco', 'V-Taco Employee ', 125, '{}', '{}'),
('vtaco', 3, 'vtaco', 'V-Taco Manager', 150, '{}', '{}'),
('vtaco', 4, 'boss', 'V-Taco Owner', 200, '{}', '{}');

CREATE TABLE `fine_types_mafia` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_mafia` (label, amount, category) VALUES 
	('Raket',3000,0),
	('Raket',5000,0),
	('Raket',10000,1),
	('Raket',20000,1),
	('Raket',50000,2),
	('Raket',150000,3),
	('Raket',350000,3)
;