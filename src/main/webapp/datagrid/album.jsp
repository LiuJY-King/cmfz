<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    var toolbar = [{
        iconCls: 'icon-add',
        text: "专辑详情",
        handler: function () {
            var row = $("#album").treegrid("getSelected");
            console.log(row);
            if (row != null) {
                $("#detailedDialog").dialog({
                    title: "请输入添加信息",
                    width: 400,
                    height: 200,
                    modal: true,
                    closed: false,
                    resizable: true,
                    cache: false,
                    href: "${pageContext.request.contextPath}/datagrid/albumDetails.jsp?id=" + row.id
                });

            } else {
                alert("请先选中行")
            }

        }
    }, '-', {
        text: "添加专辑",
        iconCls: 'icon-edit',
        handler: function () {
            //获取选中行
            var row = $("#dg").edatagrid("getSelected");
            if (row != null) {
                //编辑指定行
                var index = $("#dg").edatagrid("getRowIndex", row);
                $("#dg").edatagrid("editRow", index);
            } else {
                alert("请先选中行")
            }


        }
    }, '-', {
        text: "添加音频",
        iconCls: 'icon-remove',
        handler: function () {
            alert('帮助按钮')
        }
    }, '-', {
        text: "音频下载",
        iconCls: 'icon-save',
        handler: function () {
            $("#dg").edatagrid("saveRow")

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
                            return "<audio controls='controls'><source src='${pageContext.request.contextPath}" + value +
                                "' type='audio/mp3' /></audio>";
                        }
                    }
                },
                {field: 'duration', title: '时长', width: 40},
                {field: 'size', title: '大小', width: 40},
                {field: 'upload_date', title: '上传日期', width: 80}
            ]],
            fit: true,
            fitColumns: true,
            toolbar: toolbar

        });
    })

</script>

<table id="album"></table>
<div id="detailedDialog"></div>