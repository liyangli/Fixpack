/*初始化数据*/
/*一级导航信息*/
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(1,'首页','首页',1,0,'home');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(2,'日常管理','日常管理',2,0,'monitor');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(3,'数据查询','数据查询',3,0,'search_data');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(4,'知识库','知识库',4,0,'knowledge');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(5,'系统配置','系统配置',5,0,'system');
/*二级导航*/
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(6,'首页','首页',6,1,1,'index/showNoticeAndDutyLog/1/6');


insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(7,'值班日志','值班日志',7,1,2,'dutyLog/showGroupLog/2/7');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(8,'巡检记录','巡检记录',8,1,2,'inspectLog/dailyInspectLog/2/8');

insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(9,'排班查询','排班查询',9,1,3,'arrange/groupUserList/3/9');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(10,'值班日志','值班日志',10,1,3,'dutyLog/showDutyLog/3/10');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(11,'巡检记录','巡检记录',11,1,3,'inspectLog/showInspectLog/3/11');

insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(12,'知识库','知识库',12,1,4,'knowledge/showKnowledgePage/4/12');

insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(13,'用户管理','用户管理',13,1,5,'user/index/5/13');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(14,'角色管理','角色管理',14,1,5,'role/index/5/14');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(15,'排班管理','排班管理',15,1,5,'arrange/index/5/15');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(16,'巡检管理','巡检管理',16,1,5,'inspect/index/5/16');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(17,'联系人管理','联系人管理',17,1,5,'contact/index/5/17');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL,visible) values(18,'插件管理','插件管理',18,1,5,'plugin/index/5/18',1);
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(19,'公告管理','公告管理',19,1,5,'notice/index/5/19');

/*超级管理用户*/
insert into base_user(id,username,password,loginName,visible,userdesc) values(1,'admin','1d32be692f7597437161d710795000d6','admin',0,'超级管理员');

/*角色*/
insert into base_role(id,roleName,roleDesc) values(1,'超级管理员','超级管理员');

/*用户分配角色*/
insert into user_role_link(id,userId,roleId) values(1,1,1);

/*角色权限分配 分配所有权限*/
insert into role_model_link(id,modelId,roleId) values(1,1,1);
insert into role_model_link(id,modelId,roleId) values(2,2,1);
insert into role_model_link(id,modelId,roleId) values(3,3,1);
insert into role_model_link(id,modelId,roleId) values(4,4,1);
insert into role_model_link(id,modelId,roleId) values(5,5,1);
insert into role_model_link(id,modelId,roleId) values(6,6,1);
insert into role_model_link(id,modelId,roleId) values(7,7,1);
insert into role_model_link(id,modelId,roleId) values(8,8,1);
insert into role_model_link(id,modelId,roleId) values(9,9,1);
insert into role_model_link(id,modelId,roleId) values(10,10,1);
insert into role_model_link(id,modelId,roleId) values(11,11,1);
insert into role_model_link(id,modelId,roleId) values(12,12,1);
insert into role_model_link(id,modelId,roleId) values(13,13,1);
insert into role_model_link(id,modelId,roleId) values(14,14,1);
insert into role_model_link(id,modelId,roleId) values(15,15,1);
insert into role_model_link(id,modelId,roleId) values(16,16,1);
insert into role_model_link(id,modelId,roleId) values(17,17,1);
insert into role_model_link(id,modelId,roleId) values(18,18,1);
insert into role_model_link(id,modelId,roleId) values(19,19,1);
commit;


