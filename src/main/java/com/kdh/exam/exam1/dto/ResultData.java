package com.kdh.exam.exam1.dto;

import java.util.Map;

import com.kdh.exam.exam1.util.Ut;

import lombok.Getter;
import lombok.ToString;

@ToString
public class ResultData {
	@Getter
	private String msg;
	@Getter
	private String resultCode;
	@Getter
	private Map<String, Object> body;
	
	private ResultData() {
		
	}
	
	public boolean isSeccess() {
		return resultCode.startsWith("S-");
	}
	
	public boolean isFail() {
		return !isSeccess();
	}
	
	public static ResultData from(String resultCode, String msg, Object... args) {
		ResultData rd = new ResultData();
		
		rd.msg = msg;
		rd.resultCode = resultCode;
		rd.body = Ut.mapOf(args);
		
		return rd;
	}

}
