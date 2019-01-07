package com.yi.rentcar_project.service;

public class RentService {
	//Singleton Pattern
	private static final RentService service = new RentService();
	
	public static RentService getInstance(){
		return service;
	}
	
	//Insert
	//  0 : 추가 성공
	// -1 : id에 해당하는 Member가 없는 경우
	// -2 : rent 테이블에 저장 실패한 경우
	// -3 : 그 외
	
}
