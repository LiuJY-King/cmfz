<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-add',
            text: "添加",
            handler: function () {
                $("#addDialog").dialog("open");
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#dg").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#dg").edatagrid("getRowIndex", row);
                    $("#dg").edatagrid("editRow", index);
                } else {
                    alert("请先选中一行");
                }


            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-remove',
            handler: function () {
                var row = $("#dg").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#dg").edatagrid("getRowIndex", row);
                    $('#dg').edatagrid('destroyRow');

                } else {
                    alert("请先选中一行");
                }

            }
        }, '-', {
            text: "保存",
            iconCls: 'icon-save',
            handler: function () {
                $("#dg").edatagrid("saveRow");
                $("#dg").edatagrid("reload");
            }
        }]

        $('#dg').edatagrid({
            method: "GET",
            updateUrl: "${pageContext.request.contextPath}/banner/update",
            destroyUrl: "${pageContext.request.contextPath}/banner/delete",
            <%--saveUrl:"${pageContext.request.contextPath}/banner/update",--%>
            url: '${pageContext.request.contextPath}/banner/queryAllBanner',
            columns: [[
                {field: 'title', title: '名称', width: 100},
                {
                    field: 'status', title: '状态', width: 100, editor: {
                        type: "text",
                        options: {required: true}
                    }
                },
                {field: 'pubDate', title: '时间', width: 100, align: 'right'}
            ]],
            fitColumns: true,
            fit: true,
            pagination: true,
            pageList: [3, 5, 10, 20],
            pageSize: 3,
            toolbar: toolbar,
            view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + rowData.description + '</p>' +
                    '<p>日期: ' + rowData.pubDate + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });

    })
    $("#addDialog").dialog({
        title: "请输入添加信息",
        width: 400,
        height: 200,
        modal: true,
        closed: true,
        resizable: true,
        cache: false,
        href: "${pageContext.request.contextPath}/main/addOneBanner.jsp"
    });

</script>

<table id="dg"></table>
<div id="addDialog"></div>
<%--<div id="toolbar">--%>
<%--<a id="addbtn">添加</a>--%>
<%--<a id="updatebtn">修改</a>--%>
<%--<a id="deletebtn">删除</a>--%>
<%--<a id="savebtn">保存</a>--%>
<%--</div>--%>