USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE price_type;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO price_type (price_type)
VALUES ('Fixed Price'),
       ('Negotiable'),
       ('Exchange Donate'),
       ('Free');