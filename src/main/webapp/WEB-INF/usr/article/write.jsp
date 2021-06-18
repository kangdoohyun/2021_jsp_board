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
			<form action="">
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
			</form>
		</div>
	</section>
</body>
</html>