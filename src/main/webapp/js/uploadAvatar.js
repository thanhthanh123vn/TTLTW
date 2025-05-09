 document.getElementById("avatar-upload").addEventListener("change", function(event) {
    let file = event.target.files[0];
    if (file) {
    let reader = new FileReader();
    reader.onload = function(e) {
    document.getElementById("avatar-preview").src = e.target.result;
};
    reader.readAsDataURL(file);
}
});

    function uploadAvatar() {
    let formData = new FormData();
    let fileInput = document.getElementById("avatar-upload");

    if (fileInput.files.length === 0) {
    alert("Vui lòng chọn ảnh!");
    return;
}

    formData.append("avatar", fileInput.files[0]);

    fetch("uploadAvatar", {
    method: "POST",
    body: formData
})
    .then(response => response.json())
    .then(data => {
    if (data.success) {
    document.getElementById("avatar-preview").src = data.imageUrl;
    alert("Cập nhật ảnh đại diện thành công!");
} else {
    alert("Upload thất bại!");
}
})
    .catch(error => console.error("Lỗi:", error));
}
