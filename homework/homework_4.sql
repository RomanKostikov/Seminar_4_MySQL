use seminar_4;

drop table AUTO;
-- Создание таблицы машин
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

-- Заполнение данными
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM ) VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

select * from AUTO;

-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
select mark 'Произодитель', color 'Цвет', count(*) 'Остаток' 
from auto 
where mark in ('BMW','LADA')
group by color, mark
order by mark, color;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки
select 
	mark 'Производитель', 
	count(*) 'Количество машин произодителя', 
    (select sum(a.total) 
		from (select mark, count(*) total 
				from auto 
                group by mark 
                having mark != a_all.mark) a) 'Остаток машин других производителей'
from auto a_all group by mark;

-- 3. Даны 2 таблицы, созданные следующим образом:
drop table test_a;
drop table test_b;

create table test_a (id int, data varchar(1));
create table test_b (id int);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);
/*
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, 
НЕ используя ключевого слова NOT.
*/
select a.* from test_a a 
left join test_b b 
on a.id = b.id 
where b.id is null;