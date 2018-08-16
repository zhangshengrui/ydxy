/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.28 : Database - rbac
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rbac` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `rbac`;

/*Table structure for table `rbac_button` */

DROP TABLE IF EXISTS `rbac_button`;

CREATE TABLE `rbac_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '按钮主键id',
  `button_name` varchar(255) DEFAULT NULL COMMENT '按钮名称',
  `button_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `menu_id_f` int(11) DEFAULT NULL COMMENT '所属菜单id',
  `button_url` varchar(255) DEFAULT NULL COMMENT '按钮事件url',
  `button_status` int(11) DEFAULT '0' COMMENT '启用状态（0：正常，1：禁用）',
  `button_handler` varchar(255) DEFAULT NULL COMMENT '点击按钮执行的js函数名称',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='按钮权限表';

/*Data for the table `rbac_button` */

insert  into `rbac_button`(`button_id`,`button_name`,`button_icon`,`menu_id_f`,`button_url`,`button_status`,`button_handler`) values (18,'添加权限模块','icon-add',15,'/permission/insert.*.do',0,'openInsert'),(19,'删除','icon-cut',15,'/permission/deleteTree.do',0,'deleteRow'),(20,'修改','icon-edit',15,'/permission/moveTree.do',0,'editRow'),(21,'提交修改','icon-save',15,'/permission/updateTree.do',0,'saveRow'),(22,'放弃修改','icon-cancel',15,'',0,'undoEdit'),(23,'增加','icon-add',5,'/rbac/data/user/insert.do',0,'openInsertDialog'),(24,'删除','icon-cut',5,'/rbac/data/user/delete/.*.do',0,'openDeleteDialog'),(25,'修改','icon-save',5,'/rbac/data/user/update.do',0,'openEditDialog'),(26,'授权','icon-lock',5,'/rbac/data/user/role/.*.do',0,'openRoleDialog'),(27,'增加','icon-add',14,'/rbac/role/(validate|add).do',0,'openInsertDialog'),(28,'删除','icon-cut',14,'/rbac/role/delete.do',0,'openDeleteDialog'),(29,'修改','icon-edit',14,'/rbac/role/(validate2|edit).do',0,'openEditDialog'),(30,'编辑角色权限','icon-edit',14,'/rbac/role/editPermissions.do',0,'openEditPermissionDialog');

/*Table structure for table `rbac_iconcls` */

DROP TABLE IF EXISTS `rbac_iconcls`;

CREATE TABLE `rbac_iconcls` (
  `iconCls` varchar(100) DEFAULT NULL COMMENT '图标样式的class名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rbac_iconcls` */

insert  into `rbac_iconcls`(`iconCls`) values ('icon-anchor'),('icon-application'),('icon-chart_bar'),('icon-setting'),('icon-home'),('icon-table'),('icon-lock_open'),('icon-arrow_undo'),('icon-asterisk_orange'),('icon-asterisk_orange_left'),('icon-man'),('icon-cancel'),('icon-user'),('icon-add'),('icon-cut'),('icon-edit'),('icon-save'),('icon-door-out'),('icon-lock');

/*Table structure for table `rbac_menu` */

DROP TABLE IF EXISTS `rbac_menu`;

CREATE TABLE `rbac_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单主键id',
  `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) NOT NULL COMMENT '菜单时间url',
  `module_id_f` int(11) DEFAULT NULL COMMENT '所属模块id',
  `menu_sort` int(11) DEFAULT '1' COMMENT '在同级中的排序',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `menu_status` int(2) DEFAULT '0' COMMENT '启用状态（0：正常，1：禁用）',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `rbac_menu` */

insert  into `rbac_menu`(`menu_id`,`menu_name`,`menu_url`,`module_id_f`,`menu_sort`,`menu_icon`,`menu_status`) values (5,'用户管理','rbac/user-view',12,4,'icon-man',0),(14,'角色管理','rbac/role-view',12,2,'icon-user',0),(15,'权限管理','rbac/auth-view',12,1,'icon-setting',0),(42,'密码管理','rbac/password-view',12,3,'icon-lock',0),(64,'操作面板','console/view',26,1,'icon-table',0);

/*Table structure for table `rbac_module` */

DROP TABLE IF EXISTS `rbac_module`;

CREATE TABLE `rbac_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块主键id',
  `module_name` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `module_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `module_sort` int(11) DEFAULT '1' COMMENT '排序',
  `module_status` int(2) DEFAULT '0' COMMENT '启用状态（0：正常，1：禁用）',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='模块权限类';

/*Data for the table `rbac_module` */

insert  into `rbac_module`(`module_id`,`module_name`,`module_icon`,`module_sort`,`module_status`) values (12,'后台管理','icon-door-out',11,0),(26,'账号管理','icon-home',1,0);

/*Table structure for table `rbac_role` */

DROP TABLE IF EXISTS `rbac_role`;

CREATE TABLE `rbac_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(40) NOT NULL,
  `role_describe` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `role_create_time` varchar(40) DEFAULT NULL COMMENT '创建时间',
  `role_create_user_name` varchar(40) DEFAULT NULL,
  `is_system` int(2) DEFAULT '0' COMMENT '是否为系统角色（0：否，1：是）',
  `user_count` int(11) DEFAULT '0' COMMENT '该角色的用户数',
  `role_status` int(2) DEFAULT '0' COMMENT '该角色的状态（0：正常，1禁用）',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

/*Data for the table `rbac_role` */

insert  into `rbac_role`(`role_id`,`role_name`,`role_describe`,`role_create_time`,`role_create_user_name`,`is_system`,`user_count`,`role_status`) values (3,'普通管理员','普通管理员','2015-09-17 11:32:15','admin',1,0,0),(9,'系统管理员','系统管理员','2015-09-18 09:03:27','admin',1,0,0),(28,'普通用户','普通用户','2016-04-27 10:43:38','admin',0,0,0);

/*Table structure for table `rbac_role_permissions` */

DROP TABLE IF EXISTS `rbac_role_permissions`;

CREATE TABLE `rbac_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色-权限中间表，主键id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permissions_id` int(11) DEFAULT NULL COMMENT '权限id',
  `permissions_type` int(2) DEFAULT NULL COMMENT '权限类型（1：模块，2：菜单，3：按钮）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3022 DEFAULT CHARSET=utf8 COMMENT='角色-权限中间表';

/*Data for the table `rbac_role_permissions` */

insert  into `rbac_role_permissions`(`id`,`role_id`,`permissions_id`,`permissions_type`) values (2945,28,15,1),(2946,28,18,2),(2947,28,19,2),(2948,28,20,2),(2949,28,21,2),(2950,28,16,1),(2951,28,22,2),(2952,28,23,2),(2953,28,24,2),(2954,28,27,2),(2955,28,17,1),(2956,28,25,2),(2957,28,26,2),(2958,28,25,1),(2959,28,63,2),(2980,9,12,1),(2981,9,5,2),(2982,9,23,3),(2983,9,24,3),(2984,9,25,3),(2985,9,26,3),(2986,9,14,2),(2987,9,27,3),(2988,9,28,3),(2989,9,29,3),(2990,9,30,3),(2991,9,15,2),(2992,9,18,3),(2993,9,19,3),(2994,9,20,3),(2995,9,21,3),(2996,9,22,3),(2997,9,42,2),(2998,9,26,1),(2999,9,64,2),(3001,3,12,1),(3002,3,5,2),(3003,3,23,3),(3004,3,24,3),(3005,3,25,3),(3006,3,26,3),(3007,3,14,2),(3008,3,27,3),(3009,3,28,3),(3010,3,29,3),(3011,3,30,3),(3012,3,15,2),(3013,3,18,3),(3014,3,19,3),(3015,3,20,3),(3016,3,21,3),(3017,3,22,3),(3018,3,42,2),(3020,3,64,2),(3021,3,26,1);

/*Table structure for table `rbac_user` */

DROP TABLE IF EXISTS `rbac_user`;

CREATE TABLE `rbac_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键id',
  `center_user_id` int(11) DEFAULT NULL COMMENT '来自center_app的user唯一标识',
  `user_name` varchar(36) NOT NULL COMMENT '用户名称',
  `email` varchar(40) NOT NULL COMMENT '邮箱',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `create_time` varchar(40) DEFAULT NULL COMMENT '创建时间',
  `create_user_name` varchar(40) DEFAULT NULL COMMENT '创建人',
  `user_from` varchar(40) DEFAULT NULL COMMENT '用户数据来源',
  `update_time` varchar(40) DEFAULT NULL COMMENT '用户更新时间',
  `last_login_time` varchar(40) DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '上次登录ip地址',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '用户状态（0：正常，1：禁用）',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `rbac_user` */

insert  into `rbac_user`(`user_id`,`center_user_id`,`user_name`,`email`,`password`,`create_time`,`create_user_name`,`user_from`,`update_time`,`last_login_time`,`last_login_ip`,`login_count`,`status`) values (136,604,'admin','admin@gyyx.cn','$1$W6SpTXIv$TQpuQhdAmiSvo.qhTmLhM.','2015-09-25 10:04:24','center_app','center_app','2015-09-25 10:04:24',NULL,NULL,NULL,0),(170,1930,'付东芳','fudongfang@gyyx.cn','$1$zeU6y81R$RylTS8W4.AWf39NlFfdyN0','2016-04-27 12:04:39',NULL,'ucenter','2016-04-27 12:04:39',NULL,NULL,NULL,0),(172,2112,'向天','xiangtian@gyyx.cn','$1$Ss/aM/11$ZahIdYPPKx4yVG5n3glwm0','2016-04-27 14:14:43',NULL,'ucenter','2016-04-27 14:14:43',NULL,NULL,NULL,0),(174,60,'黄振','huangzhen@gyyx.cn','$1$5yj2FvE9$iiGskxM1yV1UAlzcNKxvl.','2016-04-27 12:04:39',NULL,NULL,NULL,NULL,NULL,0,0),(176,605,'郭威','guowei@gyyx.cn','$1$d2ppLtZv$zKoc3SWOHhz2Z.SLX/GMJ0','2016-04-29 10:06:32',NULL,'ucenter','2016-04-29 10:06:32',NULL,NULL,NULL,0),(178,2055,'王晓超','wangxiaochao@gyyx.cn','$1$ILQM3yu5$QbfHwq5oo8MuT.uyCwRUX1','2016-04-29 10:06:55',NULL,'ucenter','2016-04-29 10:06:55',NULL,NULL,NULL,0),(180,1425,'江林','jianglin@gyyx.cn','$1$yn3q63re$2sydxlCVjMRXxAzLmfNwu0','2016-04-29 10:07:11',NULL,'ucenter','2016-04-29 10:07:11',NULL,NULL,NULL,0),(182,904,'桂晨光','guichenguang@gyyx.cn','$1$zrO5CvNM$u8dqF99Ra6w8hv4oZsnzw/','2016-05-05 10:30:53',NULL,'ucenter','2016-05-05 10:30:53',NULL,NULL,NULL,0),(184,2219,'王怀友','wanghuaiyou@gyyx.cn','$1$qFLAMs7z$C8jQnqrcdM4HSudOc90bX0','2016-05-05 17:06:42',NULL,'ucenter','2016-05-05 17:06:42',NULL,NULL,NULL,0),(186,1,'沈崴','shenwei@gyyx.cn','$1$FtshQWtK$04TKcKv8jZKXczV8pcZv..','2016-05-16 19:05:50',NULL,'ucenter','2016-05-16 19:05:50',NULL,NULL,NULL,0),(188,1626,'杨瑞鹏','yangruipeng@gyyx.cn','$1$b949Ypp5$AJcSLCtGX6V.POytYlYtq/','2016-06-27 13:02:16',NULL,'ucenter','2016-06-27 13:02:16',NULL,NULL,NULL,0),(190,2059,'彭思涵','pengsihan@gyyx.cn','$1$KLx3TJnt$AH46vP2tze4lp19rtNRe..','2016-06-27 13:33:49',NULL,'ucenter','2016-06-27 13:33:49',NULL,NULL,NULL,0),(192,1428,'白鹤','baihe@gyyx.cn','$1$WnWHoBJg$0u75IUs7DqcNDXM2LgFxE0','2016-06-28 17:09:33',NULL,'system','2016-08-17 15:19:54',NULL,NULL,NULL,0),(200,2199,'尹永红','yinyonghong@gyyx.cn','$1$qFLAMs7z$C8jQnqrcdM4HSudOc90bX0','2017-06-22 13:27:40',NULL,'ucenter','2017-06-22 13:27:40',NULL,NULL,NULL,0),(201,2325,'解欢欢','xiehuanhuan@gyyx.cn','$1$NNdPPpsN$7gVViGrzC2o0PT2..TVNn.','2017-06-22 13:39:09',NULL,'ucenter','2017-06-22 13:39:09',NULL,NULL,NULL,0),(202,2242,'龚文龙','gongwenlong@gyyx.cn','$1$qFLAMs7z$C8jQnqrcdM4HSudOc90bX0','2017-06-22 13:51:10',NULL,'ucenter','2017-06-22 13:51:10',NULL,NULL,NULL,0),(203,2595,'陈容芳','chenrongfang@gyyx.cn','$1$paKRH9XQ$0E4tkRuCGkg.1MbksvHah/','2017-06-27 17:56:23',NULL,'ucenter','2017-06-27 17:56:23',NULL,NULL,NULL,0),(204,99999,'张盛瑞','zhangshengrui@gyyx.cn','$1$W6SpTXIv$TQpuQhdAmiSvo.qhTmLhM.','2017-07-28 11:45:31',NULL,NULL,'2017-07-28 11:45:31',NULL,NULL,NULL,0);

/*Table structure for table `rbac_user_role` */

DROP TABLE IF EXISTS `rbac_user_role`;

CREATE TABLE `rbac_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户-角色中间表，主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='用户-角色中间表';

/*Data for the table `rbac_user_role` */

insert  into `rbac_user_role`(`id`,`user_id`,`role_id`) values (94,170,3),(96,170,9),(98,170,28),(104,174,28),(106,176,28),(108,178,28),(110,180,28),(114,184,28),(128,188,3),(130,188,9),(132,188,28),(134,182,3),(136,182,9),(138,182,28),(140,186,3),(142,172,28),(143,172,9),(144,172,3),(145,192,3),(146,192,9),(147,192,28),(148,190,9),(149,190,3),(150,190,28),(155,136,3),(156,136,9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
