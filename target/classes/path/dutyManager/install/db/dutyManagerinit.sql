/*��ʼ������*/
/*һ��������Ϣ*/
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(1,'��ҳ','��ҳ',1,0,'home');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(2,'�ճ�����','�ճ�����',2,0,'monitor');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(3,'���ݲ�ѯ','���ݲ�ѯ',3,0,'search_data');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(4,'֪ʶ��','֪ʶ��',4,0,'knowledge');
insert into base_model(id,Name,modeldesc,orderby,type,divClass) values(5,'ϵͳ����','ϵͳ����',5,0,'system');
/*��������*/
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(6,'��ҳ','��ҳ',6,1,1,'index/showNoticeAndDutyLog/1/6');


insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(7,'ֵ����־','ֵ����־',7,1,2,'dutyLog/showGroupLog/2/7');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(8,'Ѳ���¼','Ѳ���¼',8,1,2,'inspectLog/dailyInspectLog/2/8');

insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(9,'�Ű��ѯ','�Ű��ѯ',9,1,3,'arrange/groupUserList/3/9');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(10,'ֵ����־','ֵ����־',10,1,3,'dutyLog/showDutyLog/3/10');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(11,'Ѳ���¼','Ѳ���¼',11,1,3,'inspectLog/showInspectLog/3/11');

insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(12,'֪ʶ��','֪ʶ��',12,1,4,'knowledge/showKnowledgePage/4/12');

insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(13,'�û�����','�û�����',13,1,5,'user/index/5/13');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(14,'��ɫ����','��ɫ����',14,1,5,'role/index/5/14');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(15,'�Ű����','�Ű����',15,1,5,'arrange/index/5/15');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(16,'Ѳ�����','Ѳ�����',16,1,5,'inspect/index/5/16');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(17,'��ϵ�˹���','��ϵ�˹���',17,1,5,'contact/index/5/17');
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL,visible) values(18,'�������','�������',18,1,5,'plugin/index/5/18',1);
insert into base_model(id,Name,modeldesc,orderby,type,PID,URL) values(19,'�������','�������',19,1,5,'notice/index/5/19');

/*���������û�*/
insert into base_user(id,username,password,loginName,visible,userdesc) values(1,'admin','1d32be692f7597437161d710795000d6','admin',0,'��������Ա');

/*��ɫ*/
insert into base_role(id,roleName,roleDesc) values(1,'��������Ա','��������Ա');

/*�û������ɫ*/
insert into user_role_link(id,userId,roleId) values(1,1,1);

/*��ɫȨ�޷��� ��������Ȩ��*/
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


