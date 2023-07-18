use week4;

drop procedure if exists lab4;
delimiter //
create procedure lab4 ()
begin

INSERT INTO products VALUES (NULL, "Pad Thai", "60.00");
INSERT INTO orders VALUES (NULL, "14343", "2023-02-03 15:05:49 ", "3", "Cash");
INSERT INTO order_detail VALUES (NULL, "60.00", "1", "1", "1");

INSERT INTO products VALUES (NULL, "TomYum Kung", "120.00");
INSERT INTO orders VALUES (NULL, "11435", "2023-02-03 12:08:19 ", "6", "Credit Card");
INSERT INTO order_detail VALUES (NULL, "120.00", "2", "2", "1");

end// 
delimiter ;

call lab4();

use week4;

drop procedure if exists ReportOrderAndDetail;
create view ReportOrderAndDetail as
select order_id, order_number, order_date, table_number, round(sum(product_price*quantity),2) as total_price, payment_type     
from orders join order_detail using (order_id) join products using (product_id)
group by order_id
order by order_date desc;


