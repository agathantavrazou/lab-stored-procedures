select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by first_name, last_name, email;
  
  DELIMITER //
  create procedure mandatory_lab_shit (in param1 varchar(100), in param2 varchar(100), out param3 varchar(100))
  begin
  select first_name, last_name, email from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by first_name, last_name, email;
  end //
DELIMITER ;

-- Now keep working on the previous stored procedure to make it more dynamic. 
-- Update the stored procedure in a such manner that it can take a string argument for the category name and 
-- return the results for all customers that rented movie of that category/genre. For eg., it could be action, animation, children, classics, etc.

  DELIMITER //
  create procedure mandatory_lab_shit_2 (in param1 varchar(100), in param2 varchar(100), out param3 varchar(100))
  begin
  select first_name, last_name, email from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  -- where category.name = "Action"
  group by first_name, last_name, email;
  end //
DELIMITER ;


call mandatory_lab_shit_2("name", "Animation", @x);
select @x;

 
-- Write a query to check the number of movies released in each movie category. 
-- Convert the query in to a stored procedure to filter only those categories that have 
-- movies released greater than a certain number. Pass that number as an argument in the stored procedure.

select count(fc.film_id), category.name from film_category fc
join category on category.category_id = fc.category_id 
group by fc.category_id;


drop procedure if exists mandatory_lab_shit_3;

DELIMITER //
create procedure mandatory_lab_shit_3 (in param1 int)
begin
select count(fc.film_id) as ccc, category.name from film_category fc
join category on category.category_id = fc.category_id 
group by fc.category_id
having ccc > param1;
  end //
DELIMITER ;

call mandatory_lab_shit_3(50);


