-- Create the trigger event with this name
CREATE TRIGGER decrease_quantity

-- it should be triggered after we insert data in the orders table
AFTER INSERT ON  orders
FOR EACH ROW

-- update the items table
UPDATE items

-- set its quantity to the original quantity - the number of the quanitity placed on the order that triggered this
SET quantity = quantity - NEW.number

-- which row in items to update
WHERE name = NEW.item_name;
