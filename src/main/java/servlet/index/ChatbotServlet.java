package servlet.index;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;

import java.net.*;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.OutputStream;

public class ChatbotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy câu hỏi từ phía client
        String userMessage = request.getParameter("userMessage");

        // Địa chỉ endpoint của OpenAI API
        String apiUrl = "https://api.openai.com/v1/completions";

        // Tạo kết nối tới API OpenAI
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestProperty("Authorization", "Bearer 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");  // Thay thế YOUR_API_KEY bằng API key của bạn
        connection.setDoOutput(true);

        // Tạo body của request
        String requestBody = "{\n" +
                "  \"model\": \"gpt-3.5-turbo\",\n" +
                "  \"messages\": [{\"role\": \"user\", \"content\": \"" + userMessage + "\"}]\n" +
                "}";

        // Gửi dữ liệu đến API
        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = requestBody.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // Đọc kết quả trả về từ API
        StringBuilder responseBuilder = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                responseBuilder.append(inputLine);
            }
        }

        // Trả lại câu trả lời từ chatbot về client
        String botResponse = responseBuilder.toString();
        request.setAttribute("chatbotResponse", botResponse);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/chat.jsp");  // Chuyển hướng đến trang chat.jsp để hiển thị
        dispatcher.forward(request, response);
    }
}
