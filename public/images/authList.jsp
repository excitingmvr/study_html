<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="hanmi.onlinepharm.hmeps.common.constants.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html><html lang="ko">

<head>
<!-- ============================================================== -->
<!-- 헤더 파일 -->
<!-- ============================================================== -->
<%@include file="../../include/head.jsp"%>
     
	
</head>

<body class="horizontal-nav skin-default fixed-layout">
    <!-- ============================================================== -->
    <!-- 페이지 로딩 이미지 -->
    <!-- ============================================================== -->
    <div class="preloader">
    <%@include file="../../include/preload.jsp"%>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - pages.scss 참조 -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- 탑페이지 : 로고, 사용자명, 언어변경, 웹알림 기능 -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
            <%@include file="../../include/top.jsp"%>
            </nav>
        </header>

        <!-- ============================================================== -->
        <!-- HMEPS 메뉴 네비게이션 페이지  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
        <%@include file="../../include/nav.jsp"%>
        </aside>


        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid ">
				<!-- ============================================================== -->
				<!-- 오른쪽 페이지 : 화면 칼러 조절등 -->
				<!-- ============================================================== -->
                <div class="right-sidebar">
                <%@include file="../../include/right.jsp"%>
                </div>


                <!-- ============================================================== -->
                <!-- 현재 화면명 표시 breadcrumb -->
                <!-- ============================================================== -->
                <div class="row page-titles" style="border-bottom:0px solid gray;">
                    <div class="col-4 align-self-center">
                        <h4 class="text-themecolor font-weight-bold"><i class="ti ti-direction"></i> 권한관리</h4>						
                    </div>
                    <div class="col-8 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb">
							    <li class="breadcrumb-item"><a href="javascript:void(0)"><i class="ti ti-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">환경설정관리</a></li>
                                <li class="breadcrumb-item active">권한관리</li>
                            </ol>
                        </div>						
                    </div>					
                </div>

             <!-- 메인 컨텐츠 시작 -->
                <div class="row" >
                    <div class=" col-12">
                         <div class="card" >
                            <div class="card-body">							   
                               <form name="searchForm" id="searchForm" method="get" autocomplete="off" action="/hmeps_new/auth/authList" enctype="multipart/form-data">
                                   <input type="hidden" name="thisPage" value="<c:out value="${param.thisPage}" default="1"/>">
                                   <input type="hidden" name="rowNumToShow" value="<c:out value="${params.rowNumToShow}"/>">
    								<input type="hidden" name="AUTH_SEQ">
							        <div class="form-group  col-12">									
										  <select class="form-control col-2" name="gubun" id="gubun" >
											  <option value="1" <c:if test="${params.gubun eq 1}">selected</c:if>>이름</option>
											  <option value="2" <c:if test="${params.gubun eq 2}">selected</c:if>>메모</option>
										  </select> 

										  <input type="text" class="form-control col-4" aria-label="" aria-describedby="basic-addon1" name="searchValue" value="<c:out value="${param.searchValue}"/>" placeholder="검색어" maxlength="30" >&nbsp;			
										 
										  <span style="float:right;">
												  <button class="btn btn-info" type="button" id="insertBtn" >등 록</button>&nbsp;	
												  <button class="btn btn-success" type="button" id="searchBtn" >검 색</button>
										   </span>	
										 
									 </div>	
									
								</form>

								<div class="table-responsive col-12">

                                <%@include file="../../include/totalandRowNum.jsp"%>


									<table class="table table-bordered table-hover color-table muted-table " style="text-align:center;min-width:800px;">
										<thead>
											<tr>
												<th  data-tablesaw-sortable-col data-tablesaw-prioritys="persist" class="text-center">No</th>
												<th  data-tablesaw-sortable-col data-tablesaw-prioritys="persist" class="text-center">그룹명</th>
												<th  data-tablesaw-sortable-col data-tablesaw-prioritys="persist" class="text-center">구성원</th>
												<th  data-tablesaw-sortable-col data-tablesaw-prioritys="1" class="text-center">역할</th>
<!-- 
												<th  data-tablesaw-sortable-col data-tablesaw-prioritys="2" class="text-center">등록자</th>
												<th  data-tablesaw-sortable-col data-tablesaw-prioritys="3" class="text-center">등록일</th>
 -->												
											</tr>
										</thead>
										<tbody>
	<c:choose>
       <c:when test="${fn:length(authList) eq 0}">
           <tr>
               <td class="text-center" colspan="6">There is no data!</td>
           </tr>	
       </c:when>
       <c:otherwise>
           <c:forEach items="${authList}" var="list" varStatus="status">	
											<tr>
												<td class="text-center "><c:out value="${params.totalRows - ((params.thisPage - 1) * params.rowNumToShow + status.index) }"/></td>
												<td class="title text-left" style="padding-left:10px;"><a href="javascript:goForm(<c:out value="${list.AUTH_SEQ}"/>)"><c:out value="${list.AUTH_NM}"/></a></td>
												<td class="text-center "><c:out value="${list.total}"/></td>
												<td class="text-left " style="padding-left:10px;"><c:out value="${list.AUTH_MEMO}"/></td>
<!-- 												
												<td class="text-center ">N/A</td>
												<td class="text-center ">N/A</td>
 -->	
											</tr>								
            </c:forEach>
        </c:otherwise>
    </c:choose>	
										</tbody>
									</table>
								</div>

								<div class="">
                                <%@include file="../../include/pagination.jsp"%>
								</div>


                            </div>
                        </div>
                 </div>
             </div>
			 <!-- 메인 컨텐츠 종료 -->


            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->


        <!-- ============================================================== -->
        <!-- 풋터 페이지 : 카피라이트 표시 -->
        <!-- ============================================================== -->
        <footer class="footer" style="display:none;">
        <%@include file="../../include/foot.jsp"%>
        </footer>

    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->


    <!-- ============================================================== -->
    <!-- All JS 파일들 -->
    <!-- ============================================================== -->
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <%-- <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/popper/popper.min.js"></script> --%>
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/jsp/dist/js/perfect-scrollbar.jquery.min.js"></script>
    <!--Wave Effects -->
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/jsp/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/jsp/dist/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/jsp/dist/js/custom.min.js"></script>
    <!-- Calendar JavaScript -->
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/calendar/jquery-ui.min.js"></script>
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/moment/moment.js"></script>
    <script src='http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/calendar/dist/fullcalendar.min.js'></script>
	<script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/calendar/dist/locale-all.js"></script>
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/calendar/dist/cal-init.js"></script>


    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/tablesaw/dist/tablesaw.jquery.js"></script>
    <script src="http://<%= request.getServerName() %>:<%= request.getServerPort() %>/hmeps_new/assets/node_modules/tablesaw/dist/tablesaw-init.js"></script>

	<script src="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/hmeps_new/jsp/dist/js/common.js" type="text/javascript"></script>
	<script src="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/hmeps_new/jsp/dist/js/validation.js" type="text/javascript"></script>

    <script>
    
	$(document).ready(function() {
		
	});
	
	var goUrlForm = "/hmeps_new/auth/authForm"; 	/* #-> */
	var keyName = $("input:hidden[name=AUTH_SEQ]");	/* #-> */

    var formName = $("form[name=searchForm]");
	
    $("#searchBtn").on("click", function(){
	   	if (validationList() == false) return false;
	   	$("input:hidden[name=thisPage]").val(1);
	   	formName.submit();
	});
    
    validationList = function() {
    	if(!checkNull($.trim($("input[name=searchValue]").val()), "searchValue")) return false;
    }
    
    goList = function(thisPage) {
    	$("input:hidden[name=thisPage]").val(thisPage);
    	formName.submit();
    }
    
    goForm = function(key) {
    	if(key != 0) keyName.val(btoa(key));
    	formName.attr("action", goUrlForm);
    	formName.submit();
    }
    
    $('#insertBtn').on("click", function() {
    	goForm(0);                
    });
    
    $("#data_per_page").on("change", function(){
/*     	$("input:hidden[name=thisPage]").val($("input:hidden[name=thisPage]").val());*/
    	$("input:hidden[name=rowNumToShow]").val($("#data_per_page option:selected").val());
    	formName.submit();
	});    

/*
        $(function () {
        });

        $('#insertBtn').on("click", function() {
			document.location.href="groupForm.jsp";                
        });

        $('#searchBtn').on("click", function() {
		    var param = $("#searchForm").serialize();
		    console.log(param);
		    alert("검색 수행.....");
                
        });


		function fn_view(seq){
            document.location.href="authView.jsp?seq="+seq;
		}
*/		
    </script>
</body>

</html>