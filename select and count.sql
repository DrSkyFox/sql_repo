select u.*, (select count(*) from user_like_user where user_id = u.id) as like_from_user,
       (select  count(*) from  user_like_user where user_id_get_like = u.id) as like_got_to_user,
       (select count(*) from user_like_user u_send inner join user_like_user u_get
           on u_send.user_id  = u_get.user_id_get_like and u_send.user_id_get_like = u_get.user_id and u_get.user_id = u.id) as vzaimo
from user u where u.id = 1;