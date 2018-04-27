function imageLinkFormatter(cellval, options, rowObject) {
    var img = '<span class="ui-icon ' + options.colModel.formatoptions.icon + ' icon">View<span/>';
    var link = '<a onclick="CheckId(this);"  href="javascript:void(0)" class="' +
        options.colModel.formatoptions.link_class + '" rel="' + rowObject.ID_X + '" lavel="' + rowObject.Herarchy + '">' + img + '</a>';

    return link;
}
function imageLinkFormatter_main(cellval, options, rowObject) {
    var img = '<span class="ui-icon ' + options.colModel.formatoptions.icon + ' icon">View<span/>';
    var link = '<a onclick="CheckId(this);"  href="javascript:void(0)" class="' +
        options.colModel.formatoptions.link_class + '" rel="' + rowObject.ID_X + '" lavel="0">' + img + '</a>';

    return link;
}
function imageLinkFormatter_Student(cellval, options, rowObject) {
    var img = '<span class="ui-icon ' + options.colModel.formatoptions.icon + ' icon">View<span/>';
    var link = '<a onclick="CheckId(this);"  href="javascript:void(0)" class="' +
        options.colModel.formatoptions.link_class + '" rel="' + rowObject.ID + '" lavel="1">' + img + '</a>';

    return link;
}
function imageLinkFormatter_Student_Delete(cellval, options, rowObject) {
    var img = '<span class="ui-icon ' + options.colModel.formatoptions.icon + ' icon">View<span/>';
    var link = '<a onclick="CheckId(this);"  href="javascript:void(0)" class="' +
        options.colModel.formatoptions.link_class + '" rel="' + rowObject.ID + '" lavel="2">' + img + '</a>';

    return link;
}
function imageLinkFormatter_Tutor(cellval, options, rowObject) {
    var img = '<span class="ui-icon ' + options.colModel.formatoptions.icon + ' icon">View<span/>';
    var link = '<a onclick="CheckId(this);"  href="javascript:void(0)" class="' +
        options.colModel.formatoptions.link_class + '" rel="' + rowObject.ID + '" lavel="3">' + img + '</a>';

    return link;
}
function imageLinkFormatter_Tutor_Delete(cellval, options, rowObject) {
    var img = '<span class="ui-icon ' + options.colModel.formatoptions.icon + ' icon">View<span/>';
    var link = '<a onclick="CheckId(this);"  href="javascript:void(0)" class="' +
        options.colModel.formatoptions.link_class + '" rel="' + rowObject.ID + '" lavel="4">' + img + '</a>';

    return link;
}
function LoadGrid(columns, data, GridId, pagerDiv, obGrid) {

    "use strict";
    var x = window.width;
    if (x == undefined)
        x = window.innerWidth;

    var w = x - x * 4.5 / 100;
    console.log(w, x);
    obGrid.jqGrid({
        data: data,
        editurl: "../HomeInventory/CRUDLocations",
        datatype: "local",
        colModel: columns,
        rowNum: 20,
        deleteConfirm: "Do you really want to delete this Record?",
        rowList: [10, 20, 30, 40, 50],
        rownumbers: true,
        pager: '#' + pagerDiv,
        sortname: 'ID',
        viewrecords: true,
        width: w,
        sortorder: "asc",
        onSelectRow: editRow,
        loadonce: true
    });


    $("#" + GridId).jqGrid('navGrid', '#' + pagerDiv, { edit: true, add: false, del: false }, {}, {}, {}, { closeAfterSearch: true });


}
function LoadGridWheight(columns, data, GridId, pagerDiv, obGrid, height) {

    "use strict";
    var x = window.width;
    if (x == undefined)
        x = window.innerWidth;

    var w = x - x * 4.5 / 100;
    console.log(w, x);
    obGrid.jqGrid({
        data: data,
        editurl: "../HomeInventory/CRUDLocations",
        datatype: "local",
        colModel: columns,
        rowNum: 20,
        deleteConfirm: "Do you really want to delete this Record?",
        rowList: [10, 20, 30, 40, 50],
        rownumbers: true,
        pager: '#' + pagerDiv,
        sortname: 'ID',
        viewrecords: true,
        width: w,
        sortorder: "asc",
        onSelectRow: editRow,
        loadonce: true,
        height: height
    });


    $("#" + GridId).jqGrid('navGrid', '#' + pagerDiv, { edit: true, add: false, del: false }, {}, {}, {}, { closeAfterSearch: true });


}
function LoadGrid_Add(columns, data, GridId, pagerDiv, obGrid) {
    "use strict";

    obGrid.jqGrid({
        data: data,
        datatype: "local",
        editurl: "../HomeInventory/CRUDLocations",
        colModel: columns,
        rowNum: 20,
        deleteConfirm: "Do you really want to delete this Record?",
        rowList: [10, 20, 30, 40, 50],
        rownumbers: true,
        pager: '#' + pagerDiv,
        sortname: 'ID',
        viewrecords: true,
        width: "100%",
        sortorder: "asc",
        onSelectRow: editRow,
        loadonce: true
    });


    $("#" + GridId).jqGrid('navGrid', '#' + pagerDiv, { edit: true, add: true, del: false }, {}, {}, {}, { onclickSubmit: function (response, postData) { } });


}
var lastSelection;

function editRow(id) {
    if (id && id !== lastSelection) {
        var grid = $("#jqGrid");
        grid.jqGrid('restoreRow', lastSelection);
        grid.jqGrid('editRow', id, { keys: true });
        lastSelection = id;
    }
}

function editLink(cellValue, options, rowdata, action) {
    return "<a href='javascript:EditRecord(" + rowdata.userId + ")' class='ui-icon ui-icon-pencil' ></a>";
}
function deleteLink(cellValue, options, rowdata, action) {
    return "<a href='javascript:deleteRecord(" + rowdata.userId + ")' class='ui-icon ui-icon-closethick'></a>";
}
function deleteRecord(id) {
    var result = confirm("Are you sure you Want to delete?");

}
function EditRecord(id) {
    var result = confirm("Are you sure you Want to delete?");
}
