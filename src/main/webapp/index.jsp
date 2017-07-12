<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工列表</title>


<!-- j关于web路径的问题 ，不以、开头的资源 ，以当前资源为标基准，经常容易出问题，所以以/开始的相对路径会常用一些，
 以/为开头的是以服务器的根路劲为基准 所以 如果是以/为开头，那么要把项目的位置也加上去如 /crud/......-->

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.2.1.min.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-3">
				<h1>SSM-CRUD</h1>
			</div>


		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button id="btnAdd" class="btn btn-primary">新增</button>
				<button id="btnDel" class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>

		</div>

		<!-- 分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="pageInfoMsg"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="pageInfoNav">
				<nav aria-label="Page navigation" id="pageInfoNav"></nav>
			</div>
		</div>
		
		<!-- =========================新增员工的模态框======================= -->

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLable" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLable">添加商品</h4>
			</div>
			<div class="modal-body" >
				<form id="addForm" >
					<div class="form-group">
					 <label for="goodName_add">商品名称</label>
					 <input type="text" class="form-control" id="goodName_add" name="name" placeholder="商品名称">
					</div>
					<div class="form-group">
				    <label for="goodfile_add">配图文件</label>
				    <input type="file" id="goodfile_add" name="img">
				    <p class="help-block">在文件框中选择商品的配图文件</p>
				  </div>
				  <div class="form-group">
					 <label for="goodUrl_add">商品链接</label>
					 <input type="text" class="form-control" id="goodUrl_add" name="goodUrl" placeholder="商品点击链接的URL">
					</div>
					<div class="form-group">
					 <label for="goodDesc_add">详细介绍</label>
					 <textarea class="form-control" rows="5" id="goodDesc_add" name="name" placeholder="填写商品详细介绍"></textarea>
					</div>	 		
				</form>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="addModalSubmitBtn">保存提交</button>
            </div>
		</div>
	</div>
</div>	
	
	
	
	
	</div>

	<script type="text/javascript">
		$(function(){
			//发送ajax请求  解析数据
			to_page(1);
		});
		

		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				type:"get",
				data:"pn="+pn,
				success:function(result){
					//解析并显示员工信息
					build_emps_table(result);
					//解析并显示分页信息
					build_page_info(result);
					//解析并显示分页条
					build_page_nav(result);
				}
			});
			
		}
		//解析表格数据的方法
		function build_emps_table(result){
			$("#emps_table tbody").empty();
			//从结果数据中取出需要的员工信息的数据
			var emps = result.extend.pageInfo.list;
			//每一行由列组成，构建一个个列添加到这个行中
			$.each(emps,function(index,item){
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var empGenderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
				var empEmailTd = $("<td></td>").append(item.emailTd);
				var empDeptNameTd = $("<td></td>").append(item.department.deptName);
				var btnEdit = $("<button></button>").addClass("btn btn-primary btn-sm")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				var btnDel=$("<button></button>").addClass("btn btn-danger btn-sm")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("删除");
				var btnTd=$("<td></td>").append(btnEdit).append(" ").append(btnDel);
				//对员工信息进行便利 每次便利都构造一个行添加进表格体中
				$("<tr></tr>").append(empIdTd)
				.append(empNameTd)
				.append(empGenderTd)
				.append(empEmailTd)
				.append(empDeptNameTd)
				.append(btnTd)
				.appendTo($("#emps_table tbody"));					
			});

		}	
		
		//解析分页信息的方法
		function build_page_info(result){
			$("#pageInfoMsg").empty();
			var pageInfo=result.extend.pageInfo;
			
			$("#pageInfoMsg").append("当前 "+pageInfo.pageNum+"页,总"+pageInfo.pages+"页,总"+pageInfo.total+"条记录");
		}
		
		//解析分页条的方法
		function build_page_nav(result){
			$("#pageInfoNav").empty();
			var pageInfo = result.extend.pageInfo;
			
			var ul = $("<ul></ul>").addClass("pagination");
			
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum -1);
				});
			}
			
			
			
			
			var nextPageLi =  $("<li></li>").append($("<a></a>").append("&raquo;"));
			var endPageLi= $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				endPageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				nextPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum +1);
				});
				endPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			
			ul.append(firstPageLi).append(prePageLi);
			//取出当前的页码范围并为其设置点击翻页事件
			var navNums=pageInfo.navigatepageNums;
			
			$.each(navNums,function(index,item){
				var navNumLi= $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
				if(item ==pageInfo.pageNum ){
					navNumLi.addClass("active");
				}
				navNumLi.click(function (){
					to_page(item);
				});
				
				ul.append(navNumLi);
			});
			
			ul.append(nextPageLi).append(endPageLi);
			
			$("#pageInfoNav").append(ul);
			
			
			/*<ul class="pagination">
			 <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
			<c:if test="${pageInfo.hasPreviousPage }">
				<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>


			<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
				<c:if test="${page_Num == pageInfo.pageNum }">
					<li class="active"><a href="#">${page_Num }</a></li>
				</c:if>
				<c:if test="${page_Num != pageInfo.pageNum }">
					<li><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
				</c:if>

			</c:forEach>
			<c:if test="${pageInfo.hasNextPage }">
				<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
		</ul> */
		
		
		
		}
		
	</script>

</body>
</html>