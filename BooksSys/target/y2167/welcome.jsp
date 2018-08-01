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
<body>
    <div align="center">
        <h2>图书借阅系统</h2>
        <form method="post" onsubmit="login()" action="${pageContext.request.contextPath}/login">
            用户名 : <input name="usercode" onblur="errorhide()"><br>
            <br>
            密码 : <input type="password" name="password"><br>
            <br>
            <input type="submit" value="登录|Login">&nbsp;&nbsp;<input type="button" value="注册用户" onclick="zhuce()">
        </form>
        <div id="error">
            <p style="color: red">${massage}</p>
        </div>
    </div>

</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    function zhuce() {
        location.href="/register.jsp"
    }

        function login() {
            var usercode=$("[name=usercode]").val();
            var password=$("[name=password]").val();
            if(usercode==null||usercode==""){
                alert("用户名不能为空")
                return;
            }


            if(password==null||password==""){
                alert("密码不能为空")
                return;
            }
        }

        $(function () {
            $("#error").hide();
            if(${massage !=null}||${massage!=""}) {
                $("#error").show();
            }

        })

    function errorhide() {
        $("#error").hide();
    }
</script>
</html>
