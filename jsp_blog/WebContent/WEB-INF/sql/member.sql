drop table member purge;

create table member(
	id			varchar(10)		not null,
	passwd		varchar(20)		not null,
	mname		varchar(20)		not null,
	tel			varchar(14)		null,
	email		varchar(50)		not null unique,
	zipcode		varchar(7)		null,
	address1	varchar(150)	null,
	address2	varchar(50)		null,
	job			varchar(20)		not null,
	mdate		date			not null,
	fname		varchar(50)		default 'member.jpg',
	grade		char(1)			default	'H',
	primary key	(id)
);

--create

select * from MEMBER ;

insert into member(id, passwd, mname, tel, email, zipcode,
	address1, address2, job, mdate, fname, grade)
	values('user1', '1234','개발자1','123-1234', 'email1@mail.com',
		'123-123','인천시','남동구','A01',sysdate,'man.jpg','H');
		
insert into member(id, passwd, mname, tel, email, zipcode,
	address1, address2, job, mdate, fname, grade)
	values('user2', '1234','개발자2','123-1234','email2@mail.com'
		,'123-123','인천시','서서구','A01',sysdate,'man.jpg','H');
		
insert into member(id, passwd, mname, tel, email, zipcode,
	address1, address2, job, mdate, grade)
	values('user5','1234','개발자3','123-1234','email332@mail.com',
		'123-123','서울시','중구','A01',sysdate,'iu.jpg','H')
		
insert into member(id, passwd, mname, tel, email, zipcode,
	address1, address2, job, mdate,fname, grade)
	values('admin','1234','개발자3','123-1234','ad@mail.com',
		'123-123','서울시','중구','A01',sysdate,'member.jpg','A')

		
--중복아이디 검사
select count(id) as cnt
	from MEMBER
	where id='user1';
	
--이메일중복
select count(email) as cnt
	from MEMBER
	where email = 'email@mail.com';

--user1 정보보기
select id, passwd, mname, tel, email, zipcode, ADDRESS1,address2,
	job, mdate, fname, grade
from MEMBER
where id='user1';

--회원 이미지수정
update MEMBER
set fname=''
where id='user1';

--pass변경
update MEMBER
set passwd='1234'
where id = '';

--정보수정

update MEMBER
set passwd='test',
	tel='123-123',
	email='email@email.net',
	zipcode='test',
	address1='수원',
	address2='팔달구',
	job = 'test'
	where id = 'user2';
	
-- 회원삭제
delete from member where mname= 'djkd';

--login
select count(id) as cnt
from MEMBER
where id = 'user1' and passwd = '1234';

--list

select id, mname, tel, email, zipcode, address1, address2, fname
		,r 
	from(
		select id, mname, tel, email, zipcode, address1, address2, fname
		,rownum r
		from(
			select id, mname, tel, email, zipcode, address1, address2, fname
			from MEMBER
			where mname like '%개발%'
			order by mdate desc
			)
	)where r>=1 and r<5;
	

select count(passwd) as cnt
	from MEMBER
	where id='user5';