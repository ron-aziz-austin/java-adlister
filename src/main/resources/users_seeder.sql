USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE users;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO users (first_name, last_name, username, email, password, phone_number)
VALUES('Ric',
       'Flair',
       'NatureBoy',
       'natureboy@16timechamp.com',
       '$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW',
       '2103334444')