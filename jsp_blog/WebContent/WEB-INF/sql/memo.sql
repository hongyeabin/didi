
select*from memo;
drop table memo;
create table memo(
memono number(6) not null,
title varchar(100) not null,
content varchar(4000) not null,
wdate date not null,
viewcnt number(5) default 0,
primary key(memono)
);
-- sequence 객체 삭제
drop sequence memo_seq;
-- sequence 객체 생성
create sequence memo_seq
start with 1
increment by 1
minvalue 0
cache 100;

select memo_seq.nextval from dual;

select memo_seq.currval from dual;

insert into memo(memono, title, content, wdate)
values(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate);


select memono, title, wdate, viewcnt, grpno,indent,ansnum,r
from(
select memono, title, wdate, viewcnt, grpno,indent,ansnum,rownum r
from(
select memono, title, wdate, viewcnt, grpno,indent,ansnum
from memo
order by grpno desc, ansnum
)
)where r>=1 and r<=5;

INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '읽을 도서', '가메출판사 오라클 11g', sysdate); 

insert into memo(memono, title, content, wdate) 
values(memo_seq.nextval,'수업복습', '메모제작',sysdate);

INSERT INTO memo 
VALUES(memo_seq.nextval, '도서구입', 'JSP Web Programming', sysdate, 0); 

DROP TABLE news;
--답변추가시 create
insert into memo(memono, title, content, wdate, grpno)
values(memo_seq.nextval,'오늘의 약속','프로젝트 하기',sysdate,(select nvl(max(grpno), 0) + 1 from memo));

delete from memo;

--답변 read
select memono, title, wdate, viewcnt,grpno
from memo where memono=1;
--답변 ansnum
update MEMO
set ansnum = nasnum+1
where grpno=2
and ansnum > 0;
--답변 create

insert into memo(memono, title, content, wdate, grpno,indent,ansnum)
values(memo_seq.nextval,'오늘의 약속','프로젝트 하기',sysdate,(select nvl(max(grpno), 0)+1 from memo),1,1);


alter table memo
add(grpno   number	default 0,
	indent	number	default 0,
	ansnum	number	default 0);
 
insert into memo(memono, title, content, wdate,grpno)
values(memo_seq.nextval,'dddd','dddd',sysdate,
(select nvl(max(grpno), 0)+1 from memo));
	
select count(refnum) from memo
where refnum=565;


alter table memo
add(refnum1   number	default 0);

alter table memo
drop column refnum1;
select count(refnum) from memo
where refnum=1;
