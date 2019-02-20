USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE category;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO category (parent_id, title)
VALUES (0, 'Arts & Crafts'),
       (0, 'Vehicles'),
       (0, 'Camera'),
       (0, 'Fashion & Beauty'),
       (0, 'Books & hobbies'),
       (0, 'Electronics & Computers'),
       (0, 'Kids Furniture'),
       (0, 'Jobs'),
       (0, 'Kids & Baby Products'),
       (0, 'Mobiles & Tablets'),
       (0, 'Animals'),
       (0, 'Games'),
       (0, 'Marketing'),
       (0, 'Computers & Laptops'),
       (9, 'Kids Clothes & Footwear'),
       (5, 'Books'),
       (3, 'Canon'),
       (3, 'Nikon'),
       (3, 'Sony'),
       (6, 'Laptop'),
       (4, 'Footwear'),
       (8, 'IT');