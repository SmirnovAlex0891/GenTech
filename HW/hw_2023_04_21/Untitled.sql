CREATE TABLE `users` (
  `user_id` int PRIMARY KEY,
  `user_name` varchar(255)
);

CREATE TABLE `movies` (
  `movie_id` int PRIMARY KEY,
  `title` varchar(255)
);

CREATE TABLE `halls` (
  `hall_id` int PRIMARY KEY,
  `hall_name` varchar(255)
);

CREATE TABLE `timetable` (
  `movie_id` int,
  `hall_id` int,
  `time_data` datetime,
  `price` int,
  `vip_price` int
);

CREATE TABLE `tickets` (
  `is_paid` bool,
  `session` varchar(255),
  `place` varchar(255),
  `user_id` int,
  `discount_id` ind
);

CREATE TABLE `discounts` (
  `discount_id` int PRIMARY KEY,
  `discount_information` varchar(255)
);

ALTER TABLE `timetable` ADD FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

ALTER TABLE `timetable` ADD FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`);

ALTER TABLE `tickets` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `tickets` ADD FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);
