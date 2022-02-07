-- 게시판 테이블 만들기
CREATE TABLE board2 (
    bno number not null primary key --게시물번호
    ,title varchar2(200) not null   --게시물제목
    ,content varchar2(4000)         --게시물내용
    ,writer varchar2(50) not null   --게시물작성자
    ,regdate date default sysdate   --게시물작성일자
    ,viewcnt number default 0       --게시물조회수
);
-- 테이블 데이터 삭제
DELETE FROM board2;

-- 게시물 레코드 120개 삽입하기
declare
i number := 1; begin
while i<=120 loop
insert into board2 (bno,title,content,writer) values
((select nvl(max(bno)+1,1) from board2) ,'제목'||i,'내용'||i,'kim');
i := i+1;
end loop; 
end;
/

-- 게시글수 조회 또는 게시판 조회
select count(*) from board2; 
select * from board2;
-- commit
commit;

CREATE TABLE member2 (
    userid varchar2(100) not null primary key --사용자아이디
    ,passwd varchar2(500) not null   --비밀번호
    ,name varchar2(100)         --이름
    ,email varchar2(200) not null   --이메일
    ,regdate date default sysdate   --가입일
);

insert into member2(userid, passwd, name, email) values 
('admin','1234','관리자','kkt09072@naver.com');

select * from member2;


