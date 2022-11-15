<%@ page import="com.zhenzi.sms.ZhenziSmsClient" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/10/27
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="//unpkg.com/vue@2/dist/vue.js"></script>
    <style>
        .modal-sheet .modal-dialog {
            width: 380px;
            transition: bottom .75s ease-in-out;
        }

        .modal-sheet .modal-footer {
            padding-bottom: 2rem;
        }

        .modal-alert .modal-dialog {
            width: 380px;
        }

        .modal-tour .modal-dialog {
            width: 380px;
        }
    </style>
</head>
<body>
<br><br><br><br><br><br><br>
<div class="modal modal-signin position-static d-block  py-5" tabindex="-1" role="dialog" id="modalSignin">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                <h1 class="fw-bold mb-0 fs-2">免费注册</h1>
                <a href="login.jsp">已经有账号？点此返回登录界面</a>
            </div>
            <div class="modal-body p-5 pt-0">
                <!-- 注册表单开始 -->
                <form action="Register" class="">
                    <div class="form-floating mb-3">
                        <!-- 新用户 -->
                        <input type="text" class="form-control rounded-3" id="newUser" placeholder="name@example.com"
                               name="username">
                        <label for="newUser">Your name</label>
                    </div>
                    <div class="form-floating mb-3">
                        <!-- 新密码 -->
                        <input type="password" class="form-control rounded-3" id="newPassword" placeholder="Password"
                               name="password">
                        <label for="newPassword">Password</label>
                    </div>

                    <%--获取验证码--%>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="newCode" placeholder="code"
                               name="code">
                        <label for="newCode">code</label>
                        <div id="app" style="margin-left: 291px;margin-top: 5px">
                            <el-button @click="visible = true" onclick="getCode()">获取验证码</el-button>
                        </div>
                    </div>

                    <!-- 提交按钮 -->
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">注册</button>
                    <small class="text-muted">点击注册，即表示您同意使用条款</small><br>
                    <small class="text-muted">最终解释权归产品方所有</small>
                    <hr class="my-4">
                </form>
                <!-- 表单结束 -->
            </div>
        </div>
    </div>
</div>
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function () {
            return {visible: false}
        }
    })
</script>

<%--发送验证码--%>
<script>
    function getCode() {
        <%
        String apiUrl = "https://sms_developer.zhenzikj.com";
        String appId = "112591";
        String appSecret = "2af4ffbc-1cb2-4671-ae59-cfdccaaff97c";
        ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("number", "18386797248");
        params.put("templateId", "10741");
        String[] templateParams = new String[2];

        //随机产生4位数
        int code = (int) ((Math.random() * 9 + 1) * 1000);
        templateParams[0] = String.valueOf(code);
        templateParams[1] = "5分钟";
        params.put("templateParams", templateParams);
        String result = client.send(params);
        System.out.println(result);

        %>
    }
</script>


</body>
</html>
