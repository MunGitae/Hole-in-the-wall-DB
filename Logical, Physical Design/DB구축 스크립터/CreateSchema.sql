CREATE TABLE `Users`
(
    `user_id`    INT(3) NOT NULL AUTO_INCREMENT,
    `mode` VARCHAR(5),
    `point`    INT(4),
    primary key(user_id)
);
create table `account`
(
   `user_id` INT(3) NOT NULL,
    `ID`    VARCHAR(10) NOT NULL,
    `PW`    VARCHAR(10) NOT NULL,
    PRIMARY KEY(ID),
    foreign key(user_id) references Users(user_id)
);

CREATE TABLE `Restaurant`
(
    `res_id`    INT(3) NOT NULL AUTO_INCREMENT,
    `name`    VARCHAR(20) NOT NULL,
    `category`    VARCHAR(10),
    `location`    INT(3),
    primary key(res_id)
);

CREATE TABLE `Contactnumber`
(
    `res_id`    INT(3) NOT NULL,
    `phone_number`    VARCHAR(12) NOT NULL,
    primary key(res_id, phone_number),
    foreign key(res_id) references Restaurant(res_id)
);

CREATE TABLE `Reservation`
(
    `rsv_id`    INTEGER NOT NULL AUTO_INCREMENT,
    `user_id`    INT(3),
    `res_id`    INT(3),
    `number_of_people` INT(2),
    `time`    DATETIME NOT NULL,
    primary key(rsv_id)
);


CREATE TABLE `Coupon`
(
    `cp_id`    VARCHAR(10) NOT NULL,
    `res_id`    INT(3),
    `discount`    INT(2),
    `point`    INT(4),
    primary key(cp_id),
    foreign key(res_id) references Restaurant(res_id)
);

CREATE TABLE `Menu-Res`
(
    `res_id`    INT(3) NOT NULL,
    `menu_name`    VARCHAR(20) NOT NULL,
    `price`    INTEGER NOT NULL,
    primary key(res_id,menu_name),
    foreign key(res_id) references Restaurant(res_id)
);

CREATE TABLE `User-Coupon`
(
    `code`    VARCHAR(20) NOT NULL,
    `user_id`    INT(3) NOT NULL,
    `cp_id`    VARCHAR(10) NOT NULL,
    primary key(code, user_id, cp_id),
    foreign key(user_id) references Users(user_id),
    foreign key(cp_id) references Coupon(cp_id)  
);

CREATE TABLE `Review`
(
    `rv_id`    INT(3) NOT NULL AUTO_INCREMENT,
    `rate`    INT(1),
    `review`    VARCHAR(50),
    `res_id`    INT(3),
    `user_id`    INT(3),
    primary key(rv_id),
    foreign key(res_id) references Restaurant(res_id),
    foreign key(user_id) references Users(user_id)
);