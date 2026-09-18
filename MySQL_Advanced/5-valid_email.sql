-- this TRIGGER has multiple ; so this means:
-- For now, stop treating ; as 'end of statement'. Use $$ instead. I'll tell you when to switch back
DELIMITER $$

CREATE TRIGGER reset_validation
BEFORE UPDATE ON  users
FOR EACH ROW

-- if else statement that checks if the email is changed or not and sets the valid status corresponding for it
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 0;
    END IF;
END$$

-- switch back to normal. Go back to using ; as the stop sign again
DELIMITER ;