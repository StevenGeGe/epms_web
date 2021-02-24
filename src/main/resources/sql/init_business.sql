create table T_BUSINESS_CALLBACK
(
    ID VARCHAR2 (60) not null
        primary key,
    CALLTASKID VARCHAR2 (255 char),
    CALLTASKFISCID VARCHAR2 (255 char),
    CALLOUTTYPE1 VARCHAR2 (255 char),
    CALLOUTTYPE2 VARCHAR2 (255 char),
    POLICYNO VARCHAR2 (255 char),
    APPLICANTNAME VARCHAR2 (255 char),
    APPLICANTSEX VARCHAR2 (255 char),
    RISKNAME VARCHAR2 (2000 char),
    EFFECTDT VARCHAR2 (255 char),
    NEXTDEDUCTDT VARCHAR2 (255 char),
    PAYABLEDT VARCHAR2 (255 char),
    RENEWALPAYABLEPREM VARCHAR2 (255 char),
    LASTDEDUCTDT VARCHAR2 (255 char),
    DEDUCTACCOUNT VARCHAR2 (255 char),
    DEDUCTACCOUNTCODE VARCHAR2 (255 char),
    GRACEPERIODEXPIRYDT VARCHAR2 (255 char),
    APPLICANTBIRTHDAY VARCHAR2 (255 char),
    APPLICANTCDTP VARCHAR2 (255 char),
    APPLICANTCDNO VARCHAR2 (255 char),
    PAYPERIOND VARCHAR2 (255 char),
    DEDUCTERRNOTE VARCHAR2 (255 char),
    DEDUCTBANKNAME VARCHAR2 (255 char),
    PHONES VARCHAR2 (255 char),
    POLICYSTATE VARCHAR2 (255 char),
    CUSTSAMEFLAG VARCHAR2 (255 char),
    POLICYOVERDUESTATE VARCHAR2 (255 char),
    INSUREDNAME VARCHAR2 (255 char),
    LASTCOMPLEXAPPLYDT VARCHAR2 (255 char),
    INSUREDBIRTHDAY VARCHAR2 (255 char),
    BROADCASTPOLICYSTATE VARCHAR2 (255 char),
    POLICYACQUISITIONDATE VARCHAR2 (255 char),
    IMPORTDATE     date,
    DISTRIBUTEDATE date,
    DISTRIBUTEFLAG NUMBER default 0,
    CLOSEDATE      date,
    CLOSEFLAG NUMBER default 0,
    CALLCOUNT NUMBER default 0,
    YEAR VARCHAR2 (20 char),
    CREATETIME     date,
    BELONGTASKID VARCHAR2 (50 char) not null,
    describe varchar2 (200) default ''
);
/

create table T_BUSINESS_PAPER
(
    id NVARCHAR2(255) not null,
    sort NVARCHAR2(255),
    seq NUMBER default 0,
    loid NVARCHAR2(255),
    createdate DATE,
    name NVARCHAR2(255),
    projectid NVARCHAR2(255),
    flowid NVARCHAR2(255)
);
alter table T_BUSINESS_PAPER
    add constraint T_UNIQUE_PAPER_SORT unique (SORT);

create table T_BUSINESS_QUESTION
(
    id NVARCHAR2(255) not null,
    questionid NVARCHAR2(255),
    loid NVARCHAR2(255),
    createdate DATE default sysdate,
    paperid NVARCHAR2(255),
    identifier NUMBER default 1
);
alter table T_BUSINESS_QUESTION
    add constraint T_UNIQUE_QUESTION_QID unique (QUESTIONID);
alter table T_BUSINESS_QUESTION
    add constraint T_FK_QUESTION_QID foreign key (PAPERID)
        references T_BUSINESS_PAPER (SORT) on delete cascade;
/

create table T_BUSINESS_CHILDQUESTION
(
    childid NVARCHAR2(255) not null,
    childname NVARCHAR2(255),
    subjectivity CLOB,
    identifier NUMBER default 1,
    condition CLOB,
    seq NUMBER default 1,
    parentid NVARCHAR2(255)
);
alter table T_BUSINESS_CHILDQUESTION
    add constraint T_FK_CHILDQUESTION_PARENTID foreign key (PARENTID)
        references T_BUSINESS_QUESTION (QUESTIONID) on delete cascade;
/

create table T_BUSINESS_CALLCYCLEMANAGE
(
    id NVARCHAR2(255) not null,
    pushtaskid NVARCHAR2(255),
    tasktotal NUMBER,
    taskstate NUMBER,
    startdate    DATE,
    enddate      DATE,
    newstartdate DATE,
    newenddate   DATE,
    editor NVARCHAR2(255),
    editdate     DATE,
    callstate NUMBER
);
alter table T_BUSINESS_CALLCYCLEMANAGE
    add constraint ID unique (ID);

#8a7ed0b  低版本升级所需
#alter table T_BUSINESS_CALLBACK
#    add BELONGTASKID varchar2(50) not null;
#update T_BUSINESS_CALLBACK set BELONGTASKID = CALLTASKID;
#alter table T_BUSINESS_CALLCYCLEMANAGE drop column RETURNTASKID;
##alter table T_BUSINESS_NEWCONTRACT
#    add POLICYSRC VARCHAR2(10 char);

create table T_BUSINESS_NEWCONTRACT
(
    ID VARCHAR2 (60) not null
        primary key,
    CALLTASKID VARCHAR2 (60 char),
    CALLTASKFISCID VARCHAR2 (60 char),
    CALLOUTTYPE1 VARCHAR2 (60 char),
    CALLOUTTYPE2 VARCHAR2 (60 char),
    POLICYNO VARCHAR2 (60 char),
    APPLICANTNAME VARCHAR2 (255 char),
    APPLICANTSEX VARCHAR2 (255 char),
    PHONES VARCHAR2 (255 char),
    ASKDT VARCHAR2 (255 char),
    AGENTNAME VARCHAR2 (255 char),
    POLICYORG VARCHAR2 (255 char),
    AGENTORGNAME VARCHAR2 (255 char),
    POLICYSLCHNL VARCHAR2 (255 char),
    POLICYSLTYPE VARCHAR2 (255 char),
    ISDIRECTSALE VARCHAR2 (255 char),
    APPLICANTBIRTHDAY VARCHAR2 (255 char),
    APPLICANTAGE VARCHAR2 (255 char),
    APPLICANTCDTP VARCHAR2 (255 char),
    APPLICANTCDNO VARCHAR2 (255 char),
    APPLICANTADDRESS VARCHAR2 (255 char),
    POSTALCD VARCHAR2 (255 char),
    TELLPHONES VARCHAR2 (255 char),
    EMAIL VARCHAR2 (255 char),
    ISELIFE VARCHAR2 (255 char),
    POLICYTYPE VARCHAR2 (255 char),
    CUSTSAMEFLAG VARCHAR2 (255 char),
    INSUREDNAME VARCHAR2 (255 char),
    INSUREDBIRTHDAY VARCHAR2 (255 char),
    HESITATION VARCHAR2 (255 char),
    REGULARPREM VARCHAR2 (255 char),
    MAINANDADDRISKPREM VARCHAR2 (255 char),
    TOTALPREM VARCHAR2 (255 char),
    MINGUARANTRATE VARCHAR2 (255 char),
    HESITATIONSTARTDT VARCHAR2 (255 char),
    HESITATIOENDDT VARCHAR2 (255 char),
    NEXTDEDUCTDT VARCHAR2 (255 char),
    PAYNUMBER VARCHAR2 (255 char),
    ISHISINTO VARCHAR2 (255 char),
    ISCOLLECINITIALCOST VARCHAR2 (255 char),
    ISCOLLECTMANAGECOST VARCHAR2 (255 char),
    ISCOLLECTRISKPREM VARCHAR2 (255 char),
    HAVEADDRISK VARCHAR2 (255 char),
    ISREGULARADDRISK VARCHAR2 (255 char),
    ISLIFEADDRISK VARCHAR2 (255 char),
    ISNOTREGULARADDRISK VARCHAR2 (255 char),
    POLICYSRC VARCHAR2 (10 char),
    ADDPREM VARCHAR2 (255 char),
    RISKINFOS clob,
    IMPORTDATE     date,
    DISTRIBUTEDATE date,
    DISTRIBUTEFLAG NUMBER default 0,
    CLOSEDATE      date,
    CLOSEFLAG NUMBER default 0,
    CALLCOUNT NUMBER default 0,
    YEAR VARCHAR2 (20 char),
    CREATETIME     date,
    BELONGTASKID VARCHAR2 (255 char),
    describe varchar2 (200) default ''
);

#bcdbef4f 之前的版本需要执行以下sql
#alter table T_BUSINESS_NEWCONTRACT
#    add ADDPREM varchar2(255) default ''
#    /

#3a421ee7 之前的版本需要执行以下sql
#alter table T_BUSINESS_NEWCONTRACT
#    add MANAGECOM varchar2(255) default ''
#    /
#alter table T_BUSINESS_CALLBACK
#    add MANAGECOM varchar2(255) default ''
#    /
#alter table T_BUSINESS_NEWCONTRACT
#    add INITIALCOSTRATIO varchar2(255) default ''
#    /