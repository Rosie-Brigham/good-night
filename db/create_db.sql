/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : goodnight

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2014-11-08 14:33:14
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
-- Table structure for night
-- ----------------------------
DROP TABLE IF EXISTS `night`;
CREATE TABLE `night` (
`night_id`  int(11) NOT NULL ,
`user_id`  int(11) NULL DEFAULT NULL ,
`start_datetime`  datetime NULL DEFAULT NULL ,
`end_datetime`  datetime NULL DEFAULT NULL ,
`runtot_calories`  double(255,0) NULL DEFAULT NULL ,
`runtot_units`  double(255,0) NULL DEFAULT NULL ,
PRIMARY KEY (`night_id`),
FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_night_user` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of night
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for night_drink
-- ----------------------------
DROP TABLE IF EXISTS `night_drink`;
CREATE TABLE `night_drink` (
`night_drink_id`  int(11) NOT NULL ,
`night_id`  int(11) NULL DEFAULT NULL ,
`drink_id`  int(11) NULL DEFAULT NULL ,
`night_drink_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`night_drink_id`),
FOREIGN KEY (`drink_id`) REFERENCES `drink` (`drink_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`night_id`) REFERENCES `night` (`night_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_night_drink_drink` (`drink_id`) USING BTREE ,
INDEX `FK_night_drink_night` (`night_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of night_drink
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
