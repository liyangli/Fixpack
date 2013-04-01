/* 用户表 */
create table Base_User(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    userName varchar2(40),
    PassWord varchar2(40),
    loginName varchar2(40),
    visible number(4) default 0,
    tel  varchar2(40),
    email varchar(100),
    userDesc varchar2(255),
    groupId number(4)
);
/* 创建对应序列 */
CREATE SEQUENCE Base_User_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 功能表*/
create table Base_Model(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
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
/* 创建对应序列 */
CREATE SEQUENCE Base_Model_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 角色表 */
create table base_Role(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    roleName varchar2(40),
    RoleDesc varchar2(255)
);
/* 创建对应序列 */
CREATE SEQUENCE base_Role_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 用户角色关联表 */
create table User_Role_Link(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    userId number(10),
    roleId number(10)
);
/* 创建对应序列 */
CREATE SEQUENCE User_Role_Link_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 角色功能关联表 */
create table Role_Model_Link(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    modelId number(10),
    roleId number(10)
);
/* 创建对应序列 */
CREATE SEQUENCE Role_Model_Link_Sequence
     INCREMENT BY 1   
     START WITH 40      
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 分组表*/
create table Base_group(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    groupName varchar2(40),
    Orderby number(4),
    visible number(4) default 0,
    groupDesc varchar2(255),
    peoId number(4),
    flag number(4) default 1
);
/* 创建对应序列 */
CREATE SEQUENCE Base_group_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 值班日志表*/
create table Duty_log(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    createTime date,
    content clob,
    telContent varchar2(255) ,
    groupId number(10),
    creater varchar2(255),
    lastUpdate date,
    visible number(4)
);
/* 创建对应序列 */
CREATE SEQUENCE Duty_log_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 值班表 */
create table duty(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    startTime date,
    num number(10)
);
/* 创建对应序列 */
CREATE SEQUENCE duty_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 每天班次表*/
create table Day_Duty(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    startTime varchar2(40),
    endTime varchar2(255) ,
    dayDesc varchar2(255),
    dutyId number(10)
);
/* 创建对应序列 */
CREATE SEQUENCE Day_Duty_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 公告表*/
create table notice(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    createDate date,
    content clob ,
    title varchar2(2000)
);
/* 创建对应序列 */
CREATE SEQUENCE notice_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 巡检日志表*/
create table InspectLog (
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    userId number(10),
    inspectTime date ,
    insLogdesc varchar2(255),
    dutyTime varchar2(50)
);
/* 创建对应序列 */
CREATE SEQUENCE InspectLog_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 巡检项表 */
create table Inspect(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    title varchar2(255),
    insdesc varchar2(255)
);
/* 创建对应序列 */
CREATE SEQUENCE Inspect_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 巡检日志表*/
create table InspectLogLink(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    inspect varchar(50),
    insLog_id number(10) ,
    State number(10)
);
/* 创建对应序列 */
CREATE SEQUENCE InspectLogLink_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 插件表*/
create table Plugin(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    name varchar2(40),
    author varchar2(40),
    updateTime date
);
/* 创建对应序列 */
CREATE SEQUENCE Plugin_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 联系人表*/
create table Contact(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    name varchar2(40),
    tel varchar2(40),
    company varchar2(255),
    contactDesc varchar2(255),
    Email varchar2(255),
    Fax varchar2(255)
);
/* 创建对应序列 */
CREATE SEQUENCE Contact_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 知识库表*/
create table Knowlage(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    title varchar2(255),
    creatTime date,
    userid number(10),
    content clob,
    AttachPath varchar2(255)
);
/* 创建对应序列 */
CREATE SEQUENCE Knowlage_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 人员分组表*/
create table peopleGroup(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    peopNum number(10),
    groupNum number(10) ,
    type number(10),
    flag number(4)
);
/* 创建对应序列 */
CREATE SEQUENCE peopleGroup_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
/* 接班日志*/
create table successionLog(
    id number(10) NOT NULL primary key,  /*主键，自动增加*/
    userId number(10),/*用户主键*/
    groupId number(10) ,/*当前值班组主键*/
    visible number(10),/*确认接班*/
    successionTime date/*确认接班时间*/
);
/* 创建对应序列 */
CREATE SEQUENCE succession_Log_Sequence
     INCREMENT BY 1   
     START WITH 1     
     NOMAXVALUE       
     NOCYCLE          
     CACHE 10;
     


