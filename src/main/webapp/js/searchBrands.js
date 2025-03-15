function  searchProdcutToPrice(){
    alert("SearchProduct");
    var toPrice = document.getElementById("toPrice").value;
    var fromPrice = document.getElementById("fromPrice").value;
    if(toPrice ===null && fromPrice === null){
        alert("Vui lòng nhập giá để tìm kiếm");
        return ;
    }
    window.location.href = `searchPriceProduct?toPrice=${toPrice}&fromPrice=${fromPrice}` ;
}