package com.kdh.exam.exam1.http.controller;

import com.kdh.exam.exam1.http.Rq;

public class UsrArticleController extends Controller {

	@Override
	public void performAction(Rq rq) {
		switch ( rq.getActionMethodName() ) {
		case "write":
			actionShowWrite(rq);
			break;
		case "doWrite":
			actionDoWrite(rq);
			break;
		case "list":
			actionShowList(rq);
			break;
		}
		
	}

	private void actionShowList(Rq rq) {
		rq.jsp("usr/article/list");
	}

	private void actionDoWrite(Rq rq) {
		
	}

	private void actionShowWrite(Rq rq) {
		rq.jsp("usr/article/write");
	}
	
}
