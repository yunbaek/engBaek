CREATE TABLE auth(
    authNo VARCHAR2(10) CONSTRAINT auth_pk PRIMARY KEY
);

insert into auth values('ROLE_S');
insert into auth values('ROLE_N');
insert into auth values('ROLE_Y');
insert into auth values('ROLE_R');
insert into auth values('ROLE_A');


CREATE TABLE teacher(
    teacherId   VARCHAR2(40) CONSTRAINT teacher_pk PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    pw          VARCHAR2(40) NOT NULL,
    birthday    VARCHAR2(40) NOT NULL,
    email1      VARCHAR2(40) NOT NULL,
    email2      VARCHAR2(40) NOT NULL,
    phone       VARCHAR2(40) NOT NULL,
    gender      VARCHAR2(40) NOT NULL,
    address     VARCHAR2(500) NOT NULL,
    regdate     DATE DEFAULT SYSDATE,
    career      VARCHAR2(4000) NOT NULL,
    authNo      VARCHAR2(10) CONSTRAINT t_auth_fk REFERENCES auth(authNo) NOT NULL
 );
 
 
 insert into teacher values('tc1','김하나','abc123','1992-02-14','abc','naver.com','010-1111-1111','여',
 '경기도 개멀구 힘들동',sysdate,'서울대학교','ROLE_Y');
  insert into teacher values('tc2','김두나','abc123','1992-02-14','dadd','naver.com','010-1111-1111','여',
 '경기도 개멀구 힘들동',sysdate,'서울대학교','ROLE_Y');
  insert into teacher values('tc3','김세나','abc123','1992-02-14','hoho','naver.com','010-1111-1111','여',
 '경기도 개멀구 힘들동',sysdate,'서울대학교','ROLE_Y');
 
 
 //3.관리자    
CREATE TABLE admin(
    adminId    VARCHAR2(40) CONSTRAINT admin_pk PRIMARY KEY,
    pw         VARCHAR2(40) NOT NULL,
    adminName  VARCHAR2(40) NOT NULL,
    authNo     VARCHAR2(10) CONSTRAINT a_auth_fk REFERENCES auth(authNo) NOT NULL
);

insert into admin values('admin1','1111','관리자1','ROLE_A');
insert into admin values('admin2','1111','관리자2','ROLE_A');
insert into admin values('admin3','1111','관리자3','ROLE_A');

//4.학생
CREATE TABLE student(
    studentId   VARCHAR2(40) CONSTRAINT student_pk PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    pw          VARCHAR2(40) NOT NULL,
    birthday    VARCHAR2(40) NOT NULL,
    email1      VARCHAR2(40) NOT NULL,
    email2      VARCHAR2(40) NOT NULL,
    phone       VARCHAR2(40) NOT NULL,
    gender      VARCHAR2(40) NOT NULL,
    address     VARCHAR2(40) NOT NULL,
    regdate     DATE    DEFAULT SYSDATE,
    authNo      VARCHAR2(10) CONSTRAINT s_auth_fk REFERENCES auth(authNo) NOT NULL
 );
 
 insert into student values('stu1','김학생','abc123','1997-07-26','tttt','gmail.com','010-222-2222','남','서울시 미세먼지구 인구많',
 sysdate,'ROLE_S');
  insert into student values('stu2','이학생','abc123','1997-07-26','tttt','gmail.com','010-222-2222','남','서울시 미세먼지구 인구많',
 sysdate,'ROLE_S');
  insert into student values('stu3','박학생','abc123','1997-07-26','tttt','gmail.com','010-222-2222','남','서울시 미세먼지구 인구많',
 sysdate,'ROLE_S');
 
 
 //5.강좌
CREATE TABLE course(
    courseCode     NUMBER(20) CONSTRAINT course_pk PRIMARY KEY,
    teacherId      VARCHAR2(40) CONSTRAINT c_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    classroomNo    NUMBER(20)  NOT NULL,
    courseName     VARCHAR2(40) NOT NULL,
    courseType     VARCHAR2(40) NOT NULL,
    courseLevel    VARCHAR2(40) NOT NULL,
    courseInfo     VARCHAR2(2000) NOT NULL,
    courseDay      VARCHAR2(40) NOT NULL,
    courseTime     VARCHAR2(40) NOT NULL,
    courseStart    VARCHAR2(40) NOT NULL,
    courseEnd      VARCHAR2(40) NOT NULL,
    price          NUMBER(20)  NOT NULL
);

CREATE SEQUENCE course_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE ;

insert into course values(course_seq.nextval,'tc1',12,'미친토익','토익','550','기본기를 
탄탄하게 잡아주는 기본토익','수,토','10:00-12:00',sysdate,sysdate,150000);
 
insert into course values(course_seq.nextval,'tc2',12,'돌아버린토익','토익','850','고득점 
탄탄하게 잡아주는 토익','토,일','16:00-18:00',sysdate,sysdate,100000);

insert into course values(course_seq.nextval,'tc3',12,'미친토스','토스','7','기본기를 
탄탄하게 잡아주는 기본토스','월,화,수','14:00-16:00',sysdate,sysdate,200000);
 
 
 //6.강사소개
CREATE TABLE profile(
    teacherPno  NUMBER(20) CONSTRAINT teacher_profile_pk PRIMARY KEY,
    teacherId  VARCHAR2(40) CONSTRAINT tp_teacher_fk REFERENCES teacher(teacherId) NOT NULL UNIQUE,
    teachersubject VARCHAR2(2000) NOT NULL,
    teacherProfile VARCHAR2(2000) NOT NULL
);

CREATE SEQUENCE profile_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE ;

insert into profile values(profile_seq.nextval,'tc3','토스-6,토익-550,토익-850','현)잉글리시백에서 미친토스 강의 중');
insert into profile values(profile_seq.nextval,'tc3','토스-5,토스-6,토스-7','현)잉글리시백에서 미친토스 강의 중');
insert into profile values(profile_seq.nextval,'tc1','토익-700','현)잉글리시백에서 미친토익 강의 중');


//7.FAQ
CREATE TABLE faq(
   faqNo NUMBER(20)  CONSTRAINT faq_pk PRIMARY KEY,
   adminId VARCHAR2(40) CONSTRAINT f_admin_fk REFERENCES admin(adminId) NOT NULL,
   faqTitle VARCHAR2(100) NOT NULL,
   faqContent VARCHAR2(2000) NOT NULL,
   faqRegdate DATE DEFAULT SYSDATE 
);


//FAQ 시퀀스
CREATE SEQUENCE faq_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into faq values(faq_seq.nextval,'admin1','환불 이제 안 받습니다','그냥 그런 이유가 있습니다',sysdate);
insert into faq values(faq_seq.nextval,'admin2','수강신청 절차를 알려드립니다. ','이 순서 그대로 해주세요',sysdate);
insert into faq values(faq_seq.nextval,'admin1','개강 후에 환불은 어떤 식으로 이루어지나요?','그냥 그런 이유가 있습니다',sysdate);

//8.공지사항
CREATE TABLE notice(
    noticeNo NUMBER(20) CONSTRAINT notice_pk PRIMARY KEY,
    adminId   VARCHAR2(40) CONSTRAINT notice_admin_fk REFERENCES admin(adminId) NOT NULL,
    noticeTitle VARCHAR2(100) NOT NULL,
    noticeContent VARCHAR2(2000) NOT NULL,
    noticeRegdate  DATE DEFAULT SYSDATE
);

//공지사항 시퀀스
CREATE SEQUENCE notice_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into notice  values(notice_seq.nextval,'admin1','임시 공휴일에대한 공지 드립니다.','그냥 그런 이유가 있습니다',sysdate);
insert into notice  values(notice_seq.nextval,'admin1','빈강의실 이용시 주의할 점 ','그냥 집에 가세요',sysdate);
insert into notice  values(notice_seq.nextval,'admin2','여름특강 공지','구라구라구라',sysdate);

//9.환불규정
CREATE TABLE refundInfo(
    refundInfoNo NUMBER(20) CONSTRAINT refundInfo_pk PRIMARY KEY,
    adminId VARCHAR2(40) CONSTRAINT refundInfo_admin_fk REFERENCES admin(adminId) NOT NULL,
    refundInfoContent VARCHAR2(4000) NOT NULL
);

//환불규정 시퀀스
CREATE SEQUENCE refundInfo_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into refundInfo values(refundInfo_seq.nextval,'admin3','환불은 1층 안내데스트로 와주세요');


//10.강의별 Q&A
CREATE TABLE classQna(
    classQnaNo   NUMBER(20) CONSTRAINT classQna_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT classQna_course_fk REFERENCES course(coursecode) NOT NULL,
    studentId  VARCHAR2(40)  CONSTRAINT classQna_student_fk REFERENCES student(studentid) NOT NULL,
    teacherId  VARCHAR2(40) CONSTRAINT classQna_teacher_fk  REFERENCES teacher(teacherid) NOT NULL,
    classQnaTitle VARCHAR2(100) NOT NULL,
    classQnaContent VARCHAR2(2000) NOT NULL,
    classQnaRegdate DATE DEFAULT SYSDATE
);

//강의별 Q&A 시퀀스
CREATE SEQUENCE classQna_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into classQna values(classQna_seq.nextval,1,'stu1','tc2','1강 12번 문제 풀이','왜 답이 2개인가요',sysdate);
insert into classQna values(classQna_seq.nextval,2,'stu2','tc1','1강 12번 문제 풀이','왜 답이 2개인가요',sysdate);
insert into classQna values(classQna_seq.nextval,3,'stu3','tc3','1강 12번 문제 풀이','왜 답이 2개인가요',sysdate);


/11.강의별 Q&A댓글
CREATE TABLE classQnaComment (
    commentNO NUMBER(20) CONSTRAINT c_qna_comment_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT qna_c_course_fk REFERENCES course(courseCode) NOT NULL,
    studentId  VARCHAR2(40) CONSTRAINT qna_c_student_fk REFERENCES student(studentId) NOT NULL,
    teacherId  VARCHAR2(40) CONSTRAINT qna_c_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    commentContent VARCHAR2(2000) NOT NULL,
    commentRegdate DATE DEFAULT SYSDATE,
    classQnaNo  NUMBER(20) CONSTRAINT qna_c_c_qna_board_fk REFERENCES classQna(classQnaNo)NOT NULL
);

//강의별 Q&A 댓글 시퀀스
CREATE SEQUENCE classQnaComment_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;         

insert into classQnaComment values(classQnaComment_seq.nextval,'1','stu2','tc1','왜냐면요 제가 문제를 실수했거든요',sysdate,2);


//12.수강후기
CREATE TABLE review(
    reviewNo NUMBER(20) CONSTRAINT review_pk PRIMARY KEY, 
    teacherId  VARCHAR2(40) CONSTRAINT r_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    courseCode NUMBER(20) CONSTRAINT r_course_fk REFERENCES course(courseCode) NOT NULL,
    studentId  VARCHAR2(40) CONSTRAINT r_student_fk REFERENCES student(studentId) NOT NULL,
    reviewTitle VARCHAR2(100) NOT NULL,
    reviewContent VARCHAR2(2000) NOT NULL,
    reviewRegdate DATE DEFAULT SYSDATE
);

//수강후기 시퀀스
CREATE SEQUENCE review_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into review values(review_seq.nextval,'tc1',1,'stu1','점수 최고를 찍었어요','정말감사드려요',sysdate);
insert into review values(review_seq.nextval,'tc2',1,'stu2','점수 최고를 찍었어요','정말감사드려요',sysdate);
insert into review values(review_seq.nextval,'tc3',1,'stu3','점수 최고를 찍었어요','정말감사드려요',sysdate);

//13.수업자료&공지사항
CREATE TABLE classData (
    classDataNo NUMBER(20) CONSTRAINT class_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT cl_course_fk REFERENCES course(courseCode) NOT NULL,
    teacherId VARCHAR2(40) CONSTRAINT cl_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    classDataTitle VARCHAR2(100) NOT NULL,
    classDataContent VARCHAR2(2000) NOT NULL,
    classDataRegdate DATE DEFAULT SYSDATE
);

//수업자료&공지사항 시퀀스
CREATE SEQUENCE classData_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into classData values(classData_seq.nextval,1,'tc2','1강 12번 문제 풀이','선택지에 답이 없으니 수업시간에 다시 공지드릴게요',sysdate);
insert into classData values(classData_seq.nextval,2,'tc2','1강 12번 문제 풀이','선택지에 답이 없으니 수업시간에 다시 공지드릴게요',sysdate);
insert into classData values(classData_seq.nextval,3,'tc2','1강 12번 문제 풀이','선택지에 답이 없으니 수업시간에 다시 공지드릴게요',sysdate);


//14.수업자료&공지사항 파일업로드
CREATE TABLE classDataAttach (
    uuid VARCHAR2(2000) CONSTRAINT class_upload_pk PRIMARY KEY,
    fileName VARCHAR2(40) NOT NULL,
    classDataNo NUMBER(20) CONSTRAINT cu_class_fk REFERENCES classData(classDataNo) NOT NULL,
    attachRegdate DATE DEFAULT SYSDATE
);

//15.일대일문의
CREATE TABLE privateQna(
    privateQnaNo  NUMBER(20) CONSTRAINT p_qna_board_pk PRIMARY KEY,
    studentId VARCHAR2(40) CONSTRAINT pq_student_fk REFERENCES student(studentId) NOT NULL,
    privateQnaTitle VARCHAR2(100) NOT NULL,
    privateQnaContent VARCHAR2(2000) NOT NULL,
    privateQnaRegdate DATE DEFAULT SYSDATE
);

//일대일문의 시퀀스
CREATE SEQUENCE privateQna_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into privateQna values(privateQna_seq.nextval,'stu1','임시 공휴일 휴강 하나요','궁금하네요',sysdate);
insert into privateQna values(privateQna_seq.nextval,'stu2','임시 공휴일 휴강 하나요','궁금하네요',sysdate);
insert into privateQna values(privateQna_seq.nextval,'stu3','임시 공휴일 휴강 하나요','궁금하네요',sysdate);

//16.일대일문의 답변
CREATE TABLE privateQnaReply(
    privateQnaReplyNo NUMBER(20) CONSTRAINT p_qna_comment_pk PRIMARY KEY,
    privateQnaNo NUMBER(20) CONSTRAINT pqc_p_qna_board_fk REFERENCES privateQna(privateQnaNo) NOT NULL UNIQUE,
    adminId VARCHAR2(40) CONSTRAINT pqc_admin_fk REFERENCES admin(adminId) NOT NULL,
    privateQnaReplyTitle VARCHAR2(100) NOT NULL,
    privateQnaReplyContent VARCHAR2(2000) NOT NULL,
    privateQnaReplyRegdate DATE DEFAULT SYSDATE
);

//일대일문의 답변 시퀀스
CREATE SEQUENCE privateQnaReply_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE ;

insert into privateQnaReply values(privateQnaReply_seq.nextval,1,'admin1','임시 공휴일 휴강 답변드려요','저도 궁금하네요',sysdate);


//17.결제내역
CREATE TABLE payment(
    paymentNo NUMBER(20) CONSTRAINT payment_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT pay_course_fk REFERENCES course(courseCode) NOT NULL,
    studentId  VARCHAR2(40) CONSTRAINT pay_student_fk REFERENCES student(studentId) NOT NULL,
    paymentMethod VARCHAR2(40) NOT NULL,
    paymentPrice   NUMBER(20) NOT NULL,
    paymentDate DATE DEFAULT SYSDATE,
    paymentState VARCHAR2(40) NOT NULL
);
//결제내역 시퀀스
CREATE SEQUENCE payment_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE ;

insert into payment values(payment_seq.nextval,1,'stu1','카드',290000,sysdate,'결제완료');
insert into payment values(payment_seq.nextval,2,'stu1','카드',290000,sysdate,'결제완료');
insert into payment values(payment_seq.nextval,3,'stu1','카드',290000,sysdate,'결제완료');

//18.환불내역
CREATE TABLE refund(
    refundNo NUMBER(20) CONSTRAINT refund_pk PRIMARY KEY,
    paymentNo NUMBER(20) CONSTRAINT rf_payment_fk REFERENCES payment(paymentNo) NOT NULL,
    refundPrice NUMBER(20) NOT NULL,
    courseCode NUMBER(20) CONSTRAINT rf_course_fk REFERENCES course(courseCode) NOT NULL,
    refundDate DATE DEFAULT SYSDATE,
    studentId VARCHAR2(40) CONSTRAINT rf_student_fk REFERENCES student(studentId) NOT NULL
);

//환불내역 시퀀스
CREATE SEQUENCE refund_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;


insert into refund values(refund_seq.nextval,1,290000,1,sysdate,'stu1');
insert into refund values(refund_seq.nextval,2,290000,1,sysdate,'stu2');
insert into refund values(refund_seq.nextval,3,290000,1,sysdate,'stu3');


//19.수강내역
CREATE TABLE courseHistory(
    historyNo NUMBER(20) CONSTRAINT course_history_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT ch_course_fk REFERENCES course(courseCode) NOT NULL,
    paymentNo NUMBER(20) CONSTRAINT ch_payment_fk REFERENCES payment(paymentNo) NOT NULL,
    studentId VARCHAR2(40) CONSTRAINT ch_student_fk REFERENCES student(studentId) NOT NULL,
    teacherId VARCHAR2(40) CONSTRAINT ch_teacher_fk REFERENCES teacher(teacherId) NOT NULL
);

//수강내역 시퀀스
CREATE SEQUENCE courseHistory_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE;

insert into courseHistory values(courseHistory_seq.nextval,1,1,'stu1','tc1');
insert into courseHistory values(courseHistory_seq.nextval,2,1,'stu2','tc2');
insert into courseHistory values(courseHistory_seq.nextval,3,1,'stu3','tc3');



CREATE TABLE profileAttach
(
   teacherPno number(20) CONSTRAINT attach_profile_fk REFERENCES profile(teacherPno) NOT NULL,
   teacherProfilePicture varchar2(100) NOT NULL,
   teacherProfileUuid varchar2(100) CONSTRAINT profileAttach_pk PRIMARY KEY,
   uploadPath varchar2(100) NOT null,
   fileType CHAR(1) DEFAULT 'I'
);



CREATE TABLE courseAttach
(
    coursePictureUuid VARCHAR2(100) CONSTRAINT courseAttach_pk PRIMARY KEY,
    coursePictureName VARCHAR2(100) NOT NULL,
    uploadPath VARCHAR2(100) NOT NULL,
    courseCode NUMBER(10, 0) CONSTRAINT course_attach_fk REFERENCES COURSE(courseCode) not null,
   fileType CHAR(1) DEFAULT 'I'
);


==============================테이블 다지우기=====================================
DROP TABLE courseAttach
DROP TABLE profileAttach
DROP TABLE courseHistory;
DROP TABLE refund;
DROP TABLE payment;
DROP TABLE privateQnaReply;
DROP TABLE privateQna;
DROP TABLE classDataAttach;
DROP TABLE classData;
DROP TABLE review;
DROP TABLE classQnaComment;
DROP TABLE classQna;
DROP TABLE refundInfo;
DROP TABLE notice;
DROP TABLE faq;
DROP TABLE profile;
DROP TABLE course;
DROP TABLE student;
DROP TABLE admin;
DROP TABLE teacher;
DROP TABLE auth;


================================시퀀스 다지우기==========================================
DROP SEQUENCE courseHistory_seq;
DROP SEQUENCE refund_seq;
DROP SEQUENCE payment_seq;
DROP SEQUENCE privateQnaReply_seq;
DROP SEQUENCE privateQna_seq;
DROP SEQUENCE classData_seq;
DROP SEQUENCE review_seq;
DROP SEQUENCE classQnaComment_seq;
DROP SEQUENCE classQna_seq;
DROP SEQUENCE refundInfo_seq;
DROP SEQUENCE notice_seq;
DROP SEQUENCE faq_seq;
DROP SEQUENCE course_seq;
DROP SEQUENCE profile_seq;


alter table classQna add(replycnt number default 0);    //댓글수 추가

update classQna set replycnt = (select count(commentNo) from classQnaComment where classQna.classQnaNo = classQnaComment.classQnaNo);
