/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 10.0.0.130:3306
 Source Schema         : cloud_upms

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 29/10/2018 15:42:07
*/

CREATE DATABASE IF NOT EXISTS cloud_upms DEFAULT CHARACTER SET = utf8mb4;
Use cloud_upms;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `upms_menu`;
CREATE TABLE `upms_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目ID\r\n',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目名称',
  `menu_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目类型',
  `menu_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目标识',
  `menu_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端组件',
  `menu_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目图标',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '栏目序号',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上级栏目',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upms_menu
-- ----------------------------
INSERT INTO `upms_menu` VALUES (1, '权限管理', '0', 'upms', '/upms', 'Layout', 'example', '权限管理..', 1, -1);
INSERT INTO `upms_menu` VALUES (2, '组织管理', '1', 'org', 'org', 'upms/org/org', 'table', '', 1, 1);
INSERT INTO `upms_menu` VALUES (3, '用户管理', '1', 'user', 'user', 'upms/user/user', 'table', '', 2, 1);
INSERT INTO `upms_menu` VALUES (4, '角色管理', '1', 'role', 'role', 'upms/role/role', 'table', '', 3, 1);
INSERT INTO `upms_menu` VALUES (5, '菜单管理', '1', 'menu', 'menu', 'upms/menu/menu', 'table', '', 4, 1);

-- ----------------------------
-- Table structure for upms_org
-- ----------------------------
DROP TABLE IF EXISTS `upms_org`;
CREATE TABLE `upms_org`  (
  `org_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '排序',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级ID\r\n',
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upms_org
-- ----------------------------
INSERT INTO `upms_org` VALUES (1, '总部1号', '我是老大都听我的', 1, -1);
INSERT INTO `upms_org` VALUES (2, '公司1号', '2', 2, 1);
INSERT INTO `upms_org` VALUES (3, '总部2号', '3', 1, -1);
INSERT INTO `upms_org` VALUES (5, '总部3号', '总部3号', 3, -1);
INSERT INTO `upms_org` VALUES (6, '总部4号', '总部4号', 4, -1);
INSERT INTO `upms_org` VALUES (7, '总部5号', '总部5号', 5, -1);
INSERT INTO `upms_org` VALUES (8, '总部4号', '总部4号', 4, -1);
INSERT INTO `upms_org` VALUES (11, '公司2号', '', NULL, 3);
INSERT INTO `upms_org` VALUES (12, 'string', 'string', 0, 0);

-- ----------------------------
-- Table structure for upms_role
-- ----------------------------
DROP TABLE IF EXISTS `upms_role`;
CREATE TABLE `upms_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `org_Id`(`org_id`) USING BTREE,
  CONSTRAINT `upms_role_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `upms_org` (`org_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upms_role
-- ----------------------------
INSERT INTO `upms_role` VALUES (1, '管理员', NULL, '');
INSERT INTO `upms_role` VALUES (3, '测试', NULL, '测试');

-- ----------------------------
-- Table structure for upms_user
-- ----------------------------
DROP TABLE IF EXISTS `upms_user`;
CREATE TABLE `upms_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `org_id`(`org_id`) USING BTREE,
  CONSTRAINT `upms_user_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `upms_org` (`org_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upms_user
-- ----------------------------
INSERT INTO `upms_user` VALUES (1, 'yancq', '$2a$10$mUlJkqu6kSDkqhJCBqlahuC0SsYchYapZZ0eHeOKSa1/jrUmBKVD.', '传奇', '0', '描述大叔大叔的', 5);
INSERT INTO `upms_user` VALUES (2, 'admin', '11222', '测试', '1', '', 1);

-- ----------------------------
-- Table structure for upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `upms_user_role`;
CREATE TABLE `upms_user_role`  (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`link_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `upms_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `upms_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upms_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `upms_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
