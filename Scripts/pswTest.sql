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


select zipcode, sido, sigungu, eupmyeon, doro, building1 , if(building2=0,'',building2) as building2
		from post
		where sido='대구광역시' and doro='태전로'  
		order by building1, (if(building2=0,'',building2));
		

