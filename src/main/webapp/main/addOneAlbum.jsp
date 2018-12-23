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
        $("#addTestauthor").textbox({
            required: true
        });
        $("#addTestbrief").textbox({
            required: true
        });
        $("#addTestdate").datebox({
            required: true
        });

        $("#AlbumFormAdd").linkbutton({
            iconCls: "icon-add",
            onClick: function () {
                $("#addAlbum").form("submit", {
                    url: "${pageContext.request.contextPath}/album/addAlbum",
                    onSubmit: function () {
                        return $("#addAlbum").form("validate");
                    },
                    success: function () {
                        $.messager.show({
                            title: "系统消息",
                            msg: "添加成功！"
                        });
                        $("#addAlbumDialog").dialog("close");
                        $("#album").treegrid("load");
                    }
                })
            }
        });
        $("#AlbumFormReset").linkbutton({
            iconCls: "icon-reset",
            onClick: function () {
                $("#addAlbum").form("reset");
            }
        });
    });
</script>


<form id="addAlbum" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>标题:</td>
            <td><input id="addTestName" name="title"/></td>
        </tr>
        <tr>
            <td>封面图片:</td>
            <td><input class="easyui-filebox" name="file2"/></td>

        </tr>
        <tr>
            <td>作者:</td>
            <td><input id="addTestauthor" name="author"/>
            </td>
        </tr>
        <tr>
            <td>播音:</td>
            <td><input id="addTestcat" name="broadcast"/></td>
        </tr>
        <tr>
            <td>简介:</td>
            <td><input id="addTestbrief" name="brief"/></td>
        </tr>

        <tr>
            <td><a id="AlbumFormAdd">添加</a></td>
            <td><a id="AlbumFormReset">重置</a></td>
        </tr>
    </table>
</form>