package app.servlets;

import app.entities.User;
import app.model.Database;
import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/add.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("pass");
        Model model = Model.getInstance();
        Map<String, String> map = model.map();
        if (map.get(name).equals(password)) {
            User user = new User(name,password);
            model.delete(user);

            req.setAttribute("userName", name);
            doGet(req, resp);
        }
        req.setAttribute("userName", "error_wrong_pass");
        doGet(req, resp);
    }

}
