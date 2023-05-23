create table HoitUser(
    USERID varchar(20),
    USERPASSWORD varchar(20),
    USERNAME varchar(20),
    USERSTUDENTNUMBER varchar(20),
    USERGENDER varchar(20),
    USERPHONENUMBER varchar(20)
);
create table BBS(
    BBSID INT,
    BBSTITLE VARCHAR(100),
    USERID varchar(20),
    BBSDATE TIMESTAMP,
    BBSCONTENT varchar(2048),
    BBSAVAILABLE INT,
    PRIMARY KEY (BBSID)
);

create table BBSCOMMENT(
commentID int,
bbsID int,
userID varchar(20),
commentDate varchar(50),
commentText varchar(100),
commentAvailable int
);
alter table bbscomment add primary key (bbsID);
alter table bbscomment add constraint bbsID foreign key (bbsID) references bbs(bbsID);

create table NOTICEPAGE(
    NID INT,
    NTITLE VARCHAR(100),
    USERID varchar(20),
    NDATE TIMESTAMP,
    NCONTENT varchar(2048),
    NAVAILABLE INT,
    PRIMARY KEY (NID)
); 

create table REPORTPAGE(
    REPORTID INT,
    REPORTTITLE VARCHAR(100),
    USERID varchar(20),
    REPORTDATE TIMESTAMP,
    REPORTCONTENT varchar(2048),
    REPORTCHECK INT,
    PRIMARY KEY (REPORTID)
);

create table QUESTIONPAGE(
    QUESTIONID INT,
    QUESTIONTITLE VARCHAR(100),
    USERID varchar(20),
    QUESTIONDATE TIMESTAMP,
    QUESTIONCONTENT varchar(2048),
    QUESTIONCHECK INT,
    PRIMARY KEY (QUESTIONID)
);

create table QNACOMMENT(
qnacommentID int,
qnabbsID int,
userID varchar(20),
qnacommentDate varchar(50),
qnacommentText varchar(100),
qnacommentAvailable int
);