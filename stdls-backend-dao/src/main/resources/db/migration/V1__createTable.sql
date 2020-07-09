DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`
(
    `dict_id`    varchar(32) NOT NULL COMMENT '字典id',
    `dict_type`  varchar(32)         DEFAULT NULL COMMENT '字典类型',
    `dict_key`   varchar(16)         DEFAULT NULL COMMENT '字典值',
    `dict_value` varchar(32)         DEFAULT NULL COMMENT '描述',
    `deleted`    tinyint(1) unsigned DEFAULT '0' COMMENT '逻辑删除',
    PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='字典表';

-- 用户
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `user_id`     varchar(64)         NOT NULL COMMENT 'id',
    `name`        varchar(64)         DEFAULT '' COMMENT '姓名',
    `phone`       char(11)            DEFAULT '' COMMENT '手机号',
    `area_id`     varchar(64)         DEFAULT NULL COMMENT '所属区域',
    `lv`          tinyint(1)          DEFAULT NULL COMMENT '所属区域级别',
    `account`     varchar(64)         NOT NULL COMMENT '登录账号',
    `password`    varchar(128)        NOT NULL COMMENT '登录密码',
    `user_type`   tinyint(1) unsigned NOT NULL COMMENT '账号类型 1-城管局|2-运营商',
    `company_id`  varchar(128)        DEFAULT NULL COMMENT '运营商id',
    `deleted`     tinyint(1) unsigned DEFAULT 0 COMMENT '是否删除(0:正常,1:删除)',
    `add_time`    datetime            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='用户';

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`
(
    `user_id`        varchar(64) NOT NULL COMMENT '用户id',
    `role_id`        varchar(64) NOT NULL COMMENT '角色编码',
    `create_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
    `add_time`       datetime            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='用户角色关系';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`
(
    `role_id`     varchar(64) NOT NULL COMMENT '角色编码(不能重复)',
    `name`        varchar(128)        DEFAULT '' COMMENT '角色名称',
    `remark`      varchar(128)        DEFAULT '' COMMENT '说明',
    `deleted`     tinyint(1) unsigned DEFAULT '0' COMMENT '逻辑删除(0:未删除,1:已删除)',
    `add_time`    datetime            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='角色表';

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`
(
    `role_id`        varchar(64) NOT NULL COMMENT '角色编码',
    `resource_id`    varchar(64) NOT NULL COMMENT '资源编码',
    `create_user_id` varchar(64) DEFAULT NULL COMMENT '创建人',
    `add_time`       datetime    DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`role_id`, `resource_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='角色资源关系';

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`
(
    `resource_id`    varchar(64) NOT NULL DEFAULT '' COMMENT '资源id',
    `code`           varchar(64) NOT NULL DEFAULT '' COMMENT '资源编码',
    `name`           varchar(128)         DEFAULT '' COMMENT '资源名称',
    `parent`         varchar(64)          DEFAULT NULL COMMENT '上级资源',
    `path`           varchar(256)         DEFAULT '' COMMENT 'path',
    `path_name`      varchar(256)         DEFAULT '' COMMENT 'path_name',
    `redirect`       varchar(256)         DEFAULT '' COMMENT 'redirect',
    `icon`           varchar(256)         DEFAULT '' COMMENT 'icon',
    `component`      varchar(256)         DEFAULT '' COMMENT 'component',
    `deep`           int(11)              DEFAULT '1' COMMENT '深度',
    `sort`           int(11)              DEFAULT '1' COMMENT '排序',
    `res_type`       tinyint(4)           DEFAULT '1' COMMENT '资源类型(1:模块, 2:菜单, 3:按钮)',
    `remark`         varchar(512)         DEFAULT '' COMMENT '说明',
    `create_user_id` varchar(64)          DEFAULT NULL COMMENT '创建人',
    `target`         varchar(64)          DEFAULT NULL COMMENT 'target',
    `deleted`        tinyint(1) unsigned  DEFAULT '0' COMMENT '逻辑删除(0:未删除,1:已删除)',
    `add_time`       datetime             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`    datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='资源表';

