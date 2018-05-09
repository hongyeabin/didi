drop table bbs;


create table bbs(
	bbsno 	number(7) 		not null,
	wname 	varchar(20) 	not null,
	title 	varchar(100) 	not null,
	content varchar(4000)	not null,
	passwd	varchar(15)		not null,
	viewcnt	number(5)		default 0,
	wdate	date			not null,
	grpno	number(7)		default 0,
	indent	number(2)		default 0,
	ansnum	number(5)		default 0,
	primary key(bbsno)
);
SELECT MAX(bbsno) as max FROM bbs; 

SELECT MAX(bbsno)+1 as max FROM bbs; 

SELECT NVL(MAX(bbsno), 0) as max FROM bbs; 
--새 번호 생성하기
select nvl(max(bbsno), 0) +1 as bbsno from bbs;
select * from bbs;

--create(일련번호)
insert into bbs(bbsno, wname, title,
				content,passwd,
				wdate)
		values((select nvl(max(bbsno), 0) +1 as bbsno from bbs),
				'왕눈d','왕dd','눈눈dd','123',sysdate);
--read
select	bbsno, wname, title, content, passwd, viewcnt, wdate, grpno
		indent, ansnum from bbs where bbsno=2;
--update
update	bbs	set	wname='왱눈이',
				title='비오는날',
				content='개구리연못'
			where bbsno=1;
--delete
delete from bbs where bbsno=1;


--list (paging)

	select	bbsno, wname, title, content, passwd, viewcnt, wdate, grpno,
				indent, ansnum , r
		from(
		select	bbsno, wname, title, content, passwd, viewcnt, wdate, grpno,
					indent, ansnum , rownum r
			from(
					select	bbsno, wname, title, content, passwd, viewcnt, wdate, grpno,
							indent, ansnum from bbs order by bbsno desc , ansnum			
			)
		)
	where r>= 1 and r<=5;
	
	
--pass
select	count(bbsno) as cnt
		from BBS
		where bbsno=2 and passwd='123';
		
		
--
		
UPDATE bbs 
SET viewcnt = viewcnt + 1 
WHERE bbsno=1;


DELETE FROM bbs where indent>0; 
 
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----   -----    ----- ------ ------ 
     1  부모글1     1      0      0 
 
      
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----  -----    ----- ------ ------ 
     2  부모글2      2      0      0 
     1  부모글1      1      0      0 
 
      
 BBSNO  TITLE            GRPNO INDENT ANSNUM 
 -----  -----            ----- ------ ------ 
	1	부모					1		0		0
	2	  자식				1		1		1
	3		자식의자식			1		2		2
	4		자식의자식2			1		2		3
	
	
--부모글생성
insert into bbs(bbsno, wname, title,
				content,passwd,
				wdate,grpno)
		values((select nvl(max(bbsno), 0) +1 as bbsno from bbs),
				'워웅','왕','목목','123',sysdate,
				(select nvl(max(grpno),0) +1 from bbs));
				
				
select count(*) from bbs
where wname like '%오곡%';

alter table bbs
add(refnum			number		default	0);


alter table bbs
add(filename		varchar(30)	,
	filesize		number default 0);


select * from bbs;
