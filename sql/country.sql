-- =========================================
-- DROP TABLE (opcional, si quieres recrear)
-- =========================================
DROP TABLE IF EXISTS country CASCADE;

-- =========================================
-- CREATE TABLE
-- =========================================
CREATE TABLE country (
    id SERIAL PRIMARY KEY,|
    name VARCHAR(100) NOT NULL UNIQUE,
    continent VARCHAR(50),
    population BIGINT CHECK (population >= 0)
);

-- =========================================
-- INSERT COUNTRIES WITH TRANSACTION AND ROLLBACK
-- =========================================

BEGIN;

-- Africa
INSERT INTO country (name, continent, population) VALUES
('Nigeria', 'Africa', 237000000),
('Ethiopia', 'Africa', 135000000),
('Egypt', 'Africa', 110000000),
('Democratic Republic of the Congo', 'Africa', 102000000),
('Tanzania', 'Africa', 67000000),
('South Africa', 'Africa', 60000000),
('Kenya', 'Africa', 55000000),
('Uganda', 'Africa', 49000000),
('Sudan', 'Africa', 48000000),
('Algeria', 'Africa', 45000000),
('Morocco', 'Africa', 37000000),
('Angola', 'Africa', 34000000),
('Mozambique', 'Africa', 32000000),
('Ghana', 'Africa', 31000000),
('Madagascar', 'Africa', 27000000),
('Cameroon', 'Africa', 26000000),
('Cote d''Ivoire', 'Africa', 26000000),
('Niger', 'Africa', 25000000),
('Burkina Faso', 'Africa', 23000000),
('Mali', 'Africa', 22000000),
('Malawi', 'Africa', 19000000),
('Zambia', 'Africa', 18000000),
('Senegal', 'Africa', 17000000),
('Chad', 'Africa', 16000000),
('Somalia', 'Africa', 15000000),
('Guinea', 'Africa', 13000000),
('Benin', 'Africa', 12000000),
('Burundi', 'Africa', 11000000),
('Tunisia', 'Africa', 11000000),
('South Sudan', 'Africa', 11000000),
('Rwanda', 'Africa', 12000000),
('Togo', 'Africa', 8000000),
('Sierra Leone', 'Africa', 8000000),
('Libya', 'Africa', 7000000),
('Congo', 'Africa', 5000000),
('Liberia', 'Africa', 5000000),
('Mauritania', 'Africa', 4000000),
('Eritrea', 'Africa', 3500000),
('Namibia', 'Africa', 2500000),
('Gabon', 'Africa', 2000000),
('Lesotho', 'Africa', 2000000),
('Guinea-Bissau', 'Africa', 2000000),
('Equatorial Guinea', 'Africa', 1400000),
('Mauritius', 'Africa', 1300000),
('Eswatini', 'Africa', 1100000),
('Djibouti', 'Africa', 900000),
('Comoros', 'Africa', 800000),
('Sao Tome and Principe', 'Africa', 200000),
('Seychelles', 'Africa', 100000);

-- Asia
INSERT INTO country (name, continent, population) VALUES
('China', 'Asia', 1416096094),
('India', 'Asia', 1463865525),
('Indonesia', 'Asia', 285721236),
('Pakistan', 'Asia', 255219554),
('Bangladesh', 'Asia', 175686899),
('Russia', 'Asia', 143000000),
('Japan', 'Asia', 125800000),
('Philippines', 'Asia', 113000000),
('Vietnam', 'Asia', 98000000),
('Turkey', 'Asia', 86000000),
('Iran', 'Asia', 84000000),
('Thailand', 'Asia', 70000000),
('Myanmar', 'Asia', 54000000),
('South Korea', 'Asia', 51000000),
('Iraq', 'Asia', 40000000),
('Afghanistan', 'Asia', 38000000),
('Saudi Arabia', 'Asia', 35000000),
('Uzbekistan', 'Asia', 34000000),
('Malaysia', 'Asia', 33000000),
('Yemen', 'Asia', 30000000),
('Nepal', 'Asia', 30000000),
('North Korea', 'Asia', 26000000),
('Sri Lanka', 'Asia', 21000000),
('Kazakhstan', 'Asia', 19000000),
('Syria', 'Asia', 17000000),
('Cambodia', 'Asia', 16000000),
('Jordan', 'Asia', 10000000),
('Azerbaijan', 'Asia', 10000000),
('United Arab Emirates', 'Asia', 9000000),
('Tajikistan', 'Asia', 9000000),
('Israel', 'Asia', 9000000),
('Laos', 'Asia', 7000000),
('Lebanon', 'Asia', 7000000),
('Kyrgyzstan', 'Asia', 6000000),
('Turkmenistan', 'Asia', 6000000),
('Singapore', 'Asia', 6000000),
('Oman', 'Asia', 5000000),
('State of Palestine', 'Asia', 5000000),
('Kuwait', 'Asia', 4000000),
('Georgia', 'Asia', 4000000),
('Mongolia', 'Asia', 3000000),
('Armenia', 'Asia', 3000000),
('Qatar', 'Asia', 3000000),
('Bahrain', 'Asia', 1700000),
('Timor-Leste', 'Asia', 1300000),
('Cyprus', 'Asia', 1200000),
('Bhutan', 'Asia', 800000),
('Maldives', 'Asia', 500000),
('Brunei', 'Asia', 400000),
('Macau', 'Asia', 700000),
('Hong Kong', 'Asia', 7500000);

-- Europe
INSERT INTO country (name, continent, population) VALUES
('Germany', 'Europe', 83000000),
('United Kingdom', 'Europe', 68000000),
('France', 'Europe', 67000000),
('Italy', 'Europe', 60000000),
('Spain', 'Europe', 47000000),
('Ukraine', 'Europe', 41000000),
('Poland', 'Europe', 38000000),
('Romania', 'Europe', 19000000),
('Netherlands', 'Europe', 17000000),
('Belgium', 'Europe', 11000000),
('Greece', 'Europe', 11000000),
('Czech Republic', 'Europe', 10500000),
('Portugal', 'Europe', 10000000),
('Sweden', 'Europe', 10000000),
('Hungary', 'Europe', 9600000),
('Belarus', 'Europe', 9400000),
('Austria', 'Europe', 9000000),
('Serbia', 'Europe', 8800000),
('Switzerland', 'Europe', 8600000),
('Bulgaria', 'Europe', 7000000),
('Denmark', 'Europe', 5800000),
('Finland', 'Europe', 5500000),
('Slovakia', 'Europe', 5400000),
('Norway', 'Europe', 5400000),
('Croatia', 'Europe', 4000000),
('Moldova', 'Europe', 3000000),
('Bosnia and Herzegovina', 'Europe', 3000000),
('Albania', 'Europe', 2900000),
('Lithuania', 'Europe', 2700000),
('Slovenia', 'Europe', 2700000),
('Latvia', 'Europe', 1900000),
('Estonia', 'Europe', 1300000),
('Kosovo', 'Europe', 1800000),
('Malta', 'Europe', 500000),
('Iceland', 'Europe', 350000);

-- North America
INSERT INTO country (name, continent, population) VALUES
('United States', 'North America', 347275807),
('Mexico', 'North America', 128900000),
('Canada', 'North America', 38000000),
('Guatemala', 'North America', 19000000),
('Honduras', 'North America', 10000000),
('El Salvador', 'North America', 6000000),
('Nicaragua', 'North America', 6000000),
('Costa Rica', 'North America', 5000000),
('Panama', 'North America', 4000000),
('Jamaica', 'North America', 3000000),
('Trinidad and Tobago', 'North America', 1400000),
('Barbados', 'North America', 300000),
('Saint Lucia', 'North America', 180000),
('Grenada', 'North America', 110000),
('Saint Vincent and the Grenadines', 'North America', 110000),
('Antigua and Barbuda', 'North America', 100000),
('Saint Kitts and Nevis', 'North America', 50000);

-- South America
INSERT INTO country (name, continent, population) VALUES
('Brazil', 'South America', 212000000),
('Argentina', 'South America', 45500000),
('Colombia', 'South America', 52000000),
('Peru', 'South America', 34000000),
('Venezuela', 'South America', 28000000),
('Chile', 'South America', 19000000),
('Ecuador', 'South America', 18000000),
('Bolivia', 'South America', 11000000),
('Paraguay', 'South America', 7000000),
('Uruguay', 'South America', 3500000),
('Guyana', 'South America', 800000),
('Suriname', 'South America', 600000),
('French Guiana', 'South America', 300000);


-- Oceania
INSERT INTO country (name, continent, population) VALUES
('Australia', 'Oceania', 25000000),
('Papua New Guinea', 'Oceania', 9000000),
('New Zealand', 'Oceania', 5000000),
('Fiji', 'Oceania', 900000),
('Solomon Islands', 'Oceania', 700000),
('Vanuatu', 'Oceania', 300000),
('Samoa', 'Oceania', 200000),
('Kiribati', 'Oceania', 120000),
('Micronesia', 'Oceania', 100000),
('Tonga', 'Oceania', 100000),
('Marshall Islands', 'Oceania', 60000),
('Palau', 'Oceania', 18000),
('Nauru', 'Oceania', 13000),
('Tuvalu', 'Oceania', 12000)
ON CONFLICT (name) DO NOTHING;
-- Si hay un conflicto en el nombre, no hacer nada
-- ROLLBACK; -- Descomenta esta línea si quieres deshacer los inserts
COMMIT;

