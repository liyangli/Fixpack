/* �û��� */
create table Base_User(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    userName varchar2(40),
    PassWord varchar2(40),
    loginName varchar2(40),
    visible number(4) default 0,
    tel  varchar2(40),
    email varchar(100),
    userDesc varchar2(255),
    groupId number(4)
);
/* ������Ӧ���� */
CREATE SEQUENCE Base_User_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ���ܱ�*/
create table Base_Model(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    Name varchar2(40),
    URL varchar2(40),
    Orderby number(4),
    visible number(4) default 0,
    PID number(4),
    Type number(4) default 0,
    modelDesc varchar2(255),
    Plugin_id number(4),
    divClass varchar2(40)
);
/* ������Ӧ���� */
CREATE SEQUENCE Base_Model_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ��ɫ�� */
create table base_Role(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    roleName varchar2(40),
    RoleDesc varchar2(255)
);
/* ������Ӧ���� */
CREATE SEQUENCE base_Role_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* �û���ɫ������ */
create table User_Role_Link(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    userId number(10),
    roleId number(10)
);
/* ������Ӧ���� */
CREATE SEQUENCE User_Role_Link_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ��ɫ���ܹ����� */
create table Role_Model_Link(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    modelId number(10),
    roleId number(10)
);
/* ������Ӧ���� */
CREATE SEQUENCE Role_Model_Link_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* �����*/
create table Base_group(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    groupName varchar2(40),
    Orderby number(4),
    visible number(4) default 0,
    groupDesc varchar2(255),
    peoId number(4),
    flag number(4) default 1
);
/* ������Ӧ���� */
CREATE SEQUENCE Base_group_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ֵ����־��*/
create table Duty_log(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    createTime date,
    content clob,
    telContent varchar2(255) ,
    groupId number(10),
    creater varchar2(255),
    lastUpdate date,
    visible number(4)
);
/* ������Ӧ���� */
CREATE SEQUENCE Duty_log_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ֵ��� */
create table duty(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    startTime date,
    num number(10)
);
/* ������Ӧ���� */
CREATE SEQUENCE duty_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ÿ���α�*/
create table Day_Duty(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    startTime varchar2(40),
    endTime varchar2(255) ,
    dayDesc varchar2(255),
    dutyId number(10)
);
/* ������Ӧ���� */
CREATE SEQUENCE Day_Duty_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* �����*/
create table notice(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    createDate date,
    content clob ,
    title varchar2(2000)
);
/* ������Ӧ���� */
CREATE SEQUENCE notice_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* Ѳ����־��*/
create table InspectLog (
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    userId number(10),
    inspectTime date ,
    insLogdesc varchar2(255),
    dutyTime varchar2(50)
);
/* ������Ӧ���� */
CREATE SEQUENCE InspectLog_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* Ѳ����� */
create table Inspect(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    title varchar2(255),
    insdesc varchar2(255)
);
/* ������Ӧ���� */
CREATE SEQUENCE Inspect_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* Ѳ����־��*/
create table InspectLogLink(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    inspect varchar(50),
    insLog_id number(10) ,
    State number(10)
);
/* ������Ӧ���� */
CREATE SEQUENCE InspectLogLink_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* �����*/
create table Plugin(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    name varchar2(40),
    author varchar2(40),
    updateTime date
);
/* ������Ӧ���� */
CREATE SEQUENCE Plugin_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ��ϵ�˱�*/
create table Contact(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    name varchar2(40),
    tel varchar2(40),
    company varchar2(255),
    contactDesc varchar2(255),
    Email varchar2(255),
    Fax varchar2(255)
);
/* ������Ӧ���� */
CREATE SEQUENCE Contact_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ֪ʶ���*/
create table Knowlage(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    title varchar2(255),
    creatTime date,
    userid number(10),
    content clob,
    AttachPath varchar2(255)
);
/* ������Ӧ���� */
CREATE SEQUENCE Knowlage_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* ��Ա�����*/
create table peopleGroup(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    peopNum number(10),
    groupNum number(10) ,
    type number(10),
    flag number(4)
);
/* ������Ӧ���� */
CREATE SEQUENCE peopleGroup_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* �Ӱ���־*/
create table successionLog(
    id number(10) NOT NULL primary key,  /*�������Զ�����*/
    userId number(10),/*�û�����*/
    groupId number(10) ,/*��ǰֵ��������*/
    visible number(10),/*ȷ�ϽӰ�*/
    successionTime date/*ȷ�ϽӰ�ʱ��*/
);
/* ������Ӧ���� */
CREATE SEQUENCE succession_Log_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
     


