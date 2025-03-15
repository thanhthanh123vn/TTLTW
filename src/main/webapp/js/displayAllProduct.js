const brandListDiv = document.querySelector(".brand-list");
const categoryListDiv = document.querySelector(".category-product");
let currentBrandSlideIndex = 0;
let currentCategorySlideIndex = 0;
let currentHotPSlideIndex = 0;
let currentFlashSaleSlideIndex = 0;

// Gửi yêu cầu để lấy danh sách thương hiệu và danh mục từ Servlet
async function fetchBrandAndCategoryList() {
    try {
        // Gửi yêu cầu song song để lấy danh sách thương hiệu và danh mục
        const [flashSale,brandResponse, categoryResponse,hotProduct] = await Promise.all([
            fetch("http://localhost:8080/WebMyPham__/flashSale"),
            fetch("brandList"),
            fetch(`categoryList?startIndex=${encodeURIComponent(currentCategorySlideIndex)}`),
            fetch("hotProduct")
        ]);
        if (!flashSale.ok) {
            throw new Error("Không thể tải danh sách thương hiệu.");
        }
        if (!brandResponse.ok) {
            throw new Error("Không thể tải danh sách thương hiệu.");
        }
        if (!categoryResponse.ok) {
            throw new Error("Không thể tải danh sách danh mục.");
        }
        if (!hotProduct.ok) {
            throw new Error("Không thể tải danh sách hotProduct.");
        }
        const  flashSaleP = await  flashSale.json();
        const brands = await brandResponse.json();
        const categories = await categoryResponse.json();
        const  hotsP = await  hotProduct.json();

        displayBrands(brands);
        displayCategories(categories);
        displayHotProducts(hotsP);
        displayFlashSaleProducts(flashSaleP);

    } catch (error) {
        console.error("Lỗi xảy ra:", error);
        brandListDiv.innerHTML = "<p>Đã xảy ra lỗi khi tải danh sách thương hiệu.</p>";
        categoryListDiv.innerHTML = "<p>Đã xảy ra lỗi khi tải danh sách danh mục.</p>";
    }
}

// Hiển thị danh sách thương hiệu
function displayBrands(brands) {
    brandListDiv.innerHTML = ''; // Xoá nội dung cũ

    if (brands.length === 0) {
        brandListDiv.innerHTML = "<p>Không có thương hiệu nào.</p>";
        return;
    }

    brands.forEach((brand) => {
        const brandItem = document.createElement("div");
        brandItem.classList.add("brand-item");


        brandItem.innerHTML = `
            <img src="${brand.image}" alt="${brand.name}" class="brand-logo">
            <p class="brand-name">${brand.name}</p>
        `;
        brandItem.onclick = function (){
            window.location.href = `CheckedBrand?filterBrand=${brand.name}`;

        }

        brandListDiv.appendChild(brandItem);
    });

    setupBrandSlides();
}

// Xử lý slide thương hiệu
function setupBrandSlides() {
    const brandItems = document.querySelectorAll(".brand-item");


    const itemsPerSlide = 7; // Hiển thị 8 thương hiệu mỗi slide

    brandItems.forEach((item, index) => {
        item.style.display = index < itemsPerSlide ? "block" : "none";

    });

    currentBrandSlideIndex = 0;
}

function showBrandSlide(index) {
    const brandItems = document.querySelectorAll(".brand-item");
    const itemsPerSlide = 7;
    const totalSlides = Math.ceil(brandItems.length / itemsPerSlide);

    if (index < 0) currentBrandSlideIndex = totalSlides - 1;
    else if (index >= totalSlides) currentBrandSlideIndex = 0;
    else currentBrandSlideIndex = index;

    brandItems.forEach((item, i) => {
        item.style.display = (i >= currentBrandSlideIndex * itemsPerSlide && i < (currentBrandSlideIndex + 1) * itemsPerSlide) ? "block" : "none";
    });
}

function prevBrandSlide() {
    showBrandSlide(currentBrandSlideIndex - 1);
}

function nextBrandSlide() {
    showBrandSlide(currentBrandSlideIndex + 1);
}

// Hiển thị danh sách danh mục
function displayCategories(categories) {
    categoryListDiv.innerHTML = ''; // Xóa nội dung cũ

    if (categories.length === 0) {
        categoryListDiv.innerHTML = "<p>Không có Danh mục nào.</p>";
        return;
    }

    categories.forEach((ct) => {
        const categoryContainer = document.createElement("div");
        categoryContainer.classList.add("category");

        categoryContainer.innerHTML = `
            <img src="${ct.image}" alt="${ct.categoryName}">
            <p>${ct.categoryName}</p>
        `;
        categoryContainer.onclick = function (){
            window.location.href = `searchProdcutCategory?name=${ct.categoryID}`;
        }

        categoryListDiv.appendChild(categoryContainer);
    });

    setupCategorySlides();
}

// Xử lý slide danh mục
function setupCategorySlides() {
    const categoryItems = document.querySelectorAll(".category");
    const itemsPerSlide = 8; // Hiển thị 8 danh mục mỗi slide

    categoryItems.forEach((item, index) => {
        item.style.display = index < itemsPerSlide ? "block" : "none";
    });

    currentCategorySlideIndex = 0;
}

function showCategorySlide(index) {
    const categoryItems = document.querySelectorAll(".category");
    const itemsPerSlide = 8;
    const totalSlides = Math.ceil(categoryItems.length / itemsPerSlide);

    if (index < 0) currentCategorySlideIndex = totalSlides - 1;
    else if (index >= totalSlides) currentCategorySlideIndex = 0;
    else currentCategorySlideIndex = index;

    categoryItems.forEach((item, i) => {
        item.style.display = (i >= currentCategorySlideIndex * itemsPerSlide && i < (currentCategorySlideIndex + 1) * itemsPerSlide) ? "block" : "none";
    });
}
function setupHotProductSlides() {
    const hotProductItems = document.querySelectorAll(".product-card"); // Chọn tất cả sản phẩm nổi bật
    const itemsPerSlide = 5; // Số sản phẩm hiển thị mỗi slide

    // Hiển thị sản phẩm thuộc slide đầu tiên
    hotProductItems.forEach((item, index) => {
        item.style.display = index < itemsPerSlide ? "block" : "none";
    });

    currentHotPSlideIndex = 0; // Đặt chỉ số slide hiện tại là 0
}

function prevCategorySlide() {
    showCategorySlide(currentCategorySlideIndex - 1);
}

function nextCategorySlide() {
    showCategorySlide(currentCategorySlideIndex + 1);
}
function displayHotProducts(hotProducts) {
    const productCarouselDiv = document.querySelector(".product-cards");


    productCarouselDiv.innerHTML = '';

    if (hotProducts.length === 0) {
        productCarouselDiv.innerHTML = "<p>Không có sản phẩm nổi bật.</p>";
        return;
    }

    hotProducts.forEach((product) => {
        const productCard = document.createElement("div");
        productCard.classList.add("product-card");

        // Nội dung HTML cho mỗi sản phẩm
        productCard.innerHTML = `
            <img src="${product.image}" alt="${product.name}" >
            <p class="sales-count">${product.quantity} sản phẩm đã bán</p>
            <p class="product-name">${product.name}</p>
        `;
        // Gắn sự kiện click cho từng sản phẩm (chuyển hướng đến trang chi tiết sản phẩm)
        productCard.onclick = function () {
            window.location.href = `danh-muc?name=${product.detail}`;
        };


        productCarouselDiv.appendChild(productCard);
    });
    setupHotProductSlides();
}
// Hiển thị các slide sản phẩm nổi bật
function showHotPSlide(index) {
    const hotProductItems = document.querySelectorAll(".product-card");
    const itemsPerSlide = 5;
    const totalSlides = Math.ceil(hotProductItems.length / itemsPerSlide);

    // Điều chỉnh chỉ số slide
    if (index < 0) currentHotPSlideIndex = totalSlides - 1;
    else if (index >= totalSlides) currentHotPSlideIndex = 0;
    else currentHotPSlideIndex = index;

    // Hiển thị sản phẩm thuộc slide hiện tại, ẩn các sản phẩm còn lại
    hotProductItems.forEach((item, i) => {
        item.style.display = (i >= currentHotPSlideIndex * itemsPerSlide && i < (currentHotPSlideIndex + 1) * itemsPerSlide) ? "block" : "none";
    });
}

// Chuyển đến slide trước
function prevHotPSlide() {

    showHotPSlide(currentHotPSlideIndex - 1);
}

// Chuyển đến slide kế tiếp
function nextHotPSlide() {
    showHotPSlide(currentHotPSlideIndex + 1);
}

// Hiển thị danh sách sản phẩm Flash Sale
function displayFlashSaleProducts(flashSaleProducts) {
    const flashSaleDiv = document.querySelector("#productSlider");

    flashSaleDiv.innerHTML = '';

    if (flashSaleProducts.length === 0) {
        flashSaleDiv.innerHTML = "<p>Không có sản phẩm Flash Sale.</p>";
        return;
    }

    flashSaleProducts.forEach((product) => {
        const discountPercentage = Math.round(product.discount * 100); // Tính phần trăm giảm giá
        const productItem = document.createElement('div');
        productItem.classList.add('product-item');
        productItem.innerHTML = `
            <img src="${product.image}" alt="${product.name}">
            <div class="product-info">
                <span class="discount">${discountPercentage}% OFF</span>
                <span class="price">${product.priceNew}₫</span>
                <span class="original-price"><s>${product.price}₫</s></span>
                <p class="product-name">${product.detail}</p>
            </div>
        `;

        // Gắn sự kiện click cho từng sản phẩm (chuyển hướng đến trang chi tiết sản phẩm)
        productItem.onclick = function () {
            window.location.href = `productDetail?id=${product.id}`;
        };

        flashSaleDiv.appendChild(productItem);
    });

    setupFlashSaleSlides();
}

// Hiển thị các slide sản phẩm Flash Sale
function showFlashSaleSlide(index) {
    const flashSaleItems = document.querySelectorAll(".product-item"); // Sửa lại class cho đúng
    const itemsPerSlide = 6;
    const totalSlides = Math.ceil(flashSaleItems.length / itemsPerSlide);


    if (index < 0) currentFlashSaleSlideIndex = totalSlides - 1;
    else if (index >= totalSlides) currentFlashSaleSlideIndex = 0;
    else currentFlashSaleSlideIndex = index;


    flashSaleItems.forEach((item, i) => {
        item.style.display = (i >= currentFlashSaleSlideIndex * itemsPerSlide && i < (currentFlashSaleSlideIndex + 1) * itemsPerSlide) ? "flex" : "none";
    });
}

// Chuyển đến slide trước
function prevFlashSaleSlide() {

    showFlashSaleSlide(currentFlashSaleSlideIndex - 1);
}

// Chuyển đến slide kế tiếp
function nextFlashSaleSlide() {
    showFlashSaleSlide(currentFlashSaleSlideIndex + 1);
}

// Cài đặt các slide sản phẩm Flash Sale
function setupFlashSaleSlides() {
    const flashSaleItems = document.querySelectorAll("#flashSaleSlider .product-item"); // Sửa lại class cho đúng
    const itemsPerSlide = 6; // Số sản phẩm hiển thị mỗi slide

    // Hiển thị sản phẩm thuộc slide đầu tiên
    flashSaleItems.forEach((item, index) => {
        item.style.display = index < itemsPerSlide ? "flex" : "none";
    });

    currentFlashSaleSlideIndex = 0; // Đặt chỉ số slide hiện tại là 0
}

// Tải danh sách thương hiệu và danh mục khi trang được tải
document.addEventListener("DOMContentLoaded", fetchBrandAndCategoryList);
