/*
 Navicat Premium Data Transfer

 Source Server         : myserver
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : pzh_db

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 29/06/2022 11:56:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_announce
-- ----------------------------
DROP TABLE IF EXISTS `tbl_announce`;
CREATE TABLE `tbl_announce`  (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_publisher` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_time` datetime(0) NOT NULL,
  `a_valid` bit(1) NOT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10004 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_announce
-- ----------------------------
INSERT INTO `tbl_announce` VALUES (10001, '需求分析结束了', '遭数据库数据好烦', 'czr', '2022-06-23 16:25:25', b'1');
INSERT INTO `tbl_announce` VALUES (10003, '标题2', '这是一条公告', 'Haoting', '2022-06-26 08:25:25', b'0');
INSERT INTO `tbl_announce` VALUES (10004, '标题4', '这是一条普通的公告', 'Haoting', '2022-06-26 08:25:25', b'1');

-- ----------------------------
-- Table structure for tbl_car
-- ----------------------------
DROP TABLE IF EXISTS `tbl_car`;
CREATE TABLE `tbl_car`  (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_capacity` int NOT NULL,
  `c_image` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_card` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_valid` bit(1) NOT NULL,
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_car
-- ----------------------------
INSERT INTO `tbl_car` VALUES (1, '小型汽车', 7, NULL, 'B1', '渝A001', b'1');
INSERT INTO `tbl_car` VALUES (2, '货车', 30, NULL, 'B2', '渝A002', b'1');
INSERT INTO `tbl_car` VALUES (3, '小型汽车', 50, NULL, 'B1', '渝A003', b'1');
INSERT INTO `tbl_car` VALUES (4, '卡车', 35, NULL, 'C1', '渝A004', b'1');
INSERT INTO `tbl_car` VALUES (5, '卡车', 40, NULL, 'B1', '渝A005', b'1');
INSERT INTO `tbl_car` VALUES (6, '小型汽车', 40, NULL, 'B2', '渝A006', b'1');
INSERT INTO `tbl_car` VALUES (7, '货车', 55, NULL, 'B1', '渝A007', b'0');
INSERT INTO `tbl_car` VALUES (8, '卡车', 15, NULL, 'C1', '渝A008', b'1');
INSERT INTO `tbl_car` VALUES (9, '小型汽车', 65, NULL, 'C1', '渝A009', b'1');
INSERT INTO `tbl_car` VALUES (10, '货车', 70, NULL, 'C1', '桂R001', b'0');

-- ----------------------------
-- Table structure for tbl_check
-- ----------------------------
DROP TABLE IF EXISTS `tbl_check`;
CREATE TABLE `tbl_check`  (
  `ch_id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `ch_question` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ch_time` datetime(0) NULL DEFAULT NULL,
  `ch_result` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ch_valid` bit(1) NOT NULL,
  PRIMARY KEY (`ch_id`) USING BTREE,
  INDEX `c_id`(`c_id`) USING BTREE,
  CONSTRAINT `tbl_check_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `tbl_car` (`c_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_check
-- ----------------------------
INSERT INTO `tbl_check` VALUES (1, 1, '爆胎', '2022-06-23 16:25:25', '修好了!', b'1');
INSERT INTO `tbl_check` VALUES (2, 6, '车玻璃损坏', '2022-06-28 08:41:30', '修好了一半', b'1');

-- ----------------------------
-- Table structure for tbl_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback`  (
  `fb_id` int NOT NULL AUTO_INCREMENT,
  `fb_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fb_status` int NOT NULL,
  PRIMARY KEY (`fb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_feedback
-- ----------------------------
INSERT INTO `tbl_feedback` VALUES (1, '反馈1', 1);

-- ----------------------------
-- Table structure for tbl_firm
-- ----------------------------
DROP TABLE IF EXISTS `tbl_firm`;
CREATE TABLE `tbl_firm`  (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_introduce` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_address` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_leader` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_date` datetime(0) NOT NULL,
  `f_valid` bit(1) NOT NULL,
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_firm
-- ----------------------------
INSERT INTO `tbl_firm` VALUES (1, '不加班的好公司', '重庆小学', '一人之下', '宝儿姐', '220', '2022-06-26 00:00:00', b'1');
INSERT INTO `tbl_firm` VALUES (2, '大爹的公司', '重庆大爹大学', '肖老师股份有限公司', '宝儿姐', '86-1023', '2022-06-26 00:00:00', b'0');

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods`  (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `w_id` int NULL DEFAULT NULL,
  `g_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_num` int NOT NULL,
  `g_description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `g_status` int NOT NULL DEFAULT 0,
  `g_valid` bit(1) NOT NULL,
  PRIMARY KEY (`g_id`) USING BTREE,
  INDEX `w_id`(`w_id`) USING BTREE,
  CONSTRAINT `tbl_goods_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `tbl_warehouse` (`w_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------
INSERT INTO `tbl_goods` VALUES (1, 1, '建筑材料', 20, '水泥', 0, b'1');
INSERT INTO `tbl_goods` VALUES (2, 1, '建筑材料', 15, '钢筋', 0, b'1');
INSERT INTO `tbl_goods` VALUES (3, 2, '农产品', 12, '白菜', 0, b'1');
INSERT INTO `tbl_goods` VALUES (4, 1, '建筑材料', 5000, '瓷砖5000张', 0, b'1');
INSERT INTO `tbl_goods` VALUES (5, 2, '农产品', 12, '西瓜', 0, b'1');
INSERT INTO `tbl_goods` VALUES (6, 2, '农产品', 12, '胡萝卜', 0, b'1');
INSERT INTO `tbl_goods` VALUES (7, 2, '农产品', 20, '大豆', 0, b'0');
INSERT INTO `tbl_goods` VALUES (8, 3, '生鲜产品', 8, '大黄鱼', 0, b'1');
INSERT INTO `tbl_goods` VALUES (9, 3, '生鲜产品', 8, '鲜牛肚', 0, b'1');
INSERT INTO `tbl_goods` VALUES (10, 2, '危险品', 70, '硫酸', 1, b'1');
INSERT INTO `tbl_goods` VALUES (11, NULL, '危险品', 100, '硫酸', 1, b'0');

-- ----------------------------
-- Table structure for tbl_material
-- ----------------------------
DROP TABLE IF EXISTS `tbl_material`;
CREATE TABLE `tbl_material`  (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `w_id` int NULL DEFAULT NULL,
  `m_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_num` int NOT NULL,
  `m_other` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `m_valid` bit(1) NOT NULL,
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `w_id`(`w_id`) USING BTREE,
  CONSTRAINT `tbl_material_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `tbl_warehouse` (`w_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_material
-- ----------------------------
INSERT INTO `tbl_material` VALUES (1, 1, 'A4纸', 1000, '/张', b'1');
INSERT INTO `tbl_material` VALUES (2, 1, '螺丝刀', 50, '/把', b'1');
INSERT INTO `tbl_material` VALUES (3, 2, '摄像头', 3, '/个  防止小偷!', b'1');
INSERT INTO `tbl_material` VALUES (4, 3, '空调', 4, '/台', b'1');
INSERT INTO `tbl_material` VALUES (5, 2, '剪刀', 60, '/把', b'0');

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order`  (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_start` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `o_end` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `o_status` int NOT NULL,
  `g_id` int NOT NULL,
  `o_starttime` datetime(0) NOT NULL,
  `o_other` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_price` double NULL DEFAULT NULL,
  `o_valid` bit(1) NOT NULL,
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE,
  INDEX `g_id`(`g_id`) USING BTREE,
  INDEX `c_id`(`c_id`) USING BTREE,
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`g_id`) REFERENCES `tbl_goods` (`g_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`c_id`) REFERENCES `tbl_car` (`c_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES (1, 5, 1, '重庆', '福建', 0, 1, '2022-06-23 16:25:25', NULL, 12, b'1');
INSERT INTO `tbl_order` VALUES (2, 1, 1, '四川', '贵州', 1, 2, '2022-06-23 16:25:25', NULL, 20.24, b'1');
INSERT INTO `tbl_order` VALUES (3, 2, 4, '北京', '上海', 1, 2, '2022-06-23 16:25:16', NULL, 88.12, b'1');
INSERT INTO `tbl_order` VALUES (4, 3, 4, '广西', '广东', 0, 1, '2022-06-23 08:21:25', NULL, 110.5, b'0');
INSERT INTO `tbl_order` VALUES (5, 1, 4, '海南', '甘肃', 0, 8, '2022-06-24 10:25:25', '先送我的吧，麻了', 60.4, b'1');
INSERT INTO `tbl_order` VALUES (6, 6, 4, '海南', '甘肃', 0, 6, '2022-06-25 22:25:25', '好东西', 22, b'1');
INSERT INTO `tbl_order` VALUES (7, 2, 13, '河南', '湖南', 1, 6, '2022-06-25 22:25:25', '给我休息一下吧的订单', 82.1, b'1');
INSERT INTO `tbl_order` VALUES (8, 2, 13, '河南', '河北', 0, 6, '2022-06-25 22:25:25', '给我休息一下吧的订单', 82.1, b'0');

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role`  (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r_info` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r_valid` bit(1) NOT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role` VALUES (1, '系统管理员', '系统管理员拥有最高权限', b'1');
INSERT INTO `tbl_role` VALUES (2, '普通用户', '可以查看、添加订单等', b'1');
INSERT INTO `tbl_role` VALUES (6, '菜B采购员', '臭买菜的', b'0');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r_id` int NOT NULL DEFAULT 2,
  `u_password` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_email` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_valid` bit(1) NOT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE INDEX `u_account`(`u_account`) USING BTREE,
  INDEX `r_id`(`r_id`) USING BTREE,
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `tbl_role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, '123', 1, '�\n�9I�Y��V�W��>', NULL, NULL, '宝儿姐', b'1');
INSERT INTO `tbl_user` VALUES (4, '444', 2, '�\n�9I�Y��V�W��>', NULL, NULL, '浩廷是爹', b'1');
INSERT INTO `tbl_user` VALUES (5, '456', 2, '�\n�9I�Y��V�W��>', NULL, NULL, 'iii', b'0');
INSERT INTO `tbl_user` VALUES (8, '8888', 2, '�\n�9I�Y��V�W��>', '10089', '123123@qq.com', '憨憨', b'0');
INSERT INTO `tbl_user` VALUES (13, 'abc0000', 2, '�\n�9I�Y��V�W��>', NULL, NULL, 'Haoting', b'1');
INSERT INTO `tbl_user` VALUES (14, '9090', 2, '�\n�9I�Y��V�W��>', NULL, NULL, 'Haoting', b'1');
INSERT INTO `tbl_user` VALUES (17, 'HHH', 2, '�\n�9I�Y��V�W��>', NULL, NULL, 'Haoting', b'1');

-- ----------------------------
-- Table structure for tbl_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `tbl_warehouse`;
CREATE TABLE `tbl_warehouse`  (
  `w_id` int NOT NULL AUTO_INCREMENT,
  `f_id` int NULL DEFAULT NULL,
  `w_hold` int NOT NULL,
  `w_address` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `w_valid` bit(1) NOT NULL,
  PRIMARY KEY (`w_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `tbl_warehouse_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `tbl_firm` (`f_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_warehouse
-- ----------------------------
INSERT INTO `tbl_warehouse` VALUES (1, 1, 10000, '重庆', b'1');
INSERT INTO `tbl_warehouse` VALUES (2, 1, 10000, '四川', b'1');
INSERT INTO `tbl_warehouse` VALUES (3, 1, 10000, '湖北', b'1');
INSERT INTO `tbl_warehouse` VALUES (4, 1, 5000, '广西', b'1');
INSERT INTO `tbl_warehouse` VALUES (5, 1, 5000, '广西', b'1');
INSERT INTO `tbl_warehouse` VALUES (6, 1, 88888, '西藏', b'1');
INSERT INTO `tbl_warehouse` VALUES (8, 1, 808088, '广东', b'0');

SET FOREIGN_KEY_CHECKS = 1;
