-- Adding mats
INSERT INTO materials (mat_id, material_name)
VALUES
(1, 'Beton C30/37'), -- Konstrukcja
(2, 'Stal zbrojeniowa B500'), -- Zbrojenie
(3, 'Styropian EPS100'), -- Styrodur XPS/ Styropian EPS/ Wełna mineralna ??
(4, 'Płyta g-k 12.5mm'); -- Karton-Gips


INSERT INTO material_price (price_id, mat_id, mat_price, unit)
VALUES
(1, 1, 450, 'm³'),   -- Beton C30/37
(2, 2, 5,   'kg'),   -- Stal zbrojeniowa B500
(3, 3, 80,  'm³'),   -- Styropian EPS100
(4, 4, 25,  'm²');   -- Płyta g-k 12.5mm


INSERT INTO Total_Take_Off (takeoff_id, mat_id, quantity, project_name, element_id, floor_number)
VALUES
(1, 1, 20.5, 'Budynek A', 'Ściana1', 0),   -- 20.5 m³ betonu
(2, 2, 380,  'Budynek A', 'Belka3', 1),    -- 380 kg stali
(3, 3, 15.0, 'Budynek B', 'Podłoga1', -1), -- 15 m³ styropianu
(4, 4, 42.0, 'Budynek A', 'Ściana3', 2);   -- 42 m² płyt g-k


SELECT * FROM "VIEW_TakeOff_Total_Costs";

SELECT * FROM "Total_Take_Off";
