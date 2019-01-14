select * from customer;


select * from custom_event;

select zipcode, sido, sigungu, eupmyeon, doro, building1 , building2
from post
where sido='대구광역시' and doro='태전로' 
order by building1, building2;

select zipcode, sido, sigungu, eupmyeon, doro, building1 , if(building2=0,'',building2),building2
from post
where sido='대구광역시' and doro='태전로' 
order by building1, building2;


SELECT Id as id
		FROM proj_rentcar.customer
		where name = '김철수'
		and email =	'abc@gmail.com';


select zipcode, sido, sigungu, eupmyeon, doro, building1 , if(building2=0,'',building2) as building2
		from post
		where sido='대구광역시' and doro='태전로'  
		order by building1, (if(building2=0,'',building2));
		

update customer
		set
		Id=#{id}, passwd=password(#{passwd}), Name=#{name},
		address=#{address}, zip_code=#{zipCode},
		phone=#{phone}, dob=#{dob},
		email=#{email}, emp_code=#{empCode.code}, license=#{license},
		grade_code=#{gradeCode.code},
		rent_cnt=#{rentCnt}
		where Id=#{id}
		
		
update customer 
set passwd=password('root') 
where name = '김재영'
and email ='xbmhw325@daum.com' and id = 'xbmhw325';


select * from customer
where id='asd132';

select count(*)+1 from
		event;
		
	
select max(code) from
		customer;
	
select lpad(max(right(code,3)),3,'0')from customer;

select concat('C',lpad(max(right(code,3)+1),3,'0'))  from customer;

select lpad(max(right(code,3)+1),3,'0')  from customer;


select concat('G',lpad(max(right(code,3)+1),3,'0'))  from grade;


-- 오른쪽에서 몇번째인가 right(code,1)
select concat('EVT',lpad(max(right(code,1)+1),1,'0'))  from event;

select concat('E',lpad(max(right(code,3)+1),3,'0'))  from employee;

select * from grade;

select * from employee;

