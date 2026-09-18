DELIMITER $$


-- create a set of SQL commands that u can reuse just by calling it
CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    -- Make a new, empty box
    DECLARE proj_id INT;

    SELECT id INTO proj_id
    FROM projects
    WHERE name = project_name;

    IF proj_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET proj_id = LAST_INSERT_ID();
    END IF;

    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, proj_id, score);
END$$

DELIMITER ;