package object.cart;

import object.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {

    private Map<Integer, ProductCart> cart = new HashMap<>();

    public boolean put(Product product) {
        if (cart.containsKey(product.getId())) {
            update(product.getId(), cart.get(product.getId()).getCount() + 1);
            return false;
        }
        cart.put(product.getId(), convert(product));
        return true;
    }
    public int getCountList(){
        return cart.size();
    }

    public boolean remove(int id) {
        if (cart.containsKey(id)) {
            cart.remove(id);
            return true;
        }
        return false;
    }

    public ProductCart update(int id, int quantity) {
        if (cart.containsKey(id)) {
            ProductCart productCart = cart.get(id);
            productCart.setCount(quantity);
            return productCart; // Trả về sản phẩm đã cập nhật
        }
        return null; // Trả về null nếu không tìm thấy sản phẩm
    }

    public List<ProductCart> getList() {
        return new ArrayList<>(cart.values());
    }

    public int getTotalCount(int id) {
        if (cart.containsKey(id)) {
            return cart.get(id).getCount();
        }
        return 0; // Trả về 0 nếu không tìm thấy sản phẩm
    }

    public double getTotalCart() {
        double total = 0.0;
        for (ProductCart productCart : cart.values()) {
            total += productCart.getCount() * productCart.getPrice();
        }
        return total;
    }
    public int getTotalProductCart() {
        int total = 0;
        for (ProductCart productCart : cart.values()) {
            total += productCart.getCount() ;
        }
        return total;
    }

    public ProductCart convert(Product p) {
        ProductCart cartProduct = new ProductCart();
        cartProduct.setId(p.getId());
        cartProduct.setPrice(p.getPrice());
        cartProduct.setName(p.getName());
        cartProduct.setCount(p.getQuantity());
        cartProduct.setImage(p.getImage());
        cartProduct.setDetail(p.getDetail());
        return cartProduct;
    }
}
