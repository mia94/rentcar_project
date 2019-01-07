-- proj_rentcar
DROP SCHEMA IF EXISTS proj_rentcar;

-- proj_rentcar
CREATE SCHEMA proj_rentcar;

-- �귣��
CREATE TABLE proj_rentcar.brand (
	no   CHAR(2)     NOT NULL COMMENT '�귣���ȣ', -- �귣���ȣ
	name VARCHAR(20) NOT NULL COMMENT '�귣���' -- �귣���
)
COMMENT '�귣��';

-- �귣��
ALTER TABLE proj_rentcar.brand
	ADD CONSTRAINT
		PRIMARY KEY (
			no -- �귣���ȣ
		);

-- ��(��)
CREATE TABLE proj_rentcar.car_model (
	car_code     CHAR(4)     NOT NULL COMMENT 'C001', -- C001
	name         VARCHAR(20) NOT NULL COMMENT '�̸�', -- �̸�
	color        CHAR(2)     NOT NULL COMMENT '����', -- ����
	gear         VARCHAR(5)  NOT NULL COMMENT '���� ��ƽ', -- ���� ��ƽ
	brand        CHAR(2)     NOT NULL COMMENT '�귣��', -- �귣��
	cartype      CHAR(2)     NOT NULL COMMENT '����', -- ����
	basic_charge INT(11)     NOT NULL COMMENT '��Ʈ�Ҷ� ��� ������ �⺻���', -- ��Ʈ�Ҷ� ��� ������ �⺻���
	hour6        INT(11)     NOT NULL COMMENT '6�ð��̸� �ʰ����', -- 6�ð��̸� �ʰ����
	hour10       INT(11)     NOT NULL COMMENT '10�ð��̸� �ʰ����', -- 10�ð��̸� �ʰ����
	hour12       INT(11)     NOT NULL COMMENT '12�ð����� �ʰ����', -- 12�ð����� �ʰ����
	hour_else    INT(11)     NULL     COMMENT '12�ð��ʰ� �ʰ����', -- 12�ð��ʰ� �ʰ����
	fuel_code    VARCHAR(10) NOT NULL COMMENT '�����ڵ�', -- �����ڵ�
	is_rent      TINYINT(4)  NOT NULL COMMENT '�뿩����', -- �뿩����
	rent_cnt     INT(11)     NOT NULL COMMENT '�뿩Ƚ��' -- �뿩Ƚ��
)
COMMENT '��(��)';

-- ��(��)
ALTER TABLE proj_rentcar.car_model
	ADD CONSTRAINT
		PRIMARY KEY (
			car_code -- C001
		);

-- �����ɼ�
CREATE TABLE proj_rentcar.car_option (
	no    INT(11)     NOT NULL COMMENT '�ɼǹ�ȣ', -- �ɼǹ�ȣ
	name  VARCHAR(50) NOT NULL COMMENT '�ɼǸ�', -- �ɼǸ�
	price INT(11)     NOT NULL COMMENT '�ɼǺ��' -- �ɼǺ��
)
COMMENT '�����ɼ�';

-- �����ɼ�
ALTER TABLE proj_rentcar.car_option
	ADD CONSTRAINT
		PRIMARY KEY (
			no -- �ɼǹ�ȣ
		);

-- ����(�� �� ��)
CREATE TABLE proj_rentcar.car_type (
	code CHAR(2)     NOT NULL COMMENT '����', -- ����
	type VARCHAR(20) NOT NULL COMMENT '��������' -- ��������
)
COMMENT '����(�� �� ��)';

-- ����(�� �� ��)
ALTER TABLE proj_rentcar.car_type
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- ����
		);

-- ��
CREATE TABLE proj_rentcar.customer (
	code       CHAR(4)     NOT NULL COMMENT '���ڵ�', -- ���ڵ�
	Id         VARCHAR(40) NOT NULL COMMENT '���̵�', -- ���̵�
	passwd     CHAR(42)    NOT NULL COMMENT '��й�ȣ', -- ��й�ȣ
	Name       VARCHAR(20) NOT NULL COMMENT '���̸�', -- ���̸�
	zip_code   CHAR(5)     NOT NULL COMMENT '�����ȣ', -- �����ȣ
	address    VARCHAR(50) NOT NULL COMMENT '�ּ�', -- �ּ�
	phone      VARCHAR(13) NOT NULL COMMENT '����ó', -- ����ó
	dob        DATE        NOT NULL COMMENT '�������', -- �������
	email      VARCHAR(30) NOT NULL COMMENT '�̸���', -- �̸���
	emp_code   CHAR(4)     NULL     COMMENT '�����ڵ�', -- �����ڵ�
	license    VARCHAR(40) NULL     COMMENT '��������', -- ��������
	grade_code CHAR(4)     NULL     COMMENT '����ڵ�', -- ����ڵ�
	rent_cnt   INT(11)     NULL     COMMENT '�뿩Ƚ��' -- �뿩Ƚ��
)
COMMENT '��';

-- ��
ALTER TABLE proj_rentcar.customer
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- ���ڵ�
		);

-- ���̺�Ʈ
CREATE TABLE proj_rentcar.custom_event (
	event_code  CHAR(4)    NOT NULL COMMENT '�̺�Ʈ�ڵ�', -- �̺�Ʈ�ڵ�
	custom_code CHAR(4)    NOT NULL COMMENT '���ڵ�', -- ���ڵ�
	is_use      TINYINT(1) NULL     COMMENT '�������' -- �������
)
COMMENT '���̺�Ʈ';

-- ���̺�Ʈ
ALTER TABLE proj_rentcar.custom_event
	ADD CONSTRAINT
		PRIMARY KEY (
			event_code,  -- �̺�Ʈ�ڵ�
			custom_code  -- ���ڵ�
		);

-- ����
CREATE TABLE proj_rentcar.employee (
	code   CHAR(4)     NOT NULL COMMENT '�����ڵ�', -- �����ڵ�
	name   VARCHAR(40) NOT NULL COMMENT '������', -- ������
	phone  VARCHAR(13) NOT NULL COMMENT '����ó', -- ����ó
	passwd CHAR(42)    NOT NULL COMMENT '��й�ȣ' -- ��й�ȣ
)
COMMENT '����';

-- ����
ALTER TABLE proj_rentcar.employee
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- �����ڵ�
		);

-- �̺�Ʈ
CREATE TABLE proj_rentcar.event (
	code CHAR(4)     NOT NULL COMMENT '�̺�Ʈ�ڵ�', -- �̺�Ʈ�ڵ�
	name VARCHAR(20) NOT NULL COMMENT '�̺�Ʈ��', -- �̺�Ʈ��
	rate INT(11)     NOT NULL COMMENT '������' -- ������
)
COMMENT '�̺�Ʈ';

-- �̺�Ʈ
ALTER TABLE proj_rentcar.event
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- �̺�Ʈ�ڵ�
		);

-- ����
CREATE TABLE proj_rentcar.fuel (
	no   INT(11)     NOT NULL COMMENT 'no', -- no
	code VARCHAR(10) NOT NULL COMMENT '�����ڵ�' -- �����ڵ�
)
COMMENT '����';

-- ����
ALTER TABLE proj_rentcar.fuel
	ADD CONSTRAINT
		PRIMARY KEY (
			no -- no
		);

-- ȸ�����
CREATE TABLE proj_rentcar.grade (
	code    CHAR(4)     NOT NULL COMMENT '����ڵ�', -- ����ڵ�
	name    VARCHAR(20) NOT NULL COMMENT '����̸�', -- ����̸�
	g_losal INT(11)     NOT NULL COMMENT '�ּҹ���', -- �ּҹ���
	g_hisal INT(11)     NOT NULL COMMENT '�ִ����', -- �ִ����
	rate    INT(11)     NOT NULL COMMENT '��޺�������' -- ��޺�������
)
COMMENT 'ȸ�����';

-- ȸ�����
ALTER TABLE proj_rentcar.grade
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- ����ڵ�
		);

-- ����
CREATE TABLE proj_rentcar.insurance (
	code     CHAR(4) NOT NULL COMMENT '�����ڵ�', -- �����ڵ�
	car_type CHAR(2) NOT NULL COMMENT '����', -- ����
	price    INT(11) NOT NULL COMMENT '�����' -- �����
)
COMMENT '����';

-- ����
ALTER TABLE proj_rentcar.insurance
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- �����ڵ�
		);

-- �ּ�
CREATE TABLE proj_rentcar.post (
	zipcode   CHAR(5)     NULL COMMENT '�����ȣ', -- �����ȣ
	sido      VARCHAR(20) NULL COMMENT '�õ�', -- �õ�
	sigungu   VARCHAR(20) NULL COMMENT '�ñ���', -- �ñ���
	eupmyeon  VARCHAR(20) NULL COMMENT '����', -- ����
	doro      VARCHAR(80) NULL COMMENT '����', -- ����
	building1 INT(5)      NULL COMMENT '�ǹ���1', -- �ǹ���1
	building2 INT(5)      NULL COMMENT '�ǹ���2' -- �ǹ���2
)
COMMENT '�ּ�';

-- idx_post_doro
CREATE INDEX idx_post_doro
	ON proj_rentcar.post( -- �ּ�
		doro -- ����
	);

-- idx_post_sido
CREATE INDEX idx_post_sido
	ON proj_rentcar.post( -- �ּ�
		sido -- �õ�
	);

-- �����뿩
CREATE TABLE proj_rentcar.rent (
	code           CHAR(4)    NOT NULL COMMENT 'R0001', -- R0001
	start_date     DATE       NOT NULL COMMENT '���۳�¥', -- ���۳�¥
	start_time     TIME       NOT NULL COMMENT '���۽ð�', -- ���۽ð�
	end_date       DATE       NOT NULL COMMENT '�ݳ���¥', -- �ݳ���¥
	end_time       TIME       NOT NULL COMMENT '�ݳ��ð�', -- �ݳ��ð�
	is_return      TINYINT(4) NOT NULL COMMENT '�ݳ�����', -- �ݳ�����
	basic_price    INT(11)    NOT NULL COMMENT '��Ʈ���', -- ��Ʈ���
	car_code       CHAR(4)    NOT NULL COMMENT '���ڵ�', -- ���ڵ�
	costomer_code  CHAR(4)    NOT NULL COMMENT '���ڵ�', -- ���ڵ�
	insurance_code CHAR(4)    NOT NULL COMMENT '�����ڵ�', -- �����ڵ�
	e_code         CHAR(4)    NULL     COMMENT '�̺�Ʈ�ڵ�', -- �̺�Ʈ�ڵ�
	opt_price      INT(11)    NOT NULL COMMENT '�ɼǺ��' -- �ɼǺ��
)
COMMENT '�����뿩';

-- �����뿩
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT
		PRIMARY KEY (
			code -- R0001
		);

-- �߰��ɼ�
CREATE TABLE proj_rentcar.rentcar_options (
	option_id INT(11) NOT NULL COMMENT '�ɼǹ�ȣ', -- �ɼǹ�ȣ
	code      CHAR(4) NULL     COMMENT '�����뿩��ȣ' -- �����뿩��ȣ
)
COMMENT '�߰��ɼ�';

-- ����
CREATE TABLE proj_rentcar.userpic (
	car_code CHAR(4) NOT NULL COMMENT 'C001', -- C001
	pic      LONGBLOB    NOT NULL COMMENT '����' -- ����
)
COMMENT '����';

-- ����
ALTER TABLE proj_rentcar.userpic
	ADD CONSTRAINT
		PRIMARY KEY (
			car_code -- C001
		);

-- ��(��)
ALTER TABLE proj_rentcar.car_model
	ADD CONSTRAINT FK_brand_TO_car_model -- FK_brand_TO_car_model
		FOREIGN KEY (
			brand -- �귣��
		)
		REFERENCES proj_rentcar.brand ( -- �귣��
			no -- �귣���ȣ
		),
	ADD INDEX FK_brand_TO_car_model (
		brand -- �귣��
	);

-- ��(��)
ALTER TABLE proj_rentcar.car_model
	ADD CONSTRAINT FK_car_type_TO_car_model -- FK_car_type_TO_car_model
		FOREIGN KEY (
			cartype -- ����
		)
		REFERENCES proj_rentcar.car_type ( -- ����(�� �� ��)
			code -- ����
		),
	ADD INDEX FK_car_type_TO_car_model (
		cartype -- ����
	);

-- ��
ALTER TABLE proj_rentcar.customer
	ADD CONSTRAINT FK_employee_TO_customer -- FK_employee_TO_customer
		FOREIGN KEY (
			emp_code -- �����ڵ�
		)
		REFERENCES proj_rentcar.employee ( -- ����
			code -- �����ڵ�
		),
	ADD INDEX FK_employee_TO_customer (
		emp_code -- �����ڵ�
	);

-- ��
ALTER TABLE proj_rentcar.customer
	ADD CONSTRAINT FK_grade_TO_customer -- FK_grade_TO_customer
		FOREIGN KEY (
			grade_code -- ����ڵ�
		)
		REFERENCES proj_rentcar.grade ( -- ȸ�����
			code -- ����ڵ�
		),
	ADD INDEX FK_grade_TO_customer (
		grade_code -- ����ڵ�
	);

-- ���̺�Ʈ
ALTER TABLE proj_rentcar.custom_event
	ADD CONSTRAINT FK_customer_TO_custom_event -- FK_customer_TO_custom_event
		FOREIGN KEY (
			custom_code -- ���ڵ�
		)
		REFERENCES proj_rentcar.customer ( -- ��
			code -- ���ڵ�
		),
	ADD INDEX FK_customer_TO_custom_event (
		custom_code -- ���ڵ�
	);

-- ���̺�Ʈ
ALTER TABLE proj_rentcar.custom_event
	ADD CONSTRAINT FK_event_TO_custom_event -- FK_event_TO_custom_event
		FOREIGN KEY (
			event_code -- �̺�Ʈ�ڵ�
		)
		REFERENCES proj_rentcar.event ( -- �̺�Ʈ
			code -- �̺�Ʈ�ڵ�
		),
	ADD INDEX FK_event_TO_custom_event (
		event_code -- �̺�Ʈ�ڵ�
	);

-- �����뿩
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT FK_car_model_TO_rent -- FK_car_model_TO_rent
		FOREIGN KEY (
			car_code -- ���ڵ�
		)
		REFERENCES proj_rentcar.car_model ( -- ��(��)
			car_code -- C001
		),
	ADD INDEX FK_car_model_TO_rent (
		car_code -- ���ڵ�
	);

-- �����뿩
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT FK_customer_TO_rent -- FK_customer_TO_rent
		FOREIGN KEY (
			costomer_code -- ���ڵ�
		)
		REFERENCES proj_rentcar.customer ( -- ��
			code -- ���ڵ�
		),
	ADD INDEX FK_customer_TO_rent (
		costomer_code -- ���ڵ�
	);

-- �����뿩
ALTER TABLE proj_rentcar.rent
	ADD CONSTRAINT FK_insurance_TO_rent -- FK_insurance_TO_rent
		FOREIGN KEY (
			insurance_code -- �����ڵ�
		)
		REFERENCES proj_rentcar.insurance ( -- ����
			code -- �����ڵ�
		),
	ADD INDEX FK_insurance_TO_rent (
		insurance_code -- �����ڵ�
	);

-- �߰��ɼ�
ALTER TABLE proj_rentcar.rentcar_options
	ADD CONSTRAINT FK_car_option_TO_add_option -- FK_car_option_TO_add_option
		FOREIGN KEY (
			option_id -- �ɼǹ�ȣ
		)
		REFERENCES proj_rentcar.car_option ( -- �����ɼ�
			no -- �ɼǹ�ȣ
		),
	ADD INDEX FK_car_option_TO_add_option (
		option_id -- �ɼǹ�ȣ
	);

-- �߰��ɼ�
ALTER TABLE proj_rentcar.rentcar_options
	ADD CONSTRAINT FK_rent_TO_rentCar_options -- FK_rent_TO_rentCar_options
		FOREIGN KEY (
			code -- �����뿩��ȣ
		)
		REFERENCES proj_rentcar.rent ( -- �����뿩
			code -- R0001
		),
	ADD INDEX FK_rent_TO_rentCar_options (
		code -- �����뿩��ȣ
	);

-- ����
ALTER TABLE proj_rentcar.userpic
	ADD CONSTRAINT FK_car_model_TO_userPic -- FK_car_model_TO_userPic
		FOREIGN KEY (
			car_code -- C001
		)
		REFERENCES proj_rentcar.car_model ( -- ��(��)
			car_code -- C001
		)
		ON DELETE cascade
		ON UPDATE cascade;
		
-- ����� ��踦 �������� view
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