USE vk;
-- 2.Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.

USE vk;
DROP PROCEDURE IF EXISTS `delete_user`;

DELIMITER &&
CREATE PROCEDURE delete_user(user_id INT)

BEGIN
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
   begin
    	rollback;
    end;

START TRANSACTION;
-- удаляем все сообщения пользователя
DELETE FROM messages WHERE messages.from_user_id = user_id;
DELETE FROM messages WHERE messages.to_user_id = user_id;
-- Удаляем все лайки 
DELETE FROM likes WHERE likes.user_id = user_id;
-- удаляем все медиа записи пользователя
DELETE FROM media WHERE media.user_id = user_id;
-- Удаляем профидь пользователя
DELETE FROM profiles WHERE profiles.user_id = user_id;
DELETE FROM users WHERE users.id = user_id;
COMMIT;
SELECT user_id;
END &&
DELIMITER ;

CALL delete_user(9);

select * from users;
select * from messages;
select * from likes WHERE user_id = 1;
select * from media WHERE user_id = 1;

