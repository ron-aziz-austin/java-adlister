USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE users;
SET FOREIGN_KEY_CHECKS = 1;

insert into users (username, email, password)
values ("admin", "admin@gmail.com", "$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW");