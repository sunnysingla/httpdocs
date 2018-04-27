var ALERT_TITLE = "Tutoring Club:";
var ALERT_BUTTON_TEXT = "Ok";

if (document.getElementById) {
    window.alert = function (txt, reload) {
        try {
            createCustomAlert(txt, reload);
            return false;
        }
        catch (err)
        {
            return false;
        }
    }
}

function createCustomAlert(txt, reload) {
    d = document;

    if (d.getElementById("modalContainer")) return;

    mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
    mObj.id = "modalContainer";
    mObj.style.height = d.documentElement.scrollHeight + "px";

    alertObj = mObj.appendChild(d.createElement("div"));
    alertObj.id = "alertBox";
    if (d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
    alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth) / 2 + "px";
    alertObj.style.visiblity = "visible";

    h1 = alertObj.appendChild(d.createElement("h1"));
    h1.appendChild(d.createTextNode(ALERT_TITLE));

    msg = alertObj.appendChild(d.createElement("p"));
    //msg.appendChild(d.createTextNode(txt));
    msg.innerHTML = txt;

    btn = alertObj.appendChild(d.createElement("a"));
    btn.id = "closeBtn";
    btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
    btn.href = "#";
    btn.focus();
    btn.onclick = function () { removeCustomAlert(); if (reload == true) window.location.href = location.href; else return false; }

    alertObj.style.display = "block";
    return false;
}

function removeCustomAlert() {
    document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
    if ($(".ui-dialog-titlebar-close").is(":visible") == false)
        $(".ui-dialog-titlebar-close").trigger("click");
}
 