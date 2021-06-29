package com.kdh.exam.exam1.http.controller;

import com.kdh.exam.exam1.container.Container;
import com.kdh.exam.exam1.dto.ResultData;
import com.kdh.exam.exam1.http.Rq;
import com.kdh.exam.exam1.service.MemberService;

public class UsrMemberController extends Controller {
	private MemberService memberService = Container.memberService;

	@Override
	public void performAction(Rq rq) {
		switch (rq.getActionMethodName()) {
		case "login":
			actionShowLogin(rq);
			break;
		case "doLogin":
			actionDoLogin(rq);
			break;
		default:
			rq.println("존재하지 않는 페이지입니다");
			break;
		}

	}

	private void actionDoLogin(Rq rq) {
		String loginId = rq.getParam("loginId", "");
		String loginPw = rq.getParam("loginPw", "");
		String redirectUri = rq.getParam("redirectUri", "../article/list");

		if (title.length() == 0) {
			rq.historyBack("제목을 입력해주세요");
			return;
		}

		if (body.length() == 0) {
			rq.historyBack("내용을 입력해주세요");
			return;
		}

		ResultData writeRd = articleService.write(title, body);

		int id = (int) writeRd.getBody().get("id");

		redirectUri = redirectUri.replace("[NEW_ID]", id + "");

		rq.replace(writeRd.getMsg(), redirectUri);

	}

	private void actionShowLogin(Rq rq) {
		rq.jsp("usr/member/login");
	}

}
