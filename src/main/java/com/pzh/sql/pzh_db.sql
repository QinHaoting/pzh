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

 Date: 30/06/2022 16:15:31
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
) ENGINE = InnoDB AUTO_INCREMENT = 10005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_announce
-- ----------------------------
INSERT INTO `tbl_announce` VALUES (10001, '攀枝花控股股份有限公司\n关于开立闲置募集资金现金管理专用结算账户的公告', '攀枝花控股股份有限公司（以下简称“公司”）于 2021 年 10 月 28 日召开第五\n届董事会第十九次会议、第五届监事会第十七次会议，审议通过了《关于使用部\n分闲置募集资金进行现金管理的议案》，在确保不影响募集资金项目建设和募集\n资金使用的前提下，同意公司使用不超过人民币 135 亿元闲置募集资金进行现金\n管理，额度内资金可以循环使用，投资品种发行主体为商业银行及其他金融机构，\n有效期限自第五届董事会第十九次会议审议通过之日起，至 2022 年年度股东大\n会止。公司独立董事、保荐机构及监事会均对该议案发表了明确的同意意见。具\n体内容详见公司于 2021 年 10 月 29 日在《证券时报》、《证券日报》、《上海证券\n报》、《中国证券报》和巨潮资讯网（http://www.cninfo.com.cn）上披露的公告（公\n告编号：2021-115、2021-116、2121-119）。', 'czr', '2022-06-23 16:25:25', b'1');
INSERT INTO `tbl_announce` VALUES (10003, '2022第二季度报告', '为打造综合物流服务能力和长期核心竞争力，完善产品矩阵，提高市场份额，公司积极拓展时效快递、经济快递、快运、\n冷运、同城急送、国际、供应链等各业务板块细分市场，夯实新的增长曲线，保持长期可持续发展。2021 年前三季度公司\n实现速运物流业务量 77.36 亿票，在去年同期业务量增速 75.06%的高增长基础上，仍实现同比增长 36.39%；实现总营业收\n入 1358.61 亿元，同比增长 23.97%。', 'Haoting', '2022-06-26 08:25:25', b'0');
INSERT INTO `tbl_announce` VALUES (10004, '攀枝花控股股份有限公司\n关于修订《公司章程》的公告 ', '攀枝花控股股份有限公司（以下简称“公司”）第五届董事会第十八次会议，\n审议通过了《关于修订<公司章程>的议案》。根据《上市公司治理准则》等规定，\n结合公司实际经营需要，公司拟对《公司章程》进行修改。详情如下：', 'Haoting', '2022-06-26 08:25:25', b'1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_feedback
-- ----------------------------
INSERT INTO `tbl_feedback` VALUES (1, '反馈1', 1);
INSERT INTO `tbl_feedback` VALUES (2, '饭2', 1);
INSERT INTO `tbl_feedback` VALUES (3, '和3', 0);
INSERT INTO `tbl_feedback` VALUES (4, '大会4', 0);
INSERT INTO `tbl_feedback` VALUES (5, '大会', 0);
INSERT INTO `tbl_feedback` VALUES (6, '好多天', 0);
INSERT INTO `tbl_feedback` VALUES (7, '递归放入', 0);
INSERT INTO `tbl_feedback` VALUES (8, '幅度分割体会', 1);
INSERT INTO `tbl_feedback` VALUES (9, ' 然后', 1);
INSERT INTO `tbl_feedback` VALUES (10, '按施工队^_^', 0);
INSERT INTO `tbl_feedback` VALUES (11, '啥电话费', 1);
INSERT INTO `tbl_feedback` VALUES (12, '独孤皇后', 1);
INSERT INTO `tbl_feedback` VALUES (13, '他舆论', 1);
INSERT INTO `tbl_feedback` VALUES (14, '后台', 0);
INSERT INTO `tbl_feedback` VALUES (15, 'v刚好', 0);
INSERT INTO `tbl_feedback` VALUES (16, '第16条', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `tbl_goods` VALUES (12, NULL, '建筑材料', 1, NULL, 0, b'1');
INSERT INTO `tbl_goods` VALUES (13, NULL, '建筑材料', 1, NULL, 0, b'1');
INSERT INTO `tbl_goods` VALUES (14, NULL, '农产品', 1, '玉米', 0, b'1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `tbl_order` VALUES (9, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (10, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (11, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (12, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (13, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (14, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (15, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (16, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (17, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (18, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (19, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (20, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (21, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (22, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (23, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (24, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (25, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (26, 2, 4, '四川', '重庆', 1, 6, '2021-11-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (27, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (28, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (29, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (30, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (31, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (32, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (33, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (34, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (35, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (36, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (37, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (38, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (39, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (40, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (41, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (42, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (43, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (44, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (45, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (46, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (47, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (48, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (49, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (50, 2, 4, '四川', '重庆', 1, 6, '2021-10-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (51, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (52, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (53, 2, 4, '四川', '重庆', 1, 6, '2021-01-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (54, 2, 4, '四川', '重庆', 1, 6, '2021-02-25 22:25:25', NULL, 1000, b'1');
INSERT INTO `tbl_order` VALUES (55, 3, 4, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (58, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (59, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (60, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (61, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (62, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (63, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (64, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (65, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (66, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (67, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (68, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (69, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (70, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (71, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (72, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (73, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (74, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (75, 3, 13, '广东', '福建', 1, 5, '2021-10-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (76, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (77, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (78, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (79, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (80, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (81, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (82, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (83, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (84, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (85, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (86, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (87, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (88, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (89, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (90, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (91, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (92, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (93, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (94, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (95, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (96, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (97, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (98, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (99, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (100, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (101, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (102, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (103, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (104, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (105, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (106, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (107, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (108, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (109, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (110, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (111, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (112, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (113, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (114, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (115, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (116, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (117, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (118, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (119, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (120, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (121, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (122, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (123, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (124, 3, 13, '广东', '福建', 1, 5, '2021-02-25 22:25:25', NULL, 1200, b'1');
INSERT INTO `tbl_order` VALUES (125, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (126, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (127, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (128, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (129, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (130, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (131, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (132, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (133, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (134, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (135, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (136, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (137, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (138, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (139, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (140, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (141, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (142, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (143, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (144, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (145, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (146, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (147, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (148, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (149, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (150, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (151, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (152, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (153, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (154, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (155, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (156, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (157, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (158, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (159, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (160, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (161, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (162, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (163, 2, 14, '浙江', '江苏', 1, 4, '2021-03-25 22:25:25', NULL, 1400, b'1');
INSERT INTO `tbl_order` VALUES (164, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (165, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (166, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (167, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (168, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (169, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (170, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (171, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (172, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (173, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (174, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (175, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (176, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (177, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (178, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (179, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (180, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (181, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (182, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (183, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (184, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (185, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (186, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (187, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (188, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (189, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (190, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (191, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (192, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (193, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (194, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (195, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (196, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (197, 1, 15, '贵州', '湖南', 1, 3, '2021-04-25 22:25:25', NULL, 1600, b'1');
INSERT INTO `tbl_order` VALUES (198, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (199, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (200, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (201, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (202, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (203, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (204, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (205, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (206, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (207, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (208, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (209, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (210, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (211, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (212, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (213, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (214, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (215, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (216, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (217, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (218, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (219, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (220, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (221, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (222, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (223, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (224, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (225, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (226, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (227, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (228, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (229, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (230, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (231, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (232, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (233, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (234, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (235, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (236, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (237, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (238, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (239, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (240, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (241, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (242, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (243, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (244, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (245, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (246, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (247, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (248, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (249, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (250, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (251, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (252, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (253, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (254, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (255, 2, 16, '湖北', '安徽', 1, 3, '2021-05-25 22:25:25', NULL, 1800, b'1');
INSERT INTO `tbl_order` VALUES (256, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (257, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (258, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (259, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (260, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (261, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (262, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (263, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (264, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (265, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (266, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (267, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (268, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (269, 2, 16, '河北', '山西', 1, 3, '2021-06-25 22:25:25', NULL, 2000, b'1');
INSERT INTO `tbl_order` VALUES (270, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (271, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (272, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (273, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (274, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (275, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (276, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (277, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (278, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (279, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (280, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (281, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (282, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (283, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (284, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (285, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2200, b'1');
INSERT INTO `tbl_order` VALUES (286, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (287, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (288, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (289, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (290, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (291, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (292, 2, 16, '辽宁', '吉林', 1, 3, '2021-07-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (293, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (294, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (295, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (296, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (297, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (298, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (299, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (300, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (301, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (302, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (303, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (304, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (305, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (306, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2400, b'1');
INSERT INTO `tbl_order` VALUES (307, 2, 16, '黑龙江', '山东', 1, 3, '2021-08-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (308, 2, 16, '海南', '青海', 1, 3, '2021-08-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (309, 2, 16, '海南', '青海', 1, 3, '2021-08-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (310, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (311, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (312, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (313, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (314, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (315, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (316, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (317, 2, 16, '海南', '青海', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (318, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (319, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (320, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (321, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (322, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (323, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (324, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (325, 2, 16, '内蒙古', '宁夏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (326, 2, 16, '新疆', ' 西藏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (327, 2, 16, '新疆', ' 西藏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (328, 2, 16, '新疆', ' 西藏', 1, 3, '2021-09-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (329, 2, 16, '新疆', ' 西藏', 1, 3, '2021-10-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (330, 2, 16, '新疆', ' 西藏', 1, 3, '2021-10-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (331, 2, 16, '新疆', ' 西藏', 1, 3, '2021-10-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (332, 2, 16, '新疆', ' 西藏', 1, 3, '2021-10-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (333, 2, 16, '北京', '天津', 1, 3, '2021-10-25 22:25:25', NULL, 2600, b'1');
INSERT INTO `tbl_order` VALUES (334, 2, 16, '北京', '天津', 1, 3, '2021-10-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (335, 2, 16, '北京', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (336, 2, 16, '北京', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (337, 2, 16, '北京', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (338, 2, 16, '北京', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (339, 2, 16, '上海', '上海', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (340, 2, 16, '上海', '上海', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (341, 2, 16, '香港', '澳门', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (342, 2, 16, '香港', '澳门', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (343, 6, 16, '西藏', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (344, 6, 15, '北京', '香港', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (345, 6, 15, '北京', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (346, 6, 15, '澳门', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 4023, b'1');
INSERT INTO `tbl_order` VALUES (347, 9, 14, '上海', '上海', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (348, 9, 14, '上海', '上海', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (349, 9, 17, '香港', '澳门', 1, 3, '2021-11-25 22:25:25', NULL, 22.4, b'1');
INSERT INTO `tbl_order` VALUES (350, 9, 17, '香港', '澳门', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (351, 2, 16, '北京', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (352, 2, 16, '北京', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (353, 2, 16, '上海', '上海', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (354, 2, 16, '上海', '上海', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (355, 2, 16, '香港', '澳门', 1, 3, '2021-11-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (356, 2, 16, '香港', '澳门', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (357, 6, 16, '西藏', '天津', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (358, 6, 15, '北京', '香港', 1, 3, '2021-11-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (359, 6, 15, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 4023, b'1');
INSERT INTO `tbl_order` VALUES (360, 6, 15, '澳门', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (361, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (362, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 22.4, b'1');
INSERT INTO `tbl_order` VALUES (363, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (364, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (365, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (366, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (367, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (368, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (369, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (370, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (371, 6, 16, '西藏', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (372, 6, 15, '北京', '香港', 1, 3, '2021-12-25 22:25:25', NULL, 4023, b'1');
INSERT INTO `tbl_order` VALUES (373, 6, 15, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (374, 6, 15, '澳门', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (375, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 22.4, b'1');
INSERT INTO `tbl_order` VALUES (376, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (377, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (378, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (379, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (380, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (381, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (382, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (383, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (384, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (385, 6, 16, '西藏', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 4023, b'1');
INSERT INTO `tbl_order` VALUES (386, 6, 15, '北京', '香港', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (387, 6, 15, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (388, 6, 15, '澳门', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 22.4, b'1');
INSERT INTO `tbl_order` VALUES (389, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (390, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (391, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (392, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (393, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (394, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (395, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (396, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (397, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (398, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 4023, b'1');
INSERT INTO `tbl_order` VALUES (399, 6, 16, '西藏', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (400, 6, 15, '北京', '香港', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (401, 6, 15, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 22.4, b'1');
INSERT INTO `tbl_order` VALUES (402, 6, 15, '澳门', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (403, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (404, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (405, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (406, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (407, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (408, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (409, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (410, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (411, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 4023, b'1');
INSERT INTO `tbl_order` VALUES (412, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (413, 6, 16, '西藏', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (414, 6, 15, '北京', '香港', 1, 3, '2021-12-25 22:25:25', NULL, 22.4, b'1');
INSERT INTO `tbl_order` VALUES (415, 6, 15, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (416, 6, 15, '澳门', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (417, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (418, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (419, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (420, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (421, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (422, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (423, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (424, 2, 16, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 4023, b'1');
INSERT INTO `tbl_order` VALUES (425, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (426, 2, 16, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (427, 6, 16, '西藏', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 22.4, b'1');
INSERT INTO `tbl_order` VALUES (428, 6, 15, '北京', '香港', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (429, 6, 15, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (430, 6, 15, '澳门', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (431, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (432, 9, 14, '上海', '上海', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (433, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 2800, b'1');
INSERT INTO `tbl_order` VALUES (434, 9, 17, '香港', '澳门', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (435, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (436, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (437, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');
INSERT INTO `tbl_order` VALUES (438, 2, 16, '北京', '天津', 1, 3, '2021-12-25 22:25:25', NULL, 3405, b'1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, '123', 1, '�\n�9I�Y��V�W��>', '13212344321', NULL, '宝儿姐', b'1');
INSERT INTO `tbl_user` VALUES (4, '444', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '浩廷是爹', b'1');
INSERT INTO `tbl_user` VALUES (5, '456', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, 'iii', b'0');
INSERT INTO `tbl_user` VALUES (8, '8888', 1, '�\n�9I�Y��V�W��>', '13212344321', '123123@qq.com', '憨憨', b'1');
INSERT INTO `tbl_user` VALUES (13, 'abc0000', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, 'Haoting', b'1');
INSERT INTO `tbl_user` VALUES (14, '9090', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, 'Haoting', b'1');
INSERT INTO `tbl_user` VALUES (15, '1', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '家柔怀', b'1');
INSERT INTO `tbl_user` VALUES (16, '2', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '金佳妍', b'1');
INSERT INTO `tbl_user` VALUES (17, '3', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '游子菡', b'1');
INSERT INTO `tbl_user` VALUES (18, '4', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '丁怀柔', b'1');
INSERT INTO `tbl_user` VALUES (19, '5', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '慎元冬', b'1');
INSERT INTO `tbl_user` VALUES (20, '6', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '鱼凌香', b'1');
INSERT INTO `tbl_user` VALUES (21, '7', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '祖郁蓝', b'1');
INSERT INTO `tbl_user` VALUES (22, '8', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '桂葱娟', b'1');
INSERT INTO `tbl_user` VALUES (23, '9', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '曹羽彤', b'1');
INSERT INTO `tbl_user` VALUES (24, '10', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '景诗筠', b'1');
INSERT INTO `tbl_user` VALUES (25, '11', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '尚亦绿', b'1');
INSERT INTO `tbl_user` VALUES (26, '12', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '殳明凝', b'1');
INSERT INTO `tbl_user` VALUES (27, '13', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '苍望慕', b'1');
INSERT INTO `tbl_user` VALUES (28, '14', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '石馨婷', b'1');
INSERT INTO `tbl_user` VALUES (29, '15', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '宋痴灵', b'1');
INSERT INTO `tbl_user` VALUES (30, '16', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '方燕星', b'1');
INSERT INTO `tbl_user` VALUES (31, '17', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '傅绮梅', b'1');
INSERT INTO `tbl_user` VALUES (32, '18', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '慎冰莹', b'1');
INSERT INTO `tbl_user` VALUES (33, '19', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '能任真', b'1');
INSERT INTO `tbl_user` VALUES (34, '20', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '魏玮奇', b'1');
INSERT INTO `tbl_user` VALUES (35, '21', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '卢正雅', b'1');
INSERT INTO `tbl_user` VALUES (36, '22', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '沃濡霈', b'1');
INSERT INTO `tbl_user` VALUES (37, '23', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '高梅雪', b'1');
INSERT INTO `tbl_user` VALUES (38, '24', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '农雨寒', b'1');
INSERT INTO `tbl_user` VALUES (39, '25', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '宋沛芹', b'1');
INSERT INTO `tbl_user` VALUES (40, '26', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '苏涵畅', b'1');
INSERT INTO `tbl_user` VALUES (41, '27', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '汲暄莹', b'1');
INSERT INTO `tbl_user` VALUES (42, '28', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '惠友儿', b'1');
INSERT INTO `tbl_user` VALUES (43, '29', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '温凉音', b'1');
INSERT INTO `tbl_user` VALUES (44, '30', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '庄悦和', b'1');
INSERT INTO `tbl_user` VALUES (45, '31', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '扶君茹', b'1');
INSERT INTO `tbl_user` VALUES (46, '32', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '向贝琳', b'1');
INSERT INTO `tbl_user` VALUES (47, '33', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '弓以晴', b'1');
INSERT INTO `tbl_user` VALUES (48, '34', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '郗吉敏', b'1');
INSERT INTO `tbl_user` VALUES (49, '35', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '卓叶舞', b'1');
INSERT INTO `tbl_user` VALUES (50, '36', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '向布衣', b'1');
INSERT INTO `tbl_user` VALUES (51, '37', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '莘浅伽', b'1');
INSERT INTO `tbl_user` VALUES (52, '38', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '空绮梅', b'1');
INSERT INTO `tbl_user` VALUES (53, '39', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '堵以云', b'1');
INSERT INTO `tbl_user` VALUES (54, '40', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '冷雨双', b'1');
INSERT INTO `tbl_user` VALUES (55, '41', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '韩山柏', b'1');
INSERT INTO `tbl_user` VALUES (56, '42', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '濮睿敏', b'1');
INSERT INTO `tbl_user` VALUES (57, '43', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '牧宜欣', b'1');
INSERT INTO `tbl_user` VALUES (58, '44', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '牛碧彤', b'1');
INSERT INTO `tbl_user` VALUES (59, '45', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '贡任真', b'1');
INSERT INTO `tbl_user` VALUES (60, '46', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '崔晨希', b'1');
INSERT INTO `tbl_user` VALUES (61, '47', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '吕幼南', b'1');
INSERT INTO `tbl_user` VALUES (62, '48', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '龚紫云', b'1');
INSERT INTO `tbl_user` VALUES (63, '49', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '康紫真', b'1');
INSERT INTO `tbl_user` VALUES (64, '50', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '郝丰雅', b'1');
INSERT INTO `tbl_user` VALUES (65, '51', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '祖悦和', b'1');
INSERT INTO `tbl_user` VALUES (66, '52', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '蓟依玲', b'1');
INSERT INTO `tbl_user` VALUES (67, '53', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '田思琳', b'1');
INSERT INTO `tbl_user` VALUES (68, '54', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '翟梓琬', b'1');
INSERT INTO `tbl_user` VALUES (69, '55', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '阙香桃', b'1');
INSERT INTO `tbl_user` VALUES (70, '56', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '双思萱', b'1');
INSERT INTO `tbl_user` VALUES (71, '57', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '巢笑旋', b'1');
INSERT INTO `tbl_user` VALUES (72, '58', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '家代芹', b'1');
INSERT INTO `tbl_user` VALUES (73, '59', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '衡悠雅', b'1');
INSERT INTO `tbl_user` VALUES (74, '60', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '慎陈红', b'1');
INSERT INTO `tbl_user` VALUES (75, '61', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '乜怀萍', b'1');
INSERT INTO `tbl_user` VALUES (76, '62', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '叶三婷', b'1');
INSERT INTO `tbl_user` VALUES (77, '63', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '余古香', b'1');
INSERT INTO `tbl_user` VALUES (78, '64', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '董钰彤', b'1');
INSERT INTO `tbl_user` VALUES (79, '65', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '越苏凉', b'1');
INSERT INTO `tbl_user` VALUES (80, '66', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '蒯婉容', b'1');
INSERT INTO `tbl_user` VALUES (81, '67', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '桂白山', b'1');
INSERT INTO `tbl_user` VALUES (82, '68', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '傅问香', b'1');
INSERT INTO `tbl_user` VALUES (83, '69', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '禄和平', b'1');
INSERT INTO `tbl_user` VALUES (84, '70', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '巢绮波', b'1');
INSERT INTO `tbl_user` VALUES (85, '71', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '糜素华', b'1');
INSERT INTO `tbl_user` VALUES (86, '72', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '徐绮丽', b'1');
INSERT INTO `tbl_user` VALUES (87, '73', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '武暄美', b'1');
INSERT INTO `tbl_user` VALUES (88, '74', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '盖湛霞', b'1');
INSERT INTO `tbl_user` VALUES (89, '75', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '印雪晴', b'1');
INSERT INTO `tbl_user` VALUES (90, '76', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '何唱月', b'1');
INSERT INTO `tbl_user` VALUES (91, '77', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '邓迎波', b'1');
INSERT INTO `tbl_user` VALUES (92, '78', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '段秀筠', b'1');
INSERT INTO `tbl_user` VALUES (93, '79', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '郗雅香', b'1');
INSERT INTO `tbl_user` VALUES (94, '80', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '养静慧', b'1');
INSERT INTO `tbl_user` VALUES (95, '81', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '万荌荌', b'1');
INSERT INTO `tbl_user` VALUES (96, '82', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '弘雁易', b'1');
INSERT INTO `tbl_user` VALUES (97, '83', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '白沛柔', b'1');
INSERT INTO `tbl_user` VALUES (98, '84', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '晃芬菲', b'1');
INSERT INTO `tbl_user` VALUES (99, '85', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '朱菊月', b'1');
INSERT INTO `tbl_user` VALUES (100, '86', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '扈琇莹', b'1');
INSERT INTO `tbl_user` VALUES (101, '87', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '袁蓉洁', b'1');
INSERT INTO `tbl_user` VALUES (102, '88', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '苍娅楠', b'1');
INSERT INTO `tbl_user` VALUES (103, '89', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '詹吉敏', b'1');
INSERT INTO `tbl_user` VALUES (104, '90', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '养瑞云', b'1');
INSERT INTO `tbl_user` VALUES (105, '91', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '贾雪巧', b'1');
INSERT INTO `tbl_user` VALUES (106, '92', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '蒙子珍', b'1');
INSERT INTO `tbl_user` VALUES (107, '93', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '农曼蔓', b'1');
INSERT INTO `tbl_user` VALUES (108, '94', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '景天音', b'1');
INSERT INTO `tbl_user` VALUES (109, '95', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '武淑贞', b'1');
INSERT INTO `tbl_user` VALUES (110, '96', 2, '�\n�9I�Y��V�W��>', '13212344321', NULL, '古瑞灵', b'1');
INSERT INTO `tbl_user` VALUES (111, '121212', 2, '�\n�9I�Y��V�W��>', NULL, '888@qq.com', 'HT', b'1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
