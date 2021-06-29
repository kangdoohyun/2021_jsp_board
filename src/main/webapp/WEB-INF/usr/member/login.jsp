<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="로그인" />
<%@ include file="../part/head.jspf"%>

<section class="section section-member-login px-4">
	<div class="container mx-auto">
		<div class="card bordered shadow-lg">
			<div class="card-title">
				<a href="javascript:history.back();" class="cursor-pointer"> <i
					class="fas fa-chevron-left"></i>
				</a> <span>로그인</span>
			</div>
			<div class="p-4">
				<script>
					let MemberLogin__submitDone = false;

					function MemberLogin__submit(form) {
						if (MemberLogin__submitDone) {
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
						MemberLogin__submitDone = true;
					}
				</script>
				<form action="../article/doWrite" method="POST"
					onsubmit="MemberLogin__submit(this); return false;">
					<input type="hidden" name="redirectUri"
						value="../article/detail?id=[NEW_ID]" />
					<div class="form-control">
						<label class="label"> <span class="label-text">로그인 아이디</span>
						</label>
						<div>
							<input class="input input-bordered w-full" type="text"
								name="loginId" maxlength="100" placeholder="로그인 아이디를 입력해 주세요" />
						</div>
					</div>
					<div class="form-control">
						<label class="label"> <span class="label-text">로그인 비밀번호</span>
						</label>
						<input class="input input-bordered w-full" type="password"
								name="loginId" maxlength="100" placeholder="로그인 비밀번호를 입력해 주세요" />
					</div>
					<button type="submit" class="btn btn-ghost">로그인</button>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="../part/foot.jspf"%>