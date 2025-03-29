package servlet.ManageUser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import object.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/uploadAvatar")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 10 * 1024 * 1024
)
public class UploadAvatarServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        Part filePart = request.getPart("avatar");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        if (filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            String imageUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;

            // Cập nhật đường dẫn ảnh trong session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            user.setAvatar(imageUrl);
            session.setAttribute("user", user);

            response.getWriter().write("{\"success\": true, \"imageUrl\": \"" + imageUrl + "\"}");
        } else {
            response.getWriter().write("{\"success\": false}");
        }
    }
}
