/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : partner

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 12/02/2023 21:52:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户标识',
  `deleted` int(255) NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '动态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES (2, '测试111223', '测试内容22222', 'http://localhost:9090/file/download/444712ae155d47b4b204bf976f5a2298.png', '测试22222', '2022-11-29 21:37:24', '2022-11-29 21:37:26', '4918ea50c06a458f94878abe741b4f51', 0);
INSERT INTO `dynamic` VALUES (3, '我导入了数据真的很牛皮', '三个小6扣起来', 'http://localhost:9090/file/download/a6c3c928a74e42f28515e54c9df5cfff.png', '三个小6扣起来', '2022-11-29 21:37:24', '2022-11-29 21:37:26', '4918ea50c06a458f94878abe741b4f51', 0);
INSERT INTO `dynamic` VALUES (4, '真的很牛逼哦1', '真的很牛逼哦2', 'http://localhost:9090/file/download/65cd46a7c5934258a19fedc27fce2d36.png', '真的很牛逼哦4', '2023-01-13 20:56:35', '2023-01-13 20:56:35', '4918ea50c06a458f94878abe741b4f51', 0);
INSERT INTO `dynamic` VALUES (7, '带上小米手机，去捕捉生活中的闪光时刻吧', '\n「小米手机可以这样拍」是一个以展示小米手机相机操作为主的短视频栏目，由小米社区联合小米手机相机部门联合推出，每周一、三、五上线一期。', 'http://localhost:9090/file/download/dca4682457df42eba18437fa8de184b9.jpg', ' 「小米手机可以这样拍」是一个以展示小米手机相机操作为主的短视频栏目，由小米社区联合小米手机相机部门联合推出，每周一、三、五上线一期。', '2023-01-13 21:10:21', '2023-01-13 21:10:21', '4918ea50c06a458f94878abe741b4f51', 0);
INSERT INTO `dynamic` VALUES (8, '老腊肉的小黑子日常', '每年到了冬至时节，上海人除了会做“冬至团”还有一项工作就是腌咸肉酱油肉，西北风一吹，香得不得了。 老上海人几乎家家户户都有一口大缸和一块大', 'http://localhost:9090/file/download/b5b428199fec4d2d96dc65ee5075808d.jpg', 'ikun超级粉日常', '2023-02-12 20:42:29', '2023-02-12 20:42:29', '4918ea50c06a458f94878abe741b4f51', 0);
INSERT INTO `dynamic` VALUES (9, '小黑子的日常', '小黑子的日常小黑子的日常小黑子的日常', 'http://localhost:9090/file/download/c67332cdf0ad466b9b905d252d52494f.jpg', '小黑子的日常小黑子的日常小黑子的日常小黑子的日常', '2023-02-12 20:49:21', '2023-02-12 20:49:21', '4918ea50c06a458f94878abe741b4f51', 0);

-- ----------------------------
-- Table structure for im
-- ----------------------------
DROP TABLE IF EXISTS `im`;
CREATE TABLE `im`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户编号',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个性签名',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息文字',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im
-- ----------------------------
INSERT INTO `im` VALUES (1, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '11122222', '2023-02-09 21:46:10', NULL);
INSERT INTO `im` VALUES (2, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '4444', '2023-02-09 21:46:28', NULL);
INSERT INTO `im` VALUES (3, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, 'vvvvvv', '2023-02-09 21:48:29', NULL);
INSERT INTO `im` VALUES (4, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '33333', '2023-02-09 21:49:31', NULL);
INSERT INTO `im` VALUES (5, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '223333333', '2023-02-09 21:54:07', NULL);
INSERT INTO `im` VALUES (6, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '3333333', '2023-02-09 21:54:36', NULL);
INSERT INTO `im` VALUES (7, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '6666666', '2023-02-09 21:54:41', NULL);
INSERT INTO `im` VALUES (8, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '77777', '2023-02-09 21:54:49', NULL);
INSERT INTO `im` VALUES (9, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '7788888', '2023-02-09 21:54:55', NULL);
INSERT INTO `im` VALUES (10, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '99999', '2023-02-09 21:55:02', NULL);
INSERT INTO `im` VALUES (11, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '11111111', '2023-02-09 21:55:05', NULL);
INSERT INTO `im` VALUES (12, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '6666666', '2023-02-09 21:56:33', NULL);
INSERT INTO `im` VALUES (13, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '88888', '2023-02-09 21:56:36', NULL);
INSERT INTO `im` VALUES (14, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '🎎🎖️🎖️🏆🏆🥇🥇', '2023-02-09 21:56:41', NULL);
INSERT INTO `im` VALUES (15, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '55555🎟️🎄🎄😊🥇🎟️😊🎟️🤫😄😚🏆😊😄', '2023-02-09 21:56:51', NULL);
INSERT INTO `im` VALUES (16, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '33333333🐯🐶🐈🎎🎖️🎄🥇🎟️🤫', '2023-02-09 21:59:44', NULL);
INSERT INTO `im` VALUES (17, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '44444🎎🐶🎟️👉✋✋👈👊', '2023-02-09 21:59:55', NULL);
INSERT INTO `im` VALUES (18, '4918ea50c06a458f94878abe741b4f51', 'rgg123', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '2122222🙌🙌👏👉👊👊🤛🤛👉', '2023-02-09 22:01:49', NULL);
INSERT INTO `im` VALUES (19, '4918ea50c06a458f94878abe742ert34', 'ngg', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, '333333333🍎🥭🍍🍎🥭', '2023-02-09 22:01:57', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `deleted` int(11) NULL DEFAULT 0 COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `c_d`(`code`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user', 'user', 'icon', 0);
INSERT INTO `sys_dict` VALUES (2, 'message', 'message', 'icon', 0);
INSERT INTO `sys_dict` VALUES (3, 'menu', 'menu', 'icon', 0);
INSERT INTO `sys_dict` VALUES (4, 'grid', 'grid', 'icon', 0);
INSERT INTO `sys_dict` VALUES (5, 'house', 'house', 'icon', 0);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `orders` int(11) NULL DEFAULT 1 COMMENT '顺序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'grid' COMMENT '图标',
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型，1目录  2菜单 3按钮',
  `hide` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `a_d_index`(`auth`, `deleted`) USING BTREE,
  UNIQUE INDEX `p_p_d_index`(`path`, `page`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '系统管理', '', 2, 'menu', NULL, NULL, NULL, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 1, 0);
INSERT INTO `sys_permission` VALUES (3, '用户管理', 'user', 1, 'grid', 'User', 'user.list', 1, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 2, 0);
INSERT INTO `sys_permission` VALUES (4, '用户新增', '', 1, 'grid', '', 'user.add', 3, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (8, '用户编辑', '', 1, 'grid', NULL, 'user.edit', 3, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (9, '用户删除', NULL, 1, 'grid', NULL, 'user.delete', 3, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (10, '角色管理', 'role', 1, 'grid', 'Role', 'role.list', 1, 0, '2023-01-31 20:32:59', '2023-01-31 20:32:59', 2, 0);
INSERT INTO `sys_permission` VALUES (11, '权限管理', 'permission', 1, 'grid', 'Permission', 'permission.list', 1, 0, '2023-01-31 20:33:25', '2023-01-31 20:33:25', 2, 0);
INSERT INTO `sys_permission` VALUES (12, '首页', 'home', 1, 'house', 'Home', NULL, NULL, 0, '2023-01-31 21:03:00', '2023-01-31 21:03:00', 2, 0);
INSERT INTO `sys_permission` VALUES (13, '数据字典管理', 'dict', 1, 'grid', 'Dict', 'dict.list', 1, 0, '2023-02-02 20:41:32', '2023-02-02 20:41:32', 2, 0);
INSERT INTO `sys_permission` VALUES (14, '批量删除', NULL, 1, 'grid', NULL, 'user.deleteBatch', 3, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (15, '用户导入', NULL, 1, 'grid', NULL, 'user.import', 3, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (16, '用户导出', NULL, 1, 'grid', NULL, 'user.export', 3, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (17, '聊天管理', 'im', 1, 'grid', 'Im', 'im.list', NULL, 0, '2023-02-09 21:35:17', '2023-02-09 21:35:17', 2, 0);
INSERT INTO `sys_permission` VALUES (27, '动态管理', 'dynamic', 1, 'grid', 'Dynamic', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (28, '动态查询', NULL, 1, 'grid', NULL, 'dynamic.list', 27, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (29, '动态新增', NULL, 1, 'grid', NULL, 'dynamic.add', 27, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (30, '动态导入', NULL, 1, 'grid', NULL, 'dynamic.import', 27, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (31, '动态导出', NULL, 1, 'grid', NULL, 'dynamic.export', 27, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (32, '批量删除', NULL, 1, 'grid', NULL, 'dynamic.deleteBatch', 27, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (33, '动态编辑', NULL, 1, 'grid', NULL, 'dynamic.edit', 27, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (34, '动态删除', NULL, 1, 'grid', NULL, 'dynamic.delete', 27, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (35, '热门动态', NULL, 1, 'grid', NULL, 'dynamic.list.hot', 27, 0, '2023-02-12 21:24:34', '2023-02-12 21:24:34', 3, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flag_deleted_idnex`(`flag`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'ADMIN', 0, '2023-01-16 19:49:44', '2023-01-16 19:49:55');
INSERT INTO `sys_role` VALUES (3, '普通用户', 'USER', 0, '2023-01-16 19:50:41', '2023-01-16 19:50:41');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (246, 1, 1);
INSERT INTO `sys_role_permission` VALUES (247, 1, 3);
INSERT INTO `sys_role_permission` VALUES (248, 1, 4);
INSERT INTO `sys_role_permission` VALUES (249, 1, 8);
INSERT INTO `sys_role_permission` VALUES (250, 1, 9);
INSERT INTO `sys_role_permission` VALUES (251, 1, 10);
INSERT INTO `sys_role_permission` VALUES (252, 1, 11);
INSERT INTO `sys_role_permission` VALUES (253, 1, 12);
INSERT INTO `sys_role_permission` VALUES (254, 1, 13);
INSERT INTO `sys_role_permission` VALUES (255, 1, 14);
INSERT INTO `sys_role_permission` VALUES (256, 1, 15);
INSERT INTO `sys_role_permission` VALUES (257, 1, 16);
INSERT INTO `sys_role_permission` VALUES (258, 1, 17);
INSERT INTO `sys_role_permission` VALUES (259, 1, 27);
INSERT INTO `sys_role_permission` VALUES (260, 1, 28);
INSERT INTO `sys_role_permission` VALUES (261, 1, 29);
INSERT INTO `sys_role_permission` VALUES (262, 1, 30);
INSERT INTO `sys_role_permission` VALUES (263, 1, 31);
INSERT INTO `sys_role_permission` VALUES (264, 1, 32);
INSERT INTO `sys_role_permission` VALUES (265, 1, 33);
INSERT INTO `sys_role_permission` VALUES (266, 1, 34);
INSERT INTO `sys_role_permission` VALUES (268, 3, 12);
INSERT INTO `sys_role_permission` VALUES (267, 3, 27);
INSERT INTO `sys_role_permission` VALUES (269, 3, 35);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户唯一id',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 0存在  id删除',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个性签名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`, `deleted`) USING BTREE,
  UNIQUE INDEX `email_index`(`email`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'rgg', '$2a$10$NdI471zJAPs7wvvVhSEXbuCxjr7ZA//xqYxOqHOXxIcW3xUrU/TOu', 'rgg123456', 'xqnode@163.com', '合肥市政务区', '4918ea50c06a458f94878abe741b4f51', 0, '2022-12-09 20:08:17', '2022-12-09 20:08:17', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', 'ADMIN', NULL);
INSERT INTO `sys_user` VALUES (2, 'bgg', '$2a$10$GMrMcVqC6nmefRENrgjWXeTHd4bvkwI/lYA0PkT01A.UkPwjq5Pym', 'bgg123456', 'xqnode1@163.com', '合肥市科大', '4918ea50c06a458f94878abe742131as', 2, NULL, '2023-02-02 22:36:23', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', 'USER', NULL);
INSERT INTO `sys_user` VALUES (3, 'ngg', '$2a$10$GMrMcVqC6nmefRENrgjWXeTHd4bvkwI/lYA0PkT01A.UkPwjq5Pym', 'ngg', '1', '合肥市图书馆', '4918ea50c06a458f94878abe742ert34', 0, NULL, '2023-01-29 11:20:30', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', 'USER', NULL);
INSERT INTO `sys_user` VALUES (4, 'mgg', '$2a$10$DS/R8r9TFena7ig1t4B.8eA3yLw1uTnmqiriEnnDxUT6.3yVz3HYy', '麦克111', 'mgg@163.com', '合肥市庐阳区', '4d144eeb49674271b2116d0a9793071c', 0, '2023-01-09 21:23:41', '2023-01-09 21:23:41', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', 'USER', NULL);
INSERT INTO `sys_user` VALUES (5, 'vgg', '$2a$10$kd/qJHiY8NY2Q5miTk3nSu2HDNw1kKpNBHHCKIpgNDxPxivjqVZHS', '微微', 'vv@qq.com', '合肥市新站区', 'b134172712c146ffa4a7d92fe3065c58', 0, '2023-01-09 21:24:23', '2023-01-09 21:24:23', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', 'USER', NULL);
INSERT INTO `sys_user` VALUES (6, 'lgg', '$2a$10$7kC0JSmoMWyBeoHZnIlqvuhDG/NV2/hgysV9Cy5DZ3KhdeUSLPWYi', '啦啦啦', 'lgg@163.com', '合肥市政务区', '5fb5e806e3bd47998c233e5fd4ddd9ed', 6, '2023-01-09 21:25:21', '2023-01-11 20:30:17', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, NULL);
INSERT INTO `sys_user` VALUES (7, 'lgg1', '$2a$10$kqpZwCWQJo3AYo17bfbTq./GNSSfq.pWqHsg7tHKM.r5K7t6EAJv6', '啦啦啦1', 'lgg11@163.com', '合肥市政务区', '31c444962184473e817cbdabc2c7eda7', 7, '2023-01-09 21:25:52', '2023-01-11 20:30:17', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, NULL);
INSERT INTO `sys_user` VALUES (8, 'cgg1', '$2a$10$bBnfsYfJJvshjk5d9DNu5O1mitdAOomBoVBfMZw1lm39UyokJrVG6', 'CAA1', 'cgg1@qq.com', '合肥市蜀山区1', '875068f088a7481cbb15f84f0e598b8c', 8, '2023-01-09 21:26:33', '2023-01-11 20:30:14', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 'ygg1', '$2a$10$B5h2DD1LHFVrOB/x0W/AF.QgVnx57w9CrMw3ZAFyt7y9CbJK2pxQe', '呀呀呀1', 'ygg1@qq.com', '合肥市2222', '86e865d243cb4d039b4a011656a013a3', 9, '2023-01-09 21:51:16', '2023-01-09 21:56:16', 'http://localhost:9090/file/download/c35639eeb6824f5d887e86eb04fa2501.png', NULL, NULL);
INSERT INTO `sys_user` VALUES (10, 'acc', '$2a$10$sGuSBqboDWTIcGIgQyQ.6OtfK1K2IvMwHPIKb8eRpBJafhFtNi55u', '系统用户nhozq9', 'acc@163.com', '合肥市政务区', 'c4ce46d5f05c4b769da263fe6faedbbd', 10, '2023-01-11 20:15:32', '2023-01-11 20:30:14', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (11, 'acc1', '$2a$10$fNZZUDw00beUme0cnj9kyuaH3ehzJC/D04B95JztER3/B8w.irq/W', '系统用户4jqdlw', 'acc1@163.com', '合肥市政务区', 'e6d42290806c42fe8ed2f338949020e7', 11, '2023-01-11 20:15:32', '2023-01-11 20:30:09', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (12, 'acc2', '$2a$10$d9hMi0anGz7MFT2afLa/xe1p4v1d4oMDflm7BAkK0u3dJpzzwObTK', '系统用户l4e1l5', 'acc2@163.com', '合肥市政务区', 'c38cab03cdd9454494b7ff07973e9839', 12, '2023-01-11 20:17:41', '2023-01-11 20:29:59', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 'acc3', '$2a$10$/pcccH2OgJzkKO9M5jJ5ouWszn4wUrTXBTCeFA6Jx30mhBbwsXDiO', '系统用户xl7e4q', 'acc3@163.com', '合肥市政务区', '0ec9c217a6a344a7a3ab008f4bd9f62b', 13, '2023-01-11 20:17:41', '2023-01-11 20:24:46', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (14, 'njj', '$2a$10$tx0fp6.3cU9g/VNz/nPMY.3ULcINaV9Dt3q9KmSFCR/5q6cG1j0B6', 'njj', 'njj@qq.com', '合肥市', 'd4d33c27834444ba81b98fe5e99e183d', 14, '2023-01-16 19:49:02', '2023-02-02 22:36:13', NULL, 'ADMIN', NULL);
INSERT INTO `sys_user` VALUES (15, 'zzz', '$2a$10$/sk2nU6etdDOjzFEN9qgC.O/yct6COykSoTk7tDrv8lDNay5J.zYy', '系统用户nxyn4z', 'zzz@qq.com', NULL, '0843a13e05364b25b6d2a6b2cd89d807', 15, '2023-02-02 22:21:27', '2023-02-02 22:36:13', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (16, 'zzz1', '$2a$10$aUAismbA98BDKEoAHjUUfOU5L.Cr2ki7Tcn7O5BiG9sROucVQh1.m', '系统用户ams9ab', 'zzz1@qq.com', NULL, '633aab2eac50405387ae3e854527651f', 16, '2023-02-02 22:29:04', '2023-02-02 22:36:13', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
