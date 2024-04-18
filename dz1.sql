/*
Создайте функцию, которая принимает кол-во сек и далее переводит их в кол-во дней, часов, минут, секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP FUNCTION IF EXISTS convert_seconds;
DELIMITER //
CREATE FUNCTION convert_seconds(seconds int) RETURNS varchar(255)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE message varchar(255);
    SET days = seconds DIV 86400;
    SET seconds = seconds % 86400;
	SET hours = seconds DIV 3600;
    SET seconds = seconds % 3600;  
    SET minutes = seconds DIV 60;
    SET seconds = seconds % 60;
    SET message = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds ');
RETURN message;
END//

SELECT convert_seconds(123456);

/*
2.Cоздайте процедуру, которая выведет только числа, делящиеся на 15 или 33 в промежутке от 1 до 1000.
Пример: 15,30,33,45...
*/

DROP PROCEDURE IF EXISTS divisor;
DELIMITER //

CREATE PROCEDURE divisor()
BEGIN
	DECLARE i int default 0;
	WHILE i < 1001 DO
		IF (i % 15 = 0 OR i % 33 = 0)
		THEN SELECT i;
        END IF;
    SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL divisor();
