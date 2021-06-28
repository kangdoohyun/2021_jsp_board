DROP DATABASE IF EXISTS 2021_jsp_board;
CREATE DATABASE 2021_jsp_board;
USE 2021_jsp_board;

CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    delDate DATETIME DEFAULT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    loginId CHAR(50) UNIQUE NOT NULL,
    loginPw CHAR(100) NOT NULL,
    `name` CHAR(30) NOT NULL,
    nickname CHAR(30) UNIQUE NOT NULL,
    email CHAR(100) NOT NULL,
    cellphoneNo CHAR(20) NOT NULL,
    authLevel SMALLINT(2) UNSIGNED DEFAULT 3 NOT NULL COMMENT '3=일반,7=관리자'
);

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = '관리자',
nickname = '관리자',
email= 'rkdengus1208@gmail.com',
cellphoneNo = '01012341234',
authLevel = 7;

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`name` = '홍길동',
nickname = '강바람',
email= 'ghdrlfehd@gmail.com',
cellphoneNo = '01012341234';

CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    regDate DATETIME NOT NULL COMMENT '작성날짜',
    updateDate DATETIME NOT NULL COMMENT '수정날짜',
    `code` CHAR(20) NOT NULL UNIQUE COMMENT '코드',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '이름',
    blindStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '블라인드여부',
    blindDate DATETIME COMMENT '블라인드날짜',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제여부',
    delDate DATETIME COMMENT '삭제날짜'
);

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`name` = 'NOTICE',
`code` = 'notice';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`name` = 'FREE',
`code` = 'free';

ALTER TABLE article 
ADD COLUMN delDate DATETIME DEFAULT NULL AFTER updateDate;
    
ALTER TABLE article 
ADD COLUMN delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 AFTER updateDate;

ALTER TABLE article 
ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

ALTER TABLE article 
ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER updateDate;

ALTER TABLE article
ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

ALTER TABLE article
ADD COLUMN likeCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

ALTER TABLE article
ADD COLUMN dislikeCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

UPDATE article 
SET memberId = 2,
boardId = 2;