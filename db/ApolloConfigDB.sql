/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 10.0.0.130:3306
 Source Schema         : ApolloConfigDB

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 29/10/2018 15:41:39
*/

CREATE DATABASE IF NOT EXISTS ApolloConfigDB DEFAULT CHARACTER SET = utf8mb4;
Use ApolloConfigDB;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Name`(`Name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES (1, 'auth', 'auth', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `App` VALUES (2, 'upms', 'upms', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `App` VALUES (3, 'zuul', 'zuul', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId`(`AppId`) USING BTREE,
  INDEX `Name_AppId`(`Name`, `AppId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用namespace定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES (1, 'application', 'auth', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `AppNamespace` VALUES (2, 'application', 'upms', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `AppNamespace` VALUES (3, 'application', 'zuul', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS `Audit`;
CREATE TABLE `Audit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Audit
-- ----------------------------
INSERT INTO `Audit` VALUES (1, 'App', 1, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:30:09', NULL, '2018-10-29 14:30:09');
INSERT INTO `Audit` VALUES (2, 'AppNamespace', 1, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:30:09', NULL, '2018-10-29 14:30:09');
INSERT INTO `Audit` VALUES (3, 'Cluster', 1, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:30:09', NULL, '2018-10-29 14:30:09');
INSERT INTO `Audit` VALUES (4, 'Namespace', 1, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:30:09', NULL, '2018-10-29 14:30:09');
INSERT INTO `Audit` VALUES (5, 'Item', 1, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:31:44', NULL, '2018-10-29 14:31:44');
INSERT INTO `Audit` VALUES (6, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:31:44', NULL, '2018-10-29 14:31:44');
INSERT INTO `Audit` VALUES (7, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (8, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (9, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (10, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (11, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (12, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (13, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (14, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (15, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (16, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (17, 'Item', 12, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (18, 'Item', 13, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (19, 'Item', 14, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (20, 'Item', 15, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (21, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:34:11', NULL, '2018-10-29 14:34:11');
INSERT INTO `Audit` VALUES (22, 'Item', 16, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:36:48', NULL, '2018-10-29 14:36:48');
INSERT INTO `Audit` VALUES (23, 'Item', 17, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:36:48', NULL, '2018-10-29 14:36:48');
INSERT INTO `Audit` VALUES (24, 'Item', 18, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:36:48', NULL, '2018-10-29 14:36:48');
INSERT INTO `Audit` VALUES (25, 'Item', 19, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:36:48', NULL, '2018-10-29 14:36:48');
INSERT INTO `Audit` VALUES (26, 'Item', 20, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:36:48', NULL, '2018-10-29 14:36:48');
INSERT INTO `Audit` VALUES (27, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:36:48', NULL, '2018-10-29 14:36:48');
INSERT INTO `Audit` VALUES (28, 'Release', 1, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:37:02', NULL, '2018-10-29 14:37:02');
INSERT INTO `Audit` VALUES (29, 'ReleaseHistory', 1, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 14:37:02', NULL, '2018-10-29 14:37:02');
INSERT INTO `Audit` VALUES (30, 'App', 2, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:06', NULL, '2018-10-29 15:15:06');
INSERT INTO `Audit` VALUES (31, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:06', NULL, '2018-10-29 15:15:06');
INSERT INTO `Audit` VALUES (32, 'Cluster', 2, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:06', NULL, '2018-10-29 15:15:06');
INSERT INTO `Audit` VALUES (33, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:06', NULL, '2018-10-29 15:15:06');
INSERT INTO `Audit` VALUES (34, 'Item', 21, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (35, 'Item', 22, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (36, 'Item', 23, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (37, 'Item', 24, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (38, 'Item', 25, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (39, 'Item', 26, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (40, 'Item', 27, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (41, 'Item', 28, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (42, 'Item', 29, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (43, 'Item', 30, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (44, 'Item', 31, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (45, 'Item', 32, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (46, 'Item', 33, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (47, 'Item', 34, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (48, 'Item', 35, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (49, 'Item', 36, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (50, 'Item', 37, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (51, 'Item', 38, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (52, 'Item', 39, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (53, 'Item', 40, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (54, 'Item', 41, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (55, 'Item', 42, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (56, 'Item', 43, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (57, 'Item', 44, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (58, 'Item', 45, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (59, 'Item', 46, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (60, 'Item', 47, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (61, 'Item', 48, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (62, 'Item', 49, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (63, 'Item', 50, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (64, 'Item', 51, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (65, 'Item', 52, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (66, 'Item', 53, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (67, 'Item', 54, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (68, 'Item', 55, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (69, 'Item', 56, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (70, 'Item', 57, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (71, 'Item', 58, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (72, 'Item', 59, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (73, 'Item', 60, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (74, 'Item', 61, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (75, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:15:57', NULL, '2018-10-29 15:15:57');
INSERT INTO `Audit` VALUES (76, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:16:04', NULL, '2018-10-29 15:16:04');
INSERT INTO `Audit` VALUES (77, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:16:04', NULL, '2018-10-29 15:16:04');
INSERT INTO `Audit` VALUES (78, 'App', 3, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:16:55', NULL, '2018-10-29 15:16:55');
INSERT INTO `Audit` VALUES (79, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:16:55', NULL, '2018-10-29 15:16:55');
INSERT INTO `Audit` VALUES (80, 'Cluster', 3, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:16:55', NULL, '2018-10-29 15:16:55');
INSERT INTO `Audit` VALUES (81, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:16:55', NULL, '2018-10-29 15:16:55');
INSERT INTO `Audit` VALUES (82, 'Item', 62, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (83, 'Item', 63, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (84, 'Item', 64, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (85, 'Item', 65, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (86, 'Item', 66, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (87, 'Item', 67, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (88, 'Item', 68, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (89, 'Item', 69, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (90, 'Item', 70, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (91, 'Item', 71, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (92, 'Item', 72, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (93, 'Item', 73, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (94, 'Item', 74, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (95, 'Item', 75, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (96, 'Item', 76, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (97, 'Item', 77, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (98, 'Item', 78, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (99, 'Item', 79, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (100, 'Item', 80, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (101, 'Item', 81, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (102, 'Item', 82, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (103, 'Item', 83, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (104, 'Item', 84, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (105, 'Item', 85, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (106, 'Item', 86, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (107, 'Item', 87, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (108, 'Item', 88, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (109, 'Item', 89, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (110, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:46', NULL, '2018-10-29 15:20:46');
INSERT INTO `Audit` VALUES (111, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:51', NULL, '2018-10-29 15:20:51');
INSERT INTO `Audit` VALUES (112, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2018-10-29 15:20:51', NULL, '2018-10-29 15:20:51');

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS `Cluster`;
CREATE TABLE `Cluster`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId_Name`(`AppId`, `Name`) USING BTREE,
  INDEX `IX_ParentClusterId`(`ParentClusterId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集群' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cluster
-- ----------------------------
INSERT INTO `Cluster` VALUES (1, 'default', 'auth', 0, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Cluster` VALUES (2, 'default', 'upms', 0, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Cluster` VALUES (3, 'default', 'zuul', 0, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS `Commit`;
CREATE TABLE `Commit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `ClusterName`(`ClusterName`(191)) USING BTREE,
  INDEX `NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'commit 历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Commit
-- ----------------------------
INSERT INTO `Commit` VALUES (1, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"server.port\",\"value\":\"2002\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"eureka.instance.prefer-ip-address\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":3,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"eureka.instance.lease-renewal-interval-in-seconds\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":4,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"eureka.instance.lease-expiration-duration-in-seconds\",\"value\":\"20\",\"comment\":\"\",\"lineNum\":5,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://localhost:2000/eureka/\",\"comment\":\"\",\"lineNum\":6,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"auth.clientId\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":7,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"auth.clientSecret\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":8,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"auth.scope\",\"value\":\"server\",\"comment\":\"\",\"lineNum\":9,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"auth.tokenEnhancer\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":10,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"auth.signKey\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":11,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"auth.accessTokenValiditySeconds\",\"value\":\"28800\",\"comment\":\"\",\"lineNum\":12,\"id\":12,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"auth.refreshTokenValiditySeconds\",\"value\":\"28800\",\"comment\":\"\",\"lineNum\":13,\"id\":13,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"urls.anon[0]\",\"value\":\"/oauth/**\",\"comment\":\"\",\"lineNum\":14,\"id\":14,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"},{\"namespaceId\":1,\"key\":\"urls.anon[1]\",\"value\":\"/authentication/**\",\"comment\":\"\",\"lineNum\":15,\"id\":15,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:34:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:34:11\"}],\"updateItems\":[],\"deleteItems\":[]}', 'auth', 'default', 'application', NULL, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Commit` VALUES (2, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"spring.application.name\",\"value\":\"cloud-auth\",\"comment\":\"\",\"lineNum\":16,\"id\":16,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:36:47\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:36:47\"},{\"namespaceId\":1,\"key\":\"spring.jackson.date-format\",\"value\":\"yyyy-MM-dd HH:mm:ss\",\"comment\":\"\",\"lineNum\":17,\"id\":17,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:36:47\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:36:47\"},{\"namespaceId\":1,\"key\":\"spring.jackson.time-zone\",\"value\":\"GMT+8\",\"comment\":\"\",\"lineNum\":18,\"id\":18,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:36:47\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:36:47\"},{\"namespaceId\":1,\"key\":\"spring.servlet.multipart.max-file-size\",\"value\":\"524288000\",\"comment\":\"\",\"lineNum\":19,\"id\":19,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:36:47\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:36:47\"},{\"namespaceId\":1,\"key\":\"spring.servlet.multipart.max-request-size\",\"value\":\"524288000\",\"comment\":\"\",\"lineNum\":20,\"id\":20,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 14:36:47\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 14:36:47\"}],\"updateItems\":[],\"deleteItems\":[]}', 'auth', 'default', 'application', NULL, b'0', 'apollo', '2018-10-29 14:36:48', 'apollo', '2018-10-29 14:36:48');
INSERT INTO `Commit` VALUES (3, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"spring.application.name\",\"value\":\"cloud-upms\",\"comment\":\"\",\"lineNum\":1,\"id\":21,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.jackson.date-format\",\"value\":\"yyyy-MM-dd HH:mm:ss\",\"comment\":\"\",\"lineNum\":2,\"id\":22,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.jackson.time-zone\",\"value\":\"GMT+8\",\"comment\":\"\",\"lineNum\":3,\"id\":23,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.servlet.multipart.max-file-size\",\"value\":\"524288000\",\"comment\":\"\",\"lineNum\":4,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.servlet.multipart.max-request-size\",\"value\":\"524288000\",\"comment\":\"\",\"lineNum\":5,\"id\":25,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.mapper-locations\",\"value\":\"classpath:mapper/*.xml\",\"comment\":\"\",\"lineNum\":6,\"id\":26,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.typeAliasesPackage\",\"value\":\"com.qiq.da.upms\",\"comment\":\"\",\"lineNum\":7,\"id\":27,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.global-config.db-config.id-type\",\"value\":\"AUTO\",\"comment\":\"\",\"lineNum\":8,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.global-config.db-config.field-strategy\",\"value\":\"IGNORED\",\"comment\":\"\",\"lineNum\":9,\"id\":29,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.global-config.db-config.column-underline\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":10,\"id\":30,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.global-config.refresh\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":11,\"id\":31,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.configuration.map-underscore-to-camel-case\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":12,\"id\":32,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"mybatis-plus.configuration.cache-enabled\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":13,\"id\":33,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"executor.corePoolSize\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":14,\"id\":34,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"executor.maxPoolSize\",\"value\":\"10\",\"comment\":\"\",\"lineNum\":15,\"id\":35,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"executor.keepAliveSeconds\",\"value\":\"300\",\"comment\":\"\",\"lineNum\":16,\"id\":36,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"executor.queueCapacity\",\"value\":\"9999\",\"comment\":\"\",\"lineNum\":17,\"id\":37,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"executor.threadNamePrefix\",\"value\":\"upms-service-\",\"comment\":\"\",\"lineNum\":18,\"id\":38,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.url\",\"value\":\"jdbc:mysql://10.0.0.130:3306/cloud_upms?characterEncoding\\u003dutf8\\u0026useSSL\\u003dtrue\\u0026verifyServerCertificate\\u003dfalse\",\"comment\":\"\",\"lineNum\":19,\"id\":39,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":20,\"id\":40,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.password\",\"value\":\"123456\",\"comment\":\"\",\"lineNum\":21,\"id\":41,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"\",\"lineNum\":22,\"id\":42,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.initial-size\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":23,\"id\":43,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.min-idle\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":24,\"id\":44,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.max-active\",\"value\":\"20\",\"comment\":\"\",\"lineNum\":25,\"id\":45,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.max-wait\",\"value\":\"60000\",\"comment\":\"\",\"lineNum\":26,\"id\":46,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.time-between-eviction-runs-millis\",\"value\":\"60000\",\"comment\":\"\",\"lineNum\":27,\"id\":47,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.min-evictable-idle-time-millis\",\"value\":\"50000\",\"comment\":\"\",\"lineNum\":28,\"id\":48,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.validation-query\",\"value\":\"select \\u0027x\\u0027\",\"comment\":\"\",\"lineNum\":29,\"id\":49,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.test-on-borrow\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":30,\"id\":50,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.test-on-return\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":31,\"id\":51,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"spring.datasource.druid.test-while-idle\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":32,\"id\":52,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"server.port\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":33,\"id\":53,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"eureka.instance.prefer-ip-address\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":34,\"id\":54,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"eureka.instance.lease-renewal-interval-in-seconds\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":35,\"id\":55,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"eureka.instance.lease-expiration-duration-in-seconds\",\"value\":\"20\",\"comment\":\"\",\"lineNum\":36,\"id\":56,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://localhost:2000/eureka/\",\"comment\":\"\",\"lineNum\":37,\"id\":57,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"urls.anon[0]\",\"value\":\"/upmsUser/findUserByUsername/**\",\"comment\":\"\",\"lineNum\":38,\"id\":58,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"security.oauth2.client.client-id\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":39,\"id\":59,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"security.oauth2.client.client-secret\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":40,\"id\":60,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"},{\"namespaceId\":2,\"key\":\"security.oauth2.resource.jwt.key-uri\",\"value\":\"http://localhost:2002/oauth/token_key\",\"comment\":\"\",\"lineNum\":41,\"id\":61,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:15:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:15:57\"}],\"updateItems\":[],\"deleteItems\":[]}', 'upms', 'default', 'application', NULL, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Commit` VALUES (4, '{\"createItems\":[{\"namespaceId\":3,\"key\":\"server.port\",\"value\":\"2001\",\"comment\":\"\",\"lineNum\":1,\"id\":62,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"spring.application.name\",\"value\":\"cloud-zuul\",\"comment\":\"\",\"lineNum\":2,\"id\":63,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.prefix\",\"value\":\"/api\",\"comment\":\"\",\"lineNum\":3,\"id\":64,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.ignored-services\",\"value\":\"*\",\"comment\":\"\",\"lineNum\":4,\"id\":65,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.sensitive-headers\",\"value\":\"\",\"comment\":\"\",\"lineNum\":5,\"id\":66,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.add-proxy-headers\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":6,\"id\":67,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.host.connect-timeout-millis\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":7,\"id\":68,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.host.socket-timeout-millis\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":8,\"id\":69,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.routes.upms.path\",\"value\":\"/upms/**\",\"comment\":\"\",\"lineNum\":9,\"id\":70,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.routes.upms.serviceId\",\"value\":\"cloud-upms\",\"comment\":\"\",\"lineNum\":10,\"id\":71,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.routes.auth.path\",\"value\":\"/auth/**\",\"comment\":\"\",\"lineNum\":11,\"id\":72,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"zuul.routes.auth.serviceId\",\"value\":\"cloud-auth\",\"comment\":\"\",\"lineNum\":12,\"id\":73,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"hystrix.command.default.execution.isolation.thread.timeout-in-milliseconds\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":13,\"id\":74,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"ribbon.eureka.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":14,\"id\":75,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"ribbon.ReadTimeout\",\"value\":\"60000\",\"comment\":\"\",\"lineNum\":15,\"id\":76,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"ribbon.ConnectTimeout\",\"value\":\"60000\",\"comment\":\"\",\"lineNum\":16,\"id\":77,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"eureka.instance.prefer-ip-address\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":17,\"id\":78,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"eureka.instance.lease-renewal-interval-in-seconds\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":18,\"id\":79,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"eureka.instance.lease-expiration-duration-in-seconds\",\"value\":\"20\",\"comment\":\"\",\"lineNum\":19,\"id\":80,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://localhost:2000/eureka/\",\"comment\":\"\",\"lineNum\":20,\"id\":81,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"urls.anon[0]\",\"value\":\"/api/auth/**\",\"comment\":\"\",\"lineNum\":21,\"id\":82,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"urls.anon[1]\",\"value\":\"/swagger-ui.html\",\"comment\":\"\",\"lineNum\":22,\"id\":83,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"urls.anon[2]\",\"value\":\"/webjars/**\",\"comment\":\"\",\"lineNum\":23,\"id\":84,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"urls.anon[3]\",\"value\":\"/swagger-resources/**\",\"comment\":\"\",\"lineNum\":24,\"id\":85,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"urls.anon[4]\",\"value\":\"/api/*/v2/api-docs\",\"comment\":\"\",\"lineNum\":25,\"id\":86,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"security.oauth2.client.client-id\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":26,\"id\":87,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"security.oauth2.client.client-secret\",\"value\":\"qiqi\",\"comment\":\"\",\"lineNum\":27,\"id\":88,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"},{\"namespaceId\":3,\"key\":\"security.oauth2.resource.jwt.key-uri\",\"value\":\"http://localhost:2002/oauth/token_key\",\"comment\":\"\",\"lineNum\":28,\"id\":89,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2018-10-29 15:20:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2018-10-29 15:20:46\"}],\"updateItems\":[],\"deleteItems\":[]}', 'zuul', 'default', 'application', NULL, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS `GrayReleaseRule`;
CREATE TABLE `GrayReleaseRule`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) NULL DEFAULT 1 COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '灰度规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS `Instance`;
CREATE TABLE `Instance`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`AppId`, `ClusterName`, `Ip`, `DataCenter`) USING BTREE,
  INDEX `IX_IP`(`Ip`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '使用配置的应用实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Instance
-- ----------------------------
INSERT INTO `Instance` VALUES (1, 'auth', 'default', '', '10.0.0.136', '2018-10-29 14:53:45', '2018-10-29 14:53:45');
INSERT INTO `Instance` VALUES (2, 'upms', 'default', '', '10.0.0.136', '2018-10-29 15:19:25', '2018-10-29 15:19:25');
INSERT INTO `Instance` VALUES (3, 'zuul', 'default', '', '10.0.0.136', '2018-10-29 15:21:39', '2018-10-29 15:21:39');

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS `InstanceConfig`;
CREATE TABLE `InstanceConfig`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp(0) NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`InstanceId`, `ConfigAppId`, `ConfigNamespaceName`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Valid_Namespace`(`ConfigAppId`, `ConfigClusterName`, `ConfigNamespaceName`, `DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用实例的配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of InstanceConfig
-- ----------------------------
INSERT INTO `InstanceConfig` VALUES (1, 1, 'auth', 'default', 'application', '20181029143701-7f36d2ab447e4c8f', '2018-10-29 14:53:44', '2018-10-29 14:53:44', '2018-10-29 14:53:44');
INSERT INTO `InstanceConfig` VALUES (2, 2, 'upms', 'default', 'application', '20181029151604-f0cfd2ab447e4c90', '2018-10-29 15:19:25', '2018-10-29 15:19:25', '2018-10-29 15:19:25');
INSERT INTO `InstanceConfig` VALUES (3, 3, 'zuul', 'default', 'application', '20181029152051-2a20d2ab447e4c91', '2018-10-29 15:21:39', '2018-10-29 15:21:39', '2018-10-29 15:21:39');

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS `Item`;
CREATE TABLE `Item`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `Key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `LineNum` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_GroupId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Item
-- ----------------------------
INSERT INTO `Item` VALUES (2, 1, 'server.port', '2002', '', 2, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (3, 1, 'eureka.instance.prefer-ip-address', 'true', '', 3, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (4, 1, 'eureka.instance.lease-renewal-interval-in-seconds', '5', '', 4, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (5, 1, 'eureka.instance.lease-expiration-duration-in-seconds', '20', '', 5, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (6, 1, 'eureka.client.serviceUrl.defaultZone', 'http://localhost:2000/eureka/', '', 6, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (7, 1, 'auth.clientId', 'qiqi', '', 7, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (8, 1, 'auth.clientSecret', 'qiqi', '', 8, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (9, 1, 'auth.scope', 'server', '', 9, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (10, 1, 'auth.tokenEnhancer', 'qiqi', '', 10, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (11, 1, 'auth.signKey', 'qiqi', '', 11, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (12, 1, 'auth.accessTokenValiditySeconds', '28800', '', 12, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (13, 1, 'auth.refreshTokenValiditySeconds', '28800', '', 13, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (14, 1, 'urls.anon[0]', '/oauth/**', '', 14, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (15, 1, 'urls.anon[1]', '/authentication/**', '', 15, b'0', 'apollo', '2018-10-29 14:34:11', 'apollo', '2018-10-29 14:34:11');
INSERT INTO `Item` VALUES (16, 1, 'spring.application.name', 'cloud-auth', '', 16, b'0', 'apollo', '2018-10-29 14:36:48', 'apollo', '2018-10-29 14:36:48');
INSERT INTO `Item` VALUES (17, 1, 'spring.jackson.date-format', 'yyyy-MM-dd HH:mm:ss', '', 17, b'0', 'apollo', '2018-10-29 14:36:48', 'apollo', '2018-10-29 14:36:48');
INSERT INTO `Item` VALUES (18, 1, 'spring.jackson.time-zone', 'GMT+8', '', 18, b'0', 'apollo', '2018-10-29 14:36:48', 'apollo', '2018-10-29 14:36:48');
INSERT INTO `Item` VALUES (19, 1, 'spring.servlet.multipart.max-file-size', '524288000', '', 19, b'0', 'apollo', '2018-10-29 14:36:48', 'apollo', '2018-10-29 14:36:48');
INSERT INTO `Item` VALUES (20, 1, 'spring.servlet.multipart.max-request-size', '524288000', '', 20, b'0', 'apollo', '2018-10-29 14:36:48', 'apollo', '2018-10-29 14:36:48');
INSERT INTO `Item` VALUES (21, 2, 'spring.application.name', 'cloud-upms', '', 1, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (22, 2, 'spring.jackson.date-format', 'yyyy-MM-dd HH:mm:ss', '', 2, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (23, 2, 'spring.jackson.time-zone', 'GMT+8', '', 3, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (24, 2, 'spring.servlet.multipart.max-file-size', '524288000', '', 4, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (25, 2, 'spring.servlet.multipart.max-request-size', '524288000', '', 5, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (26, 2, 'mybatis-plus.mapper-locations', 'classpath:mapper/*.xml', '', 6, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (27, 2, 'mybatis-plus.typeAliasesPackage', 'com.qiq.da.upms', '', 7, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (28, 2, 'mybatis-plus.global-config.db-config.id-type', 'AUTO', '', 8, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (29, 2, 'mybatis-plus.global-config.db-config.field-strategy', 'IGNORED', '', 9, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (30, 2, 'mybatis-plus.global-config.db-config.column-underline', 'true', '', 10, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (31, 2, 'mybatis-plus.global-config.refresh', 'true', '', 11, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (32, 2, 'mybatis-plus.configuration.map-underscore-to-camel-case', 'true', '', 12, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (33, 2, 'mybatis-plus.configuration.cache-enabled', 'false', '', 13, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (34, 2, 'executor.corePoolSize', '5', '', 14, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (35, 2, 'executor.maxPoolSize', '10', '', 15, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (36, 2, 'executor.keepAliveSeconds', '300', '', 16, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (37, 2, 'executor.queueCapacity', '9999', '', 17, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (38, 2, 'executor.threadNamePrefix', 'upms-service-', '', 18, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (39, 2, 'spring.datasource.druid.url', 'jdbc:mysql://10.0.0.130:3306/cloud_upms?characterEncoding=utf8&useSSL=true&verifyServerCertificate=false', '', 19, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (40, 2, 'spring.datasource.druid.username', 'root', '', 20, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (41, 2, 'spring.datasource.druid.password', '123456', '', 21, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (42, 2, 'spring.datasource.druid.driver-class-name', 'com.mysql.jdbc.Driver', '', 22, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (43, 2, 'spring.datasource.druid.initial-size', '5', '', 23, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (44, 2, 'spring.datasource.druid.min-idle', '5', '', 24, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (45, 2, 'spring.datasource.druid.max-active', '20', '', 25, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (46, 2, 'spring.datasource.druid.max-wait', '60000', '', 26, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (47, 2, 'spring.datasource.druid.time-between-eviction-runs-millis', '60000', '', 27, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (48, 2, 'spring.datasource.druid.min-evictable-idle-time-millis', '50000', '', 28, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (49, 2, 'spring.datasource.druid.validation-query', 'select \'x\'', '', 29, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (50, 2, 'spring.datasource.druid.test-on-borrow', 'true', '', 30, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (51, 2, 'spring.datasource.druid.test-on-return', 'false', '', 31, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (52, 2, 'spring.datasource.druid.test-while-idle', 'false', '', 32, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (53, 2, 'server.port', '3000', '', 33, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (54, 2, 'eureka.instance.prefer-ip-address', 'true', '', 34, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (55, 2, 'eureka.instance.lease-renewal-interval-in-seconds', '5', '', 35, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (56, 2, 'eureka.instance.lease-expiration-duration-in-seconds', '20', '', 36, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (57, 2, 'eureka.client.serviceUrl.defaultZone', 'http://localhost:2000/eureka/', '', 37, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (58, 2, 'urls.anon[0]', '/upmsUser/findUserByUsername/**', '', 38, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (59, 2, 'security.oauth2.client.client-id', 'qiqi', '', 39, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (60, 2, 'security.oauth2.client.client-secret', 'qiqi', '', 40, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (61, 2, 'security.oauth2.resource.jwt.key-uri', 'http://localhost:2002/oauth/token_key', '', 41, b'0', 'apollo', '2018-10-29 15:15:57', 'apollo', '2018-10-29 15:15:57');
INSERT INTO `Item` VALUES (62, 3, 'server.port', '2001', '', 1, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (63, 3, 'spring.application.name', 'cloud-zuul', '', 2, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (64, 3, 'zuul.prefix', '/api', '', 3, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (65, 3, 'zuul.ignored-services', '*', '', 4, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (66, 3, 'zuul.sensitive-headers', '', '', 5, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (67, 3, 'zuul.add-proxy-headers', 'true', '', 6, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (68, 3, 'zuul.host.connect-timeout-millis', '3000', '', 7, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (69, 3, 'zuul.host.socket-timeout-millis', '3000', '', 8, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (70, 3, 'zuul.routes.upms.path', '/upms/**', '', 9, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (71, 3, 'zuul.routes.upms.serviceId', 'cloud-upms', '', 10, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (72, 3, 'zuul.routes.auth.path', '/auth/**', '', 11, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (73, 3, 'zuul.routes.auth.serviceId', 'cloud-auth', '', 12, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (74, 3, 'hystrix.command.default.execution.isolation.thread.timeout-in-milliseconds', '3000', '', 13, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (75, 3, 'ribbon.eureka.enabled', 'true', '', 14, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (76, 3, 'ribbon.ReadTimeout', '60000', '', 15, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (77, 3, 'ribbon.ConnectTimeout', '60000', '', 16, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (78, 3, 'eureka.instance.prefer-ip-address', 'true', '', 17, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (79, 3, 'eureka.instance.lease-renewal-interval-in-seconds', '5', '', 18, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (80, 3, 'eureka.instance.lease-expiration-duration-in-seconds', '20', '', 19, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (81, 3, 'eureka.client.serviceUrl.defaultZone', 'http://localhost:2000/eureka/', '', 20, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (82, 3, 'urls.anon[0]', '/api/auth/**', '', 21, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (83, 3, 'urls.anon[1]', '/swagger-ui.html', '', 22, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (84, 3, 'urls.anon[2]', '/webjars/**', '', 23, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (85, 3, 'urls.anon[3]', '/swagger-resources/**', '', 24, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (86, 3, 'urls.anon[4]', '/api/*/v2/api-docs', '', 25, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (87, 3, 'security.oauth2.client.client-id', 'qiqi', '', 26, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (88, 3, 'security.oauth2.client.client-secret', 'qiqi', '', 27, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');
INSERT INTO `Item` VALUES (89, 3, 'security.oauth2.resource.jwt.key-uri', 'http://localhost:2002/oauth/token_key', '', 28, b'0', 'apollo', '2018-10-29 15:20:46', 'apollo', '2018-10-29 15:20:46');

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS `Namespace`;
CREATE TABLE `Namespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_NamespaceName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '命名空间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Namespace
-- ----------------------------
INSERT INTO `Namespace` VALUES (1, 'auth', 'default', 'application', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Namespace` VALUES (2, 'upms', 'default', 'application', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Namespace` VALUES (3, 'zuul', 'default', 'application', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS `NamespaceLock`;
CREATE TABLE `NamespaceLock`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `IsDeleted` bit(1) NULL DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_NamespaceId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'namespace的编辑锁' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS `Release`;
CREATE TABLE `Release`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_GroupName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Release
-- ----------------------------
INSERT INTO `Release` VALUES (1, '20181029143701-7f36d2ab447e4c8f', '20181029143656-release', '', 'auth', 'default', 'application', '{\"spring.jackson.time-zone\":\"GMT+8\",\"auth.scope\":\"server\",\"auth.accessTokenValiditySeconds\":\"28800\",\"spring.application.name\":\"cloud-auth\",\"urls.anon[1]\":\"/authentication/**\",\"auth.tokenEnhancer\":\"qiqi\",\"urls.anon[0]\":\"/oauth/**\",\"auth.signKey\":\"qiqi\",\"spring.servlet.multipart.max-file-size\":\"524288000\",\"eureka.instance.prefer-ip-address\":\"true\",\"spring.jackson.date-format\":\"yyyy-MM-dd HH:mm:ss\",\"auth.clientId\":\"qiqi\",\"eureka.instance.lease-renewal-interval-in-seconds\":\"5\",\"server.port\":\"2002\",\"auth.refreshTokenValiditySeconds\":\"28800\",\"spring.servlet.multipart.max-request-size\":\"524288000\",\"auth.clientSecret\":\"qiqi\",\"eureka.client.serviceUrl.defaultZone\":\"http://localhost:2000/eureka/\",\"eureka.instance.lease-expiration-duration-in-seconds\":\"20\"}', b'0', b'0', 'apollo', '2018-10-29 14:37:02', 'apollo', '2018-10-29 14:37:02');
INSERT INTO `Release` VALUES (2, '20181029151604-f0cfd2ab447e4c90', '20181029151559-release', '', 'upms', 'default', 'application', '{\"spring.jackson.time-zone\":\"GMT+8\",\"mybatis-plus.global-config.db-config.column-underline\":\"true\",\"spring.datasource.druid.max-active\":\"20\",\"spring.datasource.druid.min-idle\":\"5\",\"mybatis-plus.typeAliasesPackage\":\"com.qiq.da.upms\",\"spring.datasource.druid.password\":\"123456\",\"urls.anon[0]\":\"/upmsUser/findUserByUsername/**\",\"spring.datasource.druid.driver-class-name\":\"com.mysql.jdbc.Driver\",\"spring.datasource.druid.min-evictable-idle-time-millis\":\"50000\",\"spring.jackson.date-format\":\"yyyy-MM-dd HH:mm:ss\",\"security.oauth2.client.client-secret\":\"qiqi\",\"mybatis-plus.global-config.refresh\":\"true\",\"spring.datasource.druid.test-on-return\":\"false\",\"spring.datasource.druid.time-between-eviction-runs-millis\":\"60000\",\"executor.keepAliveSeconds\":\"300\",\"executor.queueCapacity\":\"9999\",\"server.port\":\"3000\",\"mybatis-plus.mapper-locations\":\"classpath:mapper/*.xml\",\"mybatis-plus.global-config.db-config.field-strategy\":\"IGNORED\",\"eureka.client.serviceUrl.defaultZone\":\"http://localhost:2000/eureka/\",\"spring.datasource.druid.test-on-borrow\":\"true\",\"executor.maxPoolSize\":\"10\",\"spring.datasource.druid.url\":\"jdbc:mysql://10.0.0.130:3306/cloud_upms?characterEncoding\\u003dutf8\\u0026useSSL\\u003dtrue\\u0026verifyServerCertificate\\u003dfalse\",\"spring.datasource.druid.validation-query\":\"select \\u0027x\\u0027\",\"executor.threadNamePrefix\":\"upms-service-\",\"mybatis-plus.configuration.cache-enabled\":\"false\",\"spring.datasource.druid.test-while-idle\":\"false\",\"spring.application.name\":\"cloud-upms\",\"spring.servlet.multipart.max-file-size\":\"524288000\",\"security.oauth2.resource.jwt.key-uri\":\"http://localhost:2002/oauth/token_key\",\"spring.datasource.druid.username\":\"root\",\"eureka.instance.prefer-ip-address\":\"true\",\"security.oauth2.client.client-id\":\"qiqi\",\"spring.datasource.druid.initial-size\":\"5\",\"eureka.instance.lease-renewal-interval-in-seconds\":\"5\",\"spring.servlet.multipart.max-request-size\":\"524288000\",\"mybatis-plus.configuration.map-underscore-to-camel-case\":\"true\",\"mybatis-plus.global-config.db-config.id-type\":\"AUTO\",\"executor.corePoolSize\":\"5\",\"spring.datasource.druid.max-wait\":\"60000\",\"eureka.instance.lease-expiration-duration-in-seconds\":\"20\"}', b'0', b'0', 'apollo', '2018-10-29 15:16:04', 'apollo', '2018-10-29 15:16:04');
INSERT INTO `Release` VALUES (3, '20181029152051-2a20d2ab447e4c91', '20181029152049-release', '', 'zuul', 'default', 'application', '{\"hystrix.command.default.execution.isolation.thread.timeout-in-milliseconds\":\"3000\",\"urls.anon[2]\":\"/webjars/**\",\"zuul.add-proxy-headers\":\"true\",\"urls.anon[0]\":\"/api/auth/**\",\"zuul.routes.auth.serviceId\":\"cloud-auth\",\"zuul.ignored-services\":\"*\",\"zuul.host.socket-timeout-millis\":\"3000\",\"ribbon.ReadTimeout\":\"60000\",\"security.oauth2.client.client-secret\":\"qiqi\",\"ribbon.eureka.enabled\":\"true\",\"urls.anon[4]\":\"/api/*/v2/api-docs\",\"server.port\":\"2001\",\"zuul.routes.upms.path\":\"/upms/**\",\"eureka.client.serviceUrl.defaultZone\":\"http://localhost:2000/eureka/\",\"zuul.routes.auth.path\":\"/auth/**\",\"zuul.sensitive-headers\":\"\",\"spring.application.name\":\"cloud-zuul\",\"ribbon.ConnectTimeout\":\"60000\",\"zuul.prefix\":\"/api\",\"urls.anon[1]\":\"/swagger-ui.html\",\"security.oauth2.resource.jwt.key-uri\":\"http://localhost:2002/oauth/token_key\",\"zuul.host.connect-timeout-millis\":\"3000\",\"eureka.instance.prefer-ip-address\":\"true\",\"zuul.routes.upms.serviceId\":\"cloud-upms\",\"security.oauth2.client.client-id\":\"qiqi\",\"eureka.instance.lease-renewal-interval-in-seconds\":\"5\",\"urls.anon[3]\":\"/swagger-resources/**\",\"eureka.instance.lease-expiration-duration-in-seconds\":\"20\"}', b'0', b'0', 'apollo', '2018-10-29 15:20:51', 'apollo', '2018-10-29 15:20:51');

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseHistory`;
CREATE TABLE `ReleaseHistory`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`, `BranchName`) USING BTREE,
  INDEX `IX_ReleaseId`(`ReleaseId`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ReleaseHistory
-- ----------------------------
INSERT INTO `ReleaseHistory` VALUES (1, 'auth', 'default', 'application', 'default', 1, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2018-10-29 14:37:02', 'apollo', '2018-10-29 14:37:02');
INSERT INTO `ReleaseHistory` VALUES (2, 'upms', 'default', 'application', 'default', 2, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2018-10-29 15:16:04', 'apollo', '2018-10-29 15:16:04');
INSERT INTO `ReleaseHistory` VALUES (3, 'zuul', 'default', 'application', 'default', 3, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2018-10-29 15:20:51', 'apollo', '2018-10-29 15:20:51');

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseMessage`;
CREATE TABLE `ReleaseMessage`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Message`(`Message`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ReleaseMessage
-- ----------------------------
INSERT INTO `ReleaseMessage` VALUES (1, 'auth+default+application', '2018-10-29 14:37:02');
INSERT INTO `ReleaseMessage` VALUES (2, 'upms+default+application', '2018-10-29 15:16:04');
INSERT INTO `ReleaseMessage` VALUES (3, 'zuul+default+application', '2018-10-29 15:20:51');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Key`(`Key`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'eureka.service.url', 'default', 'http://localhost:2000/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2018-10-29 01:50:55', '', '2018-10-29 02:32:26');
INSERT INTO `ServerConfig` VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2018-10-29 01:50:55', '', '2018-10-29 01:50:55');
INSERT INTO `ServerConfig` VALUES (3, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2018-10-29 01:50:55', '', '2018-10-29 01:50:55');
INSERT INTO `ServerConfig` VALUES (4, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2018-10-29 01:50:55', '', '2018-10-29 01:50:55');
INSERT INTO `ServerConfig` VALUES (5, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2018-10-29 01:50:55', '', '2018-10-29 01:50:55');

SET FOREIGN_KEY_CHECKS = 1;
