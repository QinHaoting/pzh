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

 Date: 25/06/2022 08:54:16
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
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10002 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_announce
-- ----------------------------
INSERT INTO `tbl_announce` VALUES (10001, '需求分析结束了', '遭数据库数据好烦', 'czr', '2022-06-23 16:25:25');

-- ----------------------------
-- Table structure for tbl_cars
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cars`;
CREATE TABLE `tbl_cars`  (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_capacity` int NULL DEFAULT NULL,
  `c_image` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_card` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_cars
-- ----------------------------
INSERT INTO `tbl_cars` VALUES (1, '面包车', 7, NULL, 'B1', '渝A001');
INSERT INTO `tbl_cars` VALUES (2, '厢式货车', 30, NULL, 'B2', '渝A002');
INSERT INTO `tbl_cars` VALUES (3, '罐式车', 50, NULL, 'B1', '渝A003');
INSERT INTO `tbl_cars` VALUES (4, '冷藏车 ', 35, NULL, 'C1', '渝A004');
INSERT INTO `tbl_cars` VALUES (5, '保温车', 40, NULL, 'B1', '渝A005');
INSERT INTO `tbl_cars` VALUES (6, '危险品车', 40, NULL, 'B2', '渝A006');
INSERT INTO `tbl_cars` VALUES (7, '中巴货车', 55, NULL, 'B1', '渝A007');
INSERT INTO `tbl_cars` VALUES (8, '铁笼车', 15, NULL, 'C1', '渝A008');
INSERT INTO `tbl_cars` VALUES (9, '加长挂车', 65, NULL, 'C1', '渝A009');

-- ----------------------------
-- Table structure for tbl_check
-- ----------------------------
DROP TABLE IF EXISTS `tbl_check`;
CREATE TABLE `tbl_check`  (
  `ch_id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `ch_question` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ch_time` datetime(0) NULL DEFAULT NULL,
  `ch_result` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ch_id`) USING BTREE,
  INDEX `c_id`(`c_id`) USING BTREE,
  CONSTRAINT `tbl_check_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `tbl_cars` (`c_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_check
-- ----------------------------
INSERT INTO `tbl_check` VALUES (1, 1, '爆胎', '2022-06-23 16:25:25', '修好了!');

-- ----------------------------
-- Table structure for tbl_firm
-- ----------------------------
DROP TABLE IF EXISTS `tbl_firm`;
CREATE TABLE `tbl_firm`  (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_introduce` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_address` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_principle` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_firm
-- ----------------------------
INSERT INTO `tbl_firm` VALUES (1, '哪都通，异能运输，宝儿姐押镖！', '重大DS3402', '一人之下', '宝儿姐', '010-86551124');

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods`  (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `w_id` int NULL DEFAULT NULL,
  `g_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_num` int NOT NULL,
  `g_describe` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `g_status` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`g_id`) USING BTREE,
  INDEX `w_id`(`w_id`) USING BTREE,
  CONSTRAINT `tbl_goods_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `tbl_warehouse` (`w_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------
INSERT INTO `tbl_goods` VALUES (1, 1, '建筑材料', 20, '水泥', 0);
INSERT INTO `tbl_goods` VALUES (2, 1, '建筑材料', 15, '钢筋', 0);
INSERT INTO `tbl_goods` VALUES (3, 2, '农产品', 12, '白菜', 0);
INSERT INTO `tbl_goods` VALUES (4, 1, '建筑材料', 5000, '瓷砖5000张', 0);
INSERT INTO `tbl_goods` VALUES (5, 2, '农产品', 12, '西瓜', 0);
INSERT INTO `tbl_goods` VALUES (6, 2, '农产品', 12, '胡萝卜', 0);
INSERT INTO `tbl_goods` VALUES (7, 2, '农产品', 20, '大豆', 0);
INSERT INTO `tbl_goods` VALUES (8, 3, '生鲜产品', 8, '大黄鱼', 0);
INSERT INTO `tbl_goods` VALUES (9, 3, '生鲜产品', 8, '鲜牛肚', 0);

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
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `w_id`(`w_id`) USING BTREE,
  CONSTRAINT `tbl_material_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `tbl_warehouse` (`w_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_material
-- ----------------------------
INSERT INTO `tbl_material` VALUES (1, 1, 'A4纸', 1000, '/张');
INSERT INTO `tbl_material` VALUES (2, 1, '螺丝刀', 50, '/把');
INSERT INTO `tbl_material` VALUES (3, 2, '摄像头', 3, '/个  防止小偷!');
INSERT INTO `tbl_material` VALUES (4, 3, '空调', 4, '/台');

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
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE,
  INDEX `g_id`(`g_id`) USING BTREE,
  INDEX `c_id`(`c_id`) USING BTREE,
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`g_id`) REFERENCES `tbl_goods` (`g_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`c_id`) REFERENCES `tbl_cars` (`c_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES (1, 5, 1, '重庆', '福建', 0, 1, '2022-06-23 16:25:25', NULL);
INSERT INTO `tbl_order` VALUES (2, 1, 1, '四川', '贵州', 1, 2, '2022-06-23 16:25:25', NULL);

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role`  (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role` VALUES (1, '系统管理员');
INSERT INTO `tbl_role` VALUES (2, '普通用户');

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
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE INDEX `u_account`(`u_account`) USING BTREE,
  INDEX `r_id`(`r_id`) USING BTREE,
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `tbl_role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, '123', 1, '123456', NULL, NULL, '宝儿姐');
INSERT INTO `tbl_user` VALUES (4, '444', 2, '000000', NULL, NULL, '浩廷是爹');
INSERT INTO `tbl_user` VALUES (5, '456', 2, '123456', NULL, NULL, 'iii');
INSERT INTO `tbl_user` VALUES (6, '888', 2, '123', NULL, NULL, 'kkk');
INSERT INTO `tbl_user` VALUES (7, '666', 2, '123', NULL, NULL, 'hhh');

-- ----------------------------
-- Table structure for tbl_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `tbl_warehouse`;
CREATE TABLE `tbl_warehouse`  (
  `w_id` int NOT NULL AUTO_INCREMENT,
  `f_id` int NULL DEFAULT NULL,
  `w_hold` int NOT NULL,
  `w_address` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`w_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `tbl_warehouse_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `tbl_firm` (`f_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_warehouse
-- ----------------------------
INSERT INTO `tbl_warehouse` VALUES (1, 1, 10000, '重庆');
INSERT INTO `tbl_warehouse` VALUES (2, 1, 10000, '四川');
INSERT INTO `tbl_warehouse` VALUES (3, 1, 10000, '湖北');

SET FOREIGN_KEY_CHECKS = 1;
