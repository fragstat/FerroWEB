package app.servlets;

import app.entities.User;
import app.model.Model;
import app.model.Text;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class TextRedactorServlet extends HttpServlet {
    private final String SEPARATOR = "(!!&&f(@@)";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/textRedactor.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("name");
        String password = req.getParameter("pass");
        String textContent = req.getParameter("text");
        String title = req.getParameter("title");
        if (userName != null && password != null) {
            Model model = Model.getInstance();
            Map<String, String> map = model.map();
            if (map.get(userName).equals(password)) {
                req.setAttribute("auth", "success");
                req.setAttribute("userName", userName);
                try {
                    Text text = Text.getInstance();
                    String textS = text.getText(userName);
                    String titleS = textS.substring(0,textS.indexOf(SEPARATOR));
                    String textT = textS.substring(textS.indexOf(SEPARATOR)+10);
                    req.setAttribute("savedTitle", titleS);
                    req.setAttribute("savedText", textT);
                }catch (Exception e){
                    e.printStackTrace();
                }
            } else {
                req.setAttribute("auth", "fail");
                req.setAttribute("userName", "error_wrong_pass");
            }
            doGet(req, resp);
        }
        if (textContent != null) {
            Text text = Text.getInstance();
            String savedText = title + SEPARATOR + textContent;
            text.addText(userName, savedText);
            req.setAttribute("saved", "true");
            req.setAttribute("auth","success");
            req.setAttribute("userName",userName);
            req.setAttribute("savedText", textContent);
            req.setAttribute("savedTitle", title);
            doGet(req, resp);
        }
    }
}
