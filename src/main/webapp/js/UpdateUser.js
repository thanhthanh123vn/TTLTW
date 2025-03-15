function  UpdateUser(){
    const username = document.getElementById("fullname");
    const email = document.getElementById("email");

    var User = {
        username:username,
        email:email
    }
    fetch(`http://localhost:8080/UpdateInfoUser?user=${encodeURIComponent(user)}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(user)
    }).then(response => {
        if (response.ok) {
            alert("Cập nhập thông tin thành công!");
        } else {
            alert("Cập nhập thông tin thất bại.");
        }
    }).catch(error => {
        console.error("Lỗi:", error);

    });
}
function  LinkupdatePass(){

window.location.href='../index/ChangPass.jsp'
}