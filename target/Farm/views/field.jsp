
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>菜地信息管理</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH}/js/jquery-3.3.1.js"></script>
    <link
            href="${APP_PATH}/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="${APP_PATH}/css/font.css"
            rel="stylesheet">
    <script
            src="${APP_PATH}/js/bootstrap.min.js"></script>
    <script src="../js/sign.js"></script>
</head>
<body style="background-image:url(../agro/UIpic/managementbackground.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size: 100%">
<!-- 菜地添加的模态框 -->
<div class="modal fade" id="fieldAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">菜地添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">菜地面积（平方米）</label>
                        <div class="col-sm-10">
                            <input type="number" name="area" class="form-control" id="fieldArea_add_input"
                                   placeholder="Area">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="username">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">时长/月（默认为12）</label>
                        <div class="col-sm-10">
                            <input type="number" name="time" class="form-control" id="time_add_input"
                                   placeholder="Time">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="field_save_btn" style="color: #0f0f0f">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 菜地修改的模态框 -->
<div class="modal fade" id="fieldUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">菜地修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ID</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="fieldID_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">菜地面积（平方米）</label>
                        <div class="col-sm-10">
                            <input type="number" name="area" class="form-control" id="area_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="username">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">时长/月</label>
                        <div class="col-sm-10">
                            <input type="number" name="time" class="form-control" id="time_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="field_update_btn" style="color: #0f0f0f">更新</button>
            </div>
        </div>
    </div>
</div>
<%--显示用户信息的模态框--%>
<div class="modal fade" id="infoCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLable1">用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${sessionScope.userName}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${sessionScope.userEmail}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">注册时间</label>
                        <div class="col-sm-10">
                            <p class="form-control-static"><fmt:formatDate value="${sessionScope.registerTime}"
                                                                           pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<%--显示推荐最佳方案的模态框--%>
<div class="modal fade" id="planRecommendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLable2">最佳方案</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">菜地面积（平方米）</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="area_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">种植时长（默认为12）</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="time_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">推荐方案</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="plan"></p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <%--<button type="button" class="btn btn-primary" id="plan_recommend_btn" style="color: #0f0f0f">显示推荐方案</button>--%>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2" style="background-color:rgba(0,0,0,0.8); height:800px">
            <div class="panel-group table-responsive" role="tablist"
                 style="background-color:transparent; border-color:transparent">
                <div class="panel panel-primary leftMenu"
                     style="background-color:transparent; border-color:transparent">
                    <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse"
                         data-target="#collapseListGroup1" role="tab"
                         style="background-color:rgba(0,0,0,0); border-color:transparent; margin-top:20px; text-align:center">
                        <p1 class="panel-title"
                            style="text-align:center;padding-top:30px;height:100px;color:#FFFFFF;font-size:20px;font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif">
                            <img src="../agro/UIpic/home.png" style="height:25px">&nbsp;&nbsp;&nbsp;农场管理&nbsp;&nbsp;&nbsp;
                        </p1>
                        <span class="glyphicon glyphicon-chevron-up right"></span>
                    </div>
                    <div id="collapseListGroup1" class="panel-collapse collapse in" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading1"
                         style="background-color:transparent; color:#FFFFFF; text-align:center">
                        <ul class="list-group" style="background-color:rgba(95,95,95,0.6)">
                            <c:if test="${sessionScope.user.role=='管理员'}">
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/field.jsp" style="color:#ffffff">菜地信息管理</a>
                            </li>
                            </c:if>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/crops.jsp" style="color:#ffffff">农作物信息管理</a>
                            </li>
                            <c:if test="${sessionScope.user.role=='管理员'}">
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/plant.jsp" style="color:#ffffff">种植信息管理</a>
                            </li>
                            <li class="list-group-item" style="background-color: transparent">
                                <a href="/views/consumerinfo.jsp" style="color: #ffffff">客户信息管理</a>
                            </li>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/sellerinfo.jsp" style="color:#ffffff">商家信息管理</a>
                            </li>
                            </c:if>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/assignment.jsp" style="color:#ffffff">任务信息管理</a>
                            </li>
                            <c:if test="${sessionScope.user.role=='管理员'}">
                            <li class="list-group-item" style="background-color: transparent">
                                <a href="/views/items.jsp" style="color:#ffffff">商品信息管理</a>
                            </li>
                            <li class="list-group-item" style="background-color: transparent">
                                <a href="/views/orders.jsp" style="color:#ffffff">订单信息管理</a>
                            </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <c:if test="${sessionScope.user.role=='管理员'}">
                <div class="panel panel-primary leftMenu"
                     style="background-color:transparent; border-color:transparent">
                    <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse"
                         data-target="#collapseListGroup2" role="tab"
                         style="background-color:rgba(0,0,0,0); border-color:transparent; margin-top:20px; text-align:center">
                        <p1 class="panel-title"
                            style="text-align:center;padding-top:30px;height:100px;color:#FFFFFF;font-size:20px;font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif">
                            <img src="../agro/UIpic/management.png" style="height:25px">&nbsp;&nbsp;&nbsp;系统管理&nbsp;&nbsp;&nbsp;
                        </p1>
                        <span class="glyphicon glyphicon-chevron-up right"></span>
                    </div>
                    <div id="collapseListGroup2" class="panel-collapse collapse in" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading2"
                         style="background-color:transparent; color:#FFFFFF; text-align:center">
                        <ul class="list-group" style="background-color:rgba(95,95,95,0.6)">
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/users.jsp" style="color:#ffffff">用户信息管理</a>
                            </li>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/logs.jsp" style="color:#ffffff">系统操作日志</a>
                            </li>
                        </ul>
                    </div>
                </div>
                </c:if>
            </div>
        </div>
        <div class="col-md-9">
            <div class="col-md-12" style="margin-top:25px; margin-bottom:20px">
                <img src="../agro/UIpic/agro.png" style="height:50px">
            </div>
            <div class="col-md-12" style="background-color:rgba(80,77,77,0.9);height:100%;color:#FFFFFF">
                <div class="row" style="height:50px">
                    <div class="col-md-3" style="margin-top:10px;text-align:center;font-size:20px">菜地信息管理</div>
                    <div class="col-md-4 col-md-offset-5" style="margin-top:10px;text-align:right;font-size:20px">
                        <button class="btn btn-primary" id="field_add_modal_btn"
                                style="background-color:transparent; vertical-align:middle"><img
                                src="../agro/UIpic/plus.png" style="height:15px">&nbsp;&nbsp;添&nbsp;加
                        </button>
                        <button class="btn btn-danger" id="field_delete_all_btn"
                                style="background-color:transparent; vertical-align:middle"><img
                                src="../agro/UIpic/delete.png" style="height:15px">&nbsp;&nbsp;删&nbsp;除
                        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                <div class="col-md-12" style="background-color:rgba(0,0,0,0.7);height:585px;color:#FFFFFF">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover" id="field_table">
                                <thead>
                                <tr style="color: #ffffff">
                                    <th style="text-align:center">
                                        <input type="checkbox" id="check_all"
                                               style="background-color:transparent; border-color:#FFFFFF"/>
                                    </th>
                                    <th style="text-align:center">#ID</th>
                                    <th style="text-align:center">面积/平方米</th>
                                    <th style="text-align:center">客户名</th>
                                    <th style="text-align:center">起始时间</th>
                                    <th style="text-align:center">时长/月</th>
                                    <th style="text-align:center">状态</th>
                                    <th style="text-align:center">收益（元）</th>
                                    <th style="text-align:center"><img src="../agro/UIpic/tools.png"
                                                                       style="height:15px">&nbsp;&nbsp;操&nbsp;&nbsp;作
                                    </th>
                                </tr>
                                </thead>
                                <tbody style="text-align:center; color: #ffffff; background-color: transparent">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row" style="position:absolute; bottom:0px; text-align:left">
                        <!--分页文字信息  -->
                        <div class="col-md-12" id="page_info_area"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-12"
                 style="background-color:rgba(80,77,77,0.9);height:50px;color:#FFFFFF;text-align:center"
                 id="page_nav_area">
            </div>
        </div>
        <div class="col-md-1" style="background-color:rgba(0,0,0,0.8); height:800px">
            <div class="panel panel-primary leftMenu" style="background-color:transparent; border-color:transparent">
                <div class="panel-heading" id="collapseListGroupHeadingr" data-toggle="collapse"
                     data-target="#collapseListGroupr" role="tab"
                     style="background-color:rgba(0,0,0,0); border-color:transparent; margin-top:20px; text-align:center">
                    <p1 class="panel-title"
                        style="text-align:center;padding-top:30px;height:100px;color:#FFFFFF;font-size:20px;font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif">
                        <img src="../agro/UIpic/sign.png" style="height:25px">
                    </p1>
                    <span class="glyphicon glyphicon-chevron-up right"></span>
                </div>
                <div id="collapseListGroupr" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="collapseListGroupHeadingr"
                     style="background-color:transparent; color:#FFFFFF; text-align:center">
                    <ul class="list-group" style="background-color:rgba(95,95,95,0.6)">
                        <li class="list-group-item" style="background-color:transparent">
                            <a href="#" data-toggle="modal" data-target="#infoCheckModal" style="color:#ffffff">信息</a>
                        </li>
                        <li class="list-group-item" style="background-color:transparent">
                            <a href="#" onclick="sign_out()" style="color:#ffffff">注销</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div style=" position:absolute;bottom:10px; right:4px; text-align:center;height:60px;color:#FFFFFF;font-size:12px;font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif">
                <img src="../agro/UIpic/contact.png" style="height:25px; margin-bottom:8px">
                <a href="/views/contactus.jsp" style="color: #ffffff">CONTACT&nbsp;US</a>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--<script src="js/jquery-1.11.2.min.js"></script>--%>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<%--<script src="js/bootstrap.js"></script>--%>
<script type="text/javascript">

    var totalPages, currentPage;
    //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
    $(function () {
        //去首页
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/field-list",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //1、解析并显示菜地数据
                build_field_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_field_table(result) {
        //清空table表格
        $("#field_table tbody").empty();
        var field = result.extend.pageInfo.list;
        $.each(field, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var fieldIdTd = $("<td></td>").append(item.id);
            var fieldAreaTd = $("<td></td>").append(item.area);
            var usernameTd = $("<td></td>").append(item.username);
            var startTime = getMyDate(item.startTime)
            var startTimeTd = $("<td></td>").append(startTime);
            var timeTd = $("<td></td>").append(item.time);
            var statusTd = $("<td></td>").append(item.status ? "正常" : "异常");
            var totalTd = $("<td></td>").append(item.total);
            var recBtn = $("<button></button>").addClass("btn btn-primary btn-sm rec_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-asterisk")).append("推荐")
            recBtn.attr("rec-id", item.id);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前菜地id
            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的菜地id
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(recBtn).append(" ").append(editBtn).append(" ").append(delBtn);
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(fieldIdTd)
                .append(fieldAreaTd)
                .append(usernameTd)
                .append(startTimeTd)
                .append(timeTd)
                .append(statusTd)
                .append(totalTd)
                .append(btnTd)
                .appendTo("#field_table tbody");
        });
    }

    //获得年月日      得到日期oTime
    function getMyDate(str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    };

    //补0操作
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" +
            result.extend.pageInfo.total + "条记录");
        totalPages = result.extend.pageInfo.pages;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }


        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清空表单样式及内容
    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    $("#field_add_modal_btn").click(function () {
        reset_form("#fieldAddModal form")
        getConsumerInfo("#fieldAddModal select");
        $("#fieldAddModal").modal({
            backdrop: "static"
        });
    });

    //查出所有的客户信息并显示在下拉列表中
    function getConsumerInfo(ele) {
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/consumerinfos",
            type: "GET",
            success: function (result) {
                // console.info(result);
                $.each(result.extend.consumerinfos, function () {
                    var optionEle = $("<option></option>").append(this.conName);
                    optionEle.appendTo(ele);
                });
            }
        });
    }


    $("#field_save_btn").click(function () {
        // 1、模态框中填写的表单数据提交给服务器进行保存
        // 2、发送ajax请求保存菜地信息
        $.ajax({
            url: "${APP_PATH}/field",
            type: "POST",
            data: $("#fieldAddModal form").serialize(),
            success: function (result) {
                //菜地信息保存成功
                //1、关闭模态框
                $("#fieldAddModal").modal('hide');
                //2、来到最后一页，显示刚才保存的数据
                //发送ajax请求显示最后一页数据即可
                to_page(totalPages);
            }
        });
    });

    //单个删除
    $(document).on("click", ".delete_btn", function () {
        //1、弹出是否确认删除对话框
        var fieldId = $(this).attr("del-id");
        if (confirm("确认删除吗？")) {
            //确认，发送ajax请求删除即可
            $.ajax({
                url: "${APP_PATH}/field/" + fieldId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    });

    //完成全选/全不选功能
    $("#check_all").click(function () {
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //check_item
    $(document).on("click", ".check_item", function () {
        //判断当前选择中的元素是否该页所有元素
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    //点击全部删除，就批量删除
    $("#field_delete_all_btn").click(function () {
        //
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            //组装菜地id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        if (confirm("确认删除吗？")) {
            //发送ajax请求删除
            $.ajax({
                url: "${APP_PATH}/field/" + del_idstr,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //回到当前页面
                    to_page(currentPage);
                }
            });
        }
    });

    $(document).on("click", ".rec_btn", function () {
        getField($(this).attr("rec-id"));
        $("#plan_recommend_btn").attr("rec-id", $(this).attr("rec-id"));
        $("#planRecommendModal").modal({
            backdrop: "static"
        });
        $.ajax({
            url: "../field/" + $(this).attr("rec-id"),
            type: "POST",
            success: function (plan) {
                $("#plan").text(plan)
            }
        });

        function getField(id) {
            $.ajax({
                url: "${APP_PATH}/field/" + id,
                type: "GET",
                dataType: "json",
                success: function (result) {
                    // console.log(result);
                    var fieldData = result.extend.field;
                    $("#area_static").text(fieldData.area);
                    $("#time_static").text(fieldData.time);
                }
            });
        }
    })

    //1、我们是按钮创建之前就绑定了click，所以绑定不上。
    //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
    //jquery新版没有live，使用on进行替代
    $(document).on("click", ".edit_btn", function () {
        //查出菜地信息，显示菜地信息
        getField($(this).attr("edit-id"));
        //把菜地的id传递给模态框的更新按钮
        $("#field_update_btn").attr("edit-id", $(this).attr("edit-id"));
        reset_form("#fieldUpdateModal form")
        getConsumerInfo("#fieldUpdateModal select");
        $("#fieldUpdateModal").modal({
            backdrop: "static"
        });

        function getField(id) {
            $.ajax({
                url: "${APP_PATH}/field/" + id,
                type: "GET",
                success: function (result) {
                    // console.log(result);
                    var fieldData = result.extend.field;
                    $("#fieldID_update_static").text(fieldData.id);
                    $("#area_update_input").val(fieldData.area);
                    $("#time_update_input").val(fieldData.time);
                }
            });
        }

        $("#field_update_btn").click(function () {
            //发送ajax请求保存更新的菜地数据
            $.ajax({
                url: "${APP_PATH}/field/" + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#fieldUpdateModal form").serialize(),
                success: function (result) {
                    //alert(result.msg);
                    //1、关闭对话框
                    $("#fieldUpdateModal").modal("hide");
                    //2、回到本页面
                    to_page(currentPage);
                }
            });
        });
    });
</script>
</body>
<style type="text/css">
    p {
        border-right: thin solid #FFFFFF;
    }

    p1 {
    }

    nav {
        font-family: bradleyhanditcttbold;
        font-size: 15px;
    }
</style>

<script>
    $(function () {
        $(".panel-heading").click(function (e) {
            /*切换折叠指示图标*/
            $(this).find("span").toggleClass("glyphicon-chevron-down");
            $(this).find("span").toggleClass("glyphicon-chevron-up");
        });
    });
</script>
</html>