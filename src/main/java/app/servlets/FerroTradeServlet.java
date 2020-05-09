package app.servlets;

import app.model.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class FerroTradeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/ferro.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code").trim();
        Database database = Database.getInstance();

        try {
            Map<String,Object> map = database.getDocumentAsMap(code);
            if (map == null){
                req.setAttribute("id", "FileNotFound");
            }if (map != null && map.get("id").equals("Неверный код")) {
                req.setAttribute("id", map.get("id"));
            }else {
                req.setAttribute("id", map.get("id"));
                req.setAttribute("mark", map.get("mark"));
                req.setAttribute("part", map.get("part"));
                req.setAttribute("plav",map.get("plav"));
                req.setAttribute("weight", map.get("weight"));
                req.setAttribute("diameter", map.get("diameter"));
                req.setAttribute("customer", map.get("customer"));
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/result.jsp");
            requestDispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            doGet(req, resp);
        }
    }




}
