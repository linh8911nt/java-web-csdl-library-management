CREATE DATABASE `library_management` DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_ci;

USE `library_management`;

CREATE TABLE `categories`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `publishers` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `authors`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `address`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `street` VARCHAR(100),
    `city` VARCHAR(50),
    `country` VARCHAR(50)
);

CREATE TABLE `students`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `code` VARCHAR(15) NOT NULL,
    `name` VARCHAR(200) NOT NULL,
    `address_id` INT NOT NULL,
    `birthday` DATE,
    `email` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(15),
    `image` VARCHAR(200),
    FOREIGN KEY (`address_id`) REFERENCES `address`(`id`)
);

CREATE TABLE `books`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `code` VARCHAR(100) NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `publisher_id` INT NOT NULL,
    `author_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `year` INT NOT NULL,
    `price` DOUBLE NOT NULL,
    `image` VARCHAR(200),
    FOREIGN KEY (`publisher_id`) REFERENCES `publishers`(`id`),
    FOREIGN KEY (`author_id`) REFERENCES `authors`(`id`),
    FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
);

CREATE TABLE `orders`(
	`id`INT PRIMARY KEY AUTO_INCREMENT,
	`student_id` INT NOT NULL,
	FOREIGN KEY (`student_id`) REFERENCES `students`(`id`)
);

CREATE TABLE `order_details`(
	`order_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	`borrow_date` DATE NOT NULL,
    `return_date` DATE NOT NULL,
    FOREIGN KEY (`book_id`) REFERENCES `books`(`id`),
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`)
);

CREATE TABLE `user` (
`id` int(11) NOT NULL,
`username` varchar(20) NOT NULL,
`password` varchar(100) NOT NULL,
`account_id` int(11) DEFAULT NULL,
`last_login` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM `user`;

INSERT INTO `user` (`id`, `username`, `password`, `account_id`, `last_login`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 0, '2018-05-07'),
(6, 'mod', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(7, 'khoa', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);