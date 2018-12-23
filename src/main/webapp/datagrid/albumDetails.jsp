<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#albumDetails").form("load", "${pageContext.request.contextPath}/album/queryOneAlbum?id=${param.id}")
        // 设置图片src的值
        $("#albumDetails").form({
            onLoadSuccess: function (data) {
                // console.log(data);
                $("#image").prop("src", "${pageContext.request.contextPath}" + data.cover_img);
            }
        })
    });

</script>

<form id="albumDetails" method="post">
    <table>
        <tr>
            <td></td>
            <td><input name="id" type="hidden"/></td>
        </tr>
        <tr>
            <td>专辑名称:</td>
            <td><input name="title"/></td>
        </tr>
        <tr>
            <td>章节数:</td>
            <td><input name="count"/></td>
        </tr>
        <tr>
            <td>评分:</td>
            <td><input name="score"/></td>
        </tr>
        <tr>
            <td>作者:</td>
            <td><input name="author"/></td>
        </tr>
        <tr>
            <td>播音:</td>
            <td><input name="broadcast"/></td>
        </tr>
        <tr>
            <td>简介:</td>
            <td><input class="easyui-textbox" name="brief" data-options="multiline:true" style="height:60px"/>
            </td>
        </tr>
        <tr>
            <td>图片:</td>
            <td><input id="image" type="image" name="cover_img" src="" width="250" height="250"/></td>

        </tr>
        <tr>
            <td>创建日期:</td>
            <td><input name="pub_date"/></td>
        </tr>
    </table>

</form>
