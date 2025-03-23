package servlet.Log;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.LogEntry;
import object.User;
import services.log.LogFile;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Log", urlPatterns = "/log")
public class LogServlet extends HttpServlet {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LogFile log = new LogFile();
        HttpSession session = req.getSession();
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        try {
            // Lấy dữ liệu từ request body (JSON)
            LogEntry logEntry = objectMapper.readValue(req.getReader(), LogEntry.class);

            // Lấy user từ session
            System.out.println(logEntry.toString());



            // Ghi log theo level
            switch (logEntry.level.toUpperCase()) {
                case "ERROR":
                    log.writeError(logEntry);
                    break;
                case "WARN":
                    log.writeWarning(logEntry);
                    break;
                case "INFO":
                    log.writeLog(logEntry);
                    break;
                case "DEBUG":
                    log.writeLog(logEntry);
                    break;
                default:
                    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print("{\"status\":\"error\", \"message\":\"Invalid log level\"}");
                    return;
            }

            // Trả về JSON response
            resp.setStatus(HttpServletResponse.SC_OK);
            out.print("{\"status\":\"success\", \"message\":\"Log recorded\"}");

        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
