drop database if EXISTS   stdls;
drop user if exists 'stdls'@'localhost';
create database stdls CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
use stdls;
create user 'stdls'@'localhost' identified by '123456';
grant all privileges on stdls.* to 'stdls'@'localhost';
flush privileges;
