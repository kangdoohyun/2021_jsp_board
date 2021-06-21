<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kdh.exam.exam1.dto.Article" %>
<%
List<Article> articles = (List<Article>)request.getAttribute("articles");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP BOARD</title>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- 테일윈드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.0/tailwind.min.css" />
<!-- 데이지UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@1.3.11/dist/full.css" rel="stylesheet" type="text/css" />
<!-- 내부 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/font.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/common.css" />
</head>
<body>
	<section class="section section-article-write px-4">
		<div class="container mx-auto">
			<div class="card bordered shadow-lg">
				<div class="card-title">
					<a href="javascript:history.back();" class="cursor-pointer">
						<i class="fas fa-chevron-left"></i>
					</a>
					<span>게시물 리스트</span>
				</div>
				<div class="p-4">
					<% for(Article article : articles) { %>
						<div>
							번호 : <%=article.getId() %><br>
							작성 : <%=article.getRegDate() %><br>
							갱신 : <%=article.getUpdateDate() %><br>
							제목 : <%=article.getTitle() %><br>
							내용 : <%=article.getBody() %><br>
						</div>
						<hr />
					<% } %>
				</div>
			</div>
		</div>
	</section>
</body>
</html>