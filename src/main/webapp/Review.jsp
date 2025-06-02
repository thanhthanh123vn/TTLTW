<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 6/2/2025
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="submitReview" method="post">
  <input type="hidden" name="productId" value="${products.id}">
  <label>Chọn số sao: </label>
  <select name="rating">
    <option value="5">★★★★★</option>
    <option value="4">★★★★☆</option>
    <option value="3">★★★☆☆</option>
    <option value="2">★★☆☆☆</option>
    <option value="1">★☆☆☆☆</option>
  </select>
  <br>
  <textarea name="comment" placeholder="Nhận xét..." rows="4" cols="50"></textarea>
  <br>
  <button type="submit">Gửi đánh giá</button>
</form>

