INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Garden State Grill', '125 Market St', 'Newark', 'NJ', '07102',
'An American restaurant serving burgers, sandwiches, steaks, and comfort food.',
'Mon-Sun 11AM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Garden State Grill'
AND c.CuisineName = 'American';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Hudson Pasta House', '88 Washington St', 'Jersey City', 'NJ', '07302',
'An Italian restaurant serving pasta, pizza, seafood, and traditional Italian dishes.',
'Mon-Sun 12PM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Hudson Pasta House'
AND c.CuisineName = 'Italian';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Jade Garden', '215 Broad St', 'Elizabeth', 'NJ', '07201',
'A Chinese restaurant serving noodles, dumplings, rice dishes, and traditional entrees.',
'Mon-Sun 11AM-9PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Jade Garden'
AND c.CuisineName = 'Chinese';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Manhattan Sushi House', '310 W 42nd St', 'New York', 'NY', '10036',
'A Japanese restaurant serving sushi, sashimi, ramen, and Japanese small plates.',
'Mon-Sun 11AM-11PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Manhattan Sushi House'
AND c.CuisineName = 'Japanese';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Brooklyn Taco Kitchen', '92 Atlantic Ave', 'Brooklyn', 'NY', '11201',
'A Mexican restaurant serving tacos, burritos, enchiladas, and fresh guacamole.',
'Mon-Sun 11AM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Brooklyn Taco Kitchen'
AND c.CuisineName = 'Mexican';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Astoria Greek Kitchen', '44 Broadway', 'Astoria', 'NY', '11103',
'A Greek restaurant serving gyros, grilled meats, salads, seafood, and Mediterranean dishes.',
'Mon-Sun 12PM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Astoria Greek Kitchen'
AND c.CuisineName = 'Greek';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Riverfront Grill', '201 Market St', 'Wilmington', 'DE', '19801',
'An American restaurant serving grilled meats, seafood, sandwiches, and salads.',
'Mon-Sun 11AM-9PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Riverfront Grill'
AND c.CuisineName = 'American';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Little Roma', '55 Main St', 'Newark', 'DE', '19711',
'An Italian restaurant serving pasta, pizza, chicken, and classic Italian dishes.',
'Mon-Sun 12PM-9PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Little Roma'
AND c.CuisineName = 'Italian';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Dragon Bowl', '145 Loockerman St', 'Dover', 'DE', '19901',
'A Chinese restaurant serving stir fry, noodles, dumplings, soups, and rice dishes.',
'Mon-Sun 11AM-9PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Dragon Bowl'
AND c.CuisineName = 'Chinese';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Harbor Sushi', '401 Light St', 'Baltimore', 'MD', '21202',
'A Japanese restaurant serving sushi rolls, sashimi, ramen, and rice bowls.',
'Mon-Sun 11AM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Harbor Sushi'
AND c.CuisineName = 'Japanese';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Charm City Tacos', '725 Pratt St', 'Baltimore', 'MD', '21201',
'A Mexican restaurant serving tacos, burritos, quesadillas, and nachos.',
'Mon-Sun 11AM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Charm City Tacos'
AND c.CuisineName = 'Mexican';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Athens Corner', '112 Main St', 'Annapolis', 'MD', '21401',
'A Greek restaurant serving gyros, souvlaki, salads, grilled seafood, and Mediterranean dishes.',
'Mon-Sun 12PM-9PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Athens Corner'
AND c.CuisineName = 'Greek';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Capital Grill House', '900 King St', 'Alexandria', 'VA', '22314',
'An American restaurant serving steaks, burgers, seafood, and traditional comfort food.',
'Mon-Sun 11AM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Capital Grill House'
AND c.CuisineName = 'American';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Roma Table', '510 Wilson Blvd', 'Arlington', 'VA', '22201',
'An Italian restaurant serving handmade pasta, pizza, seafood, and Italian entrees.',
'Mon-Sun 12PM-10PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Roma Table'
AND c.CuisineName = 'Italian';


INSERT INTO Restaurant
(RestaurantName, Address, City, State, ZipCode, Description, Hours)
VALUES
('Golden Wok', '330 Main St', 'Richmond', 'VA', '23219',
'A Chinese restaurant serving noodles, fried rice, dumplings, seafood, and traditional dishes.',
'Mon-Sun 11AM-9PM');

INSERT INTO RestaurantCuisine (RestaurantID, CuisineID)
SELECT r.RestaurantId, c.CuisineID
FROM Restaurant r, Cuisine c
WHERE r.RestaurantName = 'Golden Wok'
AND c.CuisineName = 'Chinese';