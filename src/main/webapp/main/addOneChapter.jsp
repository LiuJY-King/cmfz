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

        $("#ChapterFormAdd").linkbutton({
            iconCls: "icon-add",
            onClick: function () {
                $("#addChapter").form("submit", {
                    url: "${pageContext.request.contextPath}/chapter/addChapter?album_id=${param.pid}",
                    onSubmit: function () {
                        return $("#addChapter").form("validate");
                    },
                    success: function () {
                        $.messager.show({
                            title: "系统消息",
                            msg: "添加成功！"
                        });
                        $("#addChapterDialog").dialog("close");
                        $("#album").treegrid("load");
                    }
                })
            }
        });
        $("#ChapterFormReset").linkbutton({
            iconCls: "icon-reset",
            onClick: function () {
                $("#addChapter").form("reset");
            }
        });
    });
</script>


<form id="addChapter" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>文件名:</td>
            <td><input id="addTestName" name="ctitle"/></td>
        </tr>
        <tr>
            <td>章节音频:</td>
            <td><input class="easyui-filebox" name="file3"/></td>

        </tr>
        <tr>
            <td><a id="ChapterFormAdd">添加</a></td>
            <td><a id="ChapterFormReset">重置</a></td>
        </tr>
    </table>
</form>