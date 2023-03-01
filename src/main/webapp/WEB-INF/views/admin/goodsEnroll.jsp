<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin/goodsEnroll.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
<!-- datepciker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
	#result_card img{
		max-width:100%;
		height:auto;
		display:block;
		padding:5px;
		margin-top:10px;
		margin:auto;
	}
	#result_card{
		position:relative;
	}
	.imgDeleteBtn{
		position:absolute;
		top:0;
		right:5%;
	 	background-color: #ef7d7d;
    color: wheat;
    font-weight: 900;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    line-height: 26px;
    text-align: center;
    border: none;
    display: block;
    cursor: pointer;	
	}
</style>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 등록</span>
		</div>
		<!-- content -->
		<div class="admin_content_main">
			<form action="/admin/goodsEnroll" method="post" id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>책 제목</label>
					</div>
					<div class="form_section_content">
						<input name="bookName"> <span
							class="ck_warn bookName_warn">책 이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>작가</label>
					</div>
					<div class="form_section_content">
						<input type="text" id="authorName_input" readonly="readonly" /> <input
							id="authorId_input" name="authorId" type="hidden" />
						<button class="authorId_btn">작가 선택</button>
						<span class="ck_warn authorId_warn">작가를 선택해주세요</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>출판일</label>
					</div>
					<div class="form_section_content">
						<input name="publeYear" autocomplete="off" readonly="readonly">
						<span class="ck_warn publeYear_warn">출판일을 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>출판사</label>
					</div>
					<div class="form_section_content">
						<input name="publisher"> <span
							class="ck_warn publisher_warn">출판사를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>책 카테고리</label>
					</div>
					<div class="form_section_content">
						<div class="cate_wrap">
							<span>대분류</span> <select class="cate1">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>중분류</span> <select class="cate2">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>소분류</span> <select name="cateCode" class="cate3">
								<option selected value="none">선택</option>
							</select>
						</div>
						<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="bookPrice" value="0"> <span
							class="ck_warn bookPrice_warn">상품 가격을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="bookStock" value="0"> <span
							class="ck_warn bookStock_warn">상품 재고를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content">
						<input id="discount_interface" maxlength="2" value="0">
						<!-- bookDiscount hidden태그는 사용자가 정수값입력 시, 해당 값을 소수로 변경하여 서버로 전송 -->
						<input name="bookDiscount" type="hidden" value="0"> <span
							class="step_val">할인 적용된 최종 가격 : <span
							class="span_discount"></span></span> <span
							class="ck_warn bookDiscount_warn">1~99 숫자를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>책 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
						<span class="ck_warn bookIntro_warn">책 소개를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>책 목차</label>
					</div>
					<div class="form_section_content bct">
						<textarea name="bookContents" id="bookContents_textarea"></textarea>
						<span class="ck_warn bookContents_warn">책 목차를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이미지</label>
					</div>
					<div class="form_section_content">
						<input type="file" name="uploadFile" id="fileItem"
							style="height: 30px;"/>
							<div id="uploadResult">
<!-- 								<div id="result_card"> -->
<!-- 									<div class="imgDeleteBtn">x</div> -->
<!-- 									<img src="/display?fileName=test.png" alt="" /> -->
<!-- 								</div> -->
							</div>
					</div>
				</div>
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
	<script>
		let enrollForm = $("#enrollForm");
		/* 위지윅 적용 */
		
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#bookIntro_textarea'))
			.catch(error=>{
				console.error(error);
			});
		
		/* 책 목차 */
		ClassicEditor
			.create(document.querySelector('#bookContents_textarea'))
			.catch(error=>{
				console.error(error);
			});
		
		
		/* 취소 버튼 */
		$("#cancelBtn").click(function() {
			location.href = "/admin/goodsManage"
		});

		/* 상품 등록 버튼 */
		$("#enrollBtn").on("click", function(e) {
			e.preventDefault();
			
			/* 체크 변수 */
			let bookNameCk = false;
			let authorIdCk = false;
			let publeYearCk = false;
			let publisherCk = false;
			let cateCodeCk = false;
			let priceCk = false;
			let stockCk = false;
			let discountCk = false;
			let introCk = false;
			let contentsCk = false;
			
			/* 체크 대상 변수 */
			let bookName = $("input[name='bookName']").val();
			let authorId = $("input[name='authorId']").val();
			let publeYear = $("input[name='publeYear']").val();
			let publisher = $("input[name='publisher']").val();
			let cateCode = $("select[name='cateCode']").val();
			let bookPrice = $("input[name='bookPrice']").val();
			let bookStock = $("input[name='bookStock']").val();
			let bookDiscount = $("#discount_interface").val();
			let bookIntro = $(".bit p").html();
			let bookContents = $(".bct p").html();
			
			if(bookName){
				$(".bookName_warn").css('display','none');
				bookNameCk = true;
			} else {
				$(".bookName_warn").css('display','block');
				$("input[name='bookName']").focus();
				alert("책 이름 입력하숑");
				bookNameCk = false;
			}
			if(authorId){
				$(".authorId_warn").css('display','none');
				authorIdCk = true;
			} else {
				$(".authorId_warn").css('display','block');
				alert("작가 이름 입력하숑");
				$("#authorName_input").focus();
				authorIdCk = false;
			}
			
			if(publeYear){
				$(".publeYear_warn").css('display','none');
				publeYearCk = true;
			} else {
				$(".publeYear_warn").css('display','block');
				publeYearCk = false;
			}	
			
			if(publisher){
				$(".publisher_warn").css('display','none');
				publisherCk = true;
			} else {
				$(".publisher_warn").css('display','block');
				publisherCk = false;
			}
			if(cateCode != 'none'){
				$(".cateCode_warn").css('display','none');
				cateCodeCk = true;
			} else {
				$(".cateCode_warn").css('display','block');
				cateCodeCk = false;
			}
			if(bookPrice != 0){
				$(".bookPrice_warn").css('display','none');
				priceCk = true;
			} else {
				$(".bookPrice_warn").css('display','block');
				priceCk = false;
			}	
			if(bookStock != 0){
				$(".bookStock_warn").css('display','none');
				stockCk = true;
			} else {
				$(".bookStock_warn").css('display','block');
				stockCk = false;
			}
			if(!isNaN(bookDiscount)){
				$(".bookDiscount_warn").css('display','none');
				discountCk = true;
			} else {
				$(".bookDiscount_warn").css('display','block');
				discountCk = false;
			}	
			if(bookIntro != '<br data-cke-filler="true">'){
				$(".bookIntro_warn").css('display','none');
				introCk = true;
			} else {
				$(".bookIntro_warn").css('display','block');
				introCk = false;
			}	
			
			if(bookContents != '<br data-cke-filler="true">'){
				$(".bookContents_warn").css('display','none');
				contentsCk = true;
			} else {
				$(".bookContents_warn").css('display','block');
				contentsCk = false;
			}
			
			if(bookNameCk && authorIdCk && publeYearCk && publisherCk && cateCodeCk && priceCk && stockCk && discountCk && introCk && contentsCk ){
				//alert('통과');
				enrollForm.submit();
			} else {
				return false;
			}
			
		});
		
		/* date picker */
		/* 설정 */
		const config = {
				dateFormat:'yy-mm-dd',
				showOn:"button",
				buttonText:"날짜 선택",
				prevText:'이전 달',
				nextText:'다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    yearSuffix: '년',
		    yearRange: '1950:2031',
		    changeMonth: true,
        changeYear: true
		}
		$(function(){
			$("input[name='publeYear']").datepicker(config);	
		});
		
		/* 18강,팝업창 구현 */
		$(".authorId_btn").on("click",function(e){
			e.preventDefault();
			let popUrl = "/admin/authorPop";
			let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
			window.open(popUrl,"작가 찾기",popOption);
		});
		
		$(document)
				.ready(
						function() {
							let cateList = JSON.parse('${cateList}');
							console.log(cateList);
							let cate1Array = new Array();
							let cate2Array = new Array();
							let cate3Array = new Array();
							let cate1Obj = new Object();
							let cate2Obj = new Object();
							let cate3Obj = new Object();
							//cateSelect1 변수 : <select> 태그에 쉽게 접근
							let cateSelect1 = $(".cate1");
							let cateSelect2 = $(".cate2");
							let cateSelect3 = $(".cate3");

							//cateList의 데이터 중 tier가 1인 데이터 들을 꺼내서 cate1Array에 저장
							//카테고리 배열 초기화 메서드 만들기
							function makeCateArray(obj, array, cateList, tier) {
								for (let i = 0; i < cateList.length; i++) {
									if (cateList[i].tier === tier) {
										obj = new Object();
										obj.cateName = cateList[i].cateName;
										obj.cateCode = cateList[i].cateCode;
										obj.cateParent = cateList[i].cateParent;
										array.push(obj);
									}
								}
							}
							makeCateArray(cate1Obj, cate1Array, cateList, 1);
							makeCateArray(cate2Obj, cate2Array, cateList, 2);
							makeCateArray(cate3Obj, cate3Array, cateList, 3);

							console.log("카테1Arr = ", cate1Array);
							console.log("카테2Arr = ", cate2Array);
							console.log("카테3Arr = ", cate3Array);

							//=========<대분류>===========
							for (let i = 0; i < cate1Array.length; i++) {
								cateSelect1
										.append("<option value='"+cate1Array[i].cateCode+"'>"
												+ cate1Array[i].cateName
												+ "</option>");
							}

							//중분류 : 대분류의 옵션이 선택되었을 때 메서드가 실행되어야함.
							$(cateSelect1)
									.on(
											"change",
											()=> {
												//대분류 선택값을 가져오기
												let selectVal1 = $(this).find(
														"option:selected")
														.val();
												//selectVal1 은 국내면 100000,국외면 200000

												//사용자가 대분류를 다시 선택했을때 기존 중분류 option태그 없애기
												cateSelect2.children().remove();
												//대분류를 다시 선택했을때 소분류의 option태그도 없애야한다.
												cateSelect3.children().remove();

												cateSelect2
														.append("<option value='none'>선택</option>");
												cateSelect3
														.append("<option value='none'>선택</option>");

												//대분류 선택값과 일치하는 cateParent 값을 가진 중분류 <option>태그 출력하기
												for (let i = 0; i < cate2Array.length; i++) {
													if (selectVal1 === cate2Array[i].cateParent) {
														cateSelect2
																.append("<option value='"+cate2Array[i].cateCode+"'>"
																		+ cate2Array[i].cateName
																		+ "</option>");
													}
												}//end for
											});

							//소분류 : 중분류의 옵션이 선택되었을 때 메서드가 실행되어야함.
							$(cateSelect2)
									.on(
											"change",
											function() {
												//중분류 선택값 가져오기
												let selectVal2 = $(this).find(
														"option:selected")
														.val();

												cateSelect3.children().remove();
												cateSelect3
														.append("<option value='none'>선택</option>");

												for (let i = 0; i < cate3Array.length; i++) {
													if (selectVal2 === cate3Array[i].cateParent) {
														cateSelect3
																.append("<option value='"+cate3Array[i].cateCode+"'>"
																		+ cate3Array[i].cateName
																		+ "</option>");
													}
												} //end for
											});
	/* 할인율 Input 설정 */
	$("#discount_interface").on("propertychange change keyup paste input",function(){
		let userInput=$("#discount_interface");
		let discountInput = $("input[name='bookDiscount']");
		
		let discountRate = userInput.val();//사용자가 입력할 할인률
		let sendDiscountRate = discountRate/100; //소수로 만듬, 서버로 전송할 할인률
		
		let goodsPrice = $("input[name='bookPrice']").val();//원가
		/* 할인적용된 최종가격 = 상품가격 * (1-(할인율/100)) */
		let discountPrice = goodsPrice * (1-sendDiscountRate);
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);
			discountInput.val(sendDiscountRate);			
		}
	});
	/* 상품 가격을 수정 했을때도, 할인된 최종 가격을 볼 수 있게 */
$("input[name='bookPrice']").on("propertychange change keyup paste input", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='bookDiscount']");
		
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let goodsPrice = $("input[name='bookPrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);
		}
	});
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change",function(e){
		/* 이미 선택된 파일이 존재한다면,삭제 처리를 한 후 
		서버에 이미지를 업로드 요청을 수행해야한다.[26-2]이미지 삭제*/
		// => 미리보기 이미지 태그의 존재유무에 따라 deleteFile()호출
		/* 이미지 존재 시 삭제 */
		if($(".imgDeleteBtn").length>0){
			deleteFile();
		}
		
		let formData = new FormData(); //FormData객체 생성
		//alert("동작");
		/* FileList객체에 접근해보기 */
		let fileInput = $("input[name='uploadFile']");
		let fileList = fileInput[0].files;
/* 		console.log("fileList : ",fileList); */
		let fileObj = fileList[0];
		/* console.log("fileObj : ",fileObj);
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type); */
		
		if(!fileCheck(fileObj.name,fileObj.size)){
			return false;
		}

		formData.append("uploadFile",fileObj);
		
		/* AJAX로 서버로 전송하는 코드 */
		$.ajax({
			url:'/admin/uploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			dataType:'json',
			success:function(result){
				console.log(result);
				showUploadImg(result);
			},
			error:function(result){
				alert("이미지 파일이 아닙니다.");
			}
		});
	});
		/* file 제약조건 걸기 */
		let regex = new RegExp("(.*?)\.(jpg|png)$","i");
		let maxSize = 1048576;
		
		function fileCheck(fileName,fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			console.log("fileName : ",fileName);
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		/* 이미지 출력 */
		function showUploadImg(uploadResultArr){
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length==0){
				return;
			}
			console.log("uploadResultArr : ",uploadResultArr)
			let uploadResult = $("#uploadResult");
			let obj = uploadResultArr[0];
			let str = "";
			console.log("obj : ",obj);
			/* url매핑메서드(/display)에 전달해줄 
			파일의 경로와 이름을 포함하는 값을 저장하는 변수 fileCallPath */
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g,'/') + "/s_" + obj.uuid + "_" + obj.fileName);
			console.log("fileCallPath : ",fileCallPath);
			str += `<div id="result_card">
				<div class="imgDeleteBtn" data-file="\${fileCallPath}">x</div>
				<img src="/display?fileName=\${fileCallPath}"/>
			</div>`;
			str+="<input type='hidden' name='imageList[0].fileName' value='"+obj.fileName+"'>";
			str+="<input type='hidden' name='imageList[0].uuid' value='"+obj.uuid+"'>";
			str+="<input type='hidden' name='imageList[0].uploadPath' value='"+obj.uploadPath+"'>";
			uploadResult.append(str);
		}
		
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			deleteFile();
		});
		
		/* 파일 삭제 메서드 */
		function deleteFile(){
			//썸네일 파일 경로
			let targetFile = $(".imgDeleteBtn").data("file");
			//미리보기 이미지를 감싸고 있는 result_card
			let targetDiv = $("#result_card");
			$.ajax({
				url:'/admin/deleteFile',
				data:{fileName:targetFile},
				dataType:'text',
				type:'POST',
				success:function(result){
					console.log(result);
					//result_card의 <div>지우고 + input file태그 초기화
					targetDiv.remove();
					$("input[type='file']").val("");
				},
				error:function(result){
					console.log(result);
					alert("파일을 삭제하지 못하였습니다.");
				}
			});
		}
});
		
	</script>
</body>
</html>
