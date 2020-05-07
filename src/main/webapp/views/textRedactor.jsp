<%--
  Created by IntelliJ IDEA.
  User: Sergey
  Date: 06.05.2020
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Текстовый редактор</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Sergey's server</h1>
</div>

<div class="w3-container w3-padding">
    <%
        if (request.getAttribute("userName") != null && request.getAttribute("userName") != "error_wrong_pass") {
            out.println("<div class=\"w3-panel w3-green w3-display-container w3-card-4 w3-round\">\n" +
                    "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                    "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-green w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                    "   <h5>Пользователь '" + request.getAttribute("userName") + "' вошёл успешно!</h5>\n" +
                    "</div>");
        }if (request.getAttribute("userName") == "error_wrong_pass") {
        out.println("<div class=\"w3-panel w3-red w3-display-container w3-card-4 w3-round\">\n" +
                "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                "   <h5>Вход не удался! Неправильный пароль или пользователь не существует!</h5>\n" +
                "</div>");
        }if (request.getAttribute("saved") == "true") {
        out.println("<div class=\"w3-panel w3-green w3-display-container w3-card-4 w3-round\">\n" +
                "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-green w3-border w3-border-black w3-hover-border-grey\">×</span>\n" +
                "   <h5>Документ '"+ request.getAttribute("savedTitle") +"' сохранён!</h5>\n" +
                "</div>");
        }
    %>
    <%
        if (request.getAttribute("auth") == null || request.getAttribute("userName") == "error_wrong_pass") {
            out.println("<div class=\"w3-card-4\" >\n" +
                    "        <div class=\"w3-container w3-center w3-green\" >\n" +
                    "            <h2 >Вход в редактор</h2 >\n" +
                    "        </div >\n" +
                    "        <form method = \"post\" class=\"w3-selection w3-light-grey w3-padding\" >\n" +
                    "            <label > Логин:\n" +
                    "                <input type = \"text\" name = \"name\" class=\"w3-input w3-animate-input w3-border w3-round-large\"\n" +
                    "            style = \"width: 30%\" ><br / >\n" +
                    "            </label >\n" +
                    "            <label > Пароль:\n" +
                    "                <input type = \"password\" name = \"pass\" class=\"w3-input w3-animate-input w3-border w3-round-large\"\n" +
                    "            style = \"width: 30%\" ><br / >\n" +
                    "            </label >\n" +
                    "            <button type = \"submit\" class=\"w3-btn w3-green w3-round-large w3-margin-bottom\" > Вход </button >\n" +
                    "        </form >\n" +
                    "    </div >");

        }
    %>
    <%
        if (request.getAttribute("auth") == "success" && request.getAttribute("savedText") == null) {
            out.println("<form method = \"post\"><div class=\"w3-container w3-blue\">\n" +
                    "<input type = \"text\" name = \"title\" value = \"Документ пользвателя '"+ request.getAttribute("userName") +"'\" class = \"w3-input w3-blue w3-border-blue w3-large\" >" +
                    "</div>\n" +
                    "<textarea name=\"text\"  rows=\"30\" class=\"w3-input w3-border\"></textarea>\n" +
                    "<input type = \"text\" name = \"name\" hidden value=\""+ request.getAttribute("userName")+"\">\n" +
                    "<button class=\"w3-btn w3-green w3-border w3-round-xlarge w3-margin\" >Сохранить</button></form>");
        }if (request.getAttribute("auth") == "success" && request.getAttribute("savedText") != null) {
        out.println("<form method = \"post\"><div class=\"w3-container w3-blue\">\n" +
                "<input type = \"text\" name = \"title\" value = \""+ request.getAttribute("savedTitle") +"\" class = \"w3-input w3-blue w3-border-blue w3-large\" >" +
                "</div>\n" +
                "<textarea name=\"text\"  rows=\"30\" class=\"w3-input w3-border\">"+ request.getAttribute("savedText") +"</textarea>\n" +
                "<input type = \"text\" name = \"name\" hidden value=\""+ request.getAttribute("userName")+"\">\n" +
                "<button class=\"w3-btn w3-green w3-border w3-round-xlarge w3-margin\" >Сохранить</button></form>");
    }
    %>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/'">На главную</button>
</div>
</body>
</html>