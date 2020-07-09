-- 初始化资源
truncate table resource ;
-- 根目录
delete from resource where code = 'root' ;
insert into resource (code, name, parent, deep, sort, res_type, add_time)
values ('root', '根目录', '0', 0, 0, '0', now()) ;

-- 入口
delete from resource where code = 'home' ;
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, redirect)
values ('home', '入口', 'root', 1, 1, '1', now(), '/', '/index') ;

-- 首页
delete from resource where code = 'index' ;
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, icon, path_name, component)
values ('index', '首页', 'root', 1, 2, '2', now(), '/', 'home', 'index', './Index') ;
-- 大屏
delete from resource where code = 'dashboard' ;
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, icon, path_name, component, target)
values ('dashboard', '大屏', 'root', 1, 3, '2', now(), '/dashboard', 'dashboard', 'dashboard', './Dashboard/Analysis', '_blank') ;

-- 基础数据 start--------------------------------------------------------------------------------------------------------
delete from resource where code = 'base' ;
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, icon, path_name)
values ('base', '基础数据管理', 'root', 1, 4, '1', now(), '/data', 'database', 'data') ;


-- 系统管理 start--------------------------------------------------------------------------------------------------------
delete from resource where code = 'sys' ;
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, icon, path_name)
values ('sys', '系统管理', 'root', 1, 20, '1', now(), '/system', 'setting', 'system') ;

-- 菜单
delete from resource where code like 'sys_%' ;
-- -----------------------------------------------------------------------------
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, path_name, component)
values ('sys_region', '区域管理', 'sys', 2, 1, '2', now(), '/system/region', 'region', './System/Region') ;
-- 资源
delete from resource where code like 'sys_region_%' ;
insert into resource (code, name, parent, res_type, add_time)
values ('sys_region_open', '开通', 'sys_region', '3', now()) ;
insert into resource (code, name, parent, res_type, add_time)
values ('sys_region_close', '关闭', 'sys_region', '3', now()) ;
-- -----------------------------------------------------------------------------

-- 代币发放 start-----------------------------------------------------------------------------
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, path_name, component)
values ('sys_payment', '代币发放', 'sys', 2, 2, '2', now(), '/system/payment', 'payment', './System/Payment');
-- 代币发放 end-----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, path_name, component)
values ('sys_pad_config', '交互设置', 'sys', 2, 3, '2', now(), '/system/padConfig', 'padConfig', './System/PaidConfig') ;
-- -----------------------------------------------------------------------------

insert into resource (code, name, parent, deep, sort, res_type, add_time, path, path_name, component)
values ('sys_version_management', '版本管理', 'sys', 2, 4, '2', now(), '/system/versionManagement', 'versionManagement', './System/VersionManagement') ;
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, path_name, component)
values ('sys_user', '用户管理', 'sys', 2, 5, '2', now(), '/system/user', 'user', './System/User') ;
-- 资源
delete from resource where code like 'sys_user_%' ;
insert into resource (code, name, parent, res_type, add_time)


values ('sys_user_c', '新增', 'sys_user', '3', now()) ;
insert into resource (code, name, parent, res_type, add_time)
values ('sys_user_u', '修改', 'sys_user', '3', now()) ;
insert into resource (code, name, parent, res_type, add_time)
values ('sys_user_d', '删除', 'sys_user', '3', now()) ;
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- 角色管理
insert into resource (code, name, parent, deep, sort, res_type, add_time, path, path_name, component)
values ('sys_role', '角色管理', 'sys', 2, 6, '2', now(), '/system/role', 'role', './System/Role') ;
-- 资源
delete from resource where code like 'sys_role_%' ;
insert into resource (code, name, parent, res_type, add_time)
values ('sys_role_c', '新增', 'sys_role', '3', now()) ;
insert into resource (code, name, parent, res_type, add_time)
values ('sys_role_u', '修改', 'sys_role', '3', now()) ;
insert into resource (code, name, parent, res_type, add_time)
values ('sys_role_d', '删除', 'sys_role', '3', now()) ;
-- -----------------------------------------------------------------------------
-- 系统管理 end----------------------------------------------------------------------------------------------------------
