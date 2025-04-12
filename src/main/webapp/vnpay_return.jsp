<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 4/12/2025
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%
    String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
    if ("00".equals(vnp_ResponseCode)) {
        System.out.print("Giao dịch thành công!");
        // Cập nhật trạng thái đơn hàng tại đây
    } else {
        System.out.print("Giao dịch thất bại!");
    }
%>

</body>
</html>
