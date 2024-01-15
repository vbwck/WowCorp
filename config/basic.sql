-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 15 2024 г., 20:04
-- Версия сервера: 5.7.39
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `basic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category_connection`
--

CREATE TABLE `category_connection` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_connection`
--

INSERT INTO `category_connection` (`id`, `category_id`, `person_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 3),
(16, 16, 3),
(17, 17, 3),
(18, 18, 3),
(19, 19, 4),
(20, 20, 4),
(21, 21, 4),
(22, 22, 4),
(23, 23, 4),
(24, 24, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `category` enum('off','check','support','another') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `STATUS` enum('new','progress','closed','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci,
  `NAME` enum('Ihor Kirov','Lena Stepko','Vasya Pupko','Slava Himlo') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `category`, `DATE`, `STATUS`, `info`, `NAME`) VALUES
(1, 'off', '2024-01-06', 'closed', NULL, 'Ihor Kirov'),
(2, 'off', '2024-01-06', 'closed', NULL, 'Ihor Kirov'),
(3, 'check', '2024-01-07', 'closed', NULL, 'Ihor Kirov'),
(4, 'check', '2024-01-07', 'closed', NULL, 'Ihor Kirov'),
(5, 'support', '2024-01-08', 'closed', NULL, 'Ihor Kirov'),
(6, 'another', '2024-01-07', 'closed', NULL, 'Ihor Kirov'),
(7, 'off', '2024-01-06', 'closed', NULL, 'Lena Stepko'),
(8, 'check', '2024-01-07', 'closed', NULL, 'Lena Stepko'),
(9, 'support', '2024-01-08', 'closed', NULL, 'Lena Stepko'),
(10, 'off', '2024-01-08', 'closed', NULL, 'Lena Stepko'),
(11, 'support', '2024-01-08', 'closed', NULL, 'Lena Stepko'),
(12, 'another', '2024-01-07', 'closed', NULL, 'Lena Stepko'),
(13, 'support', '2024-01-08', 'closed', NULL, 'Lena Stepko'),
(14, 'another', '2024-01-07', 'closed', NULL, 'Lena Stepko'),
(15, 'off', '2024-01-06', 'closed', NULL, 'Vasya Pupko'),
(16, 'off', '2024-01-07', 'closed', NULL, 'Vasya Pupko'),
(17, 'another', '2024-01-07', 'closed', NULL, 'Vasya Pupko'),
(18, 'check', '2024-01-07', 'closed', NULL, 'Vasya Pupko'),
(19, 'another', '2024-01-07', 'closed', NULL, 'Slava Himlo'),
(20, 'support', '2024-01-07', 'closed', NULL, 'Slava Himlo'),
(21, 'support', '2024-01-07', 'closed', NULL, 'Slava Himlo'),
(22, 'off', '2024-01-07', 'closed', NULL, 'Slava Himlo'),
(23, 'support', '2024-01-09', 'closed', NULL, 'Slava Himlo'),
(24, 'another', '2024-01-10', 'closed', NULL, 'Slava Himlo');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category_connection`
--
ALTER TABLE `category_connection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category_connection`
--
ALTER TABLE `category_connection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category_connection`
--
ALTER TABLE `category_connection`
  ADD CONSTRAINT `category_connection_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
