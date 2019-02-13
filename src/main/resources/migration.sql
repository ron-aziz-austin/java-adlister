USE adlister_db;


SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS users;
# TRUNCATE users;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name CHAR(150) NOT NULL,
    last_name CHAR(150) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    join_date DATE NOT NULL,
    posts INT UNSIGNED NOT NULL,
    website VARCHAR(255),
    phone_number VARCHAR(10) NOT NULL CHECK (phone_number between 0 and 9999999999),
    user_bio VARCHAR(350), # maybe make this varchar(x)?
    user_fb varchar(250),
    user_twitter varchar(250),
    user_linkedin varchar(250),
    PRIMARY KEY (id),
    UNIQUE (username),
    UNIQUE (email)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ads;
# TRUNCATE ads;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
      ON DELETE CASCADE
);