-- Написать триггер, который проверяет новое появляющееся сообщество. Длина названия сообщества (поле name) должна быть не менее 5 символов.
-- Если требование не выполнено, то выбрасывать исключение с пояснением.

USE vk;

drop TRIGGER if exists check_community_name;

DELIMITER //
CREATE TRIGGER check_community_name BEFORE INSERT ON communities
FOR EACH ROW
begin
    IF char_length(NEW.name) < 5 THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Название сообщества должно содержать не менее 5 символов.';
    END IF;
END//

DELIMITER ;

-- Проверяем
INSERT INTO communities (name) values ('test');
