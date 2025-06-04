-- DROP IF EXISTS
DROP TABLE IF EXISTS "materials";
DROP TABLE IF EXISTS "material_price";
DROP TABLE IF EXISTS "Total_Take_Off";

DROP INDEX IF EXISTS "idx_takeoff_mat_id";
DROP INDEX IF EXISTS "idx_mat_price_mat_id";

DROP VIEW IF EXISTS "VIEW_TakeOff_Total_Costs";
DROP VIEW IF EXISTS "VIEW_material_price_with_name";


-- TABLE CREATION
CREATE TABLE "materials"(
    "mat_id" INTEGER PRIMARY KEY,
    "material_name" TEXT NOT NULL
);

CREATE TABLE "material_price" (
    "price_id" INTEGER PRIMARY KEY,
    "mat_id" INTEGER,
    "mat_price" INTEGER NOT NULL,
    "unit" TEXT NOT NULL,
    FOREIGN KEY ("mat_id") REFERENCES "materials"("mat_id")
);

CREATE TABLE "Total_Take_Off" (
    "takeoff_id" INTEGER PRIMARY KEY,
    "mat_id" INTEGER NOT NULL,
    "quantity" REAL NOT NULL,
    "project_name" TEXT,
    "element_id" TEXT,
    "floor_number" INTEGER,
    FOREIGN KEY ("mat_id") REFERENCES "materials"("mat_id")
);

-- VIEW CREATION
CREATE VIEW "VIEW_TakeOff_Total_Costs" AS
SELECT
    t.floor_number,
    m.material_name,
    mp.mat_price || ' zł/' || mp.unit AS price_with_unit, -- string concatenation operator
    t.quantity,
    (t.quantity * mp.mat_price) AS 'total_cost (quantity * price)'
FROM Total_Take_Off t
JOIN materials m ON t.mat_id = m.mat_id
JOIN material_price mp ON mp.mat_id = m.mat_id;

CREATE VIEW "VIEW_material_price_with_name" AS
SELECT
    material_price.price_id,
    material_price.mat_id,
    materials.material_name,
    material_price.mat_price || ' zł/' || material_price.unit AS price_with_unit -- string concatenation operator
FROM material_price
JOIN materials ON material_price.mat_id = materials.mat_id;

-- INDEX CREATION
CREATE INDEX "idx_mat_price_mat_id" ON material_price(mat_id);
CREATE INDEX "idx_takeoff_mat_id" ON Total_Take_Off(mat_id);

