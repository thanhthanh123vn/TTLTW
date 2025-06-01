package ShipperFee;
public class GHTKOrderResponse {
    private boolean success;
    private String message;
    private OrderData order;

    public static class OrderData {
        private String label;
        private String estimated_deliver_time;
        private String status;
        private String partner_id;
        private String sort_code;
        private String tracking_number;
        private String created_at;
        private String updated_at;
    }

    // Getters and setters
    public boolean isSuccess() {
        return success;
    }

    public String getMessage() {
        return message;
    }

    public OrderData getOrder() {
        return order;
    }

    public String getTrackingNumber() {
        return order != null ? order.tracking_number : null;
    }
}