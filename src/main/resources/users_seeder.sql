USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE users;
SET FOREIGN_KEY_CHECKS = 1;

insert into users (username, email, password)
values ("admin", "admin@gmail.com", "$2a$10$PZonkEiG8PDPk8gTd.h4g.y6BtNT3bYRoFSuKuTDLygMtZSTQeCIW");

INSERT INTO users (first_name, last_name, username, email, password, join_date, posts, website, phone_number, user_bio, user_fb, user_twitter, user_linkedin)
VALUES
('Ric','Flair','NatureBoy','natureboy@16timechamp.com','password',current_date, 2, null, '2103334444','I''m Ric Flair! The Stylin'', profilin'', limousine riding, jet flying, kiss-stealing, wheelin'' n'' dealin'' son of a gun!', null, null, null)