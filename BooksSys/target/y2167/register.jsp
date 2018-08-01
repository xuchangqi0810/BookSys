<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/31
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function registerUser() {
            //获取值
            var user_code=$("[name=user_code]").val();
            var password=$("[name=password]").val();
            var password2=$("[name=password2]").val();
            var gender=$("[name=gender]").val();
            var email=$("[name=email]").val();

            if(password.length<6){
                alert("密码至少6位")
                return;
            }
            if(password2.length<6){
                alert("密码至少6位")
                return;
            }

            if(password!=password2){
                alert("两次输入的密码不一致，请重新输入")
                $("[name=password]").val('');
                $("[name=password2]").val('');
                return;
            }

            if(gender==0){
                alert("请选择性别")
                return;
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/register",
                method:"POST",
                data:{"user_code":user_code,"password":password,"gender":gender,"email":email},
                success:function (data) {
                    if(data=="ok"){
                        alert("ok")
                    }
                }
            })
        }
    </script>
</head>
<body>
    <div align="center">

        <table border="1px" align="center">
            <tr>
                <td colspan="2" align="center">会员注册</td>
            </tr>
            <tr>
                <td>登录账号</td>
                <td><input type="text" name="user_code" required></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td><input type="password" name="password2" required></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <select name="gender">
                        <option value="0">--请选择--</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>电子邮箱</td>
                <td><input type="text" name="email" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="button" onclick="registerUser()" value="注册">&nbsp;&nbsp;<input type="button" value="返回"></td>
            </tr>
        </table>
    </div>
</body>

</html>
