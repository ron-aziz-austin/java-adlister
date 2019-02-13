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
DROP TABLE IF EXISTS classified_status;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS classified_status (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  classified_status CHAR(13) NOT NULL,
  PRIMARY KEY (id)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS price_type;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS price_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  price_type CHAR(15) NOT NULL,
  PRIMARY KEY (id)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ads;
SET FOREIGN_KEY_CHECKS = 1;

# TODO FIX JAVA FILES
CREATE TABLE IF NOT EXISTS ads (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  listed_on DATE NOT NULL,
  country VARCHAR(255) NOT NULL DEFAULT 'United States',
  location VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL DEFAULT 'San Antonio',
  zip_code MEDIUMINT (5) UNSIGNED ZEROFILL,
  classified_status_id INT UNSIGNED NOT NULL DEFAULT 1,
  price_type_id INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (classified_status_id) REFERENCES classified_status (id),
  FOREIGN KEY (price_type_id) REFERENCES price_type (id)
);