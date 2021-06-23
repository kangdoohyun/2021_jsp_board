<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<span>게시물 작성페이지</span>
				</div>
				<div class="p-4">
					<script>
						let ArticleWrite__submitDone = false;

						function ArticleWrite__submit(form) {
							if (ArticleWrite__submitDone) {
								return;
							}

							if (form.title.value.length == 0) {
								alert("제목을 입력해주세요.");
								form.title.focus();

								return;
							}

							if (form.body.value.length == 0) {
								alert("내용을 입력해주세요.");
								form.body.focus();

								return;
							}

							form.submit();
							ArticleWrite__submitDone = true;
						}
					</script>
					<form action="../article/doWrite" method="POST" onsubmit="ArticleWrite__submit(this); return false;">
						<input type="hidden" name="redirectUri" value="../article/detail?id=[NEW_ID]"/>
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
			</div>
		</div>
	</section>
</body>
</html>