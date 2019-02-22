USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE users;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO users (first_name, last_name, username, email, password, phone_number, image)
VALUES('Ric',
       'Flair',
       'Nature Boy',
       'natureboy@16timechamp.com',
       '$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW',
       '(210) 333-4444',
       '/images/natureboy.jpg'),

      ('Hulk',
       'Hogan',
       'Hollywood Hogan',
       'hulkhogan@hollywood.com',
       '$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW',
       '(385) 967-0372',
       '/images/hollywoodhogan.jpg'),

      ('Steve',
       'Austin',
       'Stone Cold',
       'stonecold@stunning.com',
       '$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW',
       '(098) 765-4321',
       '/images/stonecold.jpg'),

      ('Randy',
       'Savage',
       'Macho Man',
       'machoman@slimjim.com',
       '$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW',
       '(099) 365-3214',
       '/images/machoman.jpg'),

      ('Dwayne',
       'Johnson',
       'The Rock',
       'therock@rockbottom.com',
       '$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW',
       '(123) 456-7890',
       '/images/therock.jpg');