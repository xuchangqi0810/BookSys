<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery.pagination.js"></script>
<script type="text/javascript">
    function getData(index) {

        //获取用户输入的值
        var typeId=$("[name=typeid]").val();
        var bookName=$("[name=bookname]").val();
        var is_borrow=$("[name=is_borrow]").val();
        $.ajax({
            //发送请求
            url:"${pageContext.request.contextPath}/getBookAllJSON" ,
            //请求方式
            type:"POST",
            //请求参数
            data:{
                "typeId":typeId,
                "bookName":bookName,
                "is_borrow":is_borrow,
                "pageIndex":index,
                "pageSize":2
            },
            //回调函数
            success:function (data) {
                data=eval("("+data+")");
                //将此标签置空
                $("#userList").html('');

                if(data.lists!=""){
                    //渲染数据
                    $.each(data.lists,function (i,item) {
                        var borrow;
                        if(item.is_borrow==1){
                            borrow="已借阅";
                        }else if(item.is_borrow==2){
                            borrow="申请借阅";
                        }
                        $("#userList").append("<tr></td><td>"+item.book_code+"</td><td>"+item.type_name+"</td><td>"+item.book_name+"</td><td>"+item.book_author+"</td><td>"+item.publish_press+"</td><td align='center'><a href='#'>"+borrow+"</a></td></tr>");
                    });
                    //渲染分页
                    $('#pagination').pagination(data.totalSize, {
                        //当前页码
                        current_page : index,
                        //显示记录数
                        items_per_page : data.pageSize,
                        //显示页码数
                        num_display_entries : 2,
                        callback:getData,
                        load_first_page : true,
                        prev_text : '上一页',
                        next_text : '下一页'
                    });
                }

                if(data.lists==""){
                    $("#userList").append("<tr><td colspan='6' style='height: 50px' align='center'>抱歉！没有找到您想要的资源！</td></tr>")
                }

                $("#userList tr:odd").css("background-color","#999999")
            }
        });
    }

    $(function () {
        getData(0);
    })
</script>

<body >
<div align="center" style="width: 930px;height: 1000px">
    <h2>图书借阅系统</h2>
    <p>图书分类
        <select name="typeid">
            <option value="0">--请选择--</option>
            <c:forEach var="item" items="${booktype}">
                <option value="${item.id}">${item.type_name}</option>
            </c:forEach>
        </select>
        &nbsp;&nbsp;&nbsp;
        图书名称：<input type="text" name="bookname">
        &nbsp;&nbsp;&nbsp;
        是否借阅
        <select name="is_borrow">
            <option value="0">--请选择--</option>
            <option value="1">已借阅</option>
            <option value="2">未借阅</option>
        </select>
        &nbsp;&nbsp;&nbsp;
        <button onclick="getData(0)">查询</button>
    </p>

    <p align="right">当前用户：${user.user_code} &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/loginOut">退出</a></p>

    <table align="center" border="1px" style="width: 800px">
        <tr style="background-color: cadetblue">
            <th>图书编号</th>
            <th>图书分类</th>
            <th>图书名称</th>
            <th>作者</th>
            <th>出版社</th>
            <th>操作</th>
        </tr>
        <tbody id="userList">
        </tbody>
    </table>

    <div class="pagin" align="center">
        <div class="message"></div>
        <div class="pagination" id="pagination"></div>
    </div>

</div>

</body>
</html>