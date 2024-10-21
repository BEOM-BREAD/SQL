

CREATE DATABASE GameDB;

USE GameDB;


CREATE TABLE PlayerAccount
(
	accountID INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	accountMoney INTEGER DEFAULT 0,
	accountCreateTime DATETIME
	-- accountDeleteFlag VARCHAR(10)
	-- PRIMARY KEY(accountID) -- Á¦¾à, CONSTRAINT
);

SELECT * FROM PlayerAccount;
DROP TABLE PlayerAccount;


ALTER TABLE PlayerAccount
ADD accountPassword INTEGER NOT NULL;


ALTER TABLE PlayerAccount
ADD CONSTRAINT PK_accountName PRIMARY KEY(accountName);

ALTER TABLE PlayerAccount
ADD CONSTRAINT PK_accountName PRIMARY KEY(accountID, accountName);

ALTER TABLE PlayerAccount
DROP CONSTRAINT PK_accountName;


INSERT INTO PlayerAccount(accountID, accountName, accountMoney, accountCreateTime)
VALUES (1, 'BEOM', 1000000, NULL);

INSERT INTO PlayerAccount(accountID, accountName, accountMoney, accountCreateTime)
VALUES (2, 'BEOM2', 1000000, NULL);

INSERT INTO PlayerAccount(accountID, accountName, accountMoney, accountCreateTime)
VALUES (3, 'BEOM3', 1000000, NULL);

INSERT INTO PlayerAccount(accountID, accountName, accountMoney, accountCreateTime)
VALUES (4, 'BEOM4', 1000000, NULL);

INSERT INTO PlayerAccount(accountID, accountName, accountMoney, accountCreateTime)
VALUES (5, 'BEOM5', 1000000, NULL);


DELETE 
FROM PlayerAccount -- DELETE FROM ... : All Delete
WHERE accountID = 2

UPDATE PlayerAccount
SET accountName = 'BEOM123'
WHERE accountName = 'BEOM';

CREATE TABLE Item
(
	ItemID INTEGER NOT NULL,
	ItemName VARCHAR(10) NOT NULL,
	ItemType INTEGER NOT NULL,
	ItemPrice INTEGER DEFAULT 0,
	PRIMARY KEY(ItemID)
);

SELECT * FROM Item;
DROP TABLE Item;

DELETE 
FROM Item -- DELETE FROM ... : All Delete
WHERE ItemID = 2

INSERT INTO Item (ItemID, ItemName, ItemType, ItemPrice)
VALUES (1, 'WAND', 10, 3000);

INSERT INTO Item (ItemID, ItemName, ItemType, ItemPrice)
VALUES (2, 'SWORD', 12, 3200);

INSERT INTO Item (ItemID, ItemName, ItemType, ItemPrice)
VALUES (3, 'GLOVE', 13, 2800);

INSERT INTO Item (ItemID, ItemName, ItemType, ItemPrice)
VALUES (4, 'GUN', 14, 3400);

INSERT INTO Item (ItemID, ItemName, ItemType, ItemPrice)
VALUES (5, 'SHIELD', 15, 3500);