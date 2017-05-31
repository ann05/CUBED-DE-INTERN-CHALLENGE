CREATE DATABASE IF NOT EXISTS Product_DB;

use Product_DB;

CREATE TABLE IF NOT EXISTS `Products`	(
`S_no` int(11) NOT NULL ,
`name` varchar(200) NOT NULL,
`product_url` varchar(600) NOT NULL,
`price` varchar(11) ,
`num_sold` varchar(10) ,
`num_review` varchar(10) ,
`Seller` varchar(50) ,
`Seller_rating` varchar(10) ,
`item_number` varchar(20),
`viewers` varchar(10) ,
`image_url` varchar(200),
`num_bids` varchar(10) ,
`color` varchar(100),
`discount` varchar(50) ,
`Shipping` varchar(60),
PRIMARY KEY (`item_number`)
)  ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;



