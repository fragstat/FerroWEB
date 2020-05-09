<%--
  Created by IntelliJ IDEA.
  User: Sergey
  Date: 09.05.2020
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
    <title>Результаты</title>
</head>
<body>
<%
    if (request.getAttribute("id") != null) {
        out.println("<div class=\"w3-container\">\n" +
                "    <h2>Результаты проверки сертификата</h2>\n" +
                "\n" +
                "    <table class=\"w3-table-all w3-card-4\">\n" +
                "        <tr>\n" +
                "            <th>Параметер</th>\n" +
                "            <th>Значение</th>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td>Номер сертификата</td>\n" +
                "            <td>"+ request.getAttribute("id") +"</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td>Марка</td>\n" +
                "            <td>"+ request.getAttribute("mark") +"</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td>Диаметер</td>\n" +
                "            <td>"+ request.getAttribute("diameter") +"</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td>Номер плавки</td>\n" +
                "            <td>"+ request.getAttribute("plav") +"</td>\n" +
                "        </tr><tr>\n" +
                "        <td>Номер партии</td>\n" +
                "        <td>"+ request.getAttribute("part") +"</td>\n" +
                "    </tr><tr>\n" +
                "        <td>Вес</td>\n" +
                "        <td>"+ request.getAttribute("weight") +"</td>\n" +
                "    </tr><tr>\n" +
                "        <td>Покупатель</td>\n" +
                "        <td>"+ request.getAttribute("customer") +"</td>\n" +
                "    </tr>\n" +
                "    </table>\n" +
                "</div>");
    }
%>

</body>
</html>
