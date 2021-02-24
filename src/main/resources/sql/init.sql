-- 菜单表
drop table T_EPMS_MENU;
create table T_EPMS_MENU
(
  id             VARCHAR2(36 CHAR) not null,
  create_person  VARCHAR2(255 CHAR),  -- 创建人
  create_time    TIMESTAMP(6),        -- 创建时间
  modify_person  VARCHAR2(255 CHAR),  -- 修改人
  modify_time    TIMESTAMP(6),        -- 修改时间
  description    VARCHAR2(255 CHAR),  -- 描述
  icon           VARCHAR2(64 CHAR),   -- 图标
  menu_index     VARCHAR2(64 CHAR),   -- 菜单索引
  menu_model     VARCHAR2(64 CHAR),   -- 菜单模型
  p_id           VARCHAR2(36 CHAR),   -- 父级节点id
  menu_name      VARCHAR2(64 CHAR),   -- 节点名称
  node_type_code VARCHAR2(4 CHAR),    -- 节点类型
  p_menu_name    VARCHAR2(64 CHAR),   -- 父级菜单名称
  path           VARCHAR2(64 CHAR),   -- 路径
  router         VARCHAR2(64 CHAR),   -- 路由
  seq            NUMBER (10)          -- 序号
)
;
alter table T_EPMS_MENU
  add primary key (ID);

-----------------------------------------------------------
-- 用户角色表
drop table T_EPMS_ROLE;
create table T_EPMS_ROLE
(
  id            VARCHAR2(36 CHAR) not null,   -- 主键
  create_time   TIMESTAMP(6),                 -- 创建时间
  description   VARCHAR2(255 CHAR),           -- 描述
  p_id          VARCHAR2(36 CHAR),            -- 父级节点id
  p_role_name   VARCHAR2(64 CHAR),            -- 父级角色名称
  role_name     VARCHAR2(64 CHAR)             -- 角色名称
)
;
alter table T_EPMS_ROLE
  add primary key (ID);


-- 用户表
drop table T_EPMS_USER;
create table T_EPMS_USER
(
  id             VARCHAR2(36 CHAR) not null,    -- 主键
  create_person  VARCHAR2(255 CHAR),            -- 创建人
  create_time    TIMESTAMP(6),                  -- 创建时间
  modify_person  VARCHAR2(255 CHAR),            -- 修改人
  modify_time    TIMESTAMP(6),                  -- 修改时间
  age            NUMBER(10),                    -- 年龄
  effective_date DATE,                          -- 账号有效日期
  email          VARCHAR2(64 CHAR),             -- 邮箱
  mobile         VARCHAR2(64 CHAR),             -- 手机
  passwd         VARCHAR2(255 CHAR),            -- 密码
  sex            VARCHAR2(8 CHAR),              -- 性别
  user_code      VARCHAR2(64 CHAR),             -- 用户工号
  user_name      VARCHAR2(64 CHAR)              -- 用户中文名
)
;
alter table T_EPMS_USER
  add primary key (ID);


-- 用户角色关系对应表
drop table T_EPMS_USER_ROLE;
create table T_EPMS_USER_ROLE
(
  user_id VARCHAR2(36 CHAR) not null,     -- 用户id
  role_id VARCHAR2(36 CHAR) not null      -- 角色id
)
;
alter table T_EPMS_USER_ROLE
  add primary key (USER_ID, ROLE_ID);



-- 会话登录登录表
drop table T_EPMS_WEB_SESSION;
create table T_EPMS_WEB_SESSION
(
  token            VARCHAR2(36 CHAR) not null,    -- token
  client_ip        VARCHAR2(255 CHAR),            -- 客户端ip
  user_code        VARCHAR2(64 CHAR),             -- 用户工号
  start_time       TIMESTAMP(6),                  -- 登录时间
  last_access_time TIMESTAMP(6),                  -- 最后访问时间
  server_ip        VARCHAR2(255 CHAR),            -- 服务器端ip
  user_id          VARCHAR2(255 CHAR)             -- 用户id
)
;
alter table T_EPMS_WEB_SESSION
  add primary key (TOKEN);


-- 评分准则表
drop table T_EPMS_GRADING_CRITERIA;
create table T_EPMS_GRADING_CRITERIA
(
  id              VARCHAR2(36 CHAR) not null,   -- 主键
  criteria_level  VARCHAR2(255 CHAR),           -- 准则级别
  criteria_data   CLOB                          -- 准则内容
)
;
alter table T_EPMS_GRADING_CRITERIA
  add primary key (id);


-- 考核分数记录表
drop table t_epms_grading_record;
create table t_epms_grading_record
(
  id                    VARCHAR2(36 CHAR) not null,    -- 主键
  user_id               VARCHAR2(36 CHAR),             -- 考核人员
  direct_manager_id     VARCHAR2(36 CHAR),             -- 直接经理
  indirect_manager_id   VARCHAR2(36 CHAR),             -- 间接经理
  assessment_score      VARCHAR2(20 CHAR),             -- 考核分数
  create_time           date,                          -- 提交时间
  year                  VARCHAR2(10 CHAR),             -- 考核年份
  quarter               VARCHAR2(10 CHAR),             -- 考核季度
  state                 VARCHAR2(10 CHAR)             -- 考核状态
)
;
alter table t_epms_grading_record
  add primary key (id);


