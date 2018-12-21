<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#updateTest").form("load", "${pageContext.request.contextPath}/album/queryOneAlbum?id=${param.id}")
    });
</script>

<form id="updateTest" method="post">
    <table>
        <tr>
            <td></td>
            <td><input name="id" type="hidden"/></td>
        </tr>
        <tr>
            <td>title:</td>
            <td><input name="title"/></td>
        </tr>
        <tr>
            <td>count:</td>
            <td><input name="count"/></td>
        </tr>
        <tr>
            <td>score:</td>
            <td><input name="score"/></td>
        </tr>
        <tr>
            <td>author:</td>
            <td><input name="author"/></td>
        </tr>
        <tr>
            <td>broadcast:</td>
            <td><input name="broadcast"/></td>
        </tr>
        <tr>
            <td>brief:</td>
            <td><input name="brief"/></td>
        </tr>
        <tr>
            <td>cover_img:</td>
            <td><input name="cover_img"/></td>
        </tr>
        <tr>
            <td>pub_data:</td>
            <td><input name="pub_data"/></td>
        </tr>
    </table>

</form>
