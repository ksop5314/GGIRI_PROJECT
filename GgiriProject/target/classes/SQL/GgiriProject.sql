create table ggirimember(
name varchar2(30) not null,
id varchar2(30) primary key,
pwd varchar2(30) not null,
birth varchar2(8) not null,
gender varchar2(3),
email varchar2(30) not null,
tel varchar2(13),
addr varchar2(100) not null,
job varchar2(20),
skill varchar2(500),
logtime date default sysdate
);

desc ggirimember;

select * from ggirimember;

drop table ggirimember purge;
delete from ggirimember where id='userF';
commit;