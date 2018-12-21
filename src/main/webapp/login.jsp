<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>持名法州后台管理中心</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="css/common.css" type="text/css"/>
    <link rel="stylesheet" href="css/login.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/toast.css" type="text/css"/>


    <script type="text/javascript" src="script/jquery.js"></script>
    <script type="text/javascript" src="script/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/toast.js"></script>
    <script type="text/javascript">

        $(function () {
            //点击更换验证码：
            $("#captchaImage").click(function () {//点击更换验证码
                $("#captchaImage").prop("src", "${pageContext.request.contextPath}/img/createImg?time=" + new Date());
            });

            //  form 表单提交
            $("#btn").click(function () {
                var username = $("#name").val();
                var password = $("#pwd").val();
                var enCode = $("#enCode").val();
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/admin/login",
                    data: {name: username, password: password, enCode: enCode},
                    success: function (result) {
                        if (result == "ok") {
                            $("form")[0].submit();
                        } else {
                            $('body').toast({
                                position: 'fixed',
                                content: result,
                                duration: 3000,
                                isCenter: false,
                                background: 'rgba(230,0,0,0.5)',
                                animateIn: 'bounceIn-hastrans',
                                animateOut: 'bounceOut-hastrans',
                            });
                        }
                    }

                });

            });
        });
    </script>
</head>
<body>

<div class="login">
    <form id="loginForm" action="${pageContext.request.contextPath}/main/main.jsp" method="post">

        <table>
            <tbody>
            <tr>
                <td width="190" rowspan="2" align="center" valign="bottom">
                    <img src="img/header_logo.gif"/>
                </td>
                <th>
                    用户名:
                </th>
                <td>
                    <input id="name" type="text" name="name" class="text" value="ljy" maxlength="20"/>
                </td>
            </tr>
            <tr>
                <th>
                    密&nbsp;&nbsp;&nbsp;码:
                </th>
                <td>
                    <input id="pwd" type="password" name="password" class="text" value="123456" maxlength="20"
                           autocomplete="off"/>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <th>验证码:</th>
                <td>
                    <input type="text" id="enCode" name="enCode" class="text captcha" maxlength="4" autocomplete="off"/>
                    <img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/img/createImg"
                         title="点击更换验证码"/>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <th>
                    &nbsp;
                </th>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>
                    <input type="button" class="homeButton" value="" onclick="location.href='/'">
                    <input id="btn" type="button" class="loginButton" value="登录">
                </td>
            </tr>
            </tbody>
        </table>
        <div class="powered">COPYRIGHT © 2008-2017.</div>
        <div class="link">
            <a href="http://www.chimingfowang.com/">持名佛网首页</a> |
            <a href="http://www.chimingbbs.com/">交流论坛</a> |
            <a href="">关于我们</a> |
            <a href="">联系我们</a> |
            <a href="">授权查询</a>
        </div>
    </form>
</div>
</body>
</html>