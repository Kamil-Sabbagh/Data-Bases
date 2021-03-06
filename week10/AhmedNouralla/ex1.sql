DROP TABLE IF EXISTS accounts;

-- CREATE TABLE
CREATE TABLE accounts (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    credit INT NOT NULL,
    PRIMARY KEY(id)
);

-- INSERT VALUES
INSERT INTO accounts(name, credit) VALUES ('customerA', 1000);
INSERT INTO accounts(name, credit) VALUES ('customerB', 1000);
INSERT INTO accounts(name, credit) VALUES ('customerC', 1000);


-- Ex1.2
ALTER TABLE accounts
    ADD COLUMN BankName varchar(100);

UPDATE accounts
    SET BankName = 'SberBank' WHERE id = 1 OR id = 3;
UPDATE accounts
    SET BankName = 'TinkOff' WHERE id = 2;

INSERT INTO accounts(name, credit) values ('Fees', 0);


BEGIN TRANSACTION; -- T1 : Account 1 send 500 RUB to Account 3
UPDATE accounts
    SET credit = credit - 500 where accounts.id = 1;
UPDATE accounts
    SET credit = credit + 500 where accounts.id = 3;
-- rollback;
commit;


BEGIN TRANSACTION; -- T2: Account 2 send 700 RUB to Account 1
UPDATE accounts
    SET credit = credit - 700 - 30 where accounts.id = 2;
UPDATE accounts
    SET credit = credit + 700 where accounts.id = 1;
UPDATE accounts -- add fees
    SET credit = credit + 30 where accounts.id = 4;
-- rollback;
commit;


BEGIN TRANSACTION; -- T3: Account 2 send to 100 RUB to Account 3
UPDATE accounts
    SET credit = credit - 100 - 30 where accounts.id = 2;
UPDATE accounts
    SET credit = credit + 100 where accounts.id = 3;
UPDATE accounts -- add fees
    SET credit = credit + 30 where accounts.id = 4;
-- rollback;
commit;

-- Show all accounts with their credit
select * from accounts;
