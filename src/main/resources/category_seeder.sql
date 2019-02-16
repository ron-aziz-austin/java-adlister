USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE category;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO category (parent_id, title)
VALUES (0, 'Kids Products'),
       (0, 'Entertainment'),
       (0, 'Camera'),
       (0, 'Computers & Laptops'),
       (0, 'Fashion & Beauty'),
       (0, 'Jobs'),
       (1, 'Clothes & Footwear'),
       (2, 'Books'),
       (3, 'Canon'),
       (3, 'Nikon'),
       (3, 'Sony'),
       (4, 'Laptop'),
       (5, 'Footwear'),
       (6, 'IT');