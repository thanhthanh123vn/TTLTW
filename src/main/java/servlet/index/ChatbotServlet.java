package servlet.index;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {
    private static final String API_KEY = "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";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userMessage = request.getParameter("userMessage");
        HttpURLConnection connection = getHttpURLConnection(userMessage);

        int responseCode = connection.getResponseCode();
        StringBuilder responseBuilder = new StringBuilder();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    responseBuilder.append(inputLine);
                }
            }
        } else {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Lỗi API: " + responseCode);
            return;
        }

        String jsonResponse = responseBuilder.toString();
        String botMessage = extractMessage(jsonResponse);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(botMessage);
    }

    private static HttpURLConnection getHttpURLConnection(String userMessage) throws IOException {
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestProperty("Authorization", "Bearer " + API_KEY);
        connection.setDoOutput(true);

        String requestBody = "{\n" +
                "  \"model\": \"gpt-3.5-turbo\",\n" +
                "  \"messages\": [{\"role\": \"user\", \"content\": \"" + userMessage + "\"}],\n" +
                "  \"max_tokens\": 100\n" +
                "}";

        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = requestBody.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        return connection;
    }

    private String extractMessage(String jsonResponse) {
        int contentStart = jsonResponse.indexOf("\"content\":\"");
        if (contentStart == -1) return "Không thể trích xuất phản hồi từ chatbot.";

        contentStart += 11;
        int contentEnd = jsonResponse.indexOf("\"", contentStart);
        if (contentEnd == -1) return "Không thể trích xuất phản hồi từ chatbot.";

        String content = jsonResponse.substring(contentStart, contentEnd);
        return content.replace("\\n", "<br>").replace("\\\"", "\"");
    }
}
