package com.yi.rentcar_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.yi.rentcar_project.model.CustomEvent;

public interface CustomEventDao {
	int insertCustomEvent(CustomEvent customEvent);

	List<CustomEvent> selectCustomEventByCustomCode(String customCode);

	int deleteCustomEvent(CustomEvent customEvent);

	// Rent 등록에 따라 고객이 가지고 있는 이벤트 사용을 1로 수정

	@Update("update custom_event set is_use = 1 where custom_code = #{customerCode.code} and event_code = #{eCode}")
	int updateSetUse(Rent rent);
}
