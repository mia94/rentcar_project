package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.model.StateCar;

public interface CustomerDao {
	List<Customer> selectCustomerByName(Customer customer);

	List<Customer> selectCustomerByAll();

	Customer selectCustomerById(Customer customer);

	int insertCustomer(Customer customer);

	int updateCustomer(Customer customer);

	@Delete("delete from customer where code=#{code}")
	int deleteCustomer(Customer customer);

	String nextCustomerCode();

	String nextCode();

	Customer selectCustomerByPw(Customer customer);

	// 추가
	Customer selectCustomerByCode(Customer customer);

	///////////////////////// 트랜잭션 처리 //////////////////////////
	void insertCustomerJoin(Customer customer, CustomEvent customEvent);

	///////////////////////// 트랜잭션 처리 //////////////////////////
	void deleteCustomerEvent(Customer customer, CustomEvent customEvent);

	// rent 등록시 customer의 대여횟수 1증가
	@Update("update customer set rent_cnt = rent_cnt + 1 where code=#{code}")
	int updateCustomerRentCnt(Customer customer);

	// 대여횟수 1증가시 등급조정하기 위한 등급검색
	@Select("select g.code from customer c , grade g where (rent_cnt between g.g_losal and g.g_hisal) and c.code=#{code}")
	String selectGradeCustomer(Customer customer);

	// 등급 조정
	@Update("update customer set grade_code = #{gradeCode.code} where code = #{code}")
	int updateCustomerGrade(Customer customer);

	/*
	 * @Select("select Id from customer c where c.phone = #{phone} and c.email = #{email}"
	 * )
	 */
	Customer searchId(Customer customer);

	@Select("select concat( char(rand()*26 + 65) , round(rand() * 100), char(rand()*26 + 65), char(rand()*26 + 65) , round(rand() * 100), char(rand()*26 + 65)) as randomPwd")
	String getRandomPassword();

	@Update("update customer set passwd=password(#{passwd}) where name = #{name} and email = #{email} and id = #{id}")
	int changePw(Customer customer);

	@Select("select passwd = password(#{passwd}) as samePwd from customer where Id = #{id}")
	int samePwd(Customer customer);

	@Update("update customer set Name=#{name}, address=#{address}, zip_code=#{zipCode}, phone=#{phone}, dob=#{dob}, email=#{email}, license=#{license} where code=#{code}")
	int updateCustomerInfo(Customer customer);

	@Select("select mid(address, 7, 3) as title, count(*) as count from customer where mid(address, 7, 3) <> '' group by mid(address, 7, 3)")
	List<StateCar> chartAddr();

	@Select("select g.name as title , count(g.name) as count from customer c left join grade g on c.grade_code = g.code where grade_code is not null group by grade_code")
	List<StateCar> chartGrade();

	@Select("select code, Id, password(#{passwd}), Name, zip_code ,address, phone, dob, email, emp_code, license, grade_code, rent_cnt from customer where Id = #{id} and email = #{email}")
	Customer selectCustomerByIdEmail(Customer customer);
	
	

}
