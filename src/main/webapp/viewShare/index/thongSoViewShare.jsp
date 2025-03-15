<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

          <div id="information">
<%--            <p><span class="font-bold">${products.name}</span> là dòng sản phẩm tẩy trang dạng nước...</p>--%>
<%--            <img src="${products.image}" alt="Ảnh Sản phẩm">--%>

          </div>
          <div id="parameter">
            <h3>Thông số sản phẩm</h3>
            <table>
              <tr><td>Barcode</td><td>${product.barcode}</td></tr>
              <tr><td>Thương Hiệu</td><td>${product.brand}</td></tr>
              <tr><td>Xuất xứ thương hiệu</td><td>${product.brandOrigin}</td></tr>
              <tr><td>Nơi sản xuất</td><td>${product.manufactureLocation}</td></tr>
              <tr><td>Loại da</td><td>${product.skinSolution}</td></tr>
            </table>
          </div>

