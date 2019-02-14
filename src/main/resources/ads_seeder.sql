USE adlister_db;

TRUNCATE ads;

INSERT INTO ads (user_id,
                category_id,
                title,
                description,
                listed_on,
                country,
                location,
                city,
                zip_code,
                classified_status_id,
                price_type_id,
                price)
VALUES (1,
        9,
        'Canon EOS 7D 18MP CMOS Digital SLR',
        'The new EOS 7D represents a whole new class of camera, with a host of brand new features designed to enhance every facet of the photographic process, from still images to video.',
        CURRENT_DATE(),
        'United States',
        '1234 Broad Street',
        'San Antonio',
        12345,
        1,
        1,
        120.25);