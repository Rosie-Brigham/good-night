/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : goodnight

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2014-11-08 13:51:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for drink
-- ----------------------------
DROP TABLE IF EXISTS `drink`;
CREATE TABLE `drink` (
`drink_id`  int(11) NOT NULL ,
PRIMARY KEY (`drink_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of drink
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`user_id`  int(11) NOT NULL ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fb_id`  bigint(20) NULL DEFAULT NULL ,
`gender`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`dob`  date NULL DEFAULT NULL ,
`height_m`  double NULL DEFAULT NULL ,
`weight_kg`  double NULL DEFAULT NULL ,
PRIMARY KEY (`user_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_drink
-- ----------------------------
DROP TABLE IF EXISTS `user_drink`;
CREATE TABLE `user_drink` (
`user_drink_id`  int(11) NOT NULL ,
`user_id`  int(11) NULL DEFAULT NULL ,
`drink_id`  int(11) NULL DEFAULT NULL ,
`user_drink_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`user_drink_id`),
FOREIGN KEY (`drink_id`) REFERENCES `drink` (`drink_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_user_drink_user` (`user_id`) USING BTREE ,
INDEX `FK_user_drink_drink` (`drink_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of user_drink
-- ----------------------------
BEGIN;
COMMIT;
