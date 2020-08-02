use dairy;
    create table post(
    id         int auto_increment not null
        primary key,
    date_time  date         null,
    done_dairy bit          not null,
    full_text  varchar(255) null,
    title      varchar(255) null
);

insert into post ( id,date_time, done_dairy, full_text, title)
values (1,'2020-01-02',false,'Встреча в Дордой-плаза','Совещание'),
 (2,'2020-10-02',true,'Город Ош','Командировка'),
 (3,'2020-09-28',false ,'В Бишкек-Парке','Шоппинг');

