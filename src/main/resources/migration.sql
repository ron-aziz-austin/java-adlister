USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name CHAR(150) NOT NULL,
    last_name CHAR(150) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
#     join_date DATE DEFAULT CURRENT_DATE(),
#     posts INT UNSIGNED NOT NULL,
#     website VARCHAR(255),
#     user_bio VARCHAR(350), # maybe make this varchar(x)?
#     user_fb varchar(250),
#     user_twitter varchar(250),
#     user_linkedin varchar(250),
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
DROP TABLE IF EXISTS category;
SET FOREIGN_KEY_CHECKS = 1;

# TODO Add More Categories
CREATE TABLE IF NOT EXISTS category (
  parent_id INT UNSIGNED NOT NULL,
  category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title CHAR(50) NOT NULL,
  PRIMARY KEY (category_id)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ads;
SET FOREIGN_KEY_CHECKS = 1;

# TODO Need Testing
CREATE TABLE IF NOT EXISTS ads (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  category_id INT UNSIGNED NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  listed_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  location VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL DEFAULT 'San Antonio',
  zip_code MEDIUMINT (5) UNSIGNED ZEROFILL,
  classified_status_id INT UNSIGNED NOT NULL DEFAULT 1,
  price_type_id INT UNSIGNED NOT NULL DEFAULT 1,
  price DECIMAL(13, 2) NOT NULL,
  image VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id),
  FOREIGN KEY (classified_status_id) REFERENCES classified_status (id),
  FOREIGN KEY (price_type_id) REFERENCES price_type (id)
);