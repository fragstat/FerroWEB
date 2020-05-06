<%--
  Created by IntelliJ IDEA.
  User: Sergey
  Date: 06.05.2020
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Проверка сертификата</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Ферротрейд</h1>
</div>

<div class="w3-container w3-padding">
    <%
        if (request.getAttribute("id") != null && request.getAttribute("mark") != null) {
            out.println("<div class=\"w3-panel w3-green w3-display-container w3-card-4 w3-round\">\n" +
                    "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                    "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-green w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                    "   <h5>Номер сертификата: " + request.getAttribute("id") + " </h5>\n" +
                    "   <h5>Марка: " + request.getAttribute("mark") + " </h5>\n" +
                    "   <h5>Диаметер: " + request.getAttribute("diameter") + " </h5>\n" +
                    "   <h5>Номер плавки: " + request.getAttribute("plav") + " </h5>\n" +
                    "   <h5>Номер партии: " + request.getAttribute("part") + " </h5>\n" +
                    "   <h5>Вес: " + request.getAttribute("weight") + " </h5>\n" +
                    "   <h5>Покупатель: '" + request.getAttribute("customer") + "' </h5>\n" +
                    "</div>");
        }if (request.getAttribute("id") != null && request.getAttribute("mark") == null) {
        out.println("<div class=\"w3-panel w3-red w3-display-container w3-card-4 w3-round\">\n" +
                "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red w3-border w3-border-black w3-hover-border-grey\">×</span>\n" +
                "   <h5>" + request.getAttribute("id") + " !</h5>\n" +
                "</div>");
    }

    %>
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-orange">
            <h2>Проверка сертификатов</h2>
        </div>
        <form method="post" class="w3-selection w3-light-grey w3-padding">
            <label>Код с сертификата:
                <input type="text" name="code" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Проверить</button>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/'">На главную</button>
</div>
</body>
</html>

