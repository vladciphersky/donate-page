-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 20 2020 г., 07:15
-- Версия сервера: 5.7.27-0ubuntu0.18.04.1
-- Версия PHP: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `donate-page`
--

-- --------------------------------------------------------

--
-- Структура таблицы `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL COMMENT 'ID доната в базе',
  `username` text NOT NULL COMMENT 'Никнейм указанный при платеже на сайте',
  `money` text NOT NULL COMMENT 'Сколько задонатили (донат+валюта)',
  `comment` text NOT NULL COMMENT 'Комментарий к донату',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время когда был получен донат базой'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `donations`
--

INSERT INTO `donations` (`id`, `username`, `money`, `comment`, `time`) VALUES
(1, 'user1', '2.00 USD (144.78 RUB)', 'Ты очень классный!', '2020-05-20 03:18:54'),
(2, 'user2', '150.00 RUB', 'Отправил на тачку! :D', '2020-05-20 04:03:23');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID доната в базе', AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
