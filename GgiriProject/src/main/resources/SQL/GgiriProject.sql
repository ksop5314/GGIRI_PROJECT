create table ggirimember(
name varchar2(30) not null,
id varchar2(30) primary key,
pwd varchar2(30),
birth varchar2(8),
gender varchar2(3),
email varchar2(30),
tel varchar2(13),
addr varchar2(100),
logtime date default sysdate
);

desc ggirimember;

select * from ggirimember;

drop table ggirimember purge;
delete from ggirimember where id='ksop6580';

commit;

create Table ggiriFree_insert(
id varchar2(30) ,
introduce varchar2(30) not null,
job varchar2(20),
skill varchar2(500),
project_period number(30) not null,
place_of_work varchar2(100) not null, -- 근무지
insertdate date default sysdate,
CONSTRAINT ggiri_test FOREIGN KEY(id) REFERENCES ggirimember(id) ON DELETE CASCADE
);

desc ggiriFree_insert;
select * from ggiriFree_insert;
drop table ggiriFree_insert purge;

create table ggiriProject(
projectNum NUMBER(10) PRIMARY KEY,
title VARCHAR2(200),
content VARCHAR2(2000),
members VARCHAR2(100),
prodate DATE DEFAULT SYSDATE,
proHit NUMBER(10) DEFAULT 0,
id VARCHAR2(20) NOT NULL,
skill VARCHAR2(50)
);

CREATE SEQUENCE ggiriProject_seq NOCACHE NOCYCLE;
drop sequence ggiriProject_seq;

desc ggiriProject;
select * from ggiriProject;
drop table ggiriProject purge;

create table ggiriComplete(
completeNum NUMBER(10) PRIMARY KEY,
title VARCHAR2(300),
content VARCHAR2(3000),
skill VARCHAR2(500),
members VARCHAR2(100),
tag VARCHAR2(300),
comdate DATE,
comHit NUMBER(10) DEFAULT 0,
id VARCHAR2(20) NOT NULL
);
CREATE SEQUENCE ggiriComplete_seq NOCACHE NOCYCLE;

desc ggiriComplete;
select * from ggiriComplete;
drop table ggiriComplete purge;

CREATE TABLE ggiriReply (
id VARCHAR2(20),
content VARCHAR2(300),
write_group NUMBER(10),
wrtie_date DATE DEFAULT SYSDATE,
CONSTRAINT fk_test1 FOREIGN KEY(write_group) REFERENCES ggiriProject(projectNum) ON DELETE CASCADE,
CONSTRAINT fk_test2 FOREIGN KEY(id) REFERENCES ggiriMember(id) ON DELETE CASCADE
);

desc ggiriReply;
select * from ggiriReply;
drop table ggiriReply purge;