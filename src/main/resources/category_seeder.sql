USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE category;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO category (parent_id, title)
VALUES (null, 'Kids Products'),
       (null, 'Entertainment'),
       (null, 'Camera'),
       (null, 'Computers & Laptops'),
       (null, 'Fashion & Beauty'),
       (null, 'Jobs'),
       (1, 'Clothes & Footwear'),
       (2, 'Books'),
       (3, 'Canon'),
       (3, 'Nikon'),
       (3, 'Sony'),
       (4, 'Laptop'),
       (5, 'Footwear'),
       (6, 'IT');