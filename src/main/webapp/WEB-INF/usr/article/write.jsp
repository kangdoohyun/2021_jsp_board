<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP BOARD</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@1.3.11/dist/full.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.0/tailwind.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/font.css" />
</head>
<body>
	<section class="section section-article-write">
		<div class="container mx-auto">
			<script>
				let ArticleWrite__submitDone = false;
				
				function ArticleWrite__submit(form){
					if(ArticleWrite__submitDone){
						return;
					}
					
					if(form.title.value.length == 0){
						alert("제목을 입력해주세요.");
						form.title.focus();
						
						return;
					}
					
					if(form.body.value.length == 0){
						alert("내용을 입력해주세요.");
						form.body.focus();
						
						return;
					}
					
					form.submit();
					ArticleWrite__submitDone = true;
				}
			</script>
			<form action="../article/doWrite" method="POST" onsubmit="ArticleWrite__submit(this); return false;">
				<div class="form-control">
					<label class="label"> <span class="label-text">제목</span>
					</label>
					<div>
						<input class="input input-bordered w-full" type="text" name="title" maxlength="100" placeholder="제목을 입력해 주세요" />
					</div>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">내용</span>
					</label>
					<textarea class="textarea h-60 textarea-bordered" name="body" maxlength="2000" placeholder="내용을 입력해 주세요"></textarea>
				</div>
				<button type="submit" class="btn btn-ghost">작성</button>
				<button type="button" class="btn btn-ghost">취소</button>
			</form>
		</div>
	</section>
</body>
</html>