-- 1. Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. Пользователь задается по id. 
-- Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. Функция должна возвращать номер пользователя.

USE vk;

DROP FUNCTION IF EXISTS delete_user;

DELIMITER $$
CREATE FUNCTION `delete_user`(user_id INT)
RETURNS INT DETERMINISTIC
begin
	-- удаляем все сообщения пользователя
DELETE FROM messages WHERE user_id = user_id;
-- Удаляем все лайки 
DELETE FROM likes WHERE user_id = user_id;
-- удаляем все медиа записи пользователя
DELETE FROM media WHERE user_id = user_id;
-- Удаляем профиль пользователя
DELETE FROM profile WHERE user_id = user_id;
DELETE FROM users WHERE id = delete_user_id;

RETURN user_id;
END$$
DELIMITER ;

-- исполняем функцию
SELECT delete_user(3);

-- проверяем
select * from users;
select * from messages;
select * from likes WHERE user_id = 1;
select * from media WHERE user_id = 1;