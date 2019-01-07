-- proj_rentcar
DROP SCHEMA IF EXISTS proj_rentcar;

-- proj_rentcar
CREATE SCHEMA proj_rentcar;

-- 브랜드
CREATE TABLE proj_rentcar.brand (
	no   CHAR(2)     NOT NULL COMMENT '브랜드번호', -- 브랜드번호
	name VARCHAR(20) NOT NULL COMMENT '브랜드명' -- 브랜드명
)
COMMENT '브랜드';

-- 브랜드
ALTER TABLE proj_rentcar.brand
	ADD CONSTRAINT
		PRIMARY KEY (
			no -- 브랜드번호
		);

-- 차(모델)
CREATE TABLE proj_rentcar.car_model (
	car_code     CHAR(4)     NOT NULL COMMENT 'C001', -- C001
	name         VARCHAR(20) NOT NULL COMMENT '이름', -- 이름
	color        CHAR(2)     NOT NULL COMMENT '색상', -- 색상
	gear         VARCHAR(5)  NOT NULL COMMENT '오토 스틱', -- 오토 스틱
	brand        CHAR(2)     NOT NULL COMMENT '브랜드', -- 브랜드
	cartype      CHAR(2)     NOT NULL COMMENT '차종', -- 차종
	basic_charge INT(11)     NOT NULL COMMENT '렌트할때 드는 차종별 기본비용', -- 렌트할때 드는 차종별 기본비용
	hour6        INT(11)     NOT NULL COMMENT '6시간미만 초과비용', -- 6시간미만 초과비용
	hour10       INT(11)     NOT NULL COMMENT '10시간미만 초과비용', -- 10시간미만 초과비용
	hour12       INT(11)     NOT NULL COMMENT '12시간이하 초과비용', -- 12시간이하 초과비용
	hour_else    INT(11)     NULL     COMMENT '12시간초과 초과비용', -- 12시간초과 초과비용
	fuel_code    VARCHAR(10) NOT NULL COMMENT '연료코드', -- 연료코드
	is_rent      TINYINT(4)  NOT NULL COMMENT '대여여부', -- 대여여부
	rent_cnt     INT(11)     NOT NULL COMMENT '대여횟수' -- 대여횟수
)
COMMENT '차(모델)';

-- 차(모델)
ALTER TABLE proj_rentcar.car_model
	ADD CONSTRAINT
		PRIMARY KEY (
			car_code -- C001
		);

-- 차량옵션
CREATE TABLE proj_rentcar.car_option (
	no    INT(11)     NOT NULL COMMENT '옵션번호', -- 옵션번호
	name  VARCHAR(50) NOT NULL COMMENT '옵션명', -- 옵션명
	price INT(11)     NOT NULL COMMENT '옵션비용' -- 옵션비용
)
COMMENT '차량옵션';

-- 차량옵션
ALTER TABLE proj_rentcar.car_option
	ADD CONSTRAINT
		PRIMARY KEY (
			no -- 옵션번호
		);

-- 차종(소 중 대)
CREATE TABLE proj_rentcar.car_type (
	code CHAR(2)     NOT NULL COMMENT '차종', -- 차종
	type VARCHAR(20) NOT NULL COMMENT '차량유형' -- 차량유형
)
COMMENT '차종(소 중 대)';

-- 차종(소 중 대)
ALTER TABLE proj_rentcar.car_type
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- 차종
		);

-- 고객
CREATE TABLE proj_rentcar.customer (
	code       CHAR(4)     NOT NULL COMMENT '고객코드', -- 고객코드
	Id         VARCHAR(40) NOT NULL COMMENT '아이디', -- 아이디
	passwd     CHAR(42)    NOT NULL COMMENT '비밀번호', -- 비밀번호
	Name       VARCHAR(20) NOT NULL COMMENT '고객이름', -- 고객이름
	zip_code   CHAR(5)     NOT NULL COMMENT '우편번호', -- 우편번호
	address    VARCHAR(50) NOT NULL COMMENT '주소', -- 주소
	phone      VARCHAR(13) NOT NULL COMMENT '연락처', -- 연락처
	dob        DATE        NOT NULL COMMENT '생년월일', -- 생년월일
	email      VARCHAR(30) NOT NULL COMMENT '이메일', -- 이메일
	emp_code   CHAR(4)     NULL     COMMENT '직원코드', -- 직원코드
	license    VARCHAR(40) NULL     COMMENT '면허종류', -- 면허종류
	grade_code CHAR(4)     NULL     COMMENT '등급코드', -- 등급코드
	rent_cnt   INT(11)     NULL     COMMENT '대여횟수' -- 대여횟수
)
COMMENT '고객';

-- 고객
ALTER TABLE proj_rentcar.customer
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- 고객코드
		);

-- 고객이벤트
CREATE TABLE proj_rentcar.custom_event (
	event_code  CHAR(4)    NOT NULL COMMENT '이벤트코드', -- 이벤트코드
	custom_code CHAR(4)    NOT NULL COMMENT '고객코드', -- 고객코드
	is_use      TINYINT(1) NULL     COMMENT '사용유무' -- 사용유무
)
COMMENT '고객이벤트';

-- 고객이벤트
ALTER TABLE proj_rentcar.custom_event
	ADD CONSTRAINT
		PRIMARY KEY (
			event_code,  -- 이벤트코드
			custom_code  -- 고객코드
		);

-- 직원
CREATE TABLE proj_rentcar.employee (
	code   CHAR(4)     NOT NULL COMMENT '직원코드', -- 직원코드
	name   VARCHAR(40) NOT NULL COMMENT '직원명', -- 직원명
	phone  VARCHAR(13) NOT NULL COMMENT '연락처', -- 연락처
	passwd CHAR(42)    NOT NULL COMMENT '비밀번호' -- 비밀번호
)
COMMENT '직원';

-- 직원
ALTER TABLE proj_rentcar.employee
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- 직원코드
		);

-- 이벤트
CREATE TABLE proj_rentcar.event (
	code CHAR(4)     NOT NULL COMMENT '이벤트코드', -- 이벤트코드
	name VARCHAR(20) NOT NULL COMMENT '이벤트명', -- 이벤트명
	rate INT(11)     NOT NULL COMMENT '할인율' -- 할인율
)
COMMENT '이벤트';

-- 이벤트
ALTER TABLE proj_rentcar.event
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- 이벤트코드
		);

-- 연료
CREATE TABLE proj_rentcar.fuel (
	no   INT(11)     NOT NULL COMMENT 'no', -- no
	code VARCHAR(10) NOT NULL COMMENT '연료코드' -- 연료코드
)
COMMENT '연료';

-- 연료
ALTER TABLE proj_rentcar.fuel
	ADD CONSTRAINT
		PRIMARY KEY (
			no -- no
		);

-- 회원등급
CREATE TABLE proj_rentcar.grade (
	code    CHAR(4)     NOT NULL COMMENT '등급코드', -- 등급코드
	name    VARCHAR(20) NOT NULL COMMENT '등급이름', -- 등급이름
	g_losal INT(11)     NOT NULL COMMENT '최소범위', -- 최소범위
	g_hisal INT(11)     NOT NULL COMMENT '최대범위', -- 최대범위
	rate    INT(11)     NOT NULL COMMENT '등급별할인율' -- 등급별할인율
)
COMMENT '회원등급';

-- 회원등급
ALTER TABLE proj_rentcar.grade
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- 등급코드
		);

-- 보험
CREATE TABLE proj_rentcar.insurance (
	code     CHAR(4) NOT NULL COMMENT '보험코드', -- 보험코드
	car_type CHAR(2) NOT NULL COMMENT '차종', -- 차종
	price    INT(11) NOT NULL COMMENT '보험료' -- 보험료
)
COMMENT '보험';

-- 보험
ALTER TABLE proj_rentcar.insurance
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- 보험코드
		);

-- 주소
CREATE TABLE proj_rentcar.post (
	zipcode   CHAR(5)     NULL COMMENT '우편번호', -- 우편번호
	sido      VARCHAR(20) NULL COMMENT '시도', -- 시도
	sigungu   VARCHAR(20) NULL COMMENT '시군구', -- 시군구
	eupmyeon  VARCHAR(20) NULL COMMENT '읍면', -- 읍면
	doro      VARCHAR(80) NULL COMMENT '도로', -- 도로
	building1 INT(5)      NULL COMMENT '건물명1', -- 건물명1
	building2 INT(5)      NULL COMMENT '건물명2' -- 건물명2
)
COMMENT '주소';

-- idx_post_doro
CREATE INDEX idx_post_doro
	ON proj_rentcar.post( -- 주소
		doro -- 도로
	);

-- idx_post_sido
CREATE INDEX idx_post_sido
	ON proj_rentcar.post( -- 주소
		sido -- 시도
	);

-- 차량대여
CREATE TABLE proj_rentcar.rent (
	code           CHAR(4)    NOT NULL COMMENT 'R0001', -- R0001
	start_date     DATE       NOT NULL COMMENT '시작날짜', -- 시작날짜
	start_time     TIME       NOT NULL COMMENT '시작시간', -- 시작시간
	end_date       DATE       NOT NULL COMMENT '반납날짜', -- 반납날짜
	end_time       TIME       NOT NULL COMMENT '반납시간', -- 반납시간
	is_return      TINYINT(4) NOT NULL COMMENT '반납여부', -- 반납여부
	basic_price    INT(11)    NOT NULL COMMENT '렌트비용', -- 렌트비용
	car_code       CHAR(4)    NOT NULL COMMENT '차코드', -- 차코드
	costomer_code  CHAR(4)    NOT NULL COMMENT '고객코드', -- 고객코드
	insurance_code CHAR(4)    NOT NULL COMMENT '보험코드', -- 보험코드
	e_code         CHAR(4)    NULL     COMMENT '이벤트코드', -- 이벤트코드
	opt_price      INT(11)    NOT NULL COMMENT '옵션비용' -- 옵션비용
)
COMMENT '차량대여';

-- 차량대여
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- R0001
		);

-- 추가옵션
CREATE TABLE proj_rentcar.rentcar_options (
	option_id INT(11) NOT NULL COMMENT '옵션번호', -- 옵션번호
	code      CHAR(4) NULL     COMMENT '차량대여번호' -- 차량대여번호
)
COMMENT '추가옵션';

-- 사진
CREATE TABLE proj_rentcar.userpic (
	car_code CHAR(4) NOT NULL COMMENT 'C001', -- C001
	pic      LONGBLOB    NOT NULL COMMENT '사진' -- 사진
)
COMMENT '사진';

-- 사진
ALTER TABLE proj_rentcar.userpic
	ADD CONSTRAINT
		PRIMARY KEY (
			car_code -- C001
		);

-- 차(모델)
ALTER TABLE proj_rentcar.car_model
	ADD CONSTRAINT FK_brand_TO_car_model -- FK_brand_TO_car_model
		FOREIGN KEY (
			brand -- 브랜드
		)
		REFERENCES proj_rentcar.brand ( -- 브랜드
			no -- 브랜드번호
		),
	ADD INDEX FK_brand_TO_car_model (
		brand -- 브랜드
	);

-- 차(모델)
ALTER TABLE proj_rentcar.car_model
	ADD CONSTRAINT FK_car_type_TO_car_model -- FK_car_type_TO_car_model
		FOREIGN KEY (
			cartype -- 차종
		)
		REFERENCES proj_rentcar.car_type ( -- 차종(소 중 대)
			code -- 차종
		),
	ADD INDEX FK_car_type_TO_car_model (
		cartype -- 차종
	);

-- 고객
ALTER TABLE proj_rentcar.customer
	ADD CONSTRAINT FK_employee_TO_customer -- FK_employee_TO_customer
		FOREIGN KEY (
			emp_code -- 직원코드
		)
		REFERENCES proj_rentcar.employee ( -- 직원
			code -- 직원코드
		),
	ADD INDEX FK_employee_TO_customer (
		emp_code -- 직원코드
	);

-- 고객
ALTER TABLE proj_rentcar.customer
	ADD CONSTRAINT FK_grade_TO_customer -- FK_grade_TO_customer
		FOREIGN KEY (
			grade_code -- 등급코드
		)
		REFERENCES proj_rentcar.grade ( -- 회원등급
			code -- 등급코드
		),
	ADD INDEX FK_grade_TO_customer (
		grade_code -- 등급코드
	);

-- 고객이벤트
ALTER TABLE proj_rentcar.custom_event
	ADD CONSTRAINT FK_customer_TO_custom_event -- FK_customer_TO_custom_event
		FOREIGN KEY (
			custom_code -- 고객코드
		)
		REFERENCES proj_rentcar.customer ( -- 고객
			code -- 고객코드
		),
	ADD INDEX FK_customer_TO_custom_event (
		custom_code -- 고객코드
	);

-- 고객이벤트
ALTER TABLE proj_rentcar.custom_event
	ADD CONSTRAINT FK_event_TO_custom_event -- FK_event_TO_custom_event
		FOREIGN KEY (
			event_code -- 이벤트코드
		)
		REFERENCES proj_rentcar.event ( -- 이벤트
			code -- 이벤트코드
		),
	ADD INDEX FK_event_TO_custom_event (
		event_code -- 이벤트코드
	);

-- 차량대여
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT FK_car_model_TO_rent -- FK_car_model_TO_rent
		FOREIGN KEY (
			car_code -- 차코드
		)
		REFERENCES proj_rentcar.car_model ( -- 차(모델)
			car_code -- C001
		),
	ADD INDEX FK_car_model_TO_rent (
		car_code -- 차코드
	);

-- 차량대여
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT FK_customer_TO_rent -- FK_customer_TO_rent
		FOREIGN KEY (
			costomer_code -- 고객코드
		)
		REFERENCES proj_rentcar.customer ( -- 고객
			code -- 고객코드
		),
	ADD INDEX FK_customer_TO_rent (
		costomer_code -- 고객코드
	);

-- 차량대여
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT FK_insurance_TO_rent -- FK_insurance_TO_rent
		FOREIGN KEY (
			insurance_code -- 보험코드
		)
		REFERENCES proj_rentcar.insurance ( -- 보험
			code -- 보험코드
		),
	ADD INDEX FK_insurance_TO_rent (
		insurance_code -- 보험코드
	);

-- 추가옵션
ALTER TABLE proj_rentcar.rentcar_options
	ADD CONSTRAINT FK_car_option_TO_add_option -- FK_car_option_TO_add_option
		FOREIGN KEY (
			option_id -- 옵션번호
		)
		REFERENCES proj_rentcar.car_option ( -- 차량옵션
			no -- 옵션번호
		),
	ADD INDEX FK_car_option_TO_add_option (
		option_id -- 옵션번호
	);

-- 추가옵션
ALTER TABLE proj_rentcar.rentcar_options
	ADD CONSTRAINT FK_rent_TO_rentCar_options -- FK_rent_TO_rentCar_options
		FOREIGN KEY (
			code -- 차량대여번호
		)
		REFERENCES proj_rentcar.rent ( -- 차량대여
			code -- R0001
		),
	ADD INDEX FK_rent_TO_rentCar_options (
		code -- 차량대여번호
	);

-- 사진
ALTER TABLE proj_rentcar.userpic
	ADD CONSTRAINT FK_car_model_TO_userPic -- FK_car_model_TO_userPic
		FOREIGN KEY (
			car_code -- C001
		)
		REFERENCES proj_rentcar.car_model ( -- 차(모델)
			car_code -- C001
		)
		ON DELETE cascade
		ON UPDATE cascade;
		
-- 매출액 통계를 내기위한 view
create view proj_rentcar.vw_price_stat as
select b.name as brand, ct.`type` as carType,
round( ( datediff(concat(end_date, ' ', end_time), concat(start_date, ' ', start_time)) * cm.basic_charge ) + i.price + r.opt_price * (100 - if(g.rate > e.rate, g.rate, e.rate)) / 100 ) as totalPrice
from proj_rentcar.rent r left join proj_rentcar.car_model cm on cm.car_code = r.car_code 
join proj_rentcar.insurance i on r.insurance_code = i.code
join proj_rentcar.customer c on r.costomer_code = c.code
join proj_rentcar.custom_event ce on c.code = ce.custom_code
join proj_rentcar.event e on ce.event_code = e.code
join proj_rentcar.grade g on c.grade_code = g.code
join proj_rentcar.car_type ct on cm.cartype = ct.code
join proj_rentcar.brand b on b.`no` = cm.brand
group by b.name, ct.`type`;