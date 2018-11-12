/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 10.0.0.130:3306
 Source Schema         : ApolloPortalDB

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 29/10/2018 15:41:58
*/
CREATE DATABASE IF NOT EXISTS ApolloPortalDB DEFAULT CHARACTER SET = utf8mb4;
Use ApolloPortalDB;

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
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS `Authorities`;
CREATE TABLE `Authorities`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Authorities
-- ----------------------------
INSERT INTO `Authorities` VALUES (1, 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS `Consumer`;
CREATE TABLE `Consumer`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
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
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开放API消费者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerAudit`;
CREATE TABLE `ConsumerAudit`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ConsumerId`(`ConsumerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerRole`;
CREATE TABLE `ConsumerRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_ConsumerId_RoleId`(`ConsumerId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerToken`;
CREATE TABLE `ConsumerToken`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime(0) NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_Token`(`Token`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT 10000 COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `IX_UserId`(`UserId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_TargetId_PermissionType`(`TargetId`(191), `PermissionType`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'permission表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Permission
-- ----------------------------
INSERT INTO `Permission` VALUES (1, 'CreateCluster', 'auth', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Permission` VALUES (2, 'CreateNamespace', 'auth', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Permission` VALUES (3, 'AssignRole', 'auth', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Permission` VALUES (4, 'ModifyNamespace', 'auth+application', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Permission` VALUES (5, 'ReleaseNamespace', 'auth+application', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Permission` VALUES (6, 'ModifyNamespace', 'auth+application+DEV', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Permission` VALUES (7, 'ReleaseNamespace', 'auth+application+DEV', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Permission` VALUES (8, 'CreateCluster', 'upms', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Permission` VALUES (9, 'CreateNamespace', 'upms', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Permission` VALUES (10, 'AssignRole', 'upms', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Permission` VALUES (11, 'ModifyNamespace', 'upms+application', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Permission` VALUES (12, 'ReleaseNamespace', 'upms+application', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Permission` VALUES (13, 'ModifyNamespace', 'upms+application+DEV', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Permission` VALUES (14, 'ReleaseNamespace', 'upms+application+DEV', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Permission` VALUES (15, 'CreateCluster', 'zuul', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Permission` VALUES (16, 'CreateNamespace', 'zuul', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Permission` VALUES (17, 'AssignRole', 'zuul', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Permission` VALUES (18, 'ModifyNamespace', 'zuul+application', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Permission` VALUES (19, 'ReleaseNamespace', 'zuul+application', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Permission` VALUES (20, 'ModifyNamespace', 'zuul+application+DEV', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Permission` VALUES (21, 'ReleaseNamespace', 'zuul+application+DEV', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_RoleName`(`RoleName`(191)) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT INTO `Role` VALUES (1, 'Master+auth', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Role` VALUES (2, 'ModifyNamespace+auth+application', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Role` VALUES (3, 'ReleaseNamespace+auth+application', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Role` VALUES (4, 'ModifyNamespace+auth+application+DEV', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Role` VALUES (5, 'ReleaseNamespace+auth+application+DEV', b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `Role` VALUES (6, 'Master+upms', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Role` VALUES (7, 'ModifyNamespace+upms+application', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Role` VALUES (8, 'ReleaseNamespace+upms+application', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Role` VALUES (9, 'ModifyNamespace+upms+application+DEV', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Role` VALUES (10, 'ReleaseNamespace+upms+application+DEV', b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `Role` VALUES (11, 'Master+zuul', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Role` VALUES (12, 'ModifyNamespace+zuul+application', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Role` VALUES (13, 'ReleaseNamespace+zuul+application', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Role` VALUES (14, 'ModifyNamespace+zuul+application+DEV', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `Role` VALUES (15, 'ReleaseNamespace+zuul+application+DEV', b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS `RolePermission`;
CREATE TABLE `RolePermission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_PermissionId`(`PermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和权限的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
INSERT INTO `RolePermission` VALUES (1, 1, 1, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `RolePermission` VALUES (2, 1, 2, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `RolePermission` VALUES (3, 1, 3, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `RolePermission` VALUES (4, 2, 4, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `RolePermission` VALUES (5, 3, 5, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `RolePermission` VALUES (6, 4, 6, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `RolePermission` VALUES (7, 5, 7, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `RolePermission` VALUES (8, 6, 8, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `RolePermission` VALUES (9, 6, 9, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `RolePermission` VALUES (10, 6, 10, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `RolePermission` VALUES (11, 7, 11, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `RolePermission` VALUES (12, 8, 12, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `RolePermission` VALUES (13, 9, 13, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `RolePermission` VALUES (14, 10, 14, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `RolePermission` VALUES (15, 11, 15, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `RolePermission` VALUES (16, 11, 16, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `RolePermission` VALUES (17, 11, 17, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `RolePermission` VALUES (18, 12, 18, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `RolePermission` VALUES (19, 13, 19, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `RolePermission` VALUES (20, 14, 20, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `RolePermission` VALUES (21, 15, 21, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2018-10-29 01:51:17', '', '2018-10-29 01:51:17');
INSERT INTO `ServerConfig` VALUES (2, 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', b'0', 'default', '2018-10-29 01:51:17', '', '2018-10-29 01:51:17');
INSERT INTO `ServerConfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2018-10-29 01:51:17', '', '2018-10-29 01:51:17');
INSERT INTO `ServerConfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2018-10-29 01:51:17', '', '2018-10-29 01:51:17');
INSERT INTO `ServerConfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2018-10-29 01:51:17', '', '2018-10-29 01:51:17');
INSERT INTO `ServerConfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2018-10-29 01:51:17', '', '2018-10-29 01:51:17');
INSERT INTO `ServerConfig` VALUES (7, 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2018-10-29 01:51:17', '', '2018-10-29 01:51:17');

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_UserId_RoleId`(`UserId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT INTO `UserRole` VALUES (1, 'apollo', 1, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `UserRole` VALUES (2, 'apollo', 2, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `UserRole` VALUES (3, 'apollo', 3, b'0', 'apollo', '2018-10-29 14:30:09', 'apollo', '2018-10-29 14:30:09');
INSERT INTO `UserRole` VALUES (4, 'apollo', 6, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `UserRole` VALUES (5, 'apollo', 7, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `UserRole` VALUES (6, 'apollo', 8, b'0', 'apollo', '2018-10-29 15:15:06', 'apollo', '2018-10-29 15:15:06');
INSERT INTO `UserRole` VALUES (7, 'apollo', 11, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `UserRole` VALUES (8, 'apollo', 12, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');
INSERT INTO `UserRole` VALUES (9, 'apollo', 13, b'0', 'apollo', '2018-10-29 15:16:55', 'apollo', '2018-10-29 15:16:55');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
