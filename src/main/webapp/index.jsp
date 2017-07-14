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

		<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
			aria-labelledby="addModalLable" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="addModalLable">新增员工</h4>
					</div>
					<div class="modal-body">
						<form id="addForm" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="empName_add">员工姓名</label>

								<div class="col-sm-10">
									<input type="text" class="form-control" id="empName_add"
										name="empName" placeholder="员工姓名">
										<span class="help-block"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="empEmail_add">Email</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="empEmail_add"
										name="email" placeholder="Email">
										<span class="help-block"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="gender" id="gender1_add_input" value="M"
										checked="checked"> 男
									</label> <label class="radio-inline"> <input type="radio"
										name="gender" id="gender2_add_input" value="F"> 女
									</label>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">部门</label>
								<div class="col-sm-4">
									<select class="form-control depts"  name="dId">
									</select>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							id="addModalSubmitBtn">保存提交</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ======================================================== -->

<!-- =========================员工信息修改的模态框======================= -->

		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
			aria-labelledby="updateModalLable" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="updateModalLable">修改员工信息</h4>
					</div>
					<div class="modal-body">
						<form id="updateForm" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label" >员工姓名</label>

								<div class="col-sm-10">
									<p class="form-control-static" id="empNameUpdateStatic"></p>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="empEmail_update">Email</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="empEmail_update"
										name="email" placeholder="Email">
										<span class="help-block"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="gender" id="gender1_add_input" value="M"
										checked="checked"> 男
									</label> <label class="radio-inline"> <input type="radio"
										name="gender" id="gender2_add_input" value="F"> 女
									</label>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">部门</label>
								<div class="col-sm-4">
									<select class="form-control depts"   name="dId">
									</select>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							id="addModalSubmitBtn">保存修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ======================================================== -->

<!-- =========================员工信息删除的模态框======================= -->

		<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
			aria-labelledby="updateModalLable" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="delModalLable">删除员工信息</h4>
					</div>
					<div class="modal-body">
						<form id="delForm" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label" >员工姓名</label>

								<div class="col-sm-10">
									<p class="form-control-static" id="empNameDelStatic"></p>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" >Email</label>
								<div class="col-sm-10">
									<p class="form-control-static" id="empEmailDelStatic"></p>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<p class="form-control-static" id="empGenderDelStatic"></p>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">部门</label>
								<div class="col-sm-4">
									<p class="form-control-static" id="empDeptDelStatic"></p>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							id="addModalSubmitBtn">确定删除</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ======================================================== -->


	</div>

	<script type="text/javascript">
	 
		var totalRecords;	
		var isNameUsed;
		$(function() {
			//发送ajax请求  解析数据
			to_page(1);
			initBtn();
		});

		function initBtn() {
			$("#btnAdd").click(function() {
				//在弹出框框之前 应该事先就要到这个全部的部门信息了发送请求，读取部门列表 显示在select中
				getALLdept();
				$("#addModal").modal({
					backdrop : 'static'
				});
			});
			
			//按钮是在ajax请求之后才生成的 这个时候按钮还没有生成 所以不能绑定时间
			//使用ON方法绑定事件 在document中 及实施后来生成的也可以绑定成功
			$(document).on("click",".btnUpdate",function(){
				//编辑按钮 获取所有部门 获取其本身的名字
				getALLdept();
				//this 指的是当前被点击的按钮 指的是这个事件发生的触发者 不是这个事件的监听器
				getEmpUpdate($(this).attr("edit_id"));
				$("#updateModal").modal({
					backdrop : 'static'
				});
			});
			$(document).on("click",".btnDel",function(){
				//删除按钮
				//发送请求 获取各种信息 填入相关的P中
				getEmpDel($(this).attr("del_id"));
				$("#delModal").modal({
					backdrop : 'static'
				});
			});
			/* $(".btnUpdate").click(function(){
				//编辑按钮
				alert(123);
				
				$("#updateModal").modal({
					backdrop : 'static'
				});
			});
			$(".btnDel").click(function(){
				//删除按钮
				alert(456);
				$("#updateModal").modal({
					backdrop : 'static'
				});
			}); */
			
			$("#addModalSubmitBtn").click(function() {
				
				//前端校验
				if(!validate_add_form()){
					alert("填写的信息不正确");
					return;
				}
				
				//发送给服务器 
				$.ajax({

					url : "${APP_PATH}/emp",
					type : "POST",
					data : $("#addModal form").serialize(),
					success : function(result) {
						
						if (result.code==100) {
						//alert(result.msg);
						//需要关闭模态框 并且来到最后一页显示出刚刚添加的内容
						to_page(totalRecords);
						$("#addModal").modal('hide');
						//可以给一个比较大的数字 或者用总记录数字来标识 总记录数一定比分页数大 因为设置了pagethelper的合理分页 所以这个没关系
						$("#addModal form")[0].reset();//清空下 下次就不用清空了
							
						}else if(result.code==200){
							//失败
							alert(result.extend.va_name);
						}
						
					}
				
				});
			
			});
			//change属性等到焦点不属于这个标签的时候才触发
			$("#empName_add").change(function (){
				//直接使用data : "empName="+$("#empName_add").val（）得到的结果会导致服务器接收乱码 所以还是先用一个变量保存下为好
				var empName= $("#empName_add").val();//或者 this.value();
				//检查员工姓名是不是已经存在了
				$.ajax({
					url : "${APP_PATH}/checkUser",
					type : "post",
					data : "empName="+empName,
					success : function(result) {
						if(result.code==100){
							//成功
							show_validate_msg("#empName_add","success","");
							//姓名存在的话 要修改下本地的全局变量 标记一下
							isNameUsed = false;
						}else if (result.code == 200){
							//失败
							show_validate_msg("#empName_add","error","姓名已重复");
							isNameUsed = true;
						}
						
						
					}
		
				});
				
				
			});
		}
		
		
		function getEmpUpdate(id){
			//查询并更新修改窗口的员工姓名
			
			$.ajax({
				url : "${APP_PATH}/emp/"+id,
				type : "get",
				success : function(result) {
					if(result.code==100){
					$("#empNameUpdateStatic").append(result.extend.empName);						
					}
				}
			});
		}
		
		function getEmpDel(id){
			//查询并更新删除窗口的各项数据
			$.ajax({
				url : "${APP_PATH}/emp/"+id,
				type : "get",
				success : function(result) {
					if(result.code==100){
						$("#empNameDelStatic").append(result.extend.empName);	
						$("#empEmailDelStatic").append(result.extend.email);	
						$("#empGenderDelStatic").append(result.extend.gender);	
						$("#empDeptDelStatic").append(result.extend.department.deptName);	
					}
				}
			});
		}
		
		function show_validate_msg(ele,status,msg){
			$(ele).parent().removeClass("has-error has-success");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
			
		}
		function validate_add_form(){
			//获取值
			var empName = $("#empName_add").val();
			var regName = /^[a-zA-Z0-9\u2E80-\u9FFF_-]{3,16}$/
			//校验
			var flag1 = false;
			flag1 = regName.test(empName);
			if(!flag1){
				show_validate_msg("#empName_add","error","用户名只能是3-16个中文英文数字组合");
				return false;
			}else{
				show_validate_msg("#empName_add","success","");
				
			}
			var email =$("#empEmail_add").val();
			var regEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
			
			var flag2 = false;
			flag2 =regEmail.test(email);
			if(!flag2){
				show_validate_msg("#empEmail_add","error","请输入正确的电子邮箱");
				return false;
			}else{
				show_validate_msg("#empEmail_add","success","");
				
			}
			
			return flag1&&flag2&&!isNameUsed?true:false;
		}
		function getALLdept() {
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "get",
				success : function(result) {
					$(".depts").empty();
					var depts = result.extend.depts;
					$.each(depts, function() {
						//在这个方法里面 this就是每个item本身
						$(".depts").append(
								$("<option></option>").append(this.deptName)
										.attr("value", this.deptId));
					});
				}
			});

		}
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/emps",
				type : "get",
				data : "pn=" + pn,
				success : function(result) {
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
		function build_emps_table(result) {
			$("#emps_table tbody").empty();
			//从结果数据中取出需要的员工信息的数据
			var emps = result.extend.pageInfo.list;
			//每一行由列组成，构建一个个列添加到这个行中
			$.each(emps, function(index, item) {
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var empGenderTd = $("<td></td>").append(
						item.gender == "M" ? "男" : "女");
				var empEmailTd = $("<td></td>").append(item.emailTd);
				var empDeptNameTd = $("<td></td>").append(
						item.department.deptName);
				var btnEdit = $("<button></button>").addClass(
						"btn btn-primary btn-sm btnUpdate").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil ")).append("编辑");
				btnEdit.attr("edit_id",item.empId);
				var btnDel = $("<button></button>").addClass(
						"btn btn-danger btn-sm btnDel").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append("删除");
				btnDel.attr("del_id",item.empId);
				var btnTd = $("<td></td>").append(btnEdit).append(" ").append(
						btnDel);
				//对员工信息进行便利 每次便利都构造一个行添加进表格体中
				$("<tr></tr>").append(empIdTd).append(empNameTd).append(
						empGenderTd).append(empEmailTd).append(empDeptNameTd)
						.append(btnTd).appendTo($("#emps_table tbody"));
			});

		}

		//解析分页信息的方法
		function build_page_info(result) {
			$("#pageInfoMsg").empty();
			var pageInfo = result.extend.pageInfo;

			$("#pageInfoMsg").append(
					"当前 " + pageInfo.pageNum + "页,总" + pageInfo.pages + "页,总"
							+ pageInfo.total + "条记录");
			
			totalRecords = pageInfo.total;
		}

		//解析分页条的方法
		function build_page_nav(result) {
			$("#pageInfoNav").empty();
			var pageInfo = result.extend.pageInfo;

			var ul = $("<ul></ul>").addClass("pagination");

			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var endPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));

			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				endPageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				endPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}

			ul.append(firstPageLi).append(prePageLi);
			//取出当前的页码范围并为其设置点击翻页事件
			var navNums = pageInfo.navigatepageNums;

			$.each(navNums, function(index, item) {
				var navNumLi = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				if (item == pageInfo.pageNum) {
					navNumLi.addClass("active");
				}
				navNumLi.click(function() {
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