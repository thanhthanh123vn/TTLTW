/*
 Navicat Premium Dump SQL

 Source Server         : linux_server
 Source Server Type    : MySQL
 Source Server Version : 90300 (9.3.0)
 Source Host           : 192.168.159.128:3306
 Source Schema         : webmypham

 Target Server Type    : MySQL
 Target Server Version : 90300 (9.3.0)
 File Encoding         : 65001

 Date: 22/04/2025 18:54:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for FavoriteProducts
-- ----------------------------
DROP TABLE IF EXISTS `FavoriteProducts`;
CREATE TABLE `FavoriteProducts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `added_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC, `product_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FavoriteProducts
-- ----------------------------

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Carslan', 'https://media.hcdn.vn/hsk/1731925101carslanpop1811_img_410x410_8c5088_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (2, 'LOreal', 'https://media.hcdn.vn//hsk/brandL-oreal-cover-brand-500x500-190920241726736320_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (3, 'Cocoon', 'https://media.hcdn.vn//hsk/brandcocoon-image-cover-500x5001712401401_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (4, 'Dove', 'https://media.hcdn.vn//hsk/brandDove-cover-image-500-x-5001720598834_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (5, 'Bioderma', 'https://media.hcdn.vn//hsk/brandbioderma-image-cover-500x500-171020241729156097_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (6, 'La Roche-Posay', 'https://media.hcdn.vn//hsk/brandLa-roche-posay-image-cover-500-x-5001718952735_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (7, 'Vaseline', 'https://media.hcdn.vn//hsk/brandvaselineimage-cover500-x-5001715963019_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (8, 'CeraVe', 'https://media.hcdn.vn//hsk/brandCeraveimagecover500x5001712652261_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (9, 'Naris Up', 'https://media.hcdn.vn//hsk/brandNarisCosmeticsimage-cover500x5001715596352_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (10, 'Eucerin', 'https://media.hcdn.vn//hsk/brandeucerinimagecover500x5001712730538_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (11, 'Skin Aqua', 'https://media.hcdn.vn//hsk/brandSunplaycover-brand500x5001716547706_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (12, 'Skin1004', 'https://media.hcdn.vn//hsk/brandSunplaycover-brand500x5001716547706_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (13, 'Cetaphil', 'https://media.hcdn.vn//hsk/brandcetaphil-image-cover500x5001716177431_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (14, 'Klairs', 'https://media.hcdn.vn//hsk/brandKlairsimage-cover500x5001715596332_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (15, 'Garnier', 'https://media.hcdn.vn//hsk/brandGarnierimage-cover500x5001716200491_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (16, 'Hada Labo', 'https://media.hcdn.vn//hsk/brandHada-Labo-image-cover-500x5001718186717_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (17, 'Anessa', 'https://media.hcdn.vn//hsk/brandAnessaimage-cover500x5001715855624_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (18, 'Vichy', 'https://media.hcdn.vn//hsk/brandVichyimagecover500x5001712652245_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (19, 'JuDyDoll', 'https://media.hcdn.vn//hsk/brandjudydoll-image-cover-500x5001721187082_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (20, 'Hada Labo', 'https://media.hcdn.vn//hsk/brandHada-Labo-image-cover-500x5001718186717_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (21, 'Anessa', 'https://media.hcdn.vn//hsk/brandAnessaimage-cover500x5001715855624_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (22, 'Vichy', 'https://media.hcdn.vn//hsk/brandVichyimagecover500x5001712652245_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');
INSERT INTO `brands` VALUES (23, 'JuDyDoll', 'https://media.hcdn.vn//hsk/brandjudydoll-image-cover-500x5001721187082_img_190x190_30c310_fit_center.jpg', '2025-01-07 16:53:16');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ImageUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CategoryID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (2, 'Trang Điểm Môi', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/c24-trang-diem-moi_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (3, 'Mặt Nạ', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/30_1_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (4, 'Trang Điểm Mặt', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/c52-trang-diem-mat_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (5, 'Sữa Rửa Mặt', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/19_3_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (6, 'Trang Điểm Mắt', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/c50-trang-diem-mat_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (7, 'Dầu Gội Và Dầu Xả', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/2144_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (8, 'Chống Nắng Da Mặt', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/11_1_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (9, 'Sữa Tắm', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/26_1_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (10, 'Tẩy Trang Mặt', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/48_1_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (11, 'Dưỡng Thể', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/c1897-duong-the_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (12, 'Nước Hoa', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/nuoc-hoa-c103_2_4_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (13, 'Chăm Sóc Răng Miệng', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/cover-image-cham-soc-rang-mieng-c323_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (14, 'Khử Mùi', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/c1899-khu-mui_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (15, 'Tẩy Da Chết', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/1901_1_img_120x120_17b03c_fit_center.jpg');
INSERT INTO `categories` VALUES (16, 'Serum / Dầu Dưỡng Tóc', NULL, '2024-12-08 15:19:41', 'https://media.hcdn.vn/catalog/category/102_1_img_120x120_17b03c_fit_center.jpg');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 10, 1, 'sản phẩm tốt lắm', '2025-01-17 10:12:47', '2025-01-17 10:19:56', 'LeThai');
INSERT INTO `comment` VALUES (2, 10, 1, '10 điểm', '2025-01-17 10:13:29', '2025-01-17 10:20:01', 'LeThai');
INSERT INTO `comment` VALUES (3, 10, 1, 'sản phẩm oke la', '2025-01-17 10:14:43', '2025-01-17 10:20:02', 'LeThai');
INSERT INTO `comment` VALUES (4, 10, 1, 'sanr phaamr toot', '2025-01-17 10:29:19', '2025-01-17 10:29:19', 'LeThai');

-- ----------------------------
-- Table structure for listimageproductdetail
-- ----------------------------
DROP TABLE IF EXISTS `listimageproductdetail`;
CREATE TABLE `listimageproductdetail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `productID` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_productDT`(`productID` ASC) USING BTREE,
  CONSTRAINT `fk_productDT` FOREIGN KEY (`productID`) REFERENCES `productdetail` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of listimageproductdetail
-- ----------------------------
INSERT INTO `listimageproductdetail` VALUES (1, 1, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-205100137-1695896128.png');
INSERT INTO `listimageproductdetail` VALUES (2, 1, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-nuoc-tay-trang-tuoi-mat-l-oreal-3-in-1-danh-cho-da-dau-da-hon-hop-400ml_VLF3ivLnqLaFKFed.png');
INSERT INTO `listimageproductdetail` VALUES (3, 1, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-nuoc-tay-trang-tuoi-mat-l-oreal-3-in-1-danh-cho-da-dau-da-hon-hop-400ml_VLF3ivLnqLaFKFed.png');
INSERT INTO `listimageproductdetail` VALUES (4, 1, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-tay-trang-tuoi-mat-l-oreal-3-in-1-danh-cho-da-dau-da-hon-hop-400ml-1684996339_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (5, 2, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml_Do3abk26rzqjWLuh.png');
INSERT INTO `listimageproductdetail` VALUES (6, 2, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900012-1730367448_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (7, 2, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml-1-1681723599_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (8, 2, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml-2-1681723600_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (13, 47, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-sua-rua-mat-cerave-sach-sau-cho-da-thuong-den-da-dau-473ml_bzHoDqLu2cS7k4J3_img_385x385_622873_fit_center.png');
INSERT INTO `listimageproductdetail` VALUES (14, 47, 'https://media.hcdn.vn/catalog/product/d/o/doi-mau-sua-rua-mat-cerave-sach-sau-cho-da-thuong-den-da-dau-473ml-1695090630_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (15, 47, 'https://media.hcdn.vn/catalog/product/s/u/sua-rua-mat-cerave-sach-sau-cho-da-thuong-den-da-dau-473ml-1-1717125211_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (16, 47, 'https://media.hcdn.vn/catalog/product/s/u/sua-rua-mat-cerave-sach-sau-cho-da-thuong-den-da-dau-473ml-2-1717125208_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (17, 48, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml_Do3abk26rzqjWLuh.png');
INSERT INTO `listimageproductdetail` VALUES (18, 48, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-tay-trang-tuoi-mat-l-oreal-3-in-1-danh-cho-da-dau-da-hon-hop-400ml-1684996339_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (19, 48, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml-1-1681723599_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (20, 48, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml-2-1681723600_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (27, 49, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml_5Swg6BCQfrcBeGdt.png');
INSERT INTO `listimageproductdetail` VALUES (28, 49, 'https://media.hcdn.vn/catalog/product/k/e/kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-2-1716437771_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (29, 49, 'https://media.hcdn.vn/catalog/product/k/e/kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-1-1716437758_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (30, 49, 'https://media.hcdn.vn/catalog/product/k/e/kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-4-1716437784_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (31, 51, '             https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-chong-nang-anessa-cho-da-nhay-cam-tre-em-60ml-moi-1710558274_img_300x300_b798dd_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (32, 51, 'https://media.hcdn.vn/catalog/product/g/e/gel-chong-nang-anessa-duong-am-bao-ve-hoan-hao-90g-moi-1-1710470132_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (33, 51, 'https://media.hcdn.vn/catalog/product/g/e/gel-chong-nang-anessa-duong-am-bao-ve-hoan-hao-90g-moi-5-1710470086_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (34, 51, 'https://media.hcdn.vn/catalog/product/g/e/gel-chong-nang-anessa-duong-am-bao-ve-hoan-hao-90g-moi-4-1710470100_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (35, 52, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-249500007-1728878978_img_300x300_b798dd_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (37, 52, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-249500007-1728878978_img_300x300_b798dd_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (38, 52, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-sunplay-duong-da-sang-min-spf50-pa-55g-9-1680074639_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (39, 52, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-sunplay-duong-da-sang-min-spf50-pa-55g-7-1680074223_img_385x385_622873_fit_center.png');
INSERT INTO `listimageproductdetail` VALUES (40, 53, 'https://media.hcdn.vn/catalog/product/k/e/kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-1-1716437758_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (41, 53, 'https://media.hcdn.vn/catalog/product/k/e/kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-2-1716437771_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (42, 53, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-1716437865_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (43, 53, 'https://media.hcdn.vn/catalog/product/k/e/kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-4-1716437784_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (44, 54, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-am-lam-diu-da-ban-dem-klairs-60ml-2-1702880129_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (45, 54, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900005-1730429318_img_380x380_64adc6_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (46, 54, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-am-lam-diu-da-ban-dem-klairs-60ml-2-1681726503_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (47, 54, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-am-lam-diu-da-ban-dem-klairs-60ml-1681726502_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (48, 55, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-duong-la-roche-posay-giam-mun-hieu-qua-40ml-1716445434_img_380x380_64adc6_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (49, 55, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-la-roche-posay-giam-mun-hieu-qua-40ml-1-1716445460_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (50, 55, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-la-roche-posay-giam-mun-hieu-qua-40ml-2-1716445456_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (51, 55, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-la-roche-posay-giam-mun-hieu-qua-40ml-3-1716445464_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (53, 57, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-2-sua-chong-nang-anessa-duong-da-kiem-dau-20ml-moi_92dqV6C6PEFRqVip_img_385x385_622873_fit_center.png');
INSERT INTO `listimageproductdetail` VALUES (54, 57, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-1-1710472388_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (55, 57, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-2-1710472390_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (56, 57, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-3-1710472397_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (58, 58, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-2-sua-chong-nang-anessa-duong-da-kiem-dau-20ml-moi_92dqV6C6PEFRqVip_img_385x385_622873_fit_center.png');
INSERT INTO `listimageproductdetail` VALUES (59, 58, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-2-sua-chong-nang-anessa-duong-da-kiem-dau-20ml-moi_92dqV6C6PEFRqVip_img_385x385_622873_fit_center.png');
INSERT INTO `listimageproductdetail` VALUES (60, 58, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-2-1710472390_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (61, 58, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-3-1710472397_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (62, 59, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-duong-la-roche-posay-giup-phuc-hoi-da-da-cong-dung-40ml-1716439945_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (63, 59, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-la-roche-posay-giup-phuc-hoi-da-da-cong-dung-40ml-5-1716439966_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (64, 59, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-la-roche-posay-giup-phuc-hoi-da-da-cong-dung-40ml-2-1716439990_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (65, 59, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-la-roche-posay-giup-phuc-hoi-da-da-cong-dung-40ml-2-1716439990_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (66, 60, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml_1zBSnLihoFPM8Squ_img_385x385_622873_fit_center.png');
INSERT INTO `listimageproductdetail` VALUES (67, 60, 'https://media.hcdn.vn/catalog/product/s/e/serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml-3-1721198666_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (68, 60, 'https://media.hcdn.vn/catalog/product/s/e/serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml-5-1721198672_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (69, 60, 'https://media.hcdn.vn/catalog/product/s/e/serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml-7-1721198690_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (70, 61, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-chong-nang-anessa-cho-da-nhay-cam-tre-em-60ml-moi-1710558274_img_300x300_b798dd_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (71, 61, 'https://media.hcdn.vn/catalog/product/g/e/gel-chong-nang-anessa-duong-am-bao-ve-hoan-hao-90g-moi-1-1710470132_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (72, 61, 'https://media.hcdn.vn/catalog/product/g/e/gel-chong-nang-anessa-duong-am-bao-ve-hoan-hao-90g-moi-5-1710470086_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (73, 61, 'https://media.hcdn.vn/catalog/product/g/e/gel-chong-nang-anessa-duong-am-bao-ve-hoan-hao-90g-moi-4-1710470100_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (77, 62, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi_w28ZkMfWVWg4JPGk.png');
INSERT INTO `listimageproductdetail` VALUES (78, 62, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-1710558154_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (79, 62, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-2-1710472390_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (80, 62, 'https://media.hcdn.vn/catalog/product/s/u/sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-2-1710472390_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (89, 64, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml_T5VnNkpGkNCBjsw9.png');
INSERT INTO `listimageproductdetail` VALUES (90, 64, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900012-1730367448_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (91, 64, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (92, 64, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-hoa-hong-khong-mui-klairs-danh-cho-da-nhay-cam-180ml-2-1681723600_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (93, 65, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-sua-rua-mat-cetaphil-diu-nhe-khong-xa-phong-500ml-moi_cEcniTD8bNnZUKMV.png');
INSERT INTO `listimageproductdetail` VALUES (94, 65, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422209322-1727428997_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (95, 65, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-sua-rua-mat-cetaphil-diu-nhe-khong-xa-phong-500ml-moi-1718607468_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (96, 65, 'https://media.hcdn.vn/catalog/product/certificate/cetaphil_img_385x385_622873_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (97, 66, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900005-1730429318_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (98, 66, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-318900005-1681726478_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (99, 66, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-am-lam-diu-da-ban-dem-klairs-60ml-1-1702880129_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (100, 66, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (101, 67, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900002-1730426908_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (102, 67, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-318900002-1652093183_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (103, 67, 'https://media.hcdn.vn/catalog/product/t/i/tinh-chat-lam-sang-da-klairs-vitamin-c-35ml-1-1681961969_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (104, 67, 'https://media.hcdn.vn/catalog/product/t/i/tinh-chat-lam-sang-da-klairs-vitamin-c-35ml-2-1681961970_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (105, 68, 'https://media.hcdn.vn/catalog/product/g/o/google-shopping-mini-sua-rua-mat-klairs-duong-am-diu-nhe-sach-sau-20ml-1695884494_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (106, 68, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (107, 68, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-rua-mat-klairs-duong-am-diu-nhe-sach-sau-140ml-1735636193_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (108, 69, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-mini-kem-duong-am-klairs-cho-da-kho-nhay-cam-20ml-1726541871_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (109, 69, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (110, 69, 'https://media.hcdn.vn/catalog/product/g/o/google-shopping-mini-kem-duong-am-klairs-cho-da-kho-nhay-cam-20ml-1695883683_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (111, 70, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-tinh-chat-l-oreal-hyaluronic-acid-cap-am-sang-da-30ml_gM6NVBDz5KXmn27P.png');
INSERT INTO `listimageproductdetail` VALUES (112, 70, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422200152-1695796939.png');
INSERT INTO `listimageproductdetail` VALUES (113, 70, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu_422200152-1655371404_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (114, 70, 'https://media.hcdn.vn/catalog/product/t/i/tinh-chat-l-oreal-hyaluronic-acid-cap-am-sang-da-30ml-10_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (115, 71, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-kem-chong-nang-l-oreal-paris-x20-thoang-da-mong-nhe-50ml_qb8CTPUNkcRBFKjv.png');
INSERT INTO `listimageproductdetail` VALUES (116, 71, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-chong-nang-l-oreal-paris-x20-thoang-da-mong-nhe-50ml-1726649762_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (117, 71, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu_422210400-1670225294_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (118, 71, 'https://media.hcdn.vn/catalog/product/k/e/kem-chong-nang-l-oreal-paris-x20-thoang-da-mong-nhe-50ml-phien-ban-cu-va-moi-1726718775_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (119, 72, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-l-oreal-sang-da-mo-tham-mun-nam-30ml_sepj1ZNC6RgyjKm9.png');
INSERT INTO `listimageproductdetail` VALUES (120, 72, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422226334-1726196084.png');
INSERT INTO `listimageproductdetail` VALUES (121, 72, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-serum-l-oreal-sang-da-mo-tham-mun-nam-30ml-1727771838_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (122, 72, 'https://media.hcdn.vn/catalog/product/certificate/giaychungnhan-loreal1684988179_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (123, 73, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-bo-goi-xa-l-oreal-duong-toc-suon-muot-toc-cao-cap-440mlx2_ogta9qoei6ddqQRu.png');
INSERT INTO `listimageproductdetail` VALUES (124, 73, 'https://media.hcdn.vn/catalog/product/certificate/giaychungnhan-loreal1684988179_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (125, 73, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422208871-1702875545_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (126, 73, 'https://media.hcdn.vn/catalog/product/b/o/bo-goi-xa-l-oreal-duong-toc-suon-muot-toc-cao-cap-440mlx2-1-1702875416.png');
INSERT INTO `listimageproductdetail` VALUES (127, 74, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-cocoon-tay-te-bao-chet-cho-mat-va-toan-than-tu-ca-phe_uF5uZzh17GPomzMv.png');
INSERT INTO `listimageproductdetail` VALUES (128, 74, 'https://media.hcdn.vn/catalog/product/certificate/Cocoon-Image-Certificate1722487309_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (129, 74, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422209262-1689848055_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (130, 74, 'https://media.hcdn.vn/catalog/product/m/a/mat-sau-combo-cocoon-tay-te-bao-chet-cho-mat-va-toan-than-tu-ca-phe-1662610049_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (131, 75, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml_1zBSnLihoFPM8Squ.png');
INSERT INTO `listimageproductdetail` VALUES (132, 75, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml-1721198657_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (133, 75, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml-1716971504_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (134, 75, 'https://media.hcdn.vn/catalog/product/certificate/la-roche-posay_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (135, 76, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-3-xit-khoang-la-roche-posay-lam-diu-va-bao-ve-da-50g_zfxJe9YQJjY4SHf4.png');
INSERT INTO `listimageproductdetail` VALUES (136, 76, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-combo-3-xit-khoang-la-roche-posay-lam-diu-va-bao-ve-da-50g-1729240379_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (137, 76, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-combo-3-xit-khoang-la-roche-posay-lam-diu-va-bao-ve-da-50g-1709692629_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (138, 76, 'https://media.hcdn.vn/catalog/product/certificate/la-roche-posay_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (139, 77, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-gel-rua-mat-tao-bot-la-roche-posay-danh-cho-da-dau-nhay-cam-200ml_kr4NNEAyy5qGERJG.png');
INSERT INTO `listimageproductdetail` VALUES (140, 77, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-gel-rua-mat-tao-bot-la-roche-posay-danh-cho-da-dau-nhay-cam-200ml-1716603223_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (141, 77, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-gel-rua-mat-tao-bot-la-roche-posay-danh-cho-da-dau-nhay-cam-200ml-1718599371_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (142, 77, 'https://media.hcdn.vn/catalog/product/certificate/la-roche-posay_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (143, 78, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-gel-rua-mat-la-roche-posay-ho-tro-giam-mun-cho-mat-toan-than-400ml_F66KTupaNNCns7N4.png');
INSERT INTO `listimageproductdetail` VALUES (144, 78, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-204900145-1700109855_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (145, 78, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-gel-rua-mat-tam-la-roche-posay-lam-sach-giam-mun-400ml_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (146, 78, 'https://media.hcdn.vn/catalog/product/g/e/gel-rua-mat-tam-la-roche-posay-lam-sach-giam-mun-400ml-1663929609_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (147, 79, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-la-roche-posay-giup-phuc-hoi-bao-ve-cap-am-da-30ml_WyNkNigswrDofjyy.png');
INSERT INTO `listimageproductdetail` VALUES (148, 79, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-serum-la-roche-posay-giup-phuc-hoi-bao-ve-cap-am-da-30ml-1724748596_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (149, 79, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-serum-la-roche-posay-giup-phuc-hoi-bao-ve-cap-am-da-30ml-1727769781_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (150, 79, 'https://media.hcdn.vn/catalog/product/certificate/la-roche-posay_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (151, 80, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-sua-rua-mat-va-tam-la-roche-posay-danh-cho-da-kho-nhay-cam-da-bi-kich-ung-man-do-ngua-200ml_TnuEEvQvZ35574P6.png');
INSERT INTO `listimageproductdetail` VALUES (152, 80, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-100190072-1700194273_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (153, 80, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-sua-rua-mat-va-tam-la-roche-posay-danh-cho-da-kho-nhay-cam-da-bi-kich-ung-man-do-ngua-200ml-1718599301_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (154, 80, 'https://media.hcdn.vn/catalog/product/certificate/la-roche-posay_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (155, 81, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422205551-1700103499.png');
INSERT INTO `listimageproductdetail` VALUES (156, 81, 'https://media.hcdn.vn/catalog/product/certificate/la-roche-posay_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (157, 81, 'https://media.hcdn.vn/catalog/product/b/o/bo-doi-la-roche-posay-nuoc-tay-trang-lam-sach-cho-da-thuong-2_1_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (158, 81, 'https://media.hcdn.vn/catalog/product/b/o/bo-doi-la-roche-posay-nuoc-tay-trang-lam-sach-cho-da-thuong-6_1_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (159, 82, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422216355-1699585860_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (160, 82, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-tui-refill-gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-1718607836_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (161, 82, 'https://media.hcdn.vn/catalog/product/certificate/la-roche-posay_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (162, 82, 'https://media.hcdn.vn/catalog/product/g/o/google-shopping-tui-refill-gel-rua-mat-la-roche-posay-cho-da-dau-nhay-cam-400ml-1699585700_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (163, 83, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900005-1730429318_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (164, 83, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-318900005-1681726478_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (165, 83, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (166, 83, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-am-lam-diu-da-ban-dem-klairs-60ml-1681726502_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (167, 84, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900011-1730426434_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (168, 84, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-318900011_1-1652093344_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (169, 84, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (170, 84, 'https://media.hcdn.vn/catalog/product/n/u/nuoc-hoa-hong-klairs-danh-cho-da-nhay-cam-180ml-1681724593_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (171, 85, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900019-1730429206_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (172, 85, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-318900019-1652093019_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (173, 85, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (174, 85, 'https://media.hcdn.vn/catalog/product/k/e/kem-duong-am-lam-diu-da-ban-dem-klairs-30ml-1-1681726690_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (175, 86, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900006-1730429144_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (176, 86, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-318900006-1652093236_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (177, 86, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (178, 86, 'https://media.hcdn.vn/catalog/product/t/i/tinh-chat-duong-am-ho-tro-tai-tao-da-klairs-20ml-1-1681962159_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (179, 87, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900017-1730366899_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (180, 87, 'https://media.hcdn.vn/catalog/product/t/e/tem-phu-318900017-1652093077_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (181, 87, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (182, 87, 'https://media.hcdn.vn/catalog/product/m/a/mat-na-klairs-lam-diu-da-giam-kich-ung-1-1681982162_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (183, 88, 'https://media.hcdn.vn/catalog/product/t/i/tinh-chat-duong-am-sau-klairs-sample-3ml_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (184, 88, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (185, 89, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-rua-mat-klairs-duong-am-diu-nhe-sach-sau-140ml-1735636193_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (186, 89, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (187, 89, 'https://media.hcdn.vn/catalog/product/g/o/google-shopping-mini-sua-rua-mat-klairs-duong-am-diu-nhe-sach-sau-20ml-1695884494_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (188, 90, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-mini-kem-duong-am-klairs-cho-da-kho-nhay-cam-20ml-1726541871_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (189, 90, 'https://media.hcdn.vn/catalog/product/certificate/TDIC-giay-chung-nhan-dai-ly-chinh-hang-20251736844951_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (190, 90, 'https://media.hcdn.vn/catalog/product/g/o/google-shopping-mini-kem-duong-am-klairs-cho-da-kho-nhay-cam-20ml-1695883683_img_80x80_d200c5_fit_center.jpg');
INSERT INTO `listimageproductdetail` VALUES (191, NULL, '');
INSERT INTO `listimageproductdetail` VALUES (192, NULL, '');
INSERT INTO `listimageproductdetail` VALUES (193, NULL, '');
INSERT INTO `listimageproductdetail` VALUES (194, NULL, '');
INSERT INTO `listimageproductdetail` VALUES (195, NULL, '');
INSERT INTO `listimageproductdetail` VALUES (196, NULL, '');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `before_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `after_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (1, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@437cc56e', '2025-03-26 22:19:32');
INSERT INTO `logs` VALUES (2, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@47382f6f', '2025-03-28 23:33:10');
INSERT INTO `logs` VALUES (3, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@77d42e74', '2025-03-28 23:46:06');
INSERT INTO `logs` VALUES (4, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@55d5c96b', '2025-03-29 21:34:14');
INSERT INTO `logs` VALUES (5, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@b760fbe', '2025-03-29 21:35:16');
INSERT INTO `logs` VALUES (6, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@72593613', '2025-03-30 15:36:42');
INSERT INTO `logs` VALUES (7, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@21074b6a', '2025-03-30 15:41:39');
INSERT INTO `logs` VALUES (8, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@44725a32', '2025-03-30 15:45:20');
INSERT INTO `logs` VALUES (9, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@6954a199', '2025-03-30 15:45:25');
INSERT INTO `logs` VALUES (10, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@190fb4da', '2025-03-30 15:45:53');
INSERT INTO `logs` VALUES (11, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@42344838', '2025-03-30 15:47:14');
INSERT INTO `logs` VALUES (12, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@713be901', '2025-03-30 15:56:14');
INSERT INTO `logs` VALUES (13, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2aa76154', '2025-03-30 21:44:06');
INSERT INTO `logs` VALUES (14, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@b7b6194', '2025-03-30 21:44:41');
INSERT INTO `logs` VALUES (15, 'INFO', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@77d42e74', '2025-03-30 21:52:04');
INSERT INTO `logs` VALUES (16, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1673e140', '2025-03-30 23:17:36');
INSERT INTO `logs` VALUES (17, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@437cc56e', '2025-03-30 23:17:38');
INSERT INTO `logs` VALUES (18, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@230cade6', '2025-03-30 23:17:39');
INSERT INTO `logs` VALUES (19, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1a7a7893', '2025-03-30 23:17:40');
INSERT INTO `logs` VALUES (20, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@157b1508', '2025-03-30 23:17:41');
INSERT INTO `logs` VALUES (21, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@363adcfb', '2025-03-30 23:17:42');
INSERT INTO `logs` VALUES (22, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@367e5018', '2025-03-30 23:17:43');
INSERT INTO `logs` VALUES (23, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@61fcada4', '2025-03-30 23:17:44');
INSERT INTO `logs` VALUES (24, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@44b6a25b', '2025-03-30 23:17:45');
INSERT INTO `logs` VALUES (25, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@38f77d20', '2025-03-30 23:18:54');
INSERT INTO `logs` VALUES (26, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@437cc56e', '2025-03-30 23:18:56');
INSERT INTO `logs` VALUES (27, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@56614a54', '2025-03-30 23:18:57');
INSERT INTO `logs` VALUES (28, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1ebc837b', '2025-03-30 23:21:07');
INSERT INTO `logs` VALUES (29, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@273dd4a9', '2025-03-30 23:21:07');
INSERT INTO `logs` VALUES (30, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1178e2a5', '2025-03-30 23:21:07');
INSERT INTO `logs` VALUES (31, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@57028e50', '2025-03-30 23:21:07');
INSERT INTO `logs` VALUES (32, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2f6ba6e8', '2025-03-30 23:21:08');
INSERT INTO `logs` VALUES (33, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@4506e3d4', '2025-03-30 23:21:08');
INSERT INTO `logs` VALUES (34, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1fc99dc4', '2025-03-30 23:21:08');
INSERT INTO `logs` VALUES (35, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@7bd7e227', '2025-03-30 23:21:08');
INSERT INTO `logs` VALUES (36, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@46609dab', '2025-03-30 23:21:08');
INSERT INTO `logs` VALUES (37, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@385ea06', '2025-03-30 23:21:11');
INSERT INTO `logs` VALUES (38, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@14c92634', '2025-03-30 23:23:05');
INSERT INTO `logs` VALUES (39, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@eeefe5b', '2025-03-30 23:23:13');
INSERT INTO `logs` VALUES (40, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@3e920325', '2025-03-30 23:24:45');
INSERT INTO `logs` VALUES (41, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@7d8bc1ce', '2025-03-30 23:24:46');
INSERT INTO `logs` VALUES (42, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@7c8ef92f', '2025-03-30 23:24:46');
INSERT INTO `logs` VALUES (43, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@b6de0e7', '2025-03-30 23:24:46');
INSERT INTO `logs` VALUES (44, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2461b927', '2025-03-30 23:24:47');
INSERT INTO `logs` VALUES (45, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@437cc56e', '2025-03-30 23:24:49');
INSERT INTO `logs` VALUES (46, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@385ea06', '2025-03-30 23:24:57');
INSERT INTO `logs` VALUES (47, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@50ed433d', '2025-03-30 23:24:59');
INSERT INTO `logs` VALUES (48, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@768386da', '2025-03-30 23:25:13');
INSERT INTO `logs` VALUES (49, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@5ee84b4d', '2025-03-30 23:26:14');
INSERT INTO `logs` VALUES (50, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2dfbddd1', '2025-03-30 23:26:15');
INSERT INTO `logs` VALUES (51, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@797de00b', '2025-03-30 23:26:15');
INSERT INTO `logs` VALUES (52, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@55690a1', '2025-03-30 23:26:15');
INSERT INTO `logs` VALUES (53, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@3ba43895', '2025-03-30 23:26:15');
INSERT INTO `logs` VALUES (54, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@69bfb265', '2025-03-30 23:26:16');
INSERT INTO `logs` VALUES (55, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@78605b04', '2025-03-30 23:26:16');
INSERT INTO `logs` VALUES (56, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1a7a7893', '2025-03-30 23:26:22');
INSERT INTO `logs` VALUES (57, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@202f7bc0', '2025-03-30 23:26:29');
INSERT INTO `logs` VALUES (58, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@a989b2e', '2025-03-30 23:31:27');
INSERT INTO `logs` VALUES (59, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@14e36b14', '2025-03-30 23:32:44');
INSERT INTO `logs` VALUES (60, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@14e36b14', '2025-03-30 23:33:25');
INSERT INTO `logs` VALUES (61, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@6f6ade8e', '2025-03-30 23:33:28');
INSERT INTO `logs` VALUES (62, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@29138bb4', '2025-03-30 23:34:39');
INSERT INTO `logs` VALUES (63, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@669722aa', '2025-03-30 23:34:40');
INSERT INTO `logs` VALUES (64, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1cbc9747', '2025-03-30 23:34:43');
INSERT INTO `logs` VALUES (65, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1b7c0c68', '2025-03-30 23:34:44');
INSERT INTO `logs` VALUES (66, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@79648464', '2025-03-30 23:34:46');
INSERT INTO `logs` VALUES (67, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@56e2b1d2', '2025-03-30 23:34:48');
INSERT INTO `logs` VALUES (68, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1a3f3bcc', '2025-03-30 23:34:56');
INSERT INTO `logs` VALUES (69, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@293692a7', '2025-03-30 23:34:59');
INSERT INTO `logs` VALUES (70, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@45d324b3', '2025-03-30 23:36:34');
INSERT INTO `logs` VALUES (71, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@7dec2ea9', '2025-03-30 23:36:36');
INSERT INTO `logs` VALUES (72, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@4263f13f', '2025-03-30 23:36:37');
INSERT INTO `logs` VALUES (73, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@4714a329', '2025-03-30 23:36:39');
INSERT INTO `logs` VALUES (74, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@c21c73b', '2025-03-30 23:37:08');
INSERT INTO `logs` VALUES (75, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@752e043', '2025-03-30 23:37:08');
INSERT INTO `logs` VALUES (76, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@25faf83', '2025-03-30 23:37:09');
INSERT INTO `logs` VALUES (77, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@7f69f9fd', '2025-03-30 23:37:09');
INSERT INTO `logs` VALUES (78, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@199df12a', '2025-03-30 23:37:10');
INSERT INTO `logs` VALUES (79, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@5742a338', '2025-03-30 23:37:11');
INSERT INTO `logs` VALUES (80, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@3c4d6a33', '2025-03-30 23:37:11');
INSERT INTO `logs` VALUES (81, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@3a6616b3', '2025-03-30 23:37:13');
INSERT INTO `logs` VALUES (82, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2b4a1161', '2025-03-30 23:41:54');
INSERT INTO `logs` VALUES (83, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1dfa58e1', '2025-03-30 23:41:54');
INSERT INTO `logs` VALUES (84, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2d307786', '2025-03-30 23:41:54');
INSERT INTO `logs` VALUES (85, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1fc99dc4', '2025-03-30 23:41:54');
INSERT INTO `logs` VALUES (86, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@3d24b988', '2025-03-30 23:41:55');
INSERT INTO `logs` VALUES (87, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@45762e5b', '2025-03-30 23:42:02');
INSERT INTO `logs` VALUES (88, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@66bfbf1c', '2025-03-30 23:42:21');
INSERT INTO `logs` VALUES (89, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@46609dab', '2025-03-30 23:42:24');
INSERT INTO `logs` VALUES (90, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@5e206b44', '2025-03-30 23:42:31');
INSERT INTO `logs` VALUES (91, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@55690a1', '2025-03-30 23:42:31');
INSERT INTO `logs` VALUES (92, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@6884e84', '2025-03-30 23:42:31');
INSERT INTO `logs` VALUES (93, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@6741ecdd', '2025-03-30 23:42:31');
INSERT INTO `logs` VALUES (94, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@6d736ee1', '2025-03-30 23:42:32');
INSERT INTO `logs` VALUES (95, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@524e6117', '2025-03-30 23:42:32');
INSERT INTO `logs` VALUES (96, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@54c3ccb1', '2025-03-30 23:42:32');
INSERT INTO `logs` VALUES (97, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@4cba82b2', '2025-03-30 23:42:32');
INSERT INTO `logs` VALUES (98, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@150d8d9b', '2025-03-30 23:42:32');
INSERT INTO `logs` VALUES (99, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@44f0ccf6', '2025-03-30 23:42:33');
INSERT INTO `logs` VALUES (100, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2a51d6fa', '2025-03-30 23:42:33');
INSERT INTO `logs` VALUES (101, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@62346f14', '2025-03-30 23:42:33');
INSERT INTO `logs` VALUES (102, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@34e14d87', '2025-03-30 23:42:33');
INSERT INTO `logs` VALUES (103, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@2406e444', '2025-03-30 23:45:19');
INSERT INTO `logs` VALUES (104, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@6567392f', '2025-03-30 23:45:21');
INSERT INTO `logs` VALUES (105, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@45762e5b', '2025-03-30 23:45:23');
INSERT INTO `logs` VALUES (106, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@7567f712', '2025-03-30 23:45:23');
INSERT INTO `logs` VALUES (107, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@3be0e334', '2025-03-30 23:45:24');
INSERT INTO `logs` VALUES (108, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1cad8052', '2025-03-30 23:45:25');
INSERT INTO `logs` VALUES (109, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@1ef145a3', '2025-03-30 23:45:27');
INSERT INTO `logs` VALUES (110, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@4084eb06', '2025-03-30 23:45:33');
INSERT INTO `logs` VALUES (111, 'WARNING', 'user', '0:0:0:0:0:0:0:1', 'EMPTY', 'services.InforUser@7d2a1dff', '2025-03-30 23:45:44');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NULL DEFAULT NULL,
  `ProductID` int NULL DEFAULT NULL,
  `UserId` int NULL DEFAULT NULL,
  `Quantity` int NOT NULL,
  `Price` double(10, 2) NOT NULL,
  PRIMARY KEY (`OrderDetailID`) USING BTREE,
  INDEX `orderdetails_ibfk_1`(`OrderID` ASC) USING BTREE,
  INDEX `orderdetails_ibfk_2`(`ProductID` ASC) USING BTREE,
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (1, 132, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (2, 133, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (3, 134, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (4, 135, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (5, 136, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (6, 137, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (7, 138, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (8, 139, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (9, 140, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (10, 141, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (11, 142, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (12, 143, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (13, 144, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (14, 145, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (15, 146, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (16, 147, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (17, 148, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (18, 149, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (19, 150, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (20, 151, 1, 51, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (21, 152, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (22, 153, 1, 51, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (23, 154, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (24, 155, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (25, 156, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (26, 157, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (27, 158, 1, 51, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (28, 159, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (29, 160, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (30, 161, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (31, 162, 1, 55, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (32, 163, 1, 51, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (33, 164, 1, 51, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (34, 165, 1, 51, 1, 500000.00);
INSERT INTO `orderdetails` VALUES (35, 166, 1, 51, 1, 500000.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Processing','Shipped','Completed','Cancelled','Failed','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Processing',
  PRIMARY KEY (`OrderID`) USING BTREE,
  INDEX `fk_order`(`UserID` ASC) USING BTREE,
  CONSTRAINT `fk_order` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (132, 55, '2025-04-14 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (133, 55, '2025-04-14 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (134, 55, '2025-04-14 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (135, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (136, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (137, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (138, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (139, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (140, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (141, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (142, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (143, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (144, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (145, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (146, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (147, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (148, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (149, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (150, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (151, 51, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (152, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (153, 51, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (154, 55, '2025-04-16 00:00:00', 'Failed');
INSERT INTO `orders` VALUES (155, 55, '2025-04-16 00:00:00', 'Failed');
INSERT INTO `orders` VALUES (156, 55, '2025-04-16 00:00:00', 'Failed');
INSERT INTO `orders` VALUES (157, 55, '2025-04-16 00:00:00', 'Failed');
INSERT INTO `orders` VALUES (158, 51, '2025-04-16 00:00:00', 'Failed');
INSERT INTO `orders` VALUES (159, 55, '2025-04-16 00:00:00', 'Failed');
INSERT INTO `orders` VALUES (160, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (161, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (162, 55, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (163, 51, '2025-04-16 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (164, 51, '2025-04-17 00:00:00', 'Pending');
INSERT INTO `orders` VALUES (165, 51, '2025-04-17 00:00:00', 'Failed');
INSERT INTO `orders` VALUES (166, 51, '2025-04-17 00:00:00', 'Failed');

-- ----------------------------
-- Table structure for productdetail
-- ----------------------------
DROP TABLE IF EXISTS `productdetail`;
CREATE TABLE `productdetail`  (
  `ID` int NOT NULL,
  `ProductName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `SuitableSkin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `SkinSolution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Highlight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Ingredients` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `FullIngredients` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `HowToUse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `BrandOrigin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ManufactureLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Volume` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `IsSensitiveSkinSafe` bit(1) NULL DEFAULT b'1',
  `CreatedAt` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  CONSTRAINT `productdetail_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productdetail
-- ----------------------------
INSERT INTO `productdetail` VALUES (1, 'Nước Tẩy Trang L\'Oréal Micellar Water 3-In-1 Refreshing', 'Nước tẩy trang', 'Giúp làm sạch lớp trang điểm và làm tươi mát da. Phù hợp với cả da nhạy cảm.', 'Da dầu/da hỗn hợp, kể cả da nhạy cảm', 'Da dầu nhờn muốn tìm một sản phẩm tẩy trang thoáng nhẹ, không để lại cảm giác nhờn dính sau khi làm sạch.', 'Không chứa cồn, hương liệu và paraben, an toàn cho làn da nhạy cảm.', 'Nước khoáng lấy từ những ngọn núi ở Pháp', 'Aqua / Water, Hexylene Glycol, Glycerin, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, BHT , Polyaminopropyl Biguanide', '1. Lắc đều sản phẩm Nước Tẩy Trang trước khi sử dụng. 2. Đổ nước tẩy trang thấm ướt vừa đủ lên miếng bông tẩy trang...', 'Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt.', 'L\'Oréal Paris', 'Pháp', 'Trung Quốc', '6928820030226', '400ml 600ml 900ml', b'1', '2024-11-28 00:00:00');
INSERT INTO `productdetail` VALUES (2, 'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml.', 'Nước Hoa', 'Giúp da được cấp ẩm tức thì và giữ ẩm cho da.', NULL, 'Toàn thân giúp lưu giữ hương thơm', NULL, NULL, NULL, NULL, NULL, NULL, 'Hàn Quốc', 'Korea', '318900012', '180ml 360ml 480ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (46, 'Sữa Rửa Mặt CeraVe Sạch Sâu Cho Da Thường Đến Da Dầu 236ml', 'Sữa Rửa Mặt CeraVe Sạch Sâu Cho Da Thường Đến Da Dầu 236ml', 'Sữa Rửa Mặt Cerave Sạch Sâu Cho Da Thường Đến Da Dầu ', NULL, 'Da dầu/Hỗn hợp dầu', NULL, NULL, NULL, NULL, NULL, NULL, 'Mỹ', 'America', '3337875597197', '88ml 236ml 473ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (47, 'Sữa Rửa Mặt CeraVe Sạch Sâu Cho Da Thường Đến Da Dầu 236ml', 'Sữa Rửa Mặt CeraVe Sạch Sâu Cho Da Thường Đến Da Dầu 236ml', 'Sữa Rửa Mặt Cerave Sạch Sâu Cho Da Thường Đến Da Dầu ', NULL, 'Da dầu/Hỗn hợp dầu', NULL, NULL, NULL, NULL, NULL, NULL, 'Mỹ', 'America', '3337875597197', '88ml 236ml 473ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (48, 'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml.', 'Nước Hoa', 'Giúp da được cấp ẩm tức thì và giữ ẩm cho da.', NULL, 'Toàn thân giúp lưu giữ hương thơm', NULL, NULL, NULL, NULL, NULL, NULL, 'Hàn Quốc', 'Korea', '318900012', '100ml 150ml 200ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (49, 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu SPF50+ 50ml', 'Chống Nắng Da Mặt', 'XL-PROTECT: màng lọc đã được cấp bằng sáng chế, cung cấp khả năng bảo vệ vượt trội khỏi tia UVA/UVB với quang phổ rộng và giúp ngăn ngừa các tác hại do ô nhiễm và tia hồng ngoại gây ra.', NULL, 'Da dầu/Hỗn hợp dầu', NULL, NULL, NULL, NULL, NULL, NULL, 'Pháp', 'France', '3337875546430', '20ml 50ml 100ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (51, 'Sữa Chống Nắng Anessa Cho Da Nhạy Cảm & Trẻ Em 60ml (Mới)', 'Sữa Chống Nắng', 'Perfect UV Sunscreen Mild Milk (For Sensitive Skin) SPF50+/PA++++', '', 'Da nhạy cảm', '', '', '', '', '', '', 'Nhật Bản', 'Japan', '4909978131586', '60ml 120ml 180ml', b'1', '2025-01-08 16:58:46');
INSERT INTO `productdetail` VALUES (52, 'Kem Chống Nắng Vichy Thoáng Nhẹ Không Bóng Dầu SPF 50 50ml', 'Sữa Chống Nắng', 'Capital Soleil Dry Touch Protective Face Fluid SPF50 UVB+UVA', NULL, 'Da dầu/Hỗn hợp dầu', NULL, NULL, NULL, NULL, NULL, NULL, 'Pháp', 'France', '3337871323622', '100ml 150ml 200ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (53, 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu SPF50+ 50ml', 'Sữa Chống Nắng', 'Anthelios UV Mune 400 Oil Control Gel-Cream', NULL, 'Da dầu/Hỗn hợp dầu', NULL, NULL, NULL, NULL, NULL, NULL, '	Pháp', 'France', '3337875546430', '50ml 100ml 150ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (54, 'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 60g\r\nMidnight Blue Calming Cream', 'Serum / Dầu Dưỡng Tóc', NULL, '', 'Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, NULL, 'Hàn Quốc', 'Korea', '8809572890291', '60g 100g 150g', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (55, 'Kem Dưỡng La Roche-Posay Giúp Phục Hồi Da Đa Công Dụng 40ml', 'Serum / Dầu Dưỡng Tóc', 'Cicaplast Baume B5+ Ultra-Repairing Soothing Balm', NULL, 'Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, NULL, 'Pháp', 'France', '3337875816809', '40ml 60ml 80ml', b'1', '2025-01-07 00:00:00');
INSERT INTO `productdetail` VALUES (57, 'Combo 2 Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 20ml (Mới)\r\nPerfect UV Sunscreen Skincare Milk N SPF50+ PA++++', 'Chống Nắng Da Mặt', 'Sữa Chống Nắng Anessa Perfect UV Sunscreen Skincare Milk N SPF50+ PA++++ Dưỡng Da Kiềm Dầu (Mới) là dòng sản phẩm chống nắng da mặt đến từ thương hiệu Anessa - Nhật Bản. Sản phẩm với công nghệ Auto Veil mới giúp cho lớp màng chống UV trở nên bền vững hơn ', '', 'Toàn thân ', '', '', '', '', '', '', 'Pháp', 'France', '3337875816809', '60g 100g 150g', b'1', '2025-01-07 17:15:46');
INSERT INTO `productdetail` VALUES (58, 'Combo 2 Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 20ml (Mới)\r\nPerfect UV Sunscreen Skincare Milk N SPF50+ PA++++', 'Chống Nắng Da Mặt', 'Sữa Chống Nắng Anessa Perfect UV Sunscreen Skincare Milk N SPF50+ PA++++ Dưỡng Da Kiềm Dầu (Mới) là dòng sản phẩm chống nắng da mặt đến từ thương hiệu Anessa - Nhật Bản. Sản phẩm với công nghệ Auto Veil mới giúp cho lớp màng chống UV trở nên bền vững hơn ', '', 'Toàn thân ', '', '', '', '', '', '', 'Pháp', '', '', '60g 100g 150g', b'1', '2025-01-07 17:15:52');
INSERT INTO `productdetail` VALUES (59, 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu SPF50+ 50ml\r\nAnthelios UV Mune 400 Oil Control Gel-Cream', 'Chống Nắng Da Mặt', 'XL-PROTECT: màng lọc đã được cấp bằng sáng chế, cung cấp khả năng bảo vệ vượt trội khỏi tia UVA/UVB với quang phổ rộng và giúp ngăn ngừa các tác hại do ô nhiễm và tia hồng ngoại gây ra.', NULL, 'Toàn thân ', NULL, NULL, NULL, NULL, NULL, NULL, 'Pháp', 'France', '3337875546430', '60g 100g 150g', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (60, 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu SPF50+ 50ml\r\nAnthelios UV Mune 400 Oil Control Gel-Cream', 'Chống Nắng Da Mặt', 'XL-PROTECT: màng lọc đã được cấp bằng sáng chế, cung cấp khả năng bảo vệ vượt trội khỏi tia UVA/UVB với quang phổ rộng và giúp ngăn ngừa các tác hại do ô nhiễm và tia hồng ngoại gây ra.', NULL, 'Toàn thân ', NULL, NULL, NULL, NULL, NULL, NULL, 'Pháp', 'France', '3337875546430', '60g 100g 150g', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (61, 'Sữa Chống Nắng Anessa Cho Da Nhạy Cảm & Trẻ Em 60ml (Mới)', 'Chống Nắng Da Mặt', 'Sữa Chống Nắng Cho Da Nhạy Cảm & Trẻ Em Anessa Perfect UV Sunscreen Mild Milk (For Sensitive Skin) SPF50+/PA++++ (Phiên bản mới) hiện đã có mặt tại Hasaki với 2 phân loại: 60ml, 60mlx2', NULL, 'Toàn thân ', NULL, NULL, NULL, NULL, NULL, 'Anessa', 'Nhật Bản', 'Japan', '4909978131586', '60g 100g 150g', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (62, 'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 20ml (Mới)\r\nPerfect UV Sunscreen Skincare Milk N SPF50+ PA++++', 'Chống Nắng Da Mặt', 'Sữa Chống Nắng Anessa Perfect UV Sunscreen Skincare Milk N SPF50+ PA++++ Dưỡng Da Kiềm Dầu (Mới) là dòng sản phẩm chống nắng da mặt đến từ thương hiệu Anessa - Nhật Bản. Sản phẩm với công nghệ Auto Veil mới giúp cho lớp màng chống UV trở nên bền vững hơn ', NULL, 'Toàn thân ', NULL, NULL, NULL, NULL, NULL, 'Anessa', 'Nhật Bản', 'Japan', '4909978148300', '60g 100g 150g', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (64, 'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml.', 'Nước Hoa', 'Nước Hoa Hồng Klairs Supple Preparation là dòng sản phẩm toner được thương hiệu Dear, Klairs thiết kế chuyên biệt dành cho làn da nhạy cảm. Với bảng thành phần chiết xuất từ thực vật và kết cấu lỏng nhẹ, thấm nhanh trên da, nước hoa hồng Klairs sẽ giúp câ', NULL, 'Body', NULL, NULL, NULL, NULL, NULL, NULL, 'Hàn Quốc', 'Korea', '8809115029119', '50ml 100ml 150ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (65, 'Sữa Rửa Mặt Cetaphil Dịu Lành Cho Da Nhạy Cảm 500ml (Mới)\r\nGentle Skin Cleanser (New)', 'Sữa Rửa Mặt', 'Nước Hoa Hồng Klairs Supple Preparation là dòng sản phẩm toner được thương hiệu Dear, Klairs thiết kế chuyên biệt dành cho làn da nhạy cảm. Với bảng thành phần chiết xuất từ thực vật và kết cấu lỏng nhẹ, thấm nhanh trên da, nước hoa hồng Klairs sẽ giúp câ', NULL, 'Da dầu/Hỗn hợp dầu', NULL, NULL, NULL, NULL, NULL, 'Cetaphil', 'Canada', 'Canada', '3499320013048', '100ml 150ml 200ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (66, 'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 80ml\r\nRich Moist Soothing Cream', 'Serum / Dầu Dưỡng Tóc', 'Kem Dưỡng Ẩm Klairs Rich Moist Soothing Cream là sản phẩm kem dưỡng được thương hiệu dear,Klairs thiết kế dành riêng cho tình trạng da khô, mất nước & nhạy cảm. Kem dưỡng có kết cấu đặc giúp cấp ẩm sâu nhằm khôi phục cân bằng độ ẩm, giúp da trở nên rạng r', NULL, 'ình trạng da khô, mất nước & nhạy cảm. ', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809572890895', '60g 100g 150g', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (67, 'Serum Klairs Phục Hồi, Ngừa Lão Hoá Da Ban Đêm 20ml\r\nMidnight Blue Youth Activating Drop', 'Serum / Dầu Dưỡng Tóc', 'Tinh Chất Klairs Dưỡng Ẩm, Phục Hồi Da Ban Đêm 20ml là sản phẩm tinh chất đến từ thương hiệu Klairs của Hàn Quốc, chứa EGF và bFGF không chỉ giảm thiểu nếp nhăn, làm căng mịn làn da mà còn tăng cường độ đàn hồi của da, đẩy lùi các dấu hiệu lão hóa, cùng 9', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '	8809115023681', '50ml 100ml 150ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (68, 'Sữa Rửa Mặt Klairs Dưỡng Ẩm, Dịu Nhẹ, Sạch Sâu 20ml\r\nGentle Black Facial Cleanser', 'Sữa Rửa Mặt', 'là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Klairs của Hàn Quốc, chứa phức hợp đen từ các thành phần thiên nhiên giúp làm sạch sâu đồng thời dưỡng ẩm và nuôi dưỡng làn da khoẻ mạnh. Sản phẩm có độ pH lý tưởng 5.5 - 6.5 giúp duy trì độ ẩm tự nhiên c', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809572891243', '50ml 100ml 150ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (69, 'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 20ml\r\nRich Moist Soothing Cream\r\n', 'Dưỡng Thể', 'là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Klairs của Hàn Quốc, chứa phức hợp đen từ các thành phần thiên nhiên giúp làm sạch sâu đồng thời dưỡng ẩm và nuôi dưỡng làn da khoẻ mạnh. Sản phẩm có độ pH lý tưởng 5.5 - 6.5 giúp duy trì độ ẩm tự nhiên c', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809572891243', '50ml 100ml 150ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (70, 'Serum L\'Oreal Hyaluronic Acid Cấp Ẩm Sáng Da 30ml\r\nRevitalift Hyaluronic Acid 1.5% Hyaluron Serum', 'Dưỡng Thể', 'là dòng sản phẩm serum đến từ thương hiệu L\'Oréal Paris nổi tiếng của Pháp, với sự kết hợp không chỉ 1 mà đến 2 loại Hyaluronic Acid ưu việt ở nồng độ 1.5% sẽ là giải pháp chăm sóc da hiệu quả dành cho làn da khô & lão hóa, giúp cung cấp độ ẩm tối đa cho', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'L\'Oréal Paris', 'Pháp', 'Trung Quốc', '6923700966701\r\n6923700966701\r\n6923700966701\r\n69237', '400ml 600ml 900ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (71, 'Kem Chống Nắng L\'Oreal Paris X20 Thoáng Da Mỏng Nhẹ 50ml\r\nUV Defender Serum Invisible Resist SPF50+ PA++++', 'Sữa Chống Nắng', 'là sản phẩm chống nắng dạng serum đến từ thương hiệu L\'Oreal - Pháp. Sản phẩm là serum đầu tiên với 24% phức hợp chống nắng phổ rộng kết hợp cùng Hyaluronic Acid + Peptides là giải pháp bảo vệ, cải thiện làn da với hiệu quả rõ rệt', NULL, 'Da dầu', NULL, NULL, NULL, NULL, NULL, 'L\'Oréal Paris', 'Pháp', 'Trung Quốc', '8994993018086', '20ml 50ml 70ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (72, 'Serum L\'Oreal Sáng Da, Mờ Thâm Mụn & Nám 30ml (Mới)\r\nGlycolic Bright Melasyl 8% [Melasyl+Glycolic+Niacinamide]', 'Dưỡng Thể', 'là sản phẩm tinh chất dưỡng da đến từ thương hiệu mỹ phẩm L'Oreal Paris - Pháp, với thành phần đột phá sáng da MelasylTM từ viện nghiên cứu L'Oreal Paris cùng phức hợp hoạt chất 8% [Melasyl+Glycolic+Niacinamide] giúp dưỡng sáng da, làm mờ các vết thâm ná', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'L\'Oréal Paris\r\n', 'Pháp', 'Trung Quốc', '8994993016587', '30ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (73, 'Bộ Gội Xả L\'Oreal Dưỡng Tóc Suôn Mượt Tóc Cao Cấp 440mlx2\r\nExtraordinary Oil Sleek Silicone-free Shampoo & Conditioner', 'Bộ gội xã', 'được chiết xuất từ 100% tinh dầu gỗ tuyết tùng tự nhiên từ Pháp dưỡng ẩm sâu cho tóc khô và xơ rối, giúp tóc suôn mượt và ngăn ngừa tóc chẻ ngọn.', NULL, 'Tóc xơ rối và khó vào nếp', NULL, NULL, NULL, NULL, NULL, 'L\'Oréal Paris\r\n', 'Pháp', 'Trung Quốc', NULL, '250ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (74, 'Combo Cocoon Tẩy Da Chết Cho Mặt & Toàn Thân Từ Cà Phê Đắk Lắk (200ml+150ml)', 'Bộ chăm sóc da\r\nBộ chăm sóc da\r\nBộ chăm sóc da\r\nBộ chăm sóc da', 'là dòng tẩy da chết cho mặt với thành phần từ hạt cà phê Đắk Lắk xay nhuyễn giàu cafeine hòa quyện với bơ cacao Tiền Giang giúp loại bỏ lớp tế bào chết già cỗi và xỉn màu, đánh thức làn da tươi mới, mang lại làn da mịn màng ngay sau lần đầu sử dụng, làn d', NULL, 'Da thường/Mọi loại da\r\n', NULL, NULL, NULL, NULL, NULL, 'Cocoon', 'Mỹ', 'Việt Nam', NULL, '150ml 200ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (75, 'Serum La Roche-Posay Giảm Thâm Nám & Dưỡng Sáng Da 30ml Mela B3 Serum', 'Dưỡng Sáng Da', 'là sản phẩm tinh chất đến từ thương hiệu La Roche-Posay - Pháp. Sản phẩm giúp giảm thâm nám & ngăn ngừa đốm nâu sâu từng nanomet tế bào da Mela B3 với 18 năm nghiên cứu và phát triển từ các chuyên gia da liễu hàng đầu trên thế giới. Với thành phần Melasyl', NULL, 'Da thường', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', '3337875890021', '30ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (76, 'Combo 3 Xịt Khoáng La Roche-Posay Làm Dịu Và Bảo Vệ Da 50g Thermal Spring Water Sensitive Skin', 'Dưỡng Thể', 'là dòng xịt khoáng chuyên biệt dành cho làn da nhạy cảm, dễ kích ứng, được sản xuất từ nước khoáng La Roche-Posay với nguồn khoáng chất cân bằng và giàu các nguyên tố vi lượng, đặc biệt là Selenium, sẽ giúp làm dịu mát làn da, giảm kích ứng và', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', NULL, '150ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (77, 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm 200ml Effaclar Purifying Foaming Gel', 'Sữa Rửa Mặt', 'là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang ', NULL, 'Da dầu/ Da mụn/ Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', '3337872411991', '400ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (78, 'Gel Rửa Mặt & Tắm La Roche-Posay Làm Sạch & Giảm Mụn 400ml Effaclar Micro-Peeling Purifying Gel', 'Sữa Rửa Mặt', 'là sản phẩm rửa mặt và sữa tắm 2 trong 1 mới nhất vừa được ra mắt từ thương hiệu dược mỹ phẩm La Roche-Posay, thuộc dòng Effaclar chăm sóc da dầu mụn, với tác động kép - hiệu quả 2 trong 1 dùng được cho mặt và toàn thân, không chỉ giúp làm sạch dịu nhẹ mà', NULL, 'Da dầu/ Da mụn/ Da cơ thể', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', '3337875708289', '400ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (79, 'Serum La Roche-Posay Giúp Phục Hồi, Bảo Vệ & Cấp Ẩm Da 30ml\r\nCicaplast B5 Serum', 'Dưỡng Thể', 'là dòng serum chuyên biệt của thương hiệu La Roche-Posay, với hoạt chất Hyaluronic Acid Duo giúp dưỡng ẩm chuyên sâu, cho da căng mịn; Vitamin B5 làm dịu & bảo vệ da; Madecassoside cải thiện làn da hư tổn nhanh chóng Kết cấu serum cực nhẹ, thẩm thấu nhanh', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', '3337875583626', '30ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (80, 'Sữa Tắm & Rửa Mặt La Roche-Posay Cho Da Khô Nhạy Cảm 200ml\r\nLipikar Syndet AP+', 'Sửa Tắm/ Rửa Mặt', NULL, NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', NULL, '200ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (81, 'Combo La Roche-Posay Tẩy Trang & Rửa Mặt Cho Da Thường\r\nMicellar Water Ultra Sensitive Skin 400ml + Effaclar Purifying Foaming Gel For Oily Sensitive Skin 50ml', 'Tẩy Trang/ Rửa Mặt', 'là dòng sản phẩm tẩy trang dành cho da mặt, vùng mắt và môi, ứng dụng công nghệ Glyco Micellar giúp làm sạch sâu lớp trang điểm và bụi bẩn, bã nhờn trên da vượt trội mà vẫn êm dịu, không gây căng rát hay kích ứng da; đồng thời cung cấp độ ẩm, mang đến làn', NULL, 'Da nhạy cảm/ Da dầu', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', NULL, '400ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (82, 'Túi Refill Gel Rửa Mặt La Roche-Posay Cho Da Dầu, Nhạy Cảm 400ml\r\nEffaclar Purifying Foaming Gel', 'Sửa Rửa Mặt', 'là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang ', NULL, 'Da nhảy cảm', NULL, NULL, NULL, NULL, NULL, 'La Roche-Posay', 'Pháp', 'Pháp', '3337875876407', '400ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (83, 'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 60g\r\nMidnight Blue Calming Cream', 'Dưỡng Thể', 'là sản phẩm kem dưỡng ẩm lý tưởng để sử dụng hằng ngày, giúp dưỡng ẩm dịu nhẹ cho da, đồng thời hỗ trợ phục hồi và tái tạo làn da khỏe mạnh, mịn màng hơn. Bảo vệ làn da nhạy cảm khỏi các tổn thương do tác động từ môi trường bên ngoài.', NULL, 'Mọi loại da/ Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809572890291', '60ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (84, 'Nước Hoa Hồng Klairs Dành Cho Da Nhạy Cảm 180ml\r\nSupple Preparation Facial Toner', 'Nước hoa', 'là dòng sản phẩm toner được thương hiệu Dear, Klairs thiết kế chuyên biệt dành cho làn da nhạy cảm. Với bảng thành phần chiết xuất từ thực vật và kết cấu lỏng nhẹ, thấm nhanh trên da, nước hoa hồng Klairs sẽ giúp cân bằng độ pH và cấp ẩm cho làn da hiệu q', NULL, 'Mọi loại da/ Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809115025012\r\n', '180ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (85, 'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 30ml\r\nMidnight Blue Calming Cream', 'Dưỡng thể', 'là sản phẩm kem dưỡng ẩm lý tưởng để sử dụng hằng ngày, giúp dưỡng ẩm dịu nhẹ cho da, đồng thời hỗ trợ phục hồi và tái tạo làn da khỏe mạnh, mịn màng hơn. Bảo vệ làn da nhạy cảm khỏi các tổn thương do tác động từ môi trường bên ngoài.', NULL, 'Mọi loại da/ Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809115027092', '30ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (86, 'Serum Klairs Phục Hồi, Ngừa Lão Hoá Da Ban Đêm 20ml\r\nMidnight Blue Youth Activating Drop', 'Dưỡng thể', 'là sản phẩm được sử dụng trước khi đi ngủ, với thành phần chính là EGF (sh-Oligopeptide-1), bFGF (sh-Polypeptide-1). Đây là 2 hoạt chất do cơ thể tự sản sinh ra, giúp giữ cho da khỏe ở bên trong và đẹp từ bên ngoài. Các hoạt chất này sẽ giúp da căng bóng ', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809115023681', '20ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (87, 'Mặt Nạ Klairs Làm Dịu Da & Kiểm Soát Dầu Nhờn 25ml\r\nMidnight Blue Calming Sheet Mask', 'Dưỡng ẩm', 'là dòng mặt nạ đến từ thương hiệu Klairs xuất xứ Hàn Quốc với chất mặt nạ tencel mỏng nhẹ, giúp ôm sát da và cho da hấp thụ dưỡng chất tốt nhất. Sản phẩm có khả năng cấp ẩm sâu cho da, làm dịu làn da khô ráp, mẩn cảm, dễ kích ứng do thời tiết hanh khô, kh', NULL, 'Mọi loại da/ Da khô/ Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809572890239\r\n', '25ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (88, 'Tinh Chất Dưỡng Ẩm Sâu Klairs Sample 3ml\r\nRich Moist Soothing Serum', 'Dưỡng ẩm', 'hàng chính hãng có nguồn gốc rõ ràng.', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', NULL, '3ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (89, '[Mini] Sữa Rửa Mặt Klairs Dưỡng Ẩm, Dịu Nhẹ, Sạch Sâu 20ml\r\nGentle Black Facial Cleanser', 'Dưỡng ẩm', 'là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Klairs của Hàn Quốc, chứa phức hợp đen từ các thành phần thiên nhiên giúp làm sạch sâu đồng thời dưỡng ẩm và nuôi dưỡng làn da khoẻ mạnh. Sản phẩm có độ pH lý tưởng 5.5 - 6.5 giúp duy trì độ ẩm tự nhiên c', NULL, 'Mọi loại da', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809572891243', '20ml', b'1', '2025-01-16 00:00:00');
INSERT INTO `productdetail` VALUES (90, 'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 20ml\r\nRich Moist Soothing Cream', 'Dưỡng ẩm', 'là sản phẩm kem dưỡng được thương hiệu dear,Klairs thiết kế dành riêng cho tình trạng da khô, mất nước & nhạy cảm. Kem dưỡng có kết cấu đặc giúp cấp ẩm sâu nhằm khôi phục cân bằng độ ẩm, giúp da trở nên rạng rỡ và căng bóng hơn. Bên cạnh đó, sản phẩm còn ', NULL, 'Da khô/ Da nhạy cảm', NULL, NULL, NULL, NULL, NULL, 'Klairs', 'Hàn Quốc', 'Korea', '8809572890895', '20ml', b'1', '2025-01-16 00:00:00');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` decimal(10, 2) NOT NULL,
  `quantity` int NOT NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CategoryID` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CATEGORY_ID`(`CategoryID` ASC) USING BTREE,
  CONSTRAINT `FK_CATEGORY_ID` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'LOreal', 'Nước Tẩy Trang LOreal Tươi Mát Cho Da Dầu, Hỗn Hợp 400ml.', 500000.00, 0, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-205100137-1695896128_img_300x300_b798dd_fit_center.png', '2024-11-16 21:48:21', '2025-01-15 00:34:37', 10);
INSERT INTO `products` VALUES (2, 'Klairs', 'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml.', 144000.00, 0, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900012-1730367448_img_380x380_64adc6_fit_center.jpg', '2024-11-16 21:48:21', '2024-12-27 22:53:00', 12);
INSERT INTO `products` VALUES (46, 'CeraVe', 'Sữa Rửa Mặt CeraVe Sạch Sâu Cho Da.', 266000.00, 2, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422208973-1696326099_img_300x300_b798dd_fit_center.png', '2025-01-06 23:29:05', '2025-01-16 15:00:55', 5);
INSERT INTO `products` VALUES (47, 'CeraVe', 'Sữa Rửa Mặt CeraVe Sạch Sâu Cho Da.', 266000.00, 2, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422208973-1696326099_img_300x300_b798dd_fit_center.png', '2025-01-06 23:29:32', '2025-01-16 15:00:49', 5);
INSERT INTO `products` VALUES (48, 'Klairs', 'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml.', 144000.00, 2, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900012-1730367448_img_380x380_64adc6_fit_center.jpg', '2025-01-06 23:29:44', '2025-01-06 23:29:44', 12);
INSERT INTO `products` VALUES (49, 'La Roche-Posay', '  Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', 266000.00, 190, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-1716437865_img_300x300_b798dd_fit_center.jpg', '2025-01-07 16:59:36', '2025-01-07 17:01:47', 11);
INSERT INTO `products` VALUES (50, 'Anessa', '  Sữa Chống Nắng Anessa Cho Da Nhạy Cảm & Trẻ Em 60ml', 485000.00, 800, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-chong-nang-anessa-cho-da-nhay-cam-tre-em-60ml-moi-1710558274_img_300x300_b798dd_fit_center.jpg', '2025-01-07 17:00:34', '2025-01-09 14:48:01', 13);
INSERT INTO `products` VALUES (51, 'Anessa', '  Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 20ml (Mới)', 273000.00, 1999, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-1710558154_img_300x300_b798dd_fit_center.jpg', '2025-01-07 17:01:29', '2025-01-07 17:02:13', 13);
INSERT INTO `products` VALUES (52, 'Vichy', 'Sữa Chống Nắng Sunplay Skin Aqua Dưỡng Da Sáng Mịn', 175000.00, 2900, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-249500007-1728878978_img_300x300_b798dd_fit_center.jpg', '2025-01-07 17:02:23', '2025-01-07 17:02:58', 14);
INSERT INTO `products` VALUES (53, 'La Roche-Posay', '     Kem Dưỡng La Roche-Posay Giúp Phục Hồi Da Đa Công Dụng', 298000.00, 4635, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-duong-la-roche-posay-giup-phuc-hoi-da-da-cong-dung-40ml-1716439945_img_300x300_b798dd_fit_center.jpg', '2025-01-07 17:03:18', '2025-01-07 17:03:54', 11);
INSERT INTO `products` VALUES (54, 'Klairs', ' Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 60g', 288000.00, 9812, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900005-1730429318_img_380x380_64adc6_fit_center.jpg', '2025-01-07 17:04:37', '2025-01-07 17:05:43', 12);
INSERT INTO `products` VALUES (55, 'La Roche-Posay', 'Cicaplast Baume B5+ Ultra-Repairing Soothing Balm', 323000.00, 7632, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-duong-la-roche-posay-giam-mun-hieu-qua-40ml-1716445434_img_380x380_64adc6_fit_center.jpg', '2025-01-07 17:05:22', '2025-01-13 16:45:59', 11);
INSERT INTO `products` VALUES (57, 'Anessa', '  Combo 2 Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 20ml (Mới)\r\nPerfect UV Sunscreen Skincare Milk N SPF50+ PA++++', 485000.00, 800, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-2-sua-chong-nang-anessa-duong-da-kiem-dau-20ml-moi_92dqV6C6PEFRqVip_img_385x385_622873_fit_center.png', '2025-01-09 15:04:15', '2025-01-16 15:36:09', 8);
INSERT INTO `products` VALUES (58, 'Anessa', 'Perfect UV Sunscreen Skincare Milk N SPF50+ PA++++', 485000.00, 800, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-2-sua-chong-nang-anessa-duong-da-kiem-dau-20ml-moi_92dqV6C6PEFRqVip_img_385x385_622873_fit_center.png', '2025-01-14 22:57:49', '2025-01-16 16:33:40', 14);
INSERT INTO `products` VALUES (59, 'La Roche-Posay', '  Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', 266000.00, 190, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-chong-nang-la-roche-posay-kiem-soat-dau-spf50-50ml-1716437865_img_300x300_b798dd_fit_center.jpg', '2025-01-14 22:58:04', '2025-01-14 22:58:04', 12);
INSERT INTO `products` VALUES (60, 'La Roche-Posay', '  Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', 266000.00, 190, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml_1zBSnLihoFPM8Squ_img_385x385_622873_fit_center.png', '2025-01-14 22:58:15', '2025-01-16 17:54:51', 12);
INSERT INTO `products` VALUES (61, 'Anessa', 'Sữa Chống Nắng Anessa Cho Da Nhạy Cảm & Trẻ Em 60ml (Mới)', 485000.00, 800, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-chong-nang-anessa-cho-da-nhay-cam-tre-em-60ml-moi-1710558274_img_300x300_b798dd_fit_center.jpg', '2025-01-14 22:58:23', '2025-01-16 18:03:13', 14);
INSERT INTO `products` VALUES (62, 'Anessa', '  Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 20ml (Mới)', 273000.00, 1999, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-chong-nang-anessa-duong-da-kiem-dau-60ml-moi-1710558154_img_300x300_b798dd_fit_center.jpg', '2025-01-14 22:59:12', '2025-01-14 22:59:12', 14);
INSERT INTO `products` VALUES (64, 'Klairs', 'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml.', 144000.00, 11, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900012-1730367448_img_380x380_64adc6_fit_center.jpg', '2025-01-14 23:06:47', '2025-01-14 23:06:47', 12);
INSERT INTO `products` VALUES (65, 'Cetaphil', 'Sữa Rửa Mặt Cetaphil Dịu Lành Cho Da Nhạy Cảm 500ml (Mới)\r\nGentle Skin Cleanser (New)', 277000.00, 12, 'https://media.hcdn.vn/catalog/product/s/u/sua-rua-mat-cetaphil-diu-nhe-khong-xa-phong-500ml-moi-2-1684727435_img_385x385_622873_fit_center.jpg', '2025-01-14 15:01:18', '2025-01-16 15:03:51', 5);
INSERT INTO `products` VALUES (66, 'Klairs', 'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 80ml\r\nRich Moist Soothing Cream', 277000.00, 1200, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-kem-duong-am-klairs-danh-cho-da-kho-mat-nuoc-80ml-1717214679_img_385x385_622873_fit_center.jpg', '2025-01-16 15:05:27', '2025-01-08 15:06:39', 8);
INSERT INTO `products` VALUES (67, 'Klairs', 'Serum Klairs Phục Hồi, Ngừa Lão Hoá Da Ban Đêm 20ml\r\nMidnight Blue Youth Activating Drop', 354000.00, 100, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900006-1730429144_img_385x385_622873_fit_center.jpg', '2025-01-16 15:07:05', '2025-01-16 15:08:03', 16);
INSERT INTO `products` VALUES (68, 'Klairs', 'Sữa Rửa Mặt Klairs Dưỡng Ẩm, Dịu Nhẹ, Sạch Sâu 20ml\r\nGentle Black Facial Cleanser', 59000.00, 12, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-rua-mat-klairs-duong-am-diu-nhe-sach-sau-140ml-1735636193_img_385x385_622873_fit_center.jpg', '2025-01-16 15:08:36', '2025-01-16 15:09:21', 5);
INSERT INTO `products` VALUES (69, 'Klairs', 'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 20ml\r\nRich Moist Soothing Cream\r\n', 79000.00, 100, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-mini-kem-duong-am-klairs-cho-da-kho-nhay-cam-20ml-1726541871_img_385x385_622873_fit_center.jpg', '2025-01-16 15:10:00', '2025-01-15 15:11:19', 11);
INSERT INTO `products` VALUES (70, 'LOreal', 'Serum L\'Oreal Hyaluronic Acid Cấp Ẩm Sáng Da 30ml\r\nRevitalift Hyaluronic Acid 1.5% Hyaluron Serum', 299000.00, 10, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-tinh-chat-l-oreal-hyaluronic-acid-cap-am-sang-da-30ml_gM6NVBDz5KXmn27P_img_385x385_622873_fit_center.png', '2025-01-16 15:13:10', '2025-01-07 15:15:06', 16);
INSERT INTO `products` VALUES (71, 'LOreal', 'Kem Chống Nắng L\'Oreal Paris X20 Thoáng Da Mỏng Nhẹ 50ml\r\nUV Defender Serum Invisible Resist SPF50+ PA++++', 241000.00, 10, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-kem-chong-nang-l-oreal-paris-x20-thoang-da-mong-nhe-50ml_qb8CTPUNkcRBFKjv_img_385x385_622873_fit_center.png', '2025-01-16 15:15:22', '2025-01-16 15:16:55', 8);
INSERT INTO `products` VALUES (72, 'LOreal', 'Serum L\'Oreal Sáng Da, Mờ Thâm Mụn & Nám 30ml (Mới)\r\nGlycolic Bright Melasyl 8% [Melasyl+Glycolic+Niacinamide]', 299000.00, 100, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-l-oreal-sang-da-mo-tham-mun-nam-30ml_sepj1ZNC6RgyjKm9_img_385x385_622873_fit_center.png', '2025-01-16 15:18:13', '2025-01-16 15:19:33', 16);
INSERT INTO `products` VALUES (73, 'LOreal', 'Bộ Gội Xả L\'Oreal Dưỡng Tóc Suôn Mượt Tóc Cao Cấp 440mlx2\r\nExtraordinary Oil Sleek Silicone-free Shampoo & Conditioner', 320000.00, 100, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-bo-goi-xa-l-oreal-duong-toc-suon-muot-toc-cao-cap-440mlx2_ogta9qoei6ddqQRu_img_385x385_622873_fit_center.png', '2025-01-16 15:20:07', '2025-01-16 15:20:44', 7);
INSERT INTO `products` VALUES (74, 'Cocoon', 'Combo Cocoon Tẩy Da Chết Cho Mặt & Toàn Thân Từ Cà Phê Đắk Lắk (200ml+150ml)', 148000.00, 10, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-cocoon-tay-te-bao-chet-cho-mat-va-toan-than-tu-ca-phe_uF5uZzh17GPomzMv_img_385x385_622873_fit_center.png', '2025-01-16 15:24:16', '2025-01-16 15:25:07', 15);
INSERT INTO `products` VALUES (75, 'La Roche-Posay', 'Serum La Roche-Posay Giảm Thâm Nám & Dưỡng Sáng Da 30ml Mela B3 Serum', 932000.00, 10, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-la-roche-posay-giam-tham-nam-duong-sang-da-30ml_1zBSnLihoFPM8Squ_img_385x385_622873_fit_center.png', '2025-01-16 17:56:14', '2025-01-16 17:56:14', 11);
INSERT INTO `products` VALUES (76, 'La Roche-Posay', 'Combo 3 Xịt Khoáng La Roche-Posay Làm Dịu Và Bảo Vệ Da 50g Thermal Spring Water Sensitive Skin', 139000.00, 30, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-combo-3-xit-khoang-la-roche-posay-lam-diu-va-bao-ve-da-50g_zfxJe9YQJjY4SHf4_img_385x385_622873_fit_center.png', '2025-01-16 17:56:14', '2025-01-16 17:56:14', 11);
INSERT INTO `products` VALUES (77, 'La Roche-Posay', 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm 200ml Effaclar Purifying Foaming Gel', 150000.00, 20, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-gel-rua-mat-tao-bot-la-roche-posay-danh-cho-da-dau-nhay-cam-200ml-1716603223_img_300x300_b798dd_fit_center.jpg', '2025-01-16 17:56:14', '2025-01-16 17:56:14', 11);
INSERT INTO `products` VALUES (78, 'La Roche-Posay', 'Gel Rửa Mặt & Tắm La Roche-Posay Làm Sạch & Giảm Mụn 400ml Effaclar Micro-Peeling Purifying Gel', 250000.00, 10, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-gel-rua-mat-la-roche-posay-ho-tro-giam-mun-cho-mat-toan-than-400ml_F66KTupaNNCns7N4_img_385x385_622873_fit_center.png', '2025-01-16 17:56:14', '2025-01-16 17:56:14', 11);
INSERT INTO `products` VALUES (79, 'La Roche-Posay', 'Serum La Roche-Posay Giúp Phục Hồi, Bảo Vệ & Cấp Ẩm Da 30ml\r\nCicaplast B5 Serum', 1050000.00, 10, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-serum-la-roche-posay-giup-phuc-hoi-bao-ve-cap-am-da-30ml_WyNkNigswrDofjyy_img_385x385_622873_fit_center.png', '2025-01-16 17:56:24', '2025-01-16 17:56:24', 11);
INSERT INTO `products` VALUES (80, 'La Roche-Posay', 'Sữa Tắm & Rửa Mặt La Roche-Posay Cho Da Khô Nhạy Cảm 200ml\r\nLipikar Syndet AP+', 415000.00, 30, 'https://media.hcdn.vn/catalog/product/p/r/promotions-auto-sua-rua-mat-va-tam-la-roche-posay-danh-cho-da-kho-nhay-cam-da-bi-kich-ung-man-do-ngua-200ml_TnuEEvQvZ35574P6_img_385x385_622873_fit_center.png', '2025-01-16 17:56:24', '2025-01-16 17:56:24', 11);
INSERT INTO `products` VALUES (81, 'La Roche-Posay', 'Combo La Roche-Posay Tẩy Trang & Rửa Mặt Cho Da Thường\r\nMicellar Water Ultra Sensitive Skin 400ml + Effaclar Purifying Foaming Gel For Oily Sensitive Skin 50ml', 530000.00, 20, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422205551-1700103499_img_385x385_622873_fit_center.png', '2025-01-16 17:56:24', '2025-01-16 17:56:24', 11);
INSERT INTO `products` VALUES (82, 'La Roche-Posay', 'Túi Refill Gel Rửa Mặt La Roche-Posay Cho Da Dầu, Nhạy Cảm 400ml\r\nEffaclar Purifying Foaming Gel', 359000.00, 10, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422216355-1699585860_img_385x385_622873_fit_center.jpg', '2025-01-16 17:56:24', '2025-01-16 17:56:24', 11);
INSERT INTO `products` VALUES (83, 'Klairs', 'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 60g\r\nMidnight Blue Calming Cream', 317000.00, 10, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900005-1730429318_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);
INSERT INTO `products` VALUES (84, 'Klairs', 'Nước Hoa Hồng Klairs Dành Cho Da Nhạy Cảm 180ml\r\nSupple Preparation Facial Toner', 209000.00, 30, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900011-1730426434_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);
INSERT INTO `products` VALUES (85, 'Klairs', 'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 30ml\r\nMidnight Blue Calming Cream', 277000.00, 20, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900019-1730429206_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);
INSERT INTO `products` VALUES (86, 'Klairs', 'Serum Klairs Phục Hồi, Ngừa Lão Hoá Da Ban Đêm 20ml\r\nMidnight Blue Youth Activating Drop', 354000.00, 20, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900006-1730429144_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);
INSERT INTO `products` VALUES (87, 'Klairs', 'Mặt Nạ Klairs Làm Dịu Da & Kiểm Soát Dầu Nhờn 25ml\r\nMidnight Blue Calming Sheet Mask', 42000.00, 20, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900017-1730366899_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);
INSERT INTO `products` VALUES (88, 'Klairs', 'Tinh Chất Dưỡng Ẩm Sâu Klairs Sample 3ml\r\nRich Moist Soothing Serum', 8000.00, 20, 'https://media.hcdn.vn/catalog/product/t/i/tinh-chat-duong-am-sau-klairs-sample-3ml_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);
INSERT INTO `products` VALUES (89, 'Klairs', '[Mini] Sữa Rửa Mặt Klairs Dưỡng Ẩm, Dịu Nhẹ, Sạch Sâu 20ml\r\nGentle Black Facial Cleanser', 59000.00, 20, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-sua-rua-mat-klairs-duong-am-diu-nhe-sach-sau-140ml-1735636193_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);
INSERT INTO `products` VALUES (90, 'Klairs', 'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 20ml\r\nRich Moist Soothing Cream', 79000.00, 20, 'https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-mini-kem-duong-am-klairs-cho-da-kho-nhay-cam-20ml-1726541871_img_385x385_622873_fit_center.jpg', '2025-01-16 18:25:32', '2025-01-16 18:25:32', 11);

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountPercentage` decimal(5, 2) NOT NULL,
  `discount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ProductID`(`ProductID` ASC) USING BTREE,
  CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 915 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of promotions
-- ----------------------------
INSERT INTO `promotions` VALUES (1, 2, 'Khuyến mãi 1-1', 0.52, '52% OFF', '2024-12-08', '2024-12-30', '2024-12-08 00:00:00');
INSERT INTO `promotions` VALUES (2, 1, 'Khuyến mãi 1-1', 0.30, '30% OFF', '2025-01-01', '2025-01-28', '2024-12-08 00:00:00');
INSERT INTO `promotions` VALUES (5, 47, 'Khuyến mãi 1-1', 0.10, '10% OFF', '2025-01-01', '2025-01-28', '2025-01-13 00:00:00');
INSERT INTO `promotions` VALUES (7, 49, 'Khuyến mãi 1-1', 0.50, '50% OFF', '2025-01-01', '2025-01-28', '2025-01-13 00:00:00');
INSERT INTO `promotions` VALUES (8, 50, 'Khuyến mãi 1-1', 0.35, '35% OFF', '2025-01-01', '2025-01-28', '2025-01-13 00:00:00');
INSERT INTO `promotions` VALUES (9, 51, 'Khuyến mãi 1-1', 0.20, '20% OFF', '2025-01-01', '2025-01-28', '2025-01-14 00:00:00');
INSERT INTO `promotions` VALUES (10, 52, 'Khuyến mãi 1-1', 0.20, '20% OFF', '2025-01-01', '2025-01-28', '2025-01-14 00:00:00');
INSERT INTO `promotions` VALUES (11, 53, 'Khuyến mãi 1-1', 0.20, '20% OFF', '2025-01-01', '2025-01-28', '2025-01-14 00:00:00');
INSERT INTO `promotions` VALUES (12, 54, 'Khuyến mãi 1-1', 0.20, '20% OFF', '2025-01-01', '2025-01-28', '2025-01-14 00:00:00');
INSERT INTO `promotions` VALUES (13, 55, 'Khuyến mãi 15-1', 0.30, '30% OFF', '2025-01-01', '2025-01-28', '2025-01-28 00:00:00');
INSERT INTO `promotions` VALUES (14, 57, 'Khuyến mãi 1-1', 0.10, '10% OFF', '2025-01-08', '2025-01-28', '2025-01-08 00:00:00');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `UserID` int NOT NULL,
  `Rating` int NOT NULL,
  `Comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ProductID`(`ProductID` ASC) USING BTREE,
  INDEX `UserID`(`UserID` ASC) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_chk_1` CHECK (`Rating` between 1 and 5)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reviews
-- ----------------------------

-- ----------------------------
-- Table structure for shipping
-- ----------------------------
DROP TABLE IF EXISTS `shipping`;
CREATE TABLE `shipping`  (
  `ShippingID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `City` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PostalCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ShippingStatus` enum('Pending','Shipped','Delivered','Cancelled','Failed','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Pending',
  `ShippingDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ShippingID`) USING BTREE,
  INDEX `OrderID`(`OrderID` ASC) USING BTREE,
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shipping
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '123456',
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `unique_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (10, 'LeThai', 'LeThanh@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'user', '2024-12-27 20:10:32', NULL, NULL);
INSERT INTO `users` VALUES (42, 'ThiThanh', '123456', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'user', '2025-01-15 23:14:14', NULL, NULL);
INSERT INTO `users` VALUES (51, 'Tuyen', 'nguyenthanh556556@gmail.com', '$2a$10$2UzcvUUCboUGHUoEHfjWs.r2E7okCZ2JD0m06otIHEUL7xezTyLRi', 'user', '2025-03-28 23:18:27', 'b10cb703-9587-4add-9f43-2333a160e867', NULL);
INSERT INTO `users` VALUES (55, 'Thạnh Nguyễn Văn', '22130260@st.hcmuaf.edu.vn', '123456', 'user', '2025-04-14 21:31:58', NULL, 'GOOGLE');
INSERT INTO `users` VALUES (120, 'LeThaiTam', 'nguyenthanh55655c6@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'user', '2025-01-15 12:16:05', NULL, NULL);

-- ----------------------------
-- Table structure for usersarress
-- ----------------------------
DROP TABLE IF EXISTS `usersarress`;
CREATE TABLE `usersarress`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `age` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `malle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dateBth` date NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `authID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userID` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`id` ASC) USING BTREE,
  INDEX `userID_2`(`userID` ASC, `id` ASC) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usersarress
-- ----------------------------
INSERT INTO `usersarress` VALUES (10, 'LeThanh@gmail.com', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', 'https://hasaki.vn/images/graphics/account-full.svg', '0352169819', 'Nguyễn Thạnh', 'Nam', '2006-03-14', NULL, NULL, 10);
INSERT INTO `usersarress` VALUES (51, 'nguyenthanh556556@gmail.com', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', 'https://hasaki.vn/images/graphics/account-full.svg', '0352169819', 'Nguyễn Thạnh', 'Nu', '2004-10-04', NULL, NULL, 51);
INSERT INTO `usersarress` VALUES (55, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (56, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (57, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (58, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (59, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (60, '', NULL, 'Khu Phố 6  , Phường Bến Thành , Quận 1 , tphcm', NULL, '0352169819', 'Thanh Thanh Nguyen', NULL, NULL, 'FACEBOOK', NULL, 55);
INSERT INTO `usersarress` VALUES (61, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (62, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (63, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (64, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (65, '', NULL, 'Khu Phố 6  , Phường An Nghiệp , Ninh Kiều , cantho', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (66, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (67, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (68, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (69, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (70, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (71, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (72, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (73, '', NULL, 'Khu Phố 6  , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0976784894', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (74, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (75, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (76, '', NULL, 'Kh , Phường Hòa Cường Bắc , Hải Châu , danang', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (77, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (78, '', NULL, 'Kh , Phường An Nghiệp , Ninh Kiều , cantho', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (79, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (80, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 51);
INSERT INTO `usersarress` VALUES (81, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (82, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 51);
INSERT INTO `usersarress` VALUES (83, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (84, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Nguyễn Thạnh', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (85, '', NULL, 'Kh , Phường Hòa Cường Bắc , Hải Châu , danang', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (86, '', NULL, 'Kh , Phường Vĩnh Hải , Nha Trang , nhatrang', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (87, '', NULL, 'Kh , Phường Trúc Bạch , Ba Đình , hanoi', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 51);
INSERT INTO `usersarress` VALUES (88, '', NULL, 'Kh , Phường Hạ Lý , Hồng Bàng , haiphong', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (89, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (90, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (91, '', NULL, 'Kh , Phường Hòa Cường Bắc , Hải Châu , danang', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 55);
INSERT INTO `usersarress` VALUES (92, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 51);
INSERT INTO `usersarress` VALUES (93, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 51);
INSERT INTO `usersarress` VALUES (94, '', NULL, 'Kh , Phường Hạ Lý , Hồng Bàng , haiphong', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 51);
INSERT INTO `usersarress` VALUES (95, '', NULL, 'Kh , Phường Bến Nghé , Quận 1 , tphcm', NULL, '0352169819', 'Thanhnguyen41', NULL, NULL, 'GOOGLE', NULL, 51);

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `WishlistID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ProductID` int NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WishlistID`) USING BTREE,
  INDEX `UserID`(`UserID` ASC) USING BTREE,
  INDEX `ProductID`(`ProductID` ASC) USING BTREE,
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
INSERT INTO `wishlist` VALUES (1, 10, 1, '2025-01-08 10:46:15');
INSERT INTO `wishlist` VALUES (2, 10, 2, '2025-01-08 10:46:31');
INSERT INTO `wishlist` VALUES (3, 10, 46, '2025-01-08 10:46:48');

-- ----------------------------
-- Table structure for import_receipts
-- ----------------------------
CREATE TABLE import_receipts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    import_date DATETIME NOT NULL,
    supplier_id INT NOT NULL,
    note TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    total_amount DECIMAL(15,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for import_receipt_details
-- ----------------------------
CREATE TABLE import_receipt_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    import_receipt_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(15,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (import_receipt_id) REFERENCES import_receipts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
CREATE TABLE suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    email VARCHAR(100),
    tax_code VARCHAR(50),
    contact_person VARCHAR(100),
    status BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Add some sample suppliers
INSERT INTO suppliers (name, address, phone, email, tax_code, contact_person) VALUES
('Công ty TNHH ABC', '123 Đường ABC, Quận 1, TP.HCM', '02812345678', 'contact@abc.com', '1234567890', 'Nguyễn Văn A'),
('Công ty XYZ', '456 Đường XYZ, Quận 2, TP.HCM', '02887654321', 'info@xyz.com', '0987654321', 'Trần Thị B'),
('Công ty DEF', '789 Đường DEF, Quận 3, TP.HCM', '02898765432', 'sales@def.com', '1122334455', 'Lê Văn C');

SET FOREIGN_KEY_CHECKS = 1;
