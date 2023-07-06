DROP DATABASE IF EXISTS investmenttracker;

CREATE DATABASE investmenttracker;

USE investmenttracker;

DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS portfolio;
DROP TABLE IF EXISTS currency;
DROP TABLE IF EXISTS transactionType;

CREATE TABLE portfolio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO portfolio (name)
VALUES
('Nordnet'),
('Saxo Bank'),
('Jyske Bank');

CREATE TABLE currency (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO currency (name)
VALUES
('DKK'),
('USD'),
('EUR'),
('NOK');

CREATE TABLE transactionType (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO transactionType (name)
VALUES
('Buy'),
('Sell'),
('Dividend');

CREATE TABLE transaction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    portfolioID INT NOT NULL,
    currencyID INT NOT NULL,
    sharesOwned DECIMAL(10, 2) NOT NULL,
    costPerShare DECIMAL(10, 2) NOT NULL,
    commission DECIMAL(10, 2) NOT NULL,
    transactionDate DATE NOT NULL,
    transactionTime TIME NOT NULL,
    purchaseExchangeRate DECIMAL(10, 2) NOT NULL,
    transactionsTypeID INT NOT NULL,
    notes TEXT,
    FOREIGN KEY (portfolioID) REFERENCES portfolio(id),
    FOREIGN KEY (currencyID) REFERENCES currency(id),
    FOREIGN KEY (transactionsTypeID) REFERENCES transactionType(id)
);

INSERT INTO transaction (symbol, name, portfolioID, currencyID, sharesOwned, costPerShare, commission, transactionDate, transactionTime, purchaseExchangeRate, transactionsTypeID, notes)
VALUES
('PYPL', 'PayPal Holdings, Inc.', 2, 2, 6, 276.500000, 0.000000, '2021-08-05 GMT+0200', '00:00:00', 0.000000, 0, ''),
('AAPL', 'Apple Inc.', 2, 2, 11, 146.000000, 0.000000, '2021-08-09 GMT+0200', '00:00:00', 0.000000, 0, ''),
('AAPL', 'Apple Inc.', 2, 2, 7, 0.000000, 0.000000, '2021-10-01 GMT+0200', '00:00:00', 0.000000, 0, ''),
('AAPL', 'Apple Inc.', 2, 2, 0, 0.000000, 0.000000, '2021-11-11 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 18, Udbytte pr. aktie: $0,22'),
('AAPL', 'Apple Inc.', 2, 2, 0, 0.000000, 0.000000, '2022-02-10 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 18, Udbytte pr. aktie: $0,22'),
('AAPL', 'Apple Inc.', 2, 2, 0, 0.000000, 0.000000, '2022-05-12 GMT+0200', '00:00:00', 0.000000, 0, 'Aktier: 18, Udbytte pr. aktie: $0,22'),
('AAPL', 'Apple Inc.', 2, 2, 13, 143.500000, 0.000000, '2023-02-01 GMT+0200', '16:31:00', 0.000000, 0, ''),
('AAPL', 'Apple Inc.', 2, 2, 17, 146.500000, 0.000000, '2023-03-01 GMT+0200', '16:30:00', 0.000000, 0, ''),
('MSFT', 'Microsoft Corporation', 2, 2, 7, 303.500000, 0.000000, '2021-09-01 GMT+0200', '00:00:00', 0.000000, 0, ''),
('MSFT', 'Microsoft Corporation', 2, 2, 1, 286.000000, 0.000000, '2021-09-30 GMT+0200', '00:00:00', 0.000000, 0, ''),
('MSFT', 'Microsoft Corporation', 2, 2, 0, 0.000000, 0.000000, '2021-12-09 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 8, Udbytte pr. aktie: $0,62'),
('MSFT', 'Microsoft Corporation', 2, 2, 0, 0.000000, 0.000000, '2022-03-10 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 8, Udbytte pr. aktie: $0,62'),
('MSFT', 'Microsoft Corporation', 2, 2, 0, 0.000000, 0.000000, '2022-06-09 GMT+0200', '00:00:00', 0.000000, 0, 'Aktier: 8, Udbytte pr. aktie: $0,62'),
('SXR8.SG', 'Ishares Core S&p 500 Ucits Etf', 2, 3, 3, 0.000000, 0.000000, '2021-12-01 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SXR8.SG', 'Ishares Core S&p 500 Ucits Etf', 2, 3, 3, 413.000000, 0.000000, '2022-02-02 GMT+0200', '10:56:00', 0.000000, 0, ''),
('SXR8.SG', 'Ishares Core S&p 500 Ucits Etf', 2, 3, 5, 394.000000, 0.000000, '2023-04-18 GMT+0200', '09:29:00', 0.000000, 0, ''),
('DKK=CASH', 'DKK', 2, 1, 0, 0.000000, 0.000000, '2023-03-12 GMT+0200', '18:52:00', 0.000000, 0, ''),
('ABNB', 'Airbnb, Inc.', 2, 2, 19, 0.000000, 0.000000, '2021-06-14 GMT+0200', '00:00:00', 0.000000, 0, ''),
('ABNB', 'Airbnb, Inc.', 2, 2, 19, 0.000000, 0.000000, '2021-07-06 GMT+0200', '00:00:00', 0.000000, 0, ''),
('BZUN', 'Baozun Inc.', 2, 2, 44, 0.000000, 0.000000, '2021-07-07 GMT+0200', '00:00:00', 0.000000, 0, ''),
('BZUN', 'Baozun Inc.', 2, 2, 44, 0.000000, 0.000000, '2021-07-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('KO', 'Coca-Cola Company (The)', 2, 2, 52, 0.000000, 0.000000, '2021-07-09 GMT+0200', '00:00:00', 0.000000, 0, ''),
('KO', 'Coca-Cola Company (The)', 2, 2, 52, 0.000000, 0.000000, '2021-07-14 GMT+0200', '00:00:00', 0.000000, 0, ''),
('BIDU', 'Baidu, Inc.', 2, 2, 6, 0.000000, 0.000000, '2021-07-15 GMT+0200', '00:00:00', 0.000000, 0, ''),
('BIDU', 'Baidu, Inc.', 2, 2, 6, 0.000000, 0.000000, '2021-07-15 GMT+0200', '00:00:00', 0.000000, 0, ''),
('APPS', 'Digital Turbine, Inc.', 2, 2, 13, 61.600000, 0.000000, '2021-07-20 GMT+0200', '00:00:00', 0.000000, 0, ''),
('APPS', 'Digital Turbine, Inc.', 2, 2, 13, 0.000000, 0.000000, '2021-07-20 GMT+0200', '00:00:00', 0.000000, 0, ''),
('NIO', 'NIO Inc.', 2, 2, 32, 0.000000, 0.000000, '2021-07-21 GMT+0200', '00:00:00', 0.000000, 0, ''),
('NIO', 'NIO Inc.', 2, 2, 32, 0.000000, 0.000000, '2021-07-26 GMT+0200', '00:00:00', 0.000000, 0, ''),
('RBLX', 'Roblox Corporation', 2, 2, 18, 0.000000, 0.000000, '2021-07-21 GMT+0200', '00:00:00', 0.000000, 0, ''),
('RBLX', 'Roblox Corporation', 2, 2, 18, 81.800000, 0.000000, '2021-07-23 GMT+0200', '00:00:00', 0.000000, 0, ''),
('AMC', 'AMC Entertainment Holdings, Inc', 2, 2, 35, 40.100000, 0.000000, '2021-07-26 GMT+0200', '00:00:00', 0.000000, 0, ''),
('AMC', 'AMC Entertainment Holdings, Inc', 2, 2, 35, 38.000000, 0.000000, '2021-07-28 GMT+0200', '00:00:00', 0.000000, 0, ''),
('TSLA', 'Tesla, Inc.', 2, 2, 11, 127.500000, 0.000000, '2023-01-18 GMT+0200', '20:54:00', 0.000000, 0, ''),
('TSLA', 'Tesla, Inc.', 2, 2, 11, 178.000000, 0.000000, '2023-01-27 GMT+0200', '19:36:00', 0.000000, 0, ''),
('META', 'Meta Platforms, Inc.', 2, 2, 4, 0.000000, 0.000000, '2021-08-09 GMT+0200', '00:00:00', 0.000000, 0, ''),
('META', 'Meta Platforms, Inc.', 2, 2, 2, 343.000000, 0.000000, '2021-10-01 GMT+0200', '00:00:00', 0.000000, 0, ''),
('META', 'Meta Platforms, Inc.', 2, 2, 4, 329.100000, 0.000000, '2021-11-02 GMT+0200', '01:00:00', 0.000000, 0, ''),
('META', 'Meta Platforms, Inc.', 2, 2, 4, 342.800000, 0.000000, '2021-12-31 GMT+0200', '01:00:00', 0.000000, 0, ''),
('META', 'Meta Platforms, Inc.', 2, 2, 5, 0.000000, 0.000000, '2022-03-01 GMT+0200', '18:16:00', 0.000000, 0, ''),
('GOOG', 'Alphabet Inc.', 2, 2, 12, 0.000000, 0.000000, '2022-09-01 GMT+0200', '17:02:00', 0.000000, 0, ''),
('DANSKE.CO', 'Danske Bank A/s', 2, 1, 87, 0.000000, 0.000000, '2022-10-07 GMT+0200', '10:38:00', 0.000000, 0, ''),
('DANSKE.CO', 'Danske Bank A/s', 2, 1, 87, 92.000000, 0.000000, '2022-10-10 GMT+0200', '09:08:00', 0.000000, 0, 'Solgt og penge overført til Vantage'),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 46, 0.000000, 0.000000, '2020-08-05 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 72, 0.000000, 0.000000, '2020-09-07 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 80, 0.000000, 0.000000, '2020-10-05 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 31, 0.000000, 0.000000, '2020-11-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 97, 124.200000, 0.000000, '2020-12-07 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 43, 0.000000, 0.000000, '2021-01-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 47, 0.000000, 0.000000, '2021-02-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 0, 0.000000, 0.000000, '2021-02-05 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 416, Udbytte pr. aktie: 3,4kr.'),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 102, 0.000000, 0.000000, '2021-03-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 78, 135.700000, 0.000000, '2021-04-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 45, 0.000000, 0.000000, '2021-06-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 38, 140.700000, 0.000000, '2021-07-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 0, 0.000000, 0.000000, '2022-02-24 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 679, Udbytte pr. aktie: 3,6kr.'),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 38, 0.000000, 0.000000, '2022-03-08 GMT+0200', '21:48:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 45, 0.000000, 0.000000, '2022-04-08 GMT+0200', '18:09:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 47, 136.100000, 0.000000, '2022-05-09 GMT+0200', '16:58:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 77, 138.600000, 0.000000, '2022-06-08 GMT+0200', '19:05:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 39, 0.000000, 0.000000, '2022-07-08 GMT+0200', '09:54:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 23, 0.000000, 0.000000, '2022-08-08 GMT+0200', '18:53:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 0, 0.000000, 0.000000, '2023-02-14 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 948, Udbytte pr. aktie: 3,20kr.'),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 27, 0.000000, 0.000000, '2023-04-11 GMT+0200', '16:45:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 54, 0.000000, 0.000000, '2023-05-08 GMT+0200', '19:17:00', 0.000000, 0, ''),
('SPVIGAKL.CO', 'Sparindex Index Globale Aktier ', 1, 1, 71, 139.700000, 0.000000, '2023-06-08 GMT+0200', '16:10:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 147, 0.000000, 0.000000, '2020-07-06 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 9, 0.000000, 0.000000, '2020-08-05 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 14, 164.600000, 0.000000, '2020-09-07 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 16, 0.000000, 0.000000, '2020-10-05 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 6, 0.000000, 0.000000, '2020-11-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 20, 0.000000, 0.000000, '2020-12-07 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 9, 174.200000, 0.000000, '2021-01-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 10, 182.400000, 0.000000, '2021-02-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 0, 0.000000, 0.000000, '2021-02-25 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 231, Udbytte pr. aktie: 10,1kr.'),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 22, 0.000000, 0.000000, '2021-03-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 16, 180.900000, 0.000000, '2021-04-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 9, 0.000000, 0.000000, '2021-06-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 8, 0.000000, 0.000000, '2021-07-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 4576, 0.000000, 0.000000, '2022-02-24 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 286, Udbytte pr. aktie: 16kr.'),
('SPIDJWKL.CO', 'Sparindex Index Djsi World Kl', 1, 1, 0, 0.000000, 0.000000, '2023-02-14 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 286, Udbytte pr. aktie: 5,7kr.'),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 4, 0.000000, 0.000000, '2020-08-05 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 6, 180.200000, 0.000000, '2020-09-07 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 7, 0.000000, 0.000000, '2020-10-05 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 3, 0.000000, 0.000000, '2020-11-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 9, 191.800000, 0.000000, '2020-12-07 GMT+0200', '01:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 3, 206.700000, 0.000000, '2021-01-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 4, 0.000000, 0.000000, '2021-02-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 0, 0.000000, 0.000000, '2021-02-25 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 32, Udbytte pr. aktie: 21,8kr.'),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 10, 0.000000, 0.000000, '2021-03-05 GMT+0200', '01:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 8, 194.300000, 0.000000, '2021-04-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 4, 0.000000, 0.000000, '2021-06-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 3, 0.000000, 0.000000, '2021-07-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 1586, 0.000000, 0.000000, '2022-02-11 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 61, Udbytte pr. aktie: 26kr.'),
('DKIDKIX.CO', 'Danske Inv Danmark Indeks Kl Dk', 1, 1, 0, 0.000000, 0.000000, '2023-02-08 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 61, Udbytte pr. aktie: 11,8kr.'),
('SPIEMIKL.CO', 'Sparindex Index Emerging Market', 1, 1, 27, 0.000000, 0.000000, '2020-07-06 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIEMIKL.CO', 'Sparindex Index Emerging Market', 1, 1, 0, 0.000000, 0.000000, '2022-02-24 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 27, Udbytte pr. aktie: 9,8kr.'),
('SPIEMIKL.CO', 'Sparindex Index Emerging Market', 1, 1, 57, 0.000000, 0.000000, '2023-02-14 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 27, Udbytte pr. aktie: 2kr.'),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 0, 0.000000, 0.000000, '2021-02-25 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 27, Udbytte pr. aktie: 6,9kr.'),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 27, 0.000000, 0.000000, '2021-07-06 GMT+0200', '00:00:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 0, 0.000000, 0.000000, '2022-02-24 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 27, Udbytte pr. aktie: 25,2kr.'),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 3, 0.000000, 0.000000, '2022-03-08 GMT+0200', '21:48:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 3, 0.000000, 0.000000, '2022-04-08 GMT+0200', '18:09:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 4, 0.000000, 0.000000, '2022-05-09 GMT+0200', '16:58:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 6, 279.900000, 0.000000, '2022-06-08 GMT+0200', '19:05:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 3, 0.000000, 0.000000, '2022-07-08 GMT+0200', '09:53:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 2, 0.000000, 0.000000, '2022-08-08 GMT+0200', '18:53:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 0, 0.000000, 0.000000, '2023-02-14 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 48, Udbytte pr. aktie: 21,10kr.'),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 2, 277.200000, 0.000000, '2023-04-11 GMT+0200', '16:45:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 4, 287.200000, 0.000000, '2023-05-08 GMT+0200', '19:17:00', 0.000000, 0, ''),
('SPIC25KL.CO', 'Sparindex Index Omx C25 Kl', 1, 1, 6, 0.000000, 0.000000, '2023-06-08 GMT+0200', '16:10:00', 0.000000, 0, ''),
('LUN.CO', 'H. Lundbeck A/s', 1, 1, 29, 0.000000, 0.000000, '2021-04-26 GMT+0200', '00:00:00', 0.000000, 0, ''),
('LUN.CO', 'H. Lundbeck A/s', 1, 1, 29, 0.000000, 0.000000, '2021-06-08 GMT+0200', '00:00:00', 0.000000, 0, ''),
('QFUEL.OL', 'Quantafuel As', 1, 3, 362, 38.000000, 0.000000, '2021-05-04 GMT+0200', '00:00:00', 0.000000, 0, ''),
('QFUEL.OL', 'Quantafuel As', 1, 3, 362, 44.400000, 0.000000, '2021-05-25 GMT+0200', '00:00:00', 0.000000, 0, ''),
('QFUEL.OL', 'Quantafuel As', 1, 3, 394, 40.500000, 0.000000, '2021-05-31 GMT+0200', '00:00:00', 0.000000, 0, ''),
('QFUEL.OL', 'Quantafuel As', 1, 3, 394, 0.000000, 0.000000, '2021-06-07 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DKK=CASH', 'DKK', 1, 1, 557, 0.000000, 0.000000, '2023-04-03 GMT+0200', '08:32:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 19, 0.000000, 0.000000, '2022-03-08 GMT+0200', '21:48:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 22, 0.000000, 0.000000, '2022-04-08 GMT+0200', '18:09:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 23, 137.000000, 0.000000, '2022-05-09 GMT+0200', '16:58:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 39, 136.200000, 0.000000, '2022-06-08 GMT+0200', '19:05:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 19, 0.000000, 0.000000, '2022-07-08 GMT+0200', '09:52:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 11, 150.800000, 0.000000, '2022-08-08 GMT+0200', '18:53:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 0, 0.000000, 0.000000, '2023-02-14 GMT+0200', '01:00:00', 0.000000, 0, 'Aktier: 133, Udbytte pr. aktie: 20,30kr.'),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 15, 0.000000, 0.000000, '2023-04-11 GMT+0200', '16:45:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 31, 0.000000, 0.000000, '2023-05-08 GMT+0200', '19:17:00', 0.000000, 0, ''),
('SPIUSGKL.CO', 'Sparindex Index Usa Growth Kl', 1, 1, 38, 127.700000, 0.000000, '2023-06-08 GMT+0200', '16:10:00', 0.000000, 0, ''),
('DANSKE.CO', 'Danske Bank A/s', 3, 1, 50, 87.800000, 0.000000, '2020-06-22 GMT+0200', '00:00:00', 0.000000, 0, ''),
('DANSKE.CO', 'Danske Bank A/s', 3, 1, 50, 0.000000, 0.000000, '2020-11-10 GMT+0200', '01:00:00', 0.000000, 0, ''),
('VWS.CO', 'Vestas Wind Systems A/s', 3, 1, 2, 667.400000, 0.000000, '2020-06-22 GMT+0200', '00:00:00', 0.000000, 0, ''),
('VWS.CO', 'Vestas Wind Systems A/s', 3, 1, 2, 977.400000, 0.000000, '2020-09-02 GMT+0200', '00:00:00', 0.000000, 0, '');