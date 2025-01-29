CREATE TYPE fb AS ENUM ('FBI','FBW','FBT');
CREATE TYPE item_type AS ENUM ('M','B','S','K','P','I');
-- M = Messe, B = Broschüre, S = Sonstiges, K = Karte, P = Plakat, I = Item

CREATE table item (
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    anzahl integer,
    pakete integer,
    standort varchar(3) CHECK (standort ~ '^[0-9]+-[0-9]+$'),
    fb_type fb,
    item_type item_type NOT NULL
);

INSERT INTO item (name, anzahl, fb_type, item_type) VALUES
    ('Digitalisierung & Management', 9, 'FBW', 'B'),
    ('BWL & FBMA', 3, 'FBW', 'B'),
    ('Security Management', 35, 'FBW', 'B'),
    ('Anrechnung Fachinformatik (IHK)', 12, 'FBW', 'B'),
    ('Betriebswirtschaftslehre B.Sc', 40, 'FBW',  'B'),
    ('Maschinenbau B.Eng', 12, 'FBT', 'B'),
    ('Wirtschaftsingenieurwesen B.Eng', 34, 'FBT', 'B'),
    ('Augenoptik B.Sc', 50, 'FBT', 'P'),
    ('Qualifizierte Nachwuchs', 22, 'FBI', 'K'),
    ('Lust auf Cloudcomputing', 2, 'FBI', 'B'),
    ('Lust auf Digitale Medien', 2, 'FBI', 'B'),
    ('Lust auf Intelligente Systeme', 2, 'FBI', 'B'),
    ('Lust auf Medieninformatik', 27, 'FBI', 'B'),
    ('Lust auf Security Forensic', 25, 'FBI', 'B'),
    ('Transferkatalog FBI', 25, 'FBI', 'B'),
    ('Glasflasche', 33, 'FBI', 'M'),
    ('Transferkatalog FBW', 25, 'FBW', 'B');

INSERT INTO item (name, anzahl, pakete, standort, fb_type, item_type) VALUES
    ('USB-Stick - Rot', 28, NULL, '1-3', NULL,'I'),
    ('USB-Stick - Bambus', 2, NULL, '1-3', NULL,'I'),
    ('Campingbesteck', 174, 17, '3-3', NULL,'I'),
    ('Kugelschreiber S/W', 1000, 2, '3-3', NULL,'I'),
    ('Lust auf Wirtschaftswissenschaften', 23, NULL, '1-2', 'FBW','B'),
    ('Wirtschaftswissenschaften B.Eng', 23, NULL, '1-2', 'FBW','B'),
    ('Elektromobilität B.Eng', 32, NULL, '1-2', 'FBW','B'),
    ('Verteilersteckdose', 1, NULL, '1-3', NULL,'I'),
    ('Karteikarten', 1, 3, '2-2', NULL,'I'),
    ('Kreidespray', 2, NULL, '1-3', NULL,'I'),
    ('Glasflasche', 33, NULL, '3-2', NULL,'I'),
    ('Trinkflasche', 3, NULL, '3-2', NULL,'I'),
    ('Brillentuch - Dual in Brandenburg', 4, NULL, '3-4', NULL,'I'),
    ('Studienführer Master 24/25', NULL, 4, NULL, NULL,'I'),
    ('Decke - Rot', 1, 0, NULL, NULL,'I');

INSERT INTO item (name, anzahl, pakete, standort, fb_type, item_type) VALUES
    ('Bleistifte  Dual in Brandenburg',NULL, 1, '3-4', NULL,'I'),
    ('Lineal Dual in Brandenburg',NULL, 1, '3-4', NULL,'I'),
    ('Erlebniskarte Brandenburg',120, 3, '2-2', NULL,'I'),
    ('Transferkatalog FBT',32, NULL, '1-2', 'FBT','B'),
    ('Lust auf Medizininformatik', 5, NULL, '1-2', 'FBI','B');









