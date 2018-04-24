﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<!-- 表格内容过长处理 -->
<link rel="stylesheet" href="static/comment/css/comment.css">
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
						<!-- 检索  -->
						<form action="messageinfo/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入标题" class="nav-search-input" id="nav-search-input" autocomplete="off" name="MESSAGEINFO_TITLE" value="${pd.MESSAGEINFO_TITLE}" placeholder="这里输入标题"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker"value="${pd.lastLoginStart}" name="lastLoginStart" id="lastLoginStart"   type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始时间" title="开始时间"/></td>
							    <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<!-- <th class="center">系统存续编号</th> -->
									<th class="center" style="width: 15%">标题</th>
									<!-- <th class="center">摘要</th> -->
									<!-- <th class="center">文件上传</th> -->
									<th class="center">产品名称</th>
									<th class="center">状态</th>
									<!-- <th class="center">分组编号</th> -->
									<!-- <th class="center">产品存续信息</th> -->
									<th class="center" style="width: 15%">创建时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.MESSAGEINFO_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<!-- <td class='center'>${var.MESSAGEINFO_ID}</td> -->
											<td class='center autocut' title="${var.MESSAGEINFO_TITLE}">
												
												<c:if test="${fn:length(var.MESSAGEINFO_TITLE)>10 }">
													<c:if test="${var.MESSAGEINFO_STATE==0}">
													<a style="cursor: pointer;" onclick="messPdf('${var.MESSAGEINFO_URL}')" >${fn:substring(var.MESSAGEINFO_TITLE, 0, 11)}···</a>
													</c:if>
													<c:if test="${var.MESSAGEINFO_STATE==1}">
													<a style="cursor: pointer;" onclick="messPdf('${var.INFORMATION_PDFURL}')" >${fn:substring(var.MESSAGEINFO_TITLE, 0, 11)}···</a>
													</c:if> 
												</c:if>
												<c:if test="${fn:length(var.MESSAGEINFO_TITLE)<=10 }">
													<c:if test="${var.MESSAGEINFO_STATE==0}">
													<a style="cursor: pointer;" onclick="messPdf('${var.MESSAGEINFO_URL}')">${var.MESSAGEINFO_TITLE}</a>
													</c:if>
													<c:if test="${var.MESSAGEINFO_STATE==1}">
													<a style="cursor:pointer" onclick="messPdf('${var.INFORMATION_PDFURL}')">${var.MESSAGEINFO_TITLE}</a>
													</c:if>
													
													
												</c:if>
											</td>
											
											<!-- <td class='center'>${var.MESSAGEINFO_CONTEXT}</td> -->
											<!-- <td class='center autocut' title="${var.MESSAGEINFO_URL}">
												<c:if test="${fn:length(var.MESSAGEINFO_URL)>10 }">
													${fn:substring(var.MESSAGEINFO_URL, 0, 11)}··· 
												</c:if>
												<c:if test="${fn:length(var.MESSAGEINFO_URL)<=10 }">
													${var.MESSAGEINFO_URL}
												</c:if>
											</td> -->
											<td class='center'>${var.PRODUCTS_NAME}</td>
											<td class='center'>
											<c:if test="${var.MESSAGEINFO_STATE==0}">自定义上传</c:if>
											<c:if test="${var.MESSAGEINFO_STATE==1}">关联产品续存</c:if>
											</td>
											<!-- <td class='center autocut' title="${var.MESSAGEINFO_GROUP_ID}">
												<c:if test="${fn:length(var.MESSAGEINFO_GROUP_ID)>10 }">
													${fn:substring(var.MESSAGEINFO_GROUP_ID, 0, 11)}··· 
												</c:if>
												<c:if test="${fn:length(var.MESSAGEINFO_GROUP_ID)<=10 }">
													${var.MESSAGEINFO_GROUP_ID}
												</c:if>
											</td>
											<td class='center autocut' title="${var.MESSAGEINFO_INFORMATION_ID}">
												<c:if test="${fn:length(var.MESSAGEINFO_INFORMATION_ID)>10 }">
													${fn:substring(var.MESSAGEINFO_INFORMATION_ID, 0, 11)}··· 
												</c:if>
												<c:if test="${fn:length(var.MESSAGEINFO_INFORMATION_ID)<=10 }">
													${var.MESSAGEINFO_INFORMATION_ID}
												</c:if>
											</td> -->
											<td class="center"><fmt:formatDate value="${var.MESSAGEINFO_CREATETIME}" pattern="yyyy-MM-dd HH:mm" /></td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.MESSAGEINFO_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.MESSAGEINFO_ID}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.MESSAGEINFO_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.MESSAGEINFO_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-mini btn-success" onclick="add();">新增</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						</form>
					
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('#lastLoginStart').datepicker({
				autoclose: true,
				todayHighlight: true,
				onSelect: function( startDate ) {
			        var $startDate = $( "#lastLoginStart" );
			        var $endDate = $('#lastLoginEnd');
			        var endDate = $endDate.datepicker( 'getDate' );
			        if(endDate < startDate){
			            $endDate.datepicker('setDate', startDate - 3600*1000*24);
			        }
			        $endDate.datepicker( "option", "minDate", startDate );
			    }
			}).on('changeDate',function(e){
			    var startTime = e.date;
			    $('#lastLoginEnd').datepicker('setStartDate',startTime);
			});
			$('#lastLoginEnd').datepicker({
				autoclose: true,
				todayHighlight: true,
				onSelect: function( endDate ) {
			        var $startDate = $( "#lastLoginStart" );
			        var $endDate = $('#lastLoginEnd');
			        var startDate = $startDate.datepicker( "getDate" );
			        if(endDate < startDate){
			            $startDate.datepicker('setDate', startDate + 3600*1000*24);
			        }
			        $startDate.datepicker( "option", "maxDate", endDate );
			    }
			}).on('changeDate',function(e){
			    var endTime = e.date;
			    $('#lastLoginStart').datepicker('setEndDate',endTime);
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>messageinfo/goAdd.do';
			 diag.Width = 900;
			 diag.Height = 750;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//pdf 页面
		function messPdf(Id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="pdf";
			 diag.URL = '<%=basePath%>messageinfo/goPdf.do?messUrl='+Id;
			 diag.Width = 900;
			 diag.Height = 750;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show(); 
		}
		
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>messageinfo/delete.do?MESSAGEINFO_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>messageinfo/goEdit.do?MESSAGEINFO_ID='+Id;
			 diag.Width = 900;
			 diag.Height = 750;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>messageinfo/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>messageinfo/excel.do';
		}
	</script>


</body>
</html>