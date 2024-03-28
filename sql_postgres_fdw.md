# Как добавить внешнюю таблицу с другово сервера
```SQL
-- обязательно для создания связи между таблицами
-- подключаем расширение если оно не подключено
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- создаем сервер с которого будем тянуть даннные
CREATE SERVER serv_doc2
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host '192.168.1.125', port '5435', dbname 'postgres');

-- добавляем логин пароль пользоватея внешней базы данных к нашему пользователю
-- CREATE USER MAPPING
--     FOR < логин пользователя на текущем сервере> SERVER <Название уделенного серсера создается командой CREATE SERVER > 
--     OPTIONS (user '< логин пользователя на удаленном сервере>', password '<Пароль пользователя на удаленном сервере>');
CREATE USER MAPPING
    FOR postgres SERVER serv_doc2 OPTIONS (user 'postgres', password '123');


-- IMPORT FOREIGN SCHEMA <Название схемы на удаленном сервере> LIMIT TO (<название таблицы на удаленном сервере которую хотим импортировать>)
--    FROM SERVER <Название уделенного серсера создается командой CREATE SERVER > INTO <Название схемы на текущем сервере куда хотим импортировать таблицы>;
-- в результате у нас появится внешняя таблица table_for_import, эта таблица уже должна быть создана на удаленном сервере
IMPORT FOREIGN SCHEMA public LIMIT TO (table_for_import)
    FROM SERVER serv_doc2 INTO public;

insert into table_for_import values (1, 'text'),(2, 'text'),(3, 'text');
select * from table_for_import;

-- в ручную создаст внешнюю таблицу на нашем сервере и свяжит с таблицей на удаленном сервере
CREATE FOREIGN TABLE foreign_table_test (
    id integer NOT NULL,
    data text
    )
    SERVER serv_doc2
    OPTIONS (schema_name 'public', table_name 'foreign_table_test');

insert into foreign_table_test values (1, 'text1'), (2, 'text2'), (3, 'text3');
select * from foreign_table_test;

CREATE FOREIGN TABLE foreign_table_test5 (
    id integer NOT NULL,
    data text
    )
    SERVER serv_doc2;

    ```
