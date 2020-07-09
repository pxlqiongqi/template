
####小区
DROP TABLE IF EXISTS `community_info`;
CREATE TABLE `community_info` (
  `community_id` varchar(64) NOT NULL COMMENT '小区id',
  `community_name` varchar(255) DEFAULT NULL COMMENT '小区名称',
  `region_id` varchar(63) DEFAULT NULL COMMENT '所属行政区域id',
  `street_id` varchar(63) DEFAULT NULL COMMENT '街道办id',
  `committee_id` varchar(63) DEFAULT NULL COMMENT '社区id',
  `property_company` varchar(128) DEFAULT NULL COMMENT '物业公司名称',
  `address_name` varchar(255) DEFAULT NULL COMMENT '小区地址',
  `bidding_house_num` int DEFAULT NULL COMMENT '招标户数',
  `real_house_num` int DEFAULT NULL COMMENT '实际户数',
  `live_num` int DEFAULT NULL COMMENT '居民人数',
  `build_num` int DEFAULT NULL COMMENT '小区楼栋数',
  `unit_num` int DEFAULT NULL COMMENT '小区单元数',
  `cover_area` int DEFAULT NULL COMMENT '小区占地面积',

  `classification_time` datetime DEFAULT NULL COMMENT '垃圾分类开始时间',
  `company_id` varchar(64) DEFAULT NULL COMMENT '运营公司id',
  `person_in_charge_name` varchar(64) DEFAULT '' COMMENT '负责人姓名',
  `phone` varchar(64) DEFAULT '' COMMENT '手机号',
  `classification_type` int DEFAULT '0' COMMENT '垃圾分类方式',

  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',

  PRIMARY KEY (`community_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='小区信息';

####乡村
DROP TABLE IF EXISTS `countryside_info`;
CREATE TABLE `countryside_info` (
  `countryside_id` varchar(64) NOT NULL COMMENT '乡村id',
  `countryside_name` varchar(255) DEFAULT NULL COMMENT '乡村名称',
  `region_id` varchar(63) DEFAULT NULL COMMENT '所属行政区域id',
  `street_id` varchar(63) DEFAULT NULL COMMENT '街道办id',
  `committee_id` varchar(63) DEFAULT NULL COMMENT '社区id',
  `address_name` varchar(255) DEFAULT NULL COMMENT '乡村地址',
  `bidding_house_num` int DEFAULT NULL COMMENT '招标户数',
  `real_house_num` int DEFAULT NULL COMMENT '实际户数',
  `cover_area` int DEFAULT NULL COMMENT '占地面积',

  `classification_time` datetime DEFAULT NULL COMMENT '垃圾分类开始时间',
  `company_id` varchar(64) DEFAULT NULL COMMENT '运营公司id',
  `person_in_charge_name` varchar(64) DEFAULT '' COMMENT '负责人姓名',
  `phone` varchar(64) DEFAULT '' COMMENT '手机号',
  `classification_type` int DEFAULT '0' COMMENT '垃圾分类方式',

    `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',

  PRIMARY KEY (`countryside_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='乡村信息';


###机构单位
DROP TABLE IF EXISTS `organization_info`;
CREATE TABLE `organization_info` (
  `organization_id` varchar(64) NOT NULL COMMENT '机构id',

  `organization_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  `region_id` varchar(63) DEFAULT NULL COMMENT '所属行政区域id',
  `street_id` varchar(63) DEFAULT NULL COMMENT '街道办id',
  `committee_id` varchar(63) DEFAULT NULL COMMENT '社区id',
  `organization_type` int DEFAULT NULL COMMENT '机构类型',
  `superior_name` varchar(255) DEFAULT NULL COMMENT '上级单位名称',
  `address_name` varchar(255) DEFAULT NULL COMMENT '机构地址',
  `participant_num` int DEFAULT NULL COMMENT '单位人数',


  `classification_time` datetime DEFAULT NULL COMMENT '垃圾分类开始时间',
  `company_id` varchar(64) DEFAULT NULL COMMENT '运营公司id',
  `person_in_charge_name` varchar(64) DEFAULT '' COMMENT '负责人姓名',
  `phone` varchar(64) DEFAULT '' COMMENT '手机号',
  `classification_type` int DEFAULT '0' COMMENT '分类方式',

    `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',

  PRIMARY KEY (`organization_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='机构单位信息';


###公共场所
DROP TABLE IF EXISTS `public_place_info`;
CREATE TABLE `public_place_info` (
  `place_id` varchar(64) NOT NULL COMMENT '公共场所id',
  `place_name` varchar(255) DEFAULT NULL COMMENT '公共场所名称',
  `address_name` varchar(255) DEFAULT NULL COMMENT '公共场所地址',
  `place_type` int DEFAULT NULL COMMENT '公共场所类型',


  `region_id` varchar(63) DEFAULT NULL COMMENT '所属行政区域id',
  `street_id` varchar(63) DEFAULT NULL COMMENT '街道办id',
  `committee_id` varchar(63) DEFAULT NULL COMMENT '社区id',

  `classification_time` datetime DEFAULT NULL COMMENT '垃圾分类开始时间',
  `company_id` varchar(64) DEFAULT NULL COMMENT '运营公司id',
  `person_in_charge_name` varchar(64) DEFAULT '' COMMENT '负责人姓名',
  `phone` varchar(64) DEFAULT '' COMMENT '手机号',
  `classification_type` int DEFAULT '0' COMMENT '分类方式',

    `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',

  PRIMARY KEY (`place_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公共场所信息';


###运营商
DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info` (
  `company_id` varchar(64) NOT NULL COMMENT '运营商id',
  `company_name` varchar(255) DEFAULT NULL COMMENT '运营商名称',
  `company_type` int DEFAULT NULL COMMENT '所属类型',
  `credit_code` varchar(255) DEFAULT NULL COMMENT '社会信用代码',
  `register_code` varchar(255) DEFAULT NULL COMMENT '社会信用代码',
  `address_name` varchar(255) DEFAULT NULL COMMENT '注册地址',
  `corporation_name` varchar(255) DEFAULT NULL COMMENT '法定代表人',
  `company_phone` varchar(64) DEFAULT '' COMMENT '公司联系电话',
  `company_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `company_Qr` varchar(255) DEFAULT '' COMMENT '公司二维码',
  `company_slogan` varchar(255) DEFAULT '' COMMENT '公司宣传口号',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度',

   `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',

  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='运营商信息';

