<%@ page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#addTestName").textbox({
            required: true
        });
        $("#addTestEmail").textbox({
            required: true
        });
        $("#addTestprice").textbox({
            required: true
        });
        $("#addTestcat").textbox({
            required: true
        });
        $("#addTestBirthday").datebox({
            required: true
        });

        $("#formAdd").linkbutton({
            iconCls: "icon-add",
            onClick: function () {
                $("#addTest").form("submit", {
                    url: "${pageContext.request.contextPath}/banner/insertBanner",
                    onSubmit: function () {
                        return $("#addTest").form("validate");
                    },
                    success: function () {
                        $.messager.show({
                            title: "系统消息",
                            msg: "添加成功！"
                        });
                        $("#addDialog").dialog("close");
                        $("#datagrid1").datagrid("load");
                    }
                })
            }
        });
        $("#formReset").linkbutton({
            iconCls: "icon-reset",
            onClick: function () {
                $("#addTest").form("reset");
            }
        });
    });
</script>


<form id="addTest" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>标题:</td>
            <td><input id="addTestName" name="title"/></td>
        </tr>
        <tr>
            <td>图片:</td>
            <td><input class="easyui-filebox" name="file1"/></td>

        </tr>
        <tr>
            <td>状态:</td>
            <td><input type="radio" name="status" value="0"/>隐藏<input
                    type="radio" name="status" value="1" CHECKED/>显示
            </td>
        </tr>
        <tr>
            <td>描述:</td>
            <td><input id="addTestcat" name="description"/></td>
        </tr>
        <tr>
            <td><a id="formAdd">添加</a></td>
            <td><a id="formReset">重置</a></td>
        </tr>
    </table>
</form>