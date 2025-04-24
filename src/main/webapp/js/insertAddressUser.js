function addAddressUser() {
    const fullName = document.getElementById("fullname").value;
    const phone = document.getElementById("phone").value;
    const city = document.getElementById("city").value;
    const district = document.getElementById("district").value;
    const address = document.getElementById("address").value;
    const number_hours = document.getElementById("number-hours").value;

    var UserAddress = {
        userName: fullName,
        phone: phone,
        address: number_hours + " , " + address + " , " + district + " , " + city
    };

    if (fullName && phone && city && district && address) {
        fetch("AddAddressUser", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(UserAddress)
        }).then(response => {
            if (response.ok) {
                alert("Địa chỉ người dùng đã được thêm thành công!");
                fetch( "AddAddressUser")
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Network response was not ok");
                        }
                        return response.text(); // hoặc .json() nếu trả về JSON
                    })
                    .then(data => {
                        console.log("Dữ liệu từ servlet:", data);
                        // xử lý dữ liệu hoặc hiển thị
                    })
                    .catch(error => {
                        console.error("Lỗi khi fetch servlet:", error);
                    });

            } else {
                response.text().then(text => {
                    console.error("Lỗi:", response.status, text);
                    alert("Lỗi khi thêm địa chỉ người dùng: " + text);
                });
            }
        }).catch(error => {
            console.error("Lỗi:", error);
            alert("Lỗi khi thêm địa chỉ người dùng.");
        });
    } else {
        alert("Vui lòng nhập đầy đủ thông tin");
    }
}
