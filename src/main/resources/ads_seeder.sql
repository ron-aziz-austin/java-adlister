USE adlister_db;

TRUNCATE ads;

-- INSERT INTO ads (user_id, title, description)
-- VALUES (1, "playstation for sale", "This is a slightly used playstation"),
--        (1, "Super Nintendo", "Get your game on with this old-school classic!"),
--        (1, "Junior Java Developer Position", "Minimum 7 years of experience required."),
--        (1, "JavaScript Developer needed", "Must have strong Java skills"),
--        (1,	"DJI Mavic Pro", "Drone with 4K HD Camera & Extra Battery");

INSERT INTO ads (user_id,
                title,
                description,
                listed_on,
                country,
                location,
                city,
                zip_code,
                classified_status_id,
                price_type_id)
VALUES (1,
        'Rolex',
        'Watch',
        CURRENT_DATE(),
        'United States',
        '1234 Broad Street',
        'San Antonio',
        12345,
        1,
        1);