CREATE TABLE accounts (
    id serial primary key,
    name VARCHAR(255) NOT NULL,
    credit INT NOT NULL
);

INSERT INTO accounts(name, credit) VALUES ('one', 1000);
INSERT INTO accounts(name, credit) VALUES ('two', 1000);
INSERT INTO accounts(name, credit) VALUES ('three', 1000);

-- Adding the bank name to the accounts table.
ALTER TABLE accounts
    ADD COLUMN BankName varchar(255);

-- Fist and third accounts are sber bank, while the second is tinkoff.
UPDATE accounts
    SET BankName = 'TinkOff' WHERE id = 2;
UPDATE accounts
    SET BankName = 'SberBank' WHERE id = 1 OR id = 3;


-- Adding the fees as a record in the account relation.
INSERT INTO accounts(name, credit) values ('Fees', 0);

-- The transactions in the first part of ex1, they were modified for the internal/external fees.

BEGIN TRANSACTION;
UPDATE accounts
    SET credit = credit - 500 where accounts.id = 1;
UPDATE accounts
    SET credit = credit + 500 where accounts.id = 3;
-- rollback;
commit;


BEGIN TRANSACTION;
UPDATE accounts
    SET credit = credit - 700 - 30 where accounts.id = 2;
UPDATE accounts
    SET credit = credit + 700 where accounts.id = 1;
UPDATE accounts
    SET credit = credit + 30 where accounts.id = 4;
-- rollback;
commit;


BEGIN TRANSACTION;
UPDATE accounts
    SET credit = credit - 100 - 30 where accounts.id = 2;
UPDATE accounts
    SET credit = credit + 100 where accounts.id = 3;
UPDATE accounts 
    SET credit = credit + 30 where accounts.id = 4;
-- rollback;
commit;

select * from accounts;
