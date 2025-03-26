package ServletAdmin.LogManager;

import dao.LogDAOImp;
import dao.LogDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LogManager", value = "/LogManager")
public class LogManager extends HttpServlet {
    LogDao logDAO = new LogDAOImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var logs = logDAO.findAll();
        request.setAttribute("logs", logs);
        request.getRequestDispatcher("admin/logManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}