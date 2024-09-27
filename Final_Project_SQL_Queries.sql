/*Query 1 Show all tables and how they are related to one another (keys, triggers, etc)*/
SELECT *
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE table_schema = 'artmuseum';


/*Query 2 - Basic Retrieval Query
Write a query to list all the art object's titles and
the artists of those objects.*/
SELECT a.title, a.artist
FROM art_object as a, artist as ar
WHERE ar.artist_name = a.artist;


/*Query 3 - A Retrieval Query With Ordered Results
Write a query to list all the art objects, the year they were made
and their epoch, order it by the year they were made descending.*/
SELECT a.title, a.year_made, a.epoch 
FROM art_object as a, artist as ar
WHERE a.artist = ar.artist_name 
ORDER BY a.Year_made;


/*Query 4 - A Nested Retrieval Query
Write a query that lists all the paintings that were drawn with oil on a canvas. 
Include the description, the year made, and the artist who drew them. */
SELECT a.Title, a.Descript, a.Year_made, a.Artist
FROM art_object as a, artist as ar
WHERE ar.Artist_name = a.Artist and a.Id_no in (SELECT a.Id_no
FROM paintings as p
WHERE a.Id_no = p.AId_num and p.Paint_type = 'Oil' and p.Drawn_on = 'Canvas');


/*Query 5 - A Retrieval Query Using Joined Tables
Write a query to list the title and prices of all the art objects
in the database. If the art object was borrowed, "null" should be listed instead. 
Order from the most costly art piece.*/
SELECT a.title, pr.Art_cost
FROM art_object as a left OUTER JOIN permanent_collection as pr on a.Id_no = pr.AId_num
ORDER BY pr.Art_cost DESC;


