USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE classified_status;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO classified_status (classified_status)
VALUES ('No Offers'),
       ('O.N.O'),
       ('O.V.N.O'),
       ('Private Sale'),
       ('Part Exchange'),
       ('Trade'),
       ('Sold');