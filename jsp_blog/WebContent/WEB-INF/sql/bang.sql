 Drop table bang;
 
 Create table bang(
 	gbno	number(6)		not null,
 	mname	varchar(30)		not null,
 	bdate	date			not null,
 	content varchar(4000)	not null,
 	fname	varchar(20)		default 'member.jpg',
 	primary key(gbno)
 );
 	
 
 select * from bang;
 
 insert into bang(gbno , mname , bdate , content , fname)
 		values((select nvl(max(gbno), 0) +1 as gbno from bang),
 			'ssss' , sysdate , 'dfdf' , 'member.jpg');
 			
delete from bang where gbno=1;

update bang
	set content = '바이요' 
	where gbno=1;
	
select gbno , mname , bdate , content , fname
		,r 
	from(
		select gbno , mname , bdate , content , fname
		,rownum r
		from(
			select gbno , mname , bdate , content , fname
			from bang
			where gbno like '1'
			order by gbno desc
			)
	)where r>=1 and r<5;