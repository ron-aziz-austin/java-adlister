USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE users;
SET FOREIGN_KEY_CHECKS = 1;

insert into users (username, email, password)
values ("user", "user@gmail.com", "pword"),
  ("admin", "admin@gmail.com", "pword");