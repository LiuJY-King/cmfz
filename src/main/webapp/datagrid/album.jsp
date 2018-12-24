<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    var toolbar = [{
        iconCls: 'icon-edit',
        text: "专辑详情",
        handler: function () {
            var row = $("#album").treegrid("getSelected");
            // console.log(row);
            if (row != null && row.children != null) {
                $("#detailedDialog").dialog({
                    title: "请输入添加信息",
                    width: 400,
                    height: 250,
                    modal: true,
                    closed: false,
                    resizable: true,
                    cache: false,
                    href: "${pageContext.request.contextPath}/datagrid/albumDetails.jsp?id=" + row.id
                });

            } else {
                alert("请先选中一条专辑")
            }

        }
    }, '-', {
        text: "添加专辑",
        iconCls: 'icon-add',
        handler: function () {
            $("#addAlbumDialog").dialog("open");
        }
    }, '-', {
        text: "添加音频",
        iconCls: 'icon-add',
        handler: function () {
            var row = $("#album").treegrid("getSelected");
            // console.log(row);
            if (row != null && row.children != null) {
                $("#addChapterDialog").dialog({
                    title: "请输入添加信息",
                    width: 400,
                    height: 250,
                    modal: true,
                    closed: false,
                    resizable: true,
                    cache: false,
                    href: "${pageContext.request.contextPath}/main/addOneChapter.jsp?pid=" + row.id

                });

            } else {
                alert("请先选中一条专辑")
            }
        }
    }, '-', {
        text: "音频下载",
        iconCls: 'icon-save',
        handler: function () {
            var row = $("#album").treegrid("getSelected");
            console.log(row);
            if (row != null && row.url != null) {
                location.href = "${pageContext.request.contextPath}/chapter/download?fileName=" + row.url;
            } else {
                alert("请先选中章节内容")
            }

        }
    }, '-', {
        text: "导出数据",
        iconCls: 'icon-redo',
        handler: function () {
            $.get("${pageContext.request.contextPath}/album/export", function (result) {
                if (result == "ok")
                    alert("导出成功");
            });
        }
    }]
    $(function () {
        $('#album').treegrid({
            url: '${pageContext.request.contextPath}/album/queryAllAlbum',
            idField: 'id',
            treeField: 'title',
            pagination: true,
            pageList: [2, 5, 10, 20],
            pageSize: 2,
            columns: [[
                {field: 'title', title: '名字', width: 60},
                {
                    field: 'url', title: '音频', width: 80, formatter: function (value, row, index) {
                        if (row.children == null) {
                            return "<audio controls='controls'><source src='${pageContext.request.contextPath}/music/" + value +
                                "' type='audio/mp3' /></audio>";
                        }
                    }
                },
                // {field: 'duration', title: '时长', width: 40},
                {field: 'size', title: '大小', width: 40},
                {field: 'upload_date', title: '上传日期', width: 80}
            ]],
            fit: true,
            fitColumns: true,
            toolbar: toolbar

        });
    })
    $("#addAlbumDialog").dialog({
        title: "添加专辑",
        width: 400,
        height: 250,
        modal: true,
        closed: true,
        resizable: true,
        cache: false,
        href: "${pageContext.request.contextPath}/main/addOneAlbum.jsp"
    });

</script>

<table id="album"></table>
<div id="detailedDialog"></div>
<div id="addAlbumDialog"></div>
<div id="addChapterDialog"></div>