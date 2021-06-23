package com.kdh.exam.exam1.container;

import com.kdh.exam.exam1.http.controller.UsrArticleController;
import com.kdh.exam.exam1.repository.ArticleRepository;
import com.kdh.exam.exam1.service.ArticleService;

public class Container {
	public static ArticleRepository articleRepository;

	public static ArticleService articleService;
	
	public static UsrArticleController usrArticleController;
	
	public static void init() {
		articleRepository = new ArticleRepository();
		articleService = new ArticleService();
		usrArticleController = new UsrArticleController();
	}
}
