var _browser = navigator.appName, _hrefLink = "javascript:", _useJCryptionLib = !1,
    _isHttpsRequest = "https:" == document.location.protocol, _isHttpRequest = !_isHttpsRequest;
try {
    ("undefined" == typeof jquery_ui_loded_1_8 || !jquery_ui_loded_1_8) && ("undefined" == typeof jquery_ui_loded_1_10 || !jquery_ui_loded_1_10) && _loadJqueryUI()
} catch (e$$10) {
    _loadJqueryUI()
}

function _loadJqueryUI() {
    writeCss(baseURL + "/js/3rd-plug/jquery-ui-1.12.1/jquery-ui.min.css");
    writeJs(baseURL + "/js/3rd-plug/jquery-ui-1.12.1/jquery-ui.min.js")
}

function writeJs(a) {
    $.getScript(a)
}

function writeCss(a) {
    var b = document, c = document.getElementsByTagName("head")[0], d = b.createElement("link");
    d.setAttribute("type", "text/css");
    d.setAttribute("href", a);
    d.setAttribute("rel", "stylesheet");
    d.setAttribute("async", "true");
    d.onerror = function () {
        c.removeChild(d)
    };
    c.appendChild(d)
}

function loadJCryptionRuntime(a, b) {
    jQuery.getJSON(baseURL + "/encrypt.servlet", {jcryption_cipher_param_name: b}, function (c) {
        c.enabled ? jQuery.getScript(baseURL + "/js/3rd-plug/jquery/jquery.jcryption/jquery.jcryption.min.js", function () {
            for (var c = "0+1_2)3(4*5&6^7%8$9#A@B!C=D-E,F.G/HaWsXtTuZvawbx;bIc]dJe[fKgLhMiNjOkPlQmRnSoTpUqVrcydz".split(""), e = Math.floor(Math.random() * c.length), g = "", f = 0; f < e; f++) g += c[Math.floor(Math.random() * c.length)];
            c = (new jsSHA(g, "ASCII")).getHash("SHA-512", "HEX");
            $.jCryption.authenticate(c,
                baseURL + "/encrypt.servlet?generateKeyPair=true", baseURL + "/encrypt.servlet?handshake=true", function (c) {
                    var d = b.split(",");
                    d && (jQuery("#" + a).show(500), jQuery(document).bind("encryption_form", function () {
                        for (var a in d) {
                            var b = $("#" + d[a]);
                            b.attr("encrypt_plain_text", b.val()).val(jQuery.jCryption.encrypt(b.val(), c))
                        }
                    }).bind("decryption_form", function () {
                        var a = "", b;
                        for (b in d) var e = $("#" + d[b]), a = a + (jQuery.jCryption.decrypt(e.val(), c) + "\n");
                        alert(a)
                    }), _useJCryptionLib = !0)
                }, function () {
                    _isHttpRequest ? alert("敏感信息加密组件握手通讯失败，信息将明文传输。") :
                        alert("敏感信息加密组件握手通讯失败。");
                    _useJCryptionLib = !1
                })
        }) : jQuery("#" + a).show(200)
    }).fail(function () {
        jQuery("#" + a).show(200)
    })
}

try {
    var _browser_Version = navigator.appVersion.split(";")[1].replace(/[ ]/g, ""),
        _hrefLink = "MSIE6.0" == _browser_Version ? "#" : "javascript:"
} catch (e$$12) {
    _hrefLink = "javascript:"
}

function _rollbackFrameHeight() {
    var a = this.frameElement;
    a && (a.height = 500, _heightSeted = !1)
}

var _heightSeted = !1;

function _resetFrameHeight() {
    var a = this.frameElement;
    a && (a.height = a.contentDocument ? a.contentDocument.documentElement.scrollHeight + 0 : "MSIE9.0" == _browser_Version ? a.document.documentElement.scrollHeight : a.contentWindow.document.body.scrollHeight + 0, _heightSeted = !0);
    window != window.top && window.parent._resetFrameHeight()
}

window.document.body.addEventListener("onresize", _resetFrameHeight);

function _doEmpty() {
}

var _pageInitSignl = 0, eventAfterDraw = null, eventBeforDraw = null;

function Dqdp() {
    this.permissions = null;
    Dqdp.prototype.submitCheck = function (a) {
        var a = $("#" + a + " :visible[valid]"), b = !0, c = null;
        $.each(a, function (a, e) {
            var g = "", f = $(e).attr("valid"), h = $(e).val(), f = eval("(" + f + ")");
            if (f.must) if (_isNullValue(h) || _isNull(h)) b = _appendErrorTip(e, f.tip + "不能为空"), g = f.tip + "不能为空"; else if ("radio" == $(e).attr("type") && !(0 != $('input:radio[name="' + $(e).attr("name") + '"]:checked').length || 0 != $('input:radio[name="' + $(e).attr("id") + '"]:checked').length)) b = _appendErrorTip(e, f.tip + "为必选项"), g =
                f.tip + "为必选项"; else if ("checkbox" == $(e).attr("type") && !$(e).is(":checked")) {
                var i = $(e).attr("dict");
                null != i ? 0 == $('input:checkbox[dict="' + i + '"]:checked').length && (b = _appendErrorTip(e, f.tip + "为必选项"), g = f.tip + "为必选项") : (b = _appendErrorTip(e, f.tip + "为必选项"), g = f.tip + "为必选项")
            } else _removeErrorTip(e); else _removeErrorTip(e);
            if (h) {
                f.length && _strlength(h) > f.length && (g = "只能输入" + f.length + "个英文字符或" + f.length / 2 + "个汉字");
                switch (f.fieldType) {
                    case "datetime":
                        g = checkDate(h, "yyyy-MM-dd HH:mm:ss");
                        break;
                    case "date":
                        g = checkDate(h, "yyyy-MM-dd");
                        break;
                    case "certId":
                        g = checkCertID(h);
                        break;
                    case "pattern":
                        RegExp(f.regex, "g").test(h) || (g = "格式不正确");
                        break;
                    case "func":
                        eval(f.regex) || (g = "格式不正确")
                }
                "" == g ? _removeErrorTip(e) : _appendErrorTip(e, f.tip + g);
                "" != g && (b = !1, c || (c = e))
            }
        });
        c && c.focus();
        _resetFrameHeight();
        return b
    };
    Dqdp.prototype.initPage = function () {
        eventBeforDraw && eventBeforDraw.call(eventBeforDraw, null);
        _initCMD();
        _resetFrameHeight();
        eventAfterDraw && eventAfterDraw.call(eventAfterDraw, null)
    }
}

function _redraw(a, b) {
    eventBeforDraw && eventBeforDraw.call(eventBeforDraw, null);
    0 < arguments.length ? (1 == arguments.length ? (_initElementValue(a, !1), _buildEditor(a, !1)) : (_initElementValue(a, b), _buildEditor(a, b)), _filtePermission(a), _showOn(), _rebuildSelect(a), _rebuildDictInputByAttr("checkbox", a), _rebuildDictInputByAttr("radio", a), _bindDictParent(a), _bindEvent(), _undisabled(a)) : _initCMD();
    eventAfterDraw && eventAfterDraw.call(eventAfterDraw, null)
}

function _initCMD() {
    _initElementValue();
    _filtePermission();
    _showOn();
    _rebuildSelect();
    _rebuildDictInputByAttr("checkbox");
    _rebuildDictInputByAttr("radio");
    _bindDictParent();
    _buildEditor();
    _bindEvent();
    _undisabled()
}

function _regEventBeforDraw(a) {
    eventBeforDraw = a
}

function _regEventAfterDraw(a) {
    eventAfterDraw = a
}

function _bindEvent() {
    var a = $("[keySearch]");
    $.each(a, function () {
        this.onkeyup = function () {
            13 == (event ? event : window.event ? window.event : null).keyCode && eval($(this).attr("keySearch"))
        }
    })
}

function _appendErrorTip(a, b) {
    var c = $(a).parent();
    if (c.is("lable")) for (; c.is("lable");) c = c.parent();
    null == $(".error", c).html() && c.append('<span style="color: red;" class="error">(' + b + ")</span>");
    return !1
}

function _removeErrorTip(a) {
    a = $(a).parent();
    if (a.is("lable")) for (; a.is("lable");) a = a.parent();
    null != $(".error", a).html() && $(".error", a).remove();
    return !1
}

function _getDictDesc(a, b, c) {
    var d = _dqdp_dict[a];
    if (b) for (var e = b.split("."), g = 0; g < e.length; g++) for (var f in d) for (var h in d[f]) if (h == e[g]) {
        if (!d[f][h].child) return;
        d = d[f][h].child
    }
    if (3 == arguments.length) for (f in d) for (h in d[f]) if (h == c) return d[f][h].desc;
    return d
}

function _undisabled(a) {
    var b = $(1 == arguments.length ? "#" + a + "  [_disabled]" : "[_disabled]");
    $.each(b, function (a, b) {
        $(b).attr("disabled", "true" == $(b).attr("_disabled"))
    });
    b = $(1 == arguments.length ? "#" + a + "  [_readonly]" : "[_readonly]");
    $.each(b, function (a, b) {
        $(b).attr("readonly", "true" == $(b).attr("_readonly"))
    });
    b = $(1 == arguments.length ? "#" + a + "  [_checked]" : "[_checked]");
    $.each(b, function (a, b) {
        $(b).attr("checked", "true" == $(b).attr("_checked"));
        $(b).click()
    })
}

function _bindDictParent(a) {
    var b = $(1 == arguments.length ? "#" + a + "  [parentDict]" : "[parentDict]"), c;
    $.each(b, function (a, b) {
        var g = $(this), f = $("#" + g.attr("parentDict"));
        void 0 == c && (c = f);
        $(f).live("change", function () {
            for (var a = "", c = "", d = $(g); void 0 != d.attr("parentDict") && null != d.attr("parentDict") && "" != d.attr("parentDict");) {
                d = $("#" + d.attr("parentDict"));
                a = d.val() + (0 < a.length ? "." : "") + a;
                if ("" == a) break;
                if (void 0 == d.attr("parentDict") || "" == d.attr("parentDict") || null == d.attr("parentDict")) var c = d.attr("dictType"),
                    f = d.attr("dictItem"), a = f + ("" == f ? "" : ".") + a
            }
            !_isNullValue(a) && "" != a ? (d = $(this).attr("param"), _isNullValue(d) ? b.setDictData(_getDictDesc(c, a)) : (a = _doGetDataSrc(baseURL + "/dictmgr/dictmgr!queryDictByParent.action", "searchValue['_value']=" + a + "&searchValue['_dictType']=" + c + "&" + d), null != a && (a = eval(a), b.setDictData(a[c]))), c = g.attr("defaultValue"), !_isNullValue(c) && "" != c && g.attr("value", c)) : b.setDictData(null)
        });
        c.change()
    })
}

function _rebuildSelect(a) {
    var b = $(1 == arguments.length ? "#" + a + "  select" : "select");
    $.each(b, function (a, b) {
        var e = $(b), g = e.attr("dictType"), f = e.attr("dictItem"), h = e.attr("param"), i = e.attr("defaultValue");
        $.extend(b, {
            setDictData: function (a) {
                _cleanSelect(e);
                e.html("");
                if (null != a) {
                    var b = e.attr("defaultTip"),
                        b = _isNullValue(b) ? "<option value=''>请选择</option>" : "" == b ? "" : "<option value=''>" + b + "</option>";
                    e.append(b);
                    for (var c in a) for (var d in a[c]) e.append("<option value='" + d + "'" + (d == i ? "selected" : "") + ">" + a[c][d].desc +
                        "</option>")
                }
            }
        });
        _isNullValue(g) || (_isNullValue(h) ? this.setDictData(_getDictDesc(g, f)) : (f = _doGetDataSrc(baseURL + "/dictmgr/dictmgr!queryDict.action", "searchValue['_dictType']=" + g + "&" + h), null != f && (f = eval(f), this.setDictData(f[g]))))
    })
}

function _isNullValue(a) {
    return void 0 == a || null == a
}

function _cleanSelect(a) {
    $.each($("[parentDict=" + a.attr("id") + "]"), function (a, c) {
        var d = $(c);
        _cleanSelect(d);
        try {
            c.setDictData(null)
        } catch (e) {
        }
    })
}

function _showOn() {
    var a = $("[showOn]");
    $.each(a, function (a, c) {
        var d = $(c);
        if (!d.attr("permission")) try {
            eval(d.attr("showOn")) ? d.show() : d.hide()
        } catch (e) {
            d.hide()
        }
    })
}

function _filtePermission(a) {
    var b = $(1 == arguments.length ? "#" + a + "  [permission]" : "[permission]"), c;
    $.each(b, function (a, b) {
        var g = $(b).attr("permission");
        "" == g || _hasPermission(g, _dqdp_permissions) ? (c = $(b).attr("showOn"), (!c || c && eval(c)) && $(b).show()) : "true" == $(b).attr("readonlyWhenNoPermission") ? $(b).attr("readonly", "readonly") : $(b).remove()
    })
}

function _hasPermission(a, b) {
    if (-1 < a.indexOf("|")) {
        for (var c = a.split("|"), d = !1, e = 0; e < c.length; e++) d = d || b[c[e]];
        return d
    }
    if (-1 < a.indexOf("&")) {
        c = a.split("&");
        d = !1;
        for (e = 0; e < c.length; e++) d = d && b[c[e]];
        return d
    }
    return b[a]
}

function _rebuildDictInputByAttr(a, b) {
    var c = $(1 != arguments.length ? "#" + b + " :" + a : ":" + a);
    $.each(c, function () {
        var b = $(this), c = b.attr("dictType");
        if (!c) return !0;
        var g = b.attr("dictItem"), f = b.attr("defaultValue"), h = b.attr("name"), i = b.attr("param");
        f && "" != f && (f = f.split(","));
        this.setDictData = function (g) {
            if (null != g) {
                var i = $(b.parent()), k = b.attr("onclick"), o = b.attr("valid");
                $("[name='" + h + "']").remove();
                for (var p in g) for (var n in g[p]) {
                    var l = !1, r;
                    for (r in f) if (f[r] == n) {
                        l = !0;
                        break
                    }
                    if (void 0 != g[p][n]) {
                        var q =
                            $("<lable>"), l = $("<input />", {type: a, value: n, name: h, checked: l});
                        l.css("padding-right", "3px").attr("dict", c);
                        null != o && l.attr("valid", o);
                        null != k && l.click(function () {
                            eval(k)
                        });
                        l.appendTo(q);
                        q.append(g[p][n].desc + "&nbsp;&nbsp;");
                        q.appendTo(i)
                    }
                }
            }
        };
        _isNullValue(i) ? null != c && this.setDictData(_getDictDesc(c, g)) : (g = _doGetDataSrc(baseURL + "/dictmgr/dictmgr!queryDict.action", "searchValue['_dictType']=" + c + "&" + i), null != g && (g = eval(g), this.setDictData(g[c])));
        null != f && b.val(f)
    })
}

var _eleTemplateStore = new HashMap;

function _resetElement(a) {
    if (1 > arguments.length) for (var b = _eleTemplateStore.keys(), c = 0; c < b.length; c++) $("#" + b[c]).html(_eleTemplateStore.get(b[c])); else b = _eleTemplateStore.get(a), null != b && (void 0 != b && "" != b) && $("#" + a).html(b)
}

function _destoryPage() {
    _eleTemplateStore.clear()
}

$(window).on('unload', function () {
    _destoryPage()
});
var _editors = new HashMap;//$(window).unload(function(){_destoryPage()})
function _buildEditor(a, b) {
    var c = null, c = 0 < arguments.length ? $("#" + a + (b ? " " : "") + "[editor]") : $("[editor]");
    $.each(c, function () {
        var a = $(this), b = a.text(), c = eval("(" + a.attr("editor") + ")"),
            f = KindEditor.create("#" + a.attr("id"), c.param);
        f.html(b);
        c.readonly && f.readonly();
        _editors.put(a.attr("id"), f)
    })
}

function _initElementValue(a, b) {
    var c = null, c = 0 < arguments.length ? $("#" + a + (b ? " " : "") + "[dataSrc]") : $("[dataSrc]");
    $.each(c, function (a) {
        var b = $(this), c = b.attr("id");
        if (null == c || void 0 == c) b.attr("id", "_id_div_" + a), c = b.attr("id");
        _resetElement(c);
        _eleTemplateStore.put(c, b.html());
        var a = b.attr("dataSrc"), d = [];
        _isNull(a) || (-1 < a.indexOf("local:") ? (a = eval(a.substr(6, a.length)), d.push(a), _doEleValueDispathc(b, a, d), _resetFrameHeight()) : $.ajax({
            type: "post", data: {dqdp_csrf_token: dqdp_csrf_token}, url: a, dataType: "json",
            async: !1, success: function (a) {
                "0" == a.code ? (a = a.data, d.push(a), _doEleValueDispathc(b, a, d), _resetFrameHeight()) : _alert("错误提示", a.desc)
            }, error: function () {
                _alert("错误提示", "通讯故障")
            }
        }))
    });
    _showOn();
    try {
        _resetFrameHeight(document.documentElement.scrollHeight)
    } catch (d) {
    }
}

var _varReg = /@(\{|\%7B)([^@]*?(@(\{|\%7B)[^@].*?(\}|\%7D)|.)*?)(\}|\%7D)/, _expReg = /^#(.*?)#/, _jSmartSupport = !1;

function _replaceVar(a, b, c) {
    for (var d = a.html(), e; null != (e = _varReg.exec(d));) {
        var g;
        if (null != (g = _expReg.exec(e[2]))) {
            _jSmartSupport || ($("<script><\/script>").attr({
                src: baseURL + "/js/3rd-plug/jsrender/jsrender.js",
                type: "text/javascript",
                id: "load"
            }).appendTo($("head").remove("#loadscript")), _jSmartSupport = !0);
            for (var f = g[1]; null != (g = _varReg.exec(f));) var h = _replaceHTMLVar(g[2], b, c), f = f.replace(g[0], h);
            $.templates("xxx", "{{" + f + "}}");
            g = $.render.xxx(b)
        } else g = _replaceHTMLVar(e[2], b, c);
        "object" == $.type(g) &&
        (g = JSON.stringify(g));
        d = d.replace(e[0], g)
    }
    d != a.html() && a.html(d)
}

function _replaceHTMLVar(a, b, c) {
    for (var d; null != (d = _varReg.exec(a));) var e = _replaceHTMLVar(d[2], b, c), a = a.replace(d[0], e);
    var g, a = a.split(".");
    for (d = 0; d < a.length; d++) if (g = "" == a[d] ? c[c.length - d - 2] : 0 == d ? b[a[d]] : g[a[d]], null == g || void 0 == g) g = "";
    return g
}

function _doEleValueDispathc(a, b, c) {
    $("[listSourceBackup=false]", a).remove();
    var d = $("[name]", a);
    $.each(d, function () {
        for (var a = $(this), d = a.attr("name"), f; null != (f = _varReg.exec(d));) var h = _replaceHTMLVar(f[2], b, c), d = d.replace(f[0], h);
        var d = d.split("."), i;
        for (f = 0; f < d.length; f++) if (i = "" == d[f] ? c[c.length - f - 2] : 0 == f ? b[d[f]] : i[d[f]], null == i || void 0 == i) i = "";
        if (null == i || void 0 == i || "array" != $.type(i) || 0 == $(this).children().length) _doElementValueSet(this, i); else if (d = a.parent(), "true" == d.attr("listSourceBackup") &&
        "true" != a.attr("listSourceBackup")) a.remove(); else if ("SELECT" == a[0].tagName) _doElementValueSet(a[0], i); else if (void 0 != a.attr("merge") && !_isNull(a.attr("merge"))) _doElementValueSet(a[0], i.join(a.attr("merge"))); else {
            h = a.attr("class");
            f = null;
            null != h && -1 < h.indexOf("|") && (f = h.split("|"));
            for (h = 0; h < i.length; h++) {
                void 0 == i[h]._index && (i[h]._index = "" + (h + 1));
                var j = a.clone();
                j.html(j.html().replace("\\#_rpa_\\#", "@{"));
                j.attr("listSourceBackup", "false");
                if (0 < $("[name]", j).length || -1 < j.html().indexOf("@{")) {
                    for (var m =
                        [], k = 0; k < c.length; k++) m[k] = c[k];
                    m.push(i[h]);
                    _doEleValueDispathc(j, i[h], m)
                } else _doElementValueSet(j[0], i[h]);
                d.append(j);
                null != f && j.attr("class", f[h % f.length]);
                j.show()
            }
            a.remove()
        }
    });
    _replaceVar(a, b, c)
}

function _getBoolAttr(a, b) {
    var c = a.attr(b);
    return c && ("true" == c || "TRUE" == c) ? !0 : !1
}

function _isEmptyStr(a) {
    return !_isNullValue(a) && "[object String]" == Object.prototype.toString.call(a) && _isNull(a)
}

function _doElementValueSet(a, b) {
    if ("object" == $.type(b) || "array" == $.type(b)) b = JSON.stringify(b);
    var c = $(a);
    if ("INPUT" == a.tagName || "TEXTAREA" == a.tagName || "SELECT" == a.tagName) if ("TEXTAREA" == a.tagName && c.attr("editor")) c.html(b); else {
        switch (c.attr("type")) {
            case "radio":
            case "checkbox":
                c.val() == b ? c.attr("checked", !0) : c.removeAttr("checked");
                c.attr("defaultValue", b);
                break;
            default:
                if (null == b || void 0 == b) b = c.attr("defaultValue");
                c.attr("value", b)
        }
        if ("SELECT" == a.tagName) if ("array" == $.type(b)) {
            c.html("");
            for (var d =
                0; d < b.length; d++) {
                var e = c.attr("keyForSelect"), e = b[d][e], g = b[d][c.attr("descForSelect")];
                c.append("<option value='" + e + "'" + (e == c.attr("defaultValue") ? "selected" : "") + ">" + g + "</option>")
            }
        } else "" != (c.attr("defaultTip") || !_isNullValue(b)) && c.attr("defaultValue", b);
        "TEXTAREA" == a.tagName && c.text(b)
    } else "IMG" == a.tagName ? (_isEmptyStr(b) && (b = c.attr("defaultValue")), c.attr("src", (0 == b.indexOf("http://") ? "" : c.attr("src")) + b)) : (d = c.attr("charLength"), null == b || void 0 == b ? b = c.attr("defaultValue") : void 0 != d && (null !=
        d && "" != d) && (c.attr("title", b), b = _getStrByLen(b, d)), c.text(b))
}

function _alert(a, b, c) {
    var d = $("#id_dialog"), e = null;
    2 < arguments.length && null != c && (e = c);
    d[0] || ($(document.body).append("<div id=\"id_dialog\" style='width: 427px'><div>"), d = $("#id_dialog"));
    d.html("<table border='0' cellspacing='0' cellpadding='0'><tr><td><table  border='0' align='center' cellpadding='0' cellspacing='0'><tr><td rowspan='2' valign='top' class='tipsImg'><img src='" + baseURL + "/themes/default/images/icon/iconTips.png' /></td><td valign='top' >" + b + "</td></tr><tr><td align='center' valign='middle'></td></tr></table></td></tr></table>").dialog({
        resizable: !1,
        overflow: "hidden",/*position:"center",*/
        modal: !0,
        title: a,
        minHeight: 180,
        minWidth: 320,
        buttons: {
            "关闭": function () {
                $(this).dialog("close");
                e && e.call(e, null, null)
            }
        }
    });
    _resetFrameHeight()
}

function _pageGo(a, b, c) {
    a = Number(a);
    b = Number(b);
    a < b ? _alert("错误提示", "超出最大页数") : 1 > b ? _alert("错误提示", "超出最小页数") : eval(c + "(" + b + ")")
}

$(document).ready(function () {
    _rollbackFrameHeight();
    (new Dqdp).initPage();
    _resetFrameHeight()
});

function _doCheck(a, b) {
    $.each($("[name=" + b + "]"), function (b, d) {
        $(d).prop("disabled") || (true == $(a).prop("checked") ? $(d).attr("checked", "checked") : $(d).removeAttr("checked"))
    })
}

function _doGetChooseRow(a) {
    var b = "";
    $.each($("#" + a).find("[name=ids]"), function (a, d) {
        "checked" == $(this).attr("checked") && (0 < b.length && (b += ","), b += $(d).val())
    });
    return b
}

function _doEdit() {
    var a = _doGetChooseRow("ids");
    if (0 == a.length) return _alert("提示", "请选择要编辑的数据"), !1;
    if (-1 < a.indexOf(",")) return _alert("错误提示", "请不要选择多条数据"), !1;
    document.location.href = $("#" + $divId).attr("editUrl") + "?dqdp_csrf_token=" + dqdp_csrf_token + "&id=" + a
}

function _doAdd(a) {
    document.location.href = $("#" + a).attr("addUrl") + "?dqdp_csrf_token=" + dqdp_csrf_token
}

function _doDel(a, b) {
    var c = _doGetChooseRow(a);
    if (0 == c.length) return _alert("提示", "请选择要删除的数据"), !1;
    confirm("确认要删除数据吗？") && (1 == arguments.length ? (_doCommonPost($("#" + a).attr("delUrl"), "ids=" + c), doSearch(1)) : _doCommonPost($("#" + a).attr("delUrl"), "ids=" + c, b))
}

function _doSignlDel(a, b, c) {
    $("#" + a + " [name=ids][value=" + b + "]").attr("checked", "true");
    $("#" + a + " [name=ids][value!=" + b + "]").removeAttr("checked");
    3 == arguments.length ? _doDel(a, c) : _doDel(a)
}

function _doSignlEdit(a, b) {
    $("#" + a + " [name=ids][value=" + b + "]").attr("checked", "true");
    $("#" + a + " [name=ids][value!=" + b + "]").removeAttr("checked");
    var c = _doGetChooseRow(a);
    if (0 == c.length) return _alert("提示", "请选择要编辑的数据"), !1;
    document.location.href = $("#" + a).attr("editUrl") + "?dqdp_csrf_token=" + dqdp_csrf_token + "&id=" + c
}

function _doSignlView(a, b) {
    $("#" + a + " [name=ids][value=" + b + "]").attr("checked", "true");
    $("#" + a + " [name=ids][value!=" + b + "]").removeAttr("checked");
    var c = _doGetChooseRow(a);
    if (0 == c.length) return _alert("提示", "请选择要查看的数据"), !1;
    document.location.href = $("#" + a).attr("viewUrl") + "?dqdp_csrf_token=" + dqdp_csrf_token + "&id=" + c
}

function _doCommonSubmit(a, b, c) {
    $(":button").attr("disabled", !0);
    for (var d = 0; d < _editors.values().length; d++) _editors.values()[d].sync();
    d = new Dqdp;
    !b || null == b || _isNull(b) ? b = {_crashToken: _crashToken} : b._crashToken = _crashToken;
    b.dqdp_csrf_token = dqdp_csrf_token;
    d.submitCheck(a) ? $("#" + a).ajaxSubmit({
        dataType: "json", data: b, async: !1, forceSync: !0, success: function (a) {
            $(":button").attr("disabled", !1);
            "0" == a.code ? _alert("提交结果", a.desc, c.ok) : _alert("提交结果", a.desc, c.fail)
        }, error: function () {
            $(":button").attr("disabled",
                !1);
            _alert("错误提示", "通讯故障", c.error)
        }
    }) : $(":button").attr("disabled", !1)
}

function _doGetDataSrc(a, b) {
    var c = null;
    if (!b || null == b) b = {};
    b.dqdp_csrf_token = dqdp_csrf_token;
    $.ajax({
        type: "post", url: a, data: b, dataType: "json", async: !1, success: function (a) {
            "0" == a.code ? c = a.data : _alert("错误提示", a.desc)
        }, error: function () {
            _alert("错误提示", "通讯故障")
        }
    });
    return c
}

function _doCommonPost(a, b, c) {
    if (!b || null == b) b = {};
    b.dqdp_csrf_token = dqdp_csrf_token;
    $.ajax({
        type: "POST", url: a, data: b, async: !1, success: function (a) {
            _alert("提交结果", a.desc);
            2 < arguments.length && ("0" == a.code && (c && c.ok) && c.ok.call(c.ok, null, null), "0" != a.code && (c && c.fail) && c.fail.call(c.fail, null, null))
        }, error: function () {
            _alert("错误提示", "通讯故障");
            c.fail.call(c.fail, null, null)
        }, dataType: "json"
    })
}

function ListTable(a) {
    this.data = a.data;
    this.title = a.title;
    this.trStyle = a.trStyle;
    this.trevent = a.trevent;
    this.operations = a.operations;
    this.checkableColumn = a.checkableColumn;
    ListTable.prototype.setTitle = function (a) {
        this.title = a
    };
    ListTable.prototype.setData = function (a) {
        this.data = a
    };
    ListTable.prototype.createList = function (b) {
        for (var c = "<thead> <tr>", d = 0; d < this.title.length; d++) c = "" != this.checkableColumn && this.title[d].isCheckColunm ? c + ("<th width=" + this.title[d].width + '><input type="checkbox" onclick="_doCheck(this,\'ids\')"></th>') :
            this.title[d].isOperationColumn ? c + ("<th width=" + this.title[d].width + "> 操作 </th>") : c + ("<th width=" + this.title[d].width + ">" + this.title[d].showName + "</th>");
        var c = c + "</tr> </thead>", e = "<tbody >";
        if (null == this.data || void 0 == this.data || 1 > this.data.length) e += '<tr  class="' + this.trStyle[d % 2] + '" ><td colspan="' + this.title.length + '">查询结果为空</td></tr>'; else for (d = 0; d < this.data.length; d++) {
            void 0 == this.data[d]._index && (this.data[d]._index = "" + (d + 1));
            for (var g = this.data[d], e = e + ('<tr  class="' + this.trStyle[d % 2] +
                '" '), e = e + ">", f = 0; f < this.title.length; f++) if (this.title[f].isCheckColunm) var h = this.title[f].checkAble,
                h = h ? h.call(h, d, g) ? "" : "disabled='true'" : "",
                e = e + ('<td class="tc" width=' + this.title[f].width + '><input type="checkbox" name="ids" ' + h + ' value="' + this.data[d][a.checkableColumn] + '"></td>'); else if (this.title[f].isOperationColumn) e += '<td class="tdOpera  tc"  width=' + this.title[f].width + ">", $.each(this.operations, function (a, b) {
                if ((!b.permission || _dqdp_permissions[b.permission]) && (!b.condition || b.condition.call(b.condition,
                    d, g))) e = e + ('<a href="' + _hrefLink + '">' + b.name + "</a>&nbsp;&nbsp;")
            }), e += "</td>"; else {
                var h = this.title[f].name, i = this.data[d];
                if ("object" == $.type(i[h]) || "array" == $.type(i[h])) i[h] = JSON.stringify(i[h]);
                var j = this.title[f].emptyValue;
                _isNullValue(j) && (j = "&nbsp;");
                _isNullValue(i[h]) ? e += '<td class="tc" dataType="data">' + j + "</td>" : (!this.title[f].noSafe && "string" == typeof i[h] && (i[h] = i[h].replace('"', "&quot;"), i[h] = i[h].replace("<", "&lt;"), i[h] = i[h].replace(">", "&gt;")), j = this.title[f].href && (!this.title[f].linkPermission ||
                    _dqdp_permissions[this.title[f].linkPermission]), e += '<td class="tc" dataType="data">' + (j ? '<a type="link" titleIndex="' + f + '" href="' + _hrefLink + '">' : "") + _getListShowByType(this.title[f].length ? _getStrByLen(i[h], this.title[f].length) : i[h], this.title[f].showType) + (j ? "</a>" : "") + "</td>")
            }
            e += "</tr>"
        }
        e += "</tbody>";
        $("#" + b).html('<table class="tableCommon" width="100%" border="0" cellspacing="0" cellpadding="0">' + c + e + "</table>");
        if (!(null == this.data || void 0 == this.data || 1 > this.data.length)) {
            var m = this.title;
            $.each(this.data, function (a, c) {
                var d = $("#" + b).find("tr:eq(" + (a + 1) + ") [type=link]");
                $.each(d, function (a, b) {
                    var d = $(b), e = m[d.attr("titleIndex")].href;
                    d.click(function () {
                        e.call(e, a, c)
                    })
                })
            });
            var k = this.trevent;
            $.each(this.data, function (a, c) {
                for (var d in k) {
                    var e = k[d];
                    $("#" + b).find("tr:eq(" + (a + 1) + ")").bind(d, function () {
                        e.call(e, a, c)
                    })
                }
            });
            k = this.operations;
            $.each(this.data, function (a, c) {
                var d = $("#" + b).find("tr:eq(" + (a + 1) + ") td:last-child a");
                $.each(d, function (a, b) {
                    $(this).click(function () {
                        $.each(k, function (a,
                                            d) {
                            d.name == $(b).text() && k[a].event.call(k[a].event, a, c)
                        })
                    })
                })
            });
            try {
                _resetFrameHeight(document.documentElement.scrollHeight)
            } catch (o) {
            }
        }
    }
}

function _getListShowByType(a, b) {
    switch (b) {
        case "image":
            return a = a.replace(" ", ""), 0 > a.indexOf("http://") && 0 > a.indexOf("https://") && (a = baseURL + "/" + a), void 0 == b ? "<img src='' alt=''/>" : "<img src='" + a + "' alt=''/>";
        default:
            return void 0 == a ? "&nbsp;" : a
    }
}

function Pager(a) {
    this.totalPages = a.totalPages;
    this.currentPage = a.currentPage;
    this.funcName = a.funcName;
    Pager.prototype.createPageBar = function (a) {
        if (1 > this.totalPages) {
            $("#" + a).html('<a href="#" >上一页</a>|<a href="#" >下一页</a>|&nbsp;共0页<span class="font048"></span>');
            try {
                _resetFrameHeight(document.documentElement.scrollHeight)
            } catch (c) {
            }
        } else {
            var d;
            d = "" + ('<a href="javascript:' + this.funcName + "(" + (this.currentPage - 1) + ')" >上一页</a>|');
            d += '<a href="javascript:' + this.funcName + "(" + (this.currentPage + 1) + ')" >下一页</a>|';
            d += "&nbsp;共" + this.totalPages + '页<span class="font048">第 <input class="form24px border999" type="text" id="id_' + a + '_page" value="' + this.currentPage + '"/> 页</span>';
            d += '<input class="btnQuery" type="button" value="转到" onclick="var goPage=$(\'#id_' + a + "_page').val();if(!_checkPager(" + this.totalPages + ",goPage))return;" + this.funcName + '(goPage)"/>';
            $("#" + a).html(d);
            try {
                _resetFrameHeight(document.documentElement.scrollHeight)
            } catch (e) {
            }
        }
    }
}

function _checkPager(a, b) {
    return !/^\d+$/.test(b) ? (_alert("错误提示", "页数格式不正确"), !1) : b > a ? (_alert("错误提示", "超出最大页"), !1) : !0
}

var regYyyy_mm_dd_A = /^(\d{4})-(\d{1,2})-(\d{1,2})$/,
    regDateTime = /^(\d{4})-(\d{1,2})-(\d{1,2})\s(\d{1,2}):(\d{1,2}):(\d{1,2})$/,
    regChineseY_m_d = /^(\d{4})年(\d{1,2})月(\d{1,2})$/, regSlashY_m_d = /^(\d{4})\/(\d{1,2})\/(\d{1,2})$/,
    regSlashYmd = /^(\d{4})(\d{1,2})(\d{1,2})$/, sDateFormatA = "yyyy-mm-dd", sDateFormatB = "yyyy年mm月dd日",
    sDateFormatC = "yyyy/mm/dd", MONTH_LENGTH = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
    LEAP_MONTH_LENGTH = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

function _isNull(a) {
    "object" == typeof a && (a = a.toString());
    return "" == a || "" == a.replace(/\s+/g, "") ? !0 : !1
}

function checkCertID(a) {
    var b = !0, a = a.replace(/(^\s+)|(\s+$)/g, "");
    if ("" == a) return "身份证号格式错误";
    if (15 == a.length || 18 == a.length) 15 == a.length ? (year = "19" + a.substring(6, 8), month = a.substring(8, 10), day = a.substring(10, 12)) : (year = a.substring(6, 10), month = a.substring(10, 12), day = a.substring(12, 14)), b = checkDate(year + month + day, "yyyymmdd"); else return "不应为" + a.length + "位，请纠正\n";
    return "" == b ? "" : "身份证号中的日期错误"
}

function checkDate(a, b) {
    if ("" != a) {
        var c = null;
        null == b && (b = sDateFormatA);
        switch (b.toLowerCase()) {
            case "yyyy-mm-dd":
                c = regYyyy_mm_dd_A;
                break;
            case "yyyy年mm月dd日":
                c = regChineseY_m_d;
                break;
            case "yyyy/mm/dd":
                c = regSlashY_m_d;
                break;
            case "yyyymmdd":
                c = regSlashYmd;
                break;
            case "yyyy-mm-dd hh:mm:ss":
                c = regDateTime;
                break;
            default:
                return "正确的格式应为:" + b + "!\n"
        }
        if (!c.test(a)) return "应为日期类型!";
        var d = a.match(c), c = d[1], e = d[2], d = d[3];
        return 1 > c || 9999 < c || 1 > e || 12 < e || 1 > d || d > getMonthDay(e - 1, c) ? "中的日期有误!" : ""
    }
    return ""
}

function checkTime(a, b) {
    var c = document.getElementsByName(a)[0].value, d = document.getElementsByName(b)[0].value, c = c.replace("-", "/"),
        d = d.replace("-", "/"), c = new Date(c), d = new Date(d), e = new Date,
        e = e.getFullYear() + "/" + (e.getMonth() + 1) + "/" + e.getDate(), e = new Date(e);
    return c.getTime() < e.getTime() ? "开始时间不能早于当天" : d.getTime() < e.getTime() ? "结束时间不能早于当天" : c.getTime() > d.getTime() ? "开始时间不能早于结束时间" : !0
}

function getMonthDay(a, b) {
    return isLeapYear(b) ? LEAP_MONTH_LENGTH[a] : MONTH_LENGTH[a]
}

function isLeapYear(a) {
    return 0 == a % 4 && (0 != a % 100 || 0 == a % 400)
}

function _strlength(a) {
    for (var b = a.length, c = b, d = 0; d < b; d++) (0 > a.charCodeAt(d) || 255 < a.charCodeAt(d)) && c++;
    return c
}

function _getStrByLen(a, b) {
    if ("" == a) return "";
    for (var c = _strlength(a), d = "", e = 0, g = 0; e < b; g++) {
        e++;
        (0 > a.charCodeAt(g) || 255 < a.charCodeAt(g)) && e++;
        if (e > c) break;
        if (e <= b + 1 && (d += a.charAt(g), e > b || e == b && b != c)) d += "......"
    }
    return d
}

function DqdpSelect(a) {
    this.data = a.data;
    this.selectValue = a.selectValue;
    this.selectName = a.selectName;
    DqdpSelect.prototype.createSelect = function (a) {
        for (var c = this.selectName, d = this.selectValue, e = this.data, g = 0; g < e.length; g++) $("#" + a).append("<option value='" + e[g][d] + "'>" + e[g][c] + "</option>")
    }
}

function HashMap() {
    var a = 0, b = {};
    this.put = function (c, d) {
        this.containsKey(c) || a++;
        b[c] = d
    };
    this.get = function (a) {
        return this.containsKey(a) ? b[a] : null
    };
    this.remove = function (c) {
        this.containsKey(c) && delete b[c] && a--
    };
    this.containsKey = function (a) {
        return a in b
    };
    this.containsValue = function (a) {
        for (var d in b) if (b[d] == a) return !0;
        return !1
    };
    this.values = function () {
        var a = [], d;
        for (d in b) a.push(b[d]);
        return a
    };
    this.keys = function () {
        var a = [], d;
        for (d in b) a.push(d);
        return a
    };
    this.size = function () {
        return a
    };
    this.clear =
        function () {
            a = 0;
            b = {}
        }
}

jQuery.fn.floatdiv = function (a) {
    var b = !1;
    /msie/.test(navigator.userAgent.toLowerCase()) && "6.0" == $.browser.version && ($("html").css("overflow-x", "auto").css("overflow-y", "hidden"), b = !0);
    $("body").css({margin: "0px", padding: "0 10px 0 10px", border: "0px", height: "100%", overflow: "auto"});
    return this.each(function () {
        var c;
        if (a == void 0 || a.constructor == String) switch (a) {
            case "rightbottom":
                c = {right: "0px", bottom: "0px"};
                break;
            case "leftbottom":
                c = {left: "0px", bottom: "0px"};
                break;
            case "lefttop":
                c = {left: "0px", top: "0px"};
                break;
            case "righttop":
                c = {
                    right: "0px",
                    top: "0px"
                };
                break;
            case "middle":
                var d = c = 0, e, g;
                if (self.innerHeight) {
                    e = self.innerWidth;
                    g = self.innerHeight
                } else if (document.documentElement && document.documentElement.clientHeight) {
                    e = document.documentElement.clientWidth;
                    g = document.documentElement.clientHeight
                } else if (document.body) {
                    e = document.body.clientWidth;
                    g = document.body.clientHeight
                }
                c = e / 2 - $(this).width() / 2;
                d = g / 2 - $(this).height() / 2;
                c = {left: c + "px", top: d + "px"};
                break;
            default:
                c = {right: "0px", bottom: "0px"}
        } else c = a;
        $(this).css("z-index", "9999").css(c).css("position",
            "fixed");
        if (b) {
            c.right != void 0 && ($(this).css("right") == null || $(this).css("right") == "") && $(this).css("right", "18px");
            $(this).css("position", "absolute")
        }
    })
};
