DROP TABLE IF EXISTS digital_member;
CREATE TABLE IF NOT EXISTS digital_member(
	u_num INT primary key auto_increment, 	-- 회원번호
	u_id VARCHAR(30) unique,			  	-- 회원아이디
	u_pass VARCHAR(30) NOT NULL,			-- 비밀번호
	u_age int,								-- 나이
	u_gender VARCHAR(10), 				    -- 성별
	u_join char(1) default 'Y',				-- 회원탈퇴 여부 Y == 가입상태
	u_regdate TIMESTAMP default now() 		-- 회원가입일	 
);

-- 회원 가입 시
INSERT INTO digital_member(u_id,u_pass,u_age,u_gender) 
VALUES('admin', 'admin' , 20, 'male');

-- 회원탈퇴 시
-- UPDATE digital_member SET u_join = 'N' WHERE u_num = 회원번호;
commit;

SELECT * FROM digital_member;
SELECT count(*) FROM digital_member; 

-- 관리자가 아니고 탈퇴한 회원이 아닌 정보 출력
SELECT * FROM digital_member 
WHERE u_id != 'admin' AND u_join = 'Y' 
ORDER BY u_num DESC

SELECT * FROM digital_member WHERE u_id != 'admin' AND u_join = 'Y' ORDER BY u_num DESC limit 0, 2;
