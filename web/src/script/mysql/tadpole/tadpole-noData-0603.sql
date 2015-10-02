-- --------------------------------------------------------
-- 호스트:                          197.200.32.79
-- 서버 버전:                        5.5.28 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- tadpole 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `tadpole` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tadpole`;


-- 테이블 tadpole의 구조를 덤프합니다. comtcadministcode
CREATE TABLE IF NOT EXISTS `comtcadministcode` (
  `ADMINIST_ZONE_SE` char(1) NOT NULL,
  `ADMINIST_ZONE_CODE` varchar(10) NOT NULL,
  `USE_AT` char(1) NOT NULL,
  `ADMINIST_ZONE_NM` varchar(60) DEFAULT NULL,
  `UPPER_ADMINIST_ZONE_CODE` varchar(10) DEFAULT NULL,
  `CREAT_DE` char(20) DEFAULT NULL,
  `ABL_DE` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ADMINIST_ZONE_SE`,`ADMINIST_ZONE_CODE`),
  UNIQUE KEY `COMTCADMINISTCODE_PK` (`ADMINIST_ZONE_SE`,`ADMINIST_ZONE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtcadministcoderecptnlog
CREATE TABLE IF NOT EXISTS `comtcadministcoderecptnlog` (
  `OCCRRNC_DE` char(20) NOT NULL,
  `ADMINIST_ZONE_SE` char(1) NOT NULL,
  `ADMINIST_ZONE_CODE` varchar(10) NOT NULL,
  `OPERT_SN` decimal(10,0) NOT NULL,
  `CHANGE_SE_CODE` varchar(2) DEFAULT NULL,
  `PROCESS_SE` varchar(2) DEFAULT NULL,
  `ADMINIST_ZONE_NM` varchar(60) DEFAULT NULL,
  `LOWEST_ADMINIST_ZONE_NM` varchar(60) DEFAULT NULL,
  `CTPRVN_CODE` varchar(2) DEFAULT NULL,
  `SIGNGU_CODE` varchar(3) DEFAULT NULL,
  `EMD_CODE` varchar(3) DEFAULT NULL,
  `LI_CODE` varchar(2) DEFAULT NULL,
  `CREAT_DE` char(20) DEFAULT NULL,
  `ABL_DE` char(20) DEFAULT NULL,
  `ABL_ENNC` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`ADMINIST_ZONE_SE`,`ADMINIST_ZONE_CODE`,`OPERT_SN`),
  UNIQUE KEY `COMTCADMINISTCODERECPTNLOG_PK` (`OCCRRNC_DE`,`ADMINIST_ZONE_SE`,`ADMINIST_ZONE_CODE`,`OPERT_SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtccmmnclcode
CREATE TABLE IF NOT EXISTS `comtccmmnclcode` (
  `CL_CODE` char(3) NOT NULL,
  `CL_CODE_NM` varchar(60) DEFAULT NULL,
  `CL_CODE_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CL_CODE`),
  UNIQUE KEY `COMTCCMMNCLCODE_PK` (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtccmmncode
CREATE TABLE IF NOT EXISTS `comtccmmncode` (
  `CODE_ID` varchar(6) NOT NULL,
  `CODE_ID_NM` varchar(60) DEFAULT NULL,
  `CODE_ID_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `CL_CODE` char(3) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  UNIQUE KEY `COMTCCMMNCODE_PK` (`CODE_ID`),
  KEY `COMTCCMMNCODE_i01` (`CL_CODE`),
  CONSTRAINT `comtccmmncode_ibfk_1` FOREIGN KEY (`CL_CODE`) REFERENCES `comtccmmnclcode` (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtccmmndetailcode
CREATE TABLE IF NOT EXISTS `comtccmmndetailcode` (
  `CODE_ID` varchar(6) NOT NULL,
  `CODE` varchar(15) NOT NULL,
  `CODE_NM` varchar(60) DEFAULT NULL,
  `CODE_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`,`CODE`),
  UNIQUE KEY `COMTCCMMNDETAILCODE_PK` (`CODE_ID`,`CODE`),
  KEY `COMTCCMMNDETAILCODE_i01` (`CODE_ID`),
  CONSTRAINT `comtccmmndetailcode_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `comtccmmncode` (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtczip
CREATE TABLE IF NOT EXISTS `comtczip` (
  `ZIP` varchar(6) NOT NULL,
  `SN` decimal(10,0) NOT NULL DEFAULT '0',
  `CTPRVN_NM` varchar(20) DEFAULT NULL,
  `SIGNGU_NM` varchar(20) DEFAULT NULL,
  `EMD_NM` varchar(60) DEFAULT NULL,
  `LI_BULD_NM` varchar(60) DEFAULT NULL,
  `LNBR_DONG_HO` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ZIP`,`SN`),
  UNIQUE KEY `COMTCZIP_PK` (`ZIP`,`SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtecopseq
CREATE TABLE IF NOT EXISTS `comtecopseq` (
  `TABLE_NAME` varchar(20) NOT NULL DEFAULT '',
  `NEXT_ID` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`),
  UNIQUE KEY `COMTECOPSEQ_PK` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthconfmhistory
CREATE TABLE IF NOT EXISTS `comthconfmhistory` (
  `CONFM_NO` decimal(8,0) NOT NULL,
  `CONFM_RQESTER_ID` varchar(20) NOT NULL,
  `CONFMER_ID` varchar(20) DEFAULT NULL,
  `CONFM_DE` char(20) DEFAULT NULL,
  `CONFM_TY_CODE` char(4) NOT NULL,
  `CONFM_STTUS_CODE` char(4) NOT NULL,
  `OPERT_TY_CODE` char(4) DEFAULT NULL,
  `OPERT_ID` varchar(20) DEFAULT NULL,
  `TRGET_JOB_TY_CODE` char(3) DEFAULT NULL,
  `TRGET_JOB_ID` char(20) DEFAULT NULL,
  PRIMARY KEY (`CONFM_NO`),
  UNIQUE KEY `COMTHCONFMHISTORY_PK` (`CONFM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthdbmntrngloginfo
CREATE TABLE IF NOT EXISTS `comthdbmntrngloginfo` (
  `DATA_SOURC_NM` varchar(60) NOT NULL,
  `SERVER_NM` varchar(60) DEFAULT NULL,
  `DBMS_KND` varchar(2) DEFAULT NULL,
  `CECK_SQL` varchar(250) DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `LOG_INFO` varchar(2000) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LOG_ID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`LOG_ID`),
  UNIQUE KEY `COMTHDBMNTRNGLOGINFO_PK` (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthemaildsptchmanage
CREATE TABLE IF NOT EXISTS `comthemaildsptchmanage` (
  `MSSAGE_ID` varchar(20) NOT NULL DEFAULT '',
  `EMAIL_CN` mediumtext,
  `SNDR` varchar(50) NOT NULL,
  `RCVER` varchar(50) NOT NULL,
  `SJ` varchar(60) NOT NULL,
  `SNDNG_RESULT_CODE` char(1) DEFAULT NULL,
  `DSPTCH_DT` char(20) NOT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  PRIMARY KEY (`MSSAGE_ID`),
  UNIQUE KEY `COMTHEMAILDSPTCHMANAGE_PK` (`MSSAGE_ID`),
  KEY `COMTHEMAILDSPTCHMANAGE_i01` (`SNDR`),
  KEY `COMTHEMAILDSPTCHMANAGE_i02` (`ATCH_FILE_ID`),
  CONSTRAINT `comthemaildsptchmanage_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `comtnfile` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthemplyrinfochangedtls
CREATE TABLE IF NOT EXISTS `comthemplyrinfochangedtls` (
  `EMPLYR_ID` varchar(20) NOT NULL,
  `CHANGE_DE` char(20) NOT NULL DEFAULT '',
  `ORGNZT_ID` char(20) DEFAULT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `EMPL_NO` varchar(20) DEFAULT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `BRTHDY` char(20) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `HOUSE_ADRES` varchar(100) DEFAULT NULL,
  `HOUSE_END_TELNO` varchar(4) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `ZIP` varchar(6) DEFAULT NULL,
  `OFFM_TELNO` varchar(20) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `HOUSE_MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `PSTINST_CODE` char(8) DEFAULT NULL,
  `EMPLYR_STTUS_CODE` char(1) DEFAULT NULL,
  `ESNTL_ID` char(20) DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`,`CHANGE_DE`),
  UNIQUE KEY `COMTHEMPLYRINFOCHANGEDTLS_PK` (`EMPLYR_ID`,`CHANGE_DE`),
  KEY `COMTHEMPLYRINFOCHANGEDTLS_i01` (`EMPLYR_ID`),
  CONSTRAINT `comthemplyrinfochangedtls_ibfk_1` FOREIGN KEY (`EMPLYR_ID`) REFERENCES `comtnemplyrinfo` (`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthhttpmonloginfo
CREATE TABLE IF NOT EXISTS `comthhttpmonloginfo` (
  `SYS_ID` varchar(20) NOT NULL,
  `SITE_URL` varchar(100) DEFAULT NULL,
  `WEBSVC_KND` varchar(10) DEFAULT NULL,
  `HTTP_STTUS_CODE` varchar(3) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `LOG_INFO` varchar(2000) DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LOG_ID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`SYS_ID`,`LOG_ID`),
  UNIQUE KEY `COMTHHTTPMONLOGINFO_PK` (`SYS_ID`,`LOG_ID`),
  CONSTRAINT `comthhttpmonloginfo_ibfk_1` FOREIGN KEY (`SYS_ID`) REFERENCES `comtnhttpmon` (`SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthprogrmchangedtls
CREATE TABLE IF NOT EXISTS `comthprogrmchangedtls` (
  `PROGRM_FILE_NM` varchar(60) NOT NULL,
  `REQUST_NO` decimal(10,0) NOT NULL DEFAULT '0',
  `RQESTER_ID` varchar(20) NOT NULL,
  `CHANGE_REQUST_CN` varchar(1000) DEFAULT NULL,
  `REQUST_PROCESS_CN` mediumtext,
  `OPETR_ID` varchar(20) DEFAULT NULL,
  `PROCESS_STTUS_CODE` varchar(15) NOT NULL,
  `PROCESS_DE` char(20) DEFAULT NULL,
  `RQESTDE` char(20) DEFAULT NULL,
  `REQUST_SJ` varchar(60) NOT NULL,
  PRIMARY KEY (`PROGRM_FILE_NM`,`REQUST_NO`),
  UNIQUE KEY `COMTHPROGRMCHANGEDTLS_PK` (`PROGRM_FILE_NM`,`REQUST_NO`),
  KEY `COMTHPROGRMCHANGEDTLS_i01` (`PROGRM_FILE_NM`),
  CONSTRAINT `comthprogrmchangedtls_ibfk_1` FOREIGN KEY (`PROGRM_FILE_NM`) REFERENCES `comtnprogrmlist` (`PROGRM_FILE_NM`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthsyshist
CREATE TABLE IF NOT EXISTS `comthsyshist` (
  `HIST_ID` char(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `HIST_SE_CODE` char(6) NOT NULL,
  `HIST_CN` varchar(2500) NOT NULL,
  `SYS_NM` varchar(255) NOT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  PRIMARY KEY (`HIST_ID`),
  UNIQUE KEY `COMTHSYSHIST_PK` (`HIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comthtrsmrcvmntrngloginfo
CREATE TABLE IF NOT EXISTS `comthtrsmrcvmntrngloginfo` (
  `LOG_ID` char(20) NOT NULL,
  `CNTC_ID` char(8) NOT NULL,
  `TEST_CLASS_NM` varchar(255) DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `LOG_INFO` varchar(2000) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`LOG_ID`),
  UNIQUE KEY `COMTHTRSMRCVMNTRNGLOGINFO_PK` (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnadbk
CREATE TABLE IF NOT EXISTS `comtnadbk` (
  `EMPLYR_ID` varchar(20) DEFAULT NULL,
  `NCRD_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `ADBK_CONSTNT_ID` char(20) NOT NULL,
  `NM` varchar(50) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `OFFM_TELNO` varchar(20) DEFAULT NULL,
  `HOUSE_TELNO` varchar(20) DEFAULT NULL,
  `ADBK_ID` char(20) NOT NULL,
  PRIMARY KEY (`ADBK_CONSTNT_ID`,`ADBK_ID`),
  UNIQUE KEY `COMTNADBK_PK` (`ADBK_CONSTNT_ID`,`ADBK_ID`),
  KEY `COMTNADBK_i01` (`ADBK_ID`),
  CONSTRAINT `comtnadbk_ibfk_1` FOREIGN KEY (`ADBK_ID`) REFERENCES `comtnadbkmanage` (`ADBK_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnadbkmanage
CREATE TABLE IF NOT EXISTS `comtnadbkmanage` (
  `ADBK_ID` char(20) NOT NULL,
  `ADBK_NM` varchar(50) NOT NULL,
  `OTHBC_SCOPE` varchar(20) NOT NULL,
  `USE_AT` char(1) NOT NULL,
  `WRTER_ID` varchar(20) DEFAULT NULL,
  `TRGET_ORGNZT_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ADBK_ID`),
  UNIQUE KEY `COMTNADBKMANAGE_PK` (`ADBK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnadministrationword
CREATE TABLE IF NOT EXISTS `comtnadministrationword` (
  `ADMINIST_WORD_ID` char(20) NOT NULL DEFAULT '',
  `ADMINIST_WORD_NM` varchar(255) DEFAULT NULL,
  `ADMINIST_WORD_ENG_NM` varchar(255) DEFAULT NULL,
  `ADMINIST_WORD_ABRV_NM` varchar(255) DEFAULT NULL,
  `THEMA_RELM` varchar(255) DEFAULT NULL,
  `WORD_SE` varchar(255) DEFAULT NULL,
  `RELATE_STD_WORD` varchar(255) DEFAULT NULL,
  `ADMINIST_WORD_DFN` varchar(2500) DEFAULT NULL,
  `ADMINIST_WORD_DC` varchar(4000) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`ADMINIST_WORD_ID`),
  UNIQUE KEY `COMTNADMINISTRATIONWORD_PK` (`ADMINIST_WORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnannvrsrymanage
CREATE TABLE IF NOT EXISTS `comtnannvrsrymanage` (
  `ANNVRSRY_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `ANNVRSRY_SE` varchar(2) NOT NULL,
  `ANNVRSRY_NM` varchar(255) NOT NULL,
  `ANNVRSRY` char(20) NOT NULL,
  `CLDR_SE` char(1) NOT NULL,
  `ANNVRSRY_NTCN_SETUP` char(1) DEFAULT NULL,
  `ANNVRSRY_NTCN_BGNDE` char(20) DEFAULT NULL,
  `MEMO` varchar(1000) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `REPTIT_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ANNVRSRY_ID`),
  UNIQUE KEY `COMTNANNVRSRYMANAGE_PK` (`ANNVRSRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnanswer
CREATE TABLE IF NOT EXISTS `comtnanswer` (
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `WRTER_ID` varchar(20) DEFAULT NULL,
  `ANSWER` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `WRTER_NM` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `ANSWER_NO` decimal(20,0) NOT NULL,
  PRIMARY KEY (`NTT_ID`,`BBS_ID`,`ANSWER_NO`),
  UNIQUE KEY `COMTNANSWER_PK` (`NTT_ID`,`BBS_ID`,`ANSWER_NO`),
  KEY `COMTNANSWER_FK1` (`BBS_ID`),
  CONSTRAINT `comtnanswer_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `comtnbbsmasteroptn` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnauthorgroupinfo
CREATE TABLE IF NOT EXISTS `comtnauthorgroupinfo` (
  `GROUP_ID` char(20) NOT NULL DEFAULT '',
  `GROUP_NM` varchar(60) NOT NULL,
  `GROUP_CREAT_DE` char(20) NOT NULL,
  `GROUP_DC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `COMTNAUTHORGROUPINFO_PK` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnauthorinfo
CREATE TABLE IF NOT EXISTS `comtnauthorinfo` (
  `AUTHOR_CODE` varchar(30) NOT NULL DEFAULT '',
  `AUTHOR_NM` varchar(60) NOT NULL,
  `AUTHOR_DC` varchar(200) DEFAULT NULL,
  `AUTHOR_CREAT_DE` char(20) NOT NULL,
  PRIMARY KEY (`AUTHOR_CODE`),
  UNIQUE KEY `COMTNAUTHORINFO_PK` (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnauthorrolerelate
CREATE TABLE IF NOT EXISTS `comtnauthorrolerelate` (
  `AUTHOR_CODE` varchar(30) NOT NULL,
  `ROLE_CODE` varchar(50) NOT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`AUTHOR_CODE`,`ROLE_CODE`),
  UNIQUE KEY `COMTNAUTHORROLERELATE_PK` (`AUTHOR_CODE`,`ROLE_CODE`),
  KEY `COMTNAUTHORROLERELATE_i01` (`AUTHOR_CODE`),
  KEY `COMTNAUTHORROLERELATE_i02` (`ROLE_CODE`),
  CONSTRAINT `comtnauthorrolerelate_ibfk_1` FOREIGN KEY (`AUTHOR_CODE`) REFERENCES `comtnauthorinfo` (`AUTHOR_CODE`) ON DELETE CASCADE,
  CONSTRAINT `comtnauthorrolerelate_ibfk_2` FOREIGN KEY (`ROLE_CODE`) REFERENCES `comtnroleinfo` (`ROLE_CODE`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbackupopert
CREATE TABLE IF NOT EXISTS `comtnbackupopert` (
  `BACKUP_OPERT_ID` varchar(20) NOT NULL,
  `BACKUP_OPERT_NM` varchar(60) DEFAULT NULL,
  `BACKUP_ORGINL_DRCTRY` varchar(255) DEFAULT NULL,
  `BACKUP_STRE_DRCTRY` varchar(255) DEFAULT NULL,
  `CMPRS_SE` varchar(2) DEFAULT NULL,
  `EXECUT_CYCLE` varchar(2) DEFAULT NULL,
  `EXECUT_SCHDUL_DE` char(20) DEFAULT NULL,
  `EXECUT_SCHDUL_HOUR` char(2) DEFAULT NULL,
  `EXECUT_SCHDUL_MNT` char(2) DEFAULT NULL,
  `EXECUT_SCHDUL_SECND` char(2) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`BACKUP_OPERT_ID`),
  UNIQUE KEY `COMTNBACKUPOPERT_PK` (`BACKUP_OPERT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbackupresult
CREATE TABLE IF NOT EXISTS `comtnbackupresult` (
  `BACKUP_RESULT_ID` varchar(20) NOT NULL,
  `BACKUP_OPERT_ID` varchar(20) NOT NULL,
  `BACKUP_FILE` varchar(255) DEFAULT NULL,
  `STTUS` varchar(2) DEFAULT NULL,
  `ERROR_INFO` varchar(2000) DEFAULT NULL,
  `EXECUT_BEGIN_TM` varchar(14) DEFAULT NULL,
  `EXECUT_END_TM` varchar(14) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`BACKUP_RESULT_ID`),
  UNIQUE KEY `COMTNBACKUPRESULT_PK` (`BACKUP_RESULT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbackupschduldfk
CREATE TABLE IF NOT EXISTS `comtnbackupschduldfk` (
  `BACKUP_OPERT_ID` varchar(20) NOT NULL,
  `EXECUT_SCHDUL_DFK_SE` char(1) NOT NULL,
  PRIMARY KEY (`BACKUP_OPERT_ID`,`EXECUT_SCHDUL_DFK_SE`),
  UNIQUE KEY `COMTNBACKUPSCHDULDFK_PK` (`BACKUP_OPERT_ID`,`EXECUT_SCHDUL_DFK_SE`),
  CONSTRAINT `comtnbackupschduldfk_ibfk_1` FOREIGN KEY (`BACKUP_OPERT_ID`) REFERENCES `comtnbackupopert` (`BACKUP_OPERT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbanner
CREATE TABLE IF NOT EXISTS `comtnbanner` (
  `BANNER_ID` char(20) NOT NULL DEFAULT '',
  `BANNER_NM` varchar(60) NOT NULL,
  `LINK_URL` varchar(255) NOT NULL,
  `BANNER_IMAGE` varchar(60) NOT NULL,
  `BANNER_DC` varchar(200) DEFAULT NULL,
  `REFLCT_AT` char(1) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `BANNER_IMAGE_FILE` varchar(60) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`BANNER_ID`),
  UNIQUE KEY `COMTNBANNER_PK` (`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbatchopert
CREATE TABLE IF NOT EXISTS `comtnbatchopert` (
  `BATCH_OPERT_ID` varchar(20) NOT NULL,
  `BATCH_OPERT_NM` varchar(60) DEFAULT NULL,
  `BATCH_PROGRM` varchar(255) DEFAULT NULL,
  `PARAMTR` varchar(250) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`BATCH_OPERT_ID`),
  UNIQUE KEY `COMTNBATCHOPERT_PK` (`BATCH_OPERT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbatchresult
CREATE TABLE IF NOT EXISTS `comtnbatchresult` (
  `BATCH_RESULT_ID` varchar(20) NOT NULL,
  `BATCH_SCHDUL_ID` varchar(20) NOT NULL,
  `BATCH_OPERT_ID` varchar(20) NOT NULL,
  `PARAMTR` varchar(250) DEFAULT NULL,
  `STTUS` varchar(2) DEFAULT NULL,
  `ERROR_INFO` varchar(2000) DEFAULT NULL,
  `EXECUT_BEGIN_TM` varchar(14) DEFAULT NULL,
  `EXECUT_END_TM` varchar(14) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BATCH_RESULT_ID`),
  UNIQUE KEY `COMTNBATCHRESULT_PK` (`BATCH_RESULT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbatchschdul
CREATE TABLE IF NOT EXISTS `comtnbatchschdul` (
  `BATCH_SCHDUL_ID` varchar(20) NOT NULL,
  `BATCH_OPERT_ID` varchar(20) NOT NULL,
  `EXECUT_CYCLE` varchar(2) DEFAULT NULL,
  `EXECUT_SCHDUL_DE` char(20) DEFAULT NULL,
  `EXECUT_SCHDUL_HOUR` char(2) DEFAULT NULL,
  `EXECUT_SCHDUL_MNT` char(2) DEFAULT NULL,
  `EXECUT_SCHDUL_SECND` char(2) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`BATCH_SCHDUL_ID`),
  UNIQUE KEY `COMTNBATCHSCHDUL_PK` (`BATCH_SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbatchschduldfk
CREATE TABLE IF NOT EXISTS `comtnbatchschduldfk` (
  `BATCH_SCHDUL_ID` varchar(20) NOT NULL,
  `EXECUT_SCHDUL_DFK_SE` char(1) NOT NULL,
  PRIMARY KEY (`BATCH_SCHDUL_ID`,`EXECUT_SCHDUL_DFK_SE`),
  UNIQUE KEY `COMTNBATCHSCHDULDFK_PK` (`BATCH_SCHDUL_ID`,`EXECUT_SCHDUL_DFK_SE`),
  CONSTRAINT `comtnbatchschduldfk_ibfk_1` FOREIGN KEY (`BATCH_SCHDUL_ID`) REFERENCES `comtnbatchschdul` (`BATCH_SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbbs
CREATE TABLE IF NOT EXISTS `comtnbbs` (
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `NTT_NO` decimal(20,0) DEFAULT NULL,
  `NTT_SJ` varchar(2000) DEFAULT NULL,
  `NTT_CN` mediumtext,
  `ANSWER_AT` char(1) DEFAULT NULL,
  `PARNTSCTT_NO` decimal(10,0) DEFAULT NULL,
  `ANSWER_LC` decimal(8,0) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `NTCE_BGNDE` char(20) DEFAULT NULL,
  `NTCE_ENDDE` char(20) DEFAULT NULL,
  `NTCR_ID` varchar(20) DEFAULT NULL,
  `NTCR_NM` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NTT_ID`,`BBS_ID`),
  UNIQUE KEY `COMTNBBS_PK` (`NTT_ID`,`BBS_ID`),
  KEY `COMTNBBS_i01` (`BBS_ID`),
  CONSTRAINT `comtnbbs_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `comtnbbsmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbbsmaster
CREATE TABLE IF NOT EXISTS `comtnbbsmaster` (
  `BBS_ID` char(20) NOT NULL,
  `BBS_NM` varchar(255) NOT NULL,
  `BBS_INTRCN` varchar(2400) DEFAULT NULL,
  `BBS_TY_CODE` char(6) NOT NULL,
  `BBS_ATTRB_CODE` char(6) NOT NULL,
  `REPLY_POSBL_AT` char(1) DEFAULT NULL,
  `FILE_ATCH_POSBL_AT` char(1) NOT NULL,
  `ATCH_POSBL_FILE_NUMBER` decimal(2,0) NOT NULL,
  `ATCH_POSBL_FILE_SIZE` decimal(8,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `TMPLAT_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`),
  UNIQUE KEY `COMTNBBSMASTER_PK` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbbsmasteroptn
CREATE TABLE IF NOT EXISTS `comtnbbsmasteroptn` (
  `BBS_ID` char(20) NOT NULL,
  `ANSWER_AT` char(1) NOT NULL,
  `STSFDG_AT` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`),
  UNIQUE KEY `COMTNBBSMASTEROPTN_PK` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbbsuse
CREATE TABLE IF NOT EXISTS `comtnbbsuse` (
  `BBS_ID` char(20) NOT NULL,
  `TRGET_ID` char(20) NOT NULL DEFAULT '',
  `USE_AT` char(1) NOT NULL,
  `REGIST_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`,`TRGET_ID`),
  UNIQUE KEY `COMTNBBSUSE_PK` (`BBS_ID`,`TRGET_ID`),
  KEY `COMTNBBSUSE_i01` (`BBS_ID`),
  CONSTRAINT `comtnbbsuse_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `comtnbbsmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbkmkmenumanageresult
CREATE TABLE IF NOT EXISTS `comtnbkmkmenumanageresult` (
  `MENU_ID` decimal(20,0) NOT NULL DEFAULT '0',
  `EMPLYR_ID` varchar(20) NOT NULL DEFAULT '',
  `MENU_NM` varchar(60) NOT NULL,
  `PROGRM_STRE_PATH` varchar(100) NOT NULL,
  PRIMARY KEY (`MENU_ID`,`EMPLYR_ID`),
  UNIQUE KEY `COMTNBKMKMENUMANAGERESULT_PK` (`MENU_ID`,`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbndtceckmanage
CREATE TABLE IF NOT EXISTS `comtnbndtceckmanage` (
  `BNDT_CECK_SE` char(2) NOT NULL,
  `BNDT_CECK_CODE` varchar(10) NOT NULL,
  `BNDT_CECK_CODE_NM` varchar(255) NOT NULL,
  `USE_AT` char(1) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BNDT_CECK_CODE`,`BNDT_CECK_SE`),
  UNIQUE KEY `COMTNBNDTCECKMANAGE_PK` (`BNDT_CECK_CODE`,`BNDT_CECK_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbndtdiary
CREATE TABLE IF NOT EXISTS `comtnbndtdiary` (
  `BNDT_ID` varchar(20) NOT NULL,
  `BNDT_DE` char(8) NOT NULL,
  `BNDT_CECK_SE` char(2) NOT NULL,
  `BNDT_CECK_CODE` varchar(10) NOT NULL,
  `CHCK_STTUS` varchar(1000) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BNDT_ID`,`BNDT_DE`,`BNDT_CECK_SE`,`BNDT_CECK_CODE`),
  UNIQUE KEY `COMTNBNDTDIARY_PK` (`BNDT_ID`,`BNDT_DE`,`BNDT_CECK_SE`,`BNDT_CECK_CODE`),
  KEY `COMTNBNDTDIARY_FK1` (`BNDT_CECK_CODE`,`BNDT_CECK_SE`),
  CONSTRAINT `comtnbndtdiary_ibfk_1` FOREIGN KEY (`BNDT_ID`, `BNDT_DE`) REFERENCES `comtnbndtmanage` (`BNDT_ID`, `BNDT_DE`),
  CONSTRAINT `comtnbndtdiary_ibfk_2` FOREIGN KEY (`BNDT_CECK_CODE`, `BNDT_CECK_SE`) REFERENCES `comtnbndtceckmanage` (`BNDT_CECK_CODE`, `BNDT_CECK_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnbndtmanage
CREATE TABLE IF NOT EXISTS `comtnbndtmanage` (
  `BNDT_ID` varchar(20) NOT NULL,
  `BNDT_DE` char(8) NOT NULL,
  `RM` varchar(2500) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BNDT_ID`,`BNDT_DE`),
  UNIQUE KEY `COMTNBNDTMANAGE_PK` (`BNDT_ID`,`BNDT_DE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnclub
CREATE TABLE IF NOT EXISTS `comtnclub` (
  `CLB_ID` char(20) NOT NULL,
  `CMMNTY_ID` char(20) NOT NULL,
  `CLB_NM` varchar(255) NOT NULL,
  `CLB_INTRCN` varchar(2400) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `REGIST_SE_CODE` char(6) DEFAULT NULL,
  `TMPLAT_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CLB_ID`,`CMMNTY_ID`),
  UNIQUE KEY `COMTNCLUB_PK` (`CLB_ID`,`CMMNTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnclubuser
CREATE TABLE IF NOT EXISTS `comtnclubuser` (
  `CLB_ID` char(20) NOT NULL,
  `CMMNTY_ID` char(20) NOT NULL,
  `OPRTR_AT` char(1) NOT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `SECSN_DE` char(20) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `EMPLYR_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`CLB_ID`,`CMMNTY_ID`,`EMPLYR_ID`),
  UNIQUE KEY `COMTNCLUBUSER_PK` (`CLB_ID`,`CMMNTY_ID`,`EMPLYR_ID`),
  KEY `COMTNCLUBUSER_i01` (`CLB_ID`,`CMMNTY_ID`),
  CONSTRAINT `comtnclubuser_ibfk_1` FOREIGN KEY (`CLB_ID`, `CMMNTY_ID`) REFERENCES `comtnclub` (`CLB_ID`, `CMMNTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncmmnty
CREATE TABLE IF NOT EXISTS `comtncmmnty` (
  `CMMNTY_ID` char(20) NOT NULL,
  `CMMNTY_NM` varchar(255) NOT NULL,
  `CMMNTY_INTRCN` varchar(2400) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `REGIST_SE_CODE` char(6) DEFAULT NULL,
  `TMPLAT_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CMMNTY_ID`),
  UNIQUE KEY `COMTNCMMNTY_PK` (`CMMNTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncmmntyuser
CREATE TABLE IF NOT EXISTS `comtncmmntyuser` (
  `CMMNTY_ID` char(20) NOT NULL,
  `EMPLYR_ID` varchar(20) NOT NULL,
  `MNGR_AT` char(1) NOT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `SECSN_DE` char(20) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CMMNTY_ID`,`EMPLYR_ID`),
  UNIQUE KEY `COMTNCMMNTYUSER_PK` (`CMMNTY_ID`,`EMPLYR_ID`),
  KEY `COMTNCMMNTYUSER_i01` (`CMMNTY_ID`),
  CONSTRAINT `comtncmmntyuser_ibfk_1` FOREIGN KEY (`CMMNTY_ID`) REFERENCES `comtncmmnty` (`CMMNTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncnsltlist
CREATE TABLE IF NOT EXISTS `comtncnsltlist` (
  `CNSLT_ID` char(20) NOT NULL,
  `CNSLT_SJ` varchar(255) DEFAULT NULL,
  `OTHBC_AT` char(1) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `CNSLT_CN` varchar(2500) DEFAULT NULL,
  `MANAGT_CN` varchar(2500) DEFAULT NULL,
  `MANAGT_DE` char(20) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `END_TELNO` varchar(4) DEFAULT NULL,
  `FRST_MBTLNUM` varchar(4) DEFAULT NULL,
  `MIDDLE_MBTLNUM` varchar(4) DEFAULT NULL,
  `END_MBTLNUM` varchar(4) DEFAULT NULL,
  `WRITNG_DE` char(20) DEFAULT NULL,
  `WRTER_NM` varchar(20) DEFAULT NULL,
  `EMAIL_ANSWER_AT` char(1) DEFAULT NULL,
  `QNA_PROCESS_STTUS_CODE` char(1) DEFAULT NULL,
  `WRITNG_PASSWORD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CNSLT_ID`),
  UNIQUE KEY `COMTNCNSLTLIST_PK` (`CNSLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncntcinstt
CREATE TABLE IF NOT EXISTS `comtncntcinstt` (
  `INSTT_ID` varchar(20) NOT NULL DEFAULT '',
  `INSTT_NM` varchar(100) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`INSTT_ID`),
  UNIQUE KEY `COMTNCNTCINSTT_PK` (`INSTT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncntcmessage
CREATE TABLE IF NOT EXISTS `comtncntcmessage` (
  `CNTC_MSSAGE_ID` varchar(20) NOT NULL DEFAULT '',
  `CNTC_MSSAGE_NM` varchar(100) DEFAULT NULL,
  `UPPER_CNTC_MSSAGE_ID` varchar(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`CNTC_MSSAGE_ID`),
  UNIQUE KEY `COMTNCNTCMESSAGE_PK` (`CNTC_MSSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncntcmessageitem
CREATE TABLE IF NOT EXISTS `comtncntcmessageitem` (
  `CNTC_MSSAGE_ID` varchar(20) NOT NULL,
  `IEM_ID` varchar(20) NOT NULL,
  `IEM_NM` varchar(100) DEFAULT NULL,
  `IEM_TY` varchar(50) DEFAULT NULL,
  `IEM_LT` decimal(8,0) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`CNTC_MSSAGE_ID`,`IEM_ID`),
  UNIQUE KEY `COMTNCNTCMESSAGEITEM_PK` (`CNTC_MSSAGE_ID`,`IEM_ID`),
  KEY `COMTNCNTCMESSAGEITEM_i01` (`CNTC_MSSAGE_ID`),
  CONSTRAINT `comtncntcmessageitem_ibfk_1` FOREIGN KEY (`CNTC_MSSAGE_ID`) REFERENCES `comtncntcmessage` (`CNTC_MSSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncntcservice
CREATE TABLE IF NOT EXISTS `comtncntcservice` (
  `INSTT_ID` varchar(20) NOT NULL DEFAULT '',
  `SYS_ID` varchar(20) NOT NULL DEFAULT '',
  `SVC_ID` varchar(20) NOT NULL DEFAULT '',
  `SVC_NM` varchar(255) DEFAULT NULL,
  `REQUST_MSSAGE_ID` varchar(20) DEFAULT NULL,
  `RSPNS_MSSAGE_ID` varchar(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`INSTT_ID`,`SYS_ID`,`SVC_ID`),
  UNIQUE KEY `COMTNCNTCSERVICE_PK` (`INSTT_ID`,`SYS_ID`,`SVC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncntcsystem
CREATE TABLE IF NOT EXISTS `comtncntcsystem` (
  `INSTT_ID` varchar(20) NOT NULL DEFAULT '',
  `SYS_ID` varchar(20) NOT NULL DEFAULT '',
  `SYS_NM` varchar(255) DEFAULT NULL,
  `SYS_IP` varchar(23) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`INSTT_ID`,`SYS_ID`),
  UNIQUE KEY `COMTNCNTCSYSTEM_PK` (`INSTT_ID`,`SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncntntslist
CREATE TABLE IF NOT EXISTS `comtncntntslist` (
  `CNTNTS_ID` varchar(20) NOT NULL,
  `EMPLYR_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`CNTNTS_ID`,`EMPLYR_ID`),
  UNIQUE KEY `COMTNCNTNTSLIST_PK` (`CNTNTS_ID`,`EMPLYR_ID`),
  KEY `COMTNCNTNTSLIST_i01` (`CNTNTS_ID`),
  KEY `COMTNCNTNTSLIST_i02` (`EMPLYR_ID`),
  CONSTRAINT `comtncntntslist_ibfk_1` FOREIGN KEY (`CNTNTS_ID`) REFERENCES `comtnindvdlpgecntnts` (`CNTNTS_ID`),
  CONSTRAINT `comtncntntslist_ibfk_2` FOREIGN KEY (`EMPLYR_ID`) REFERENCES `comtnindvdlpgeestbs` (`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncomment
CREATE TABLE IF NOT EXISTS `comtncomment` (
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `ANSWER_NO` decimal(20,0) NOT NULL,
  `WRTER_ID` varchar(20) DEFAULT NULL,
  `WRTER_NM` varchar(20) DEFAULT NULL,
  `ANSWER` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`NTT_ID`,`BBS_ID`,`ANSWER_NO`),
  UNIQUE KEY `COMTNCOMMENT_PK` (`NTT_ID`,`BBS_ID`,`ANSWER_NO`),
  KEY `COMTNCOMMENT_i01` (`NTT_ID`,`BBS_ID`),
  CONSTRAINT `comtncomment_ibfk_1` FOREIGN KEY (`NTT_ID`, `BBS_ID`) REFERENCES `comtnbbs` (`NTT_ID`, `BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtncpyrhtinfo
CREATE TABLE IF NOT EXISTS `comtncpyrhtinfo` (
  `CPYRHT_ID` char(20) NOT NULL,
  `CPYRHT_PRTC_POLICY_CN` varchar(2500) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CPYRHT_ID`),
  UNIQUE KEY `COMTNCPYRHTINFO_PK` (`CPYRHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnctsnnmanage
CREATE TABLE IF NOT EXISTS `comtnctsnnmanage` (
  `CTSNN_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `CTSNN_CODE` char(2) NOT NULL,
  `REQST_DE` char(20) NOT NULL,
  `CTSNN_NM` varchar(255) NOT NULL,
  `TRGTER_NM` varchar(20) NOT NULL,
  `BRTHDY` char(20) NOT NULL,
  `OCCRRNC_DE` char(20) NOT NULL,
  `RELATE` char(2) NOT NULL,
  `RM` varchar(2500) DEFAULT NULL,
  `SANCTNER_ID` varchar(20) NOT NULL,
  `CONFM_AT` char(1) DEFAULT NULL,
  `SANCTN_DT` datetime DEFAULT NULL,
  `RETURN_RESN` varchar(1000) DEFAULT NULL,
  `INFRML_SANCTN_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`CTSNN_ID`),
  UNIQUE KEY `COMTNCTSNNMANAGE_PK` (`CTSNN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndamcalres
CREATE TABLE IF NOT EXISTS `comtndamcalres` (
  `ORGNZT_ID` char(20) DEFAULT NULL,
  `EXPERT_ID` char(20) DEFAULT NULL,
  `KNWLDG_TY_CODE` varchar(3) DEFAULT NULL,
  `EMPLYR_ID` varchar(20) DEFAULT NULL,
  `KNWLDG_NM` varchar(60) DEFAULT NULL,
  `KNWLDG_CN` varchar(2500) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `PARNTS_KNWLDG_ID` char(20) DEFAULT NULL,
  `ANSWER_DP` decimal(20,0) DEFAULT NULL,
  `ANSWER_ORDR` decimal(20,0) DEFAULT NULL,
  `ANSWER_GROUP_NO` decimal(20,0) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `KNWLDG_ID` char(20) NOT NULL,
  PRIMARY KEY (`KNWLDG_ID`),
  UNIQUE KEY `COMTNDAMCALRES_PK` (`KNWLDG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndamknoifm
CREATE TABLE IF NOT EXISTS `comtndamknoifm` (
  `KNWLDG_ID` char(20) NOT NULL,
  `KNWLDG_TY_CODE` varchar(3) DEFAULT NULL,
  `ORGNZT_ID` char(20) DEFAULT NULL,
  `EXPERT_ID` char(20) DEFAULT NULL,
  `EMPLYR_ID` varchar(20) DEFAULT NULL,
  `KNWLDG_NM` varchar(60) DEFAULT NULL,
  `KNWLDG_CN` varchar(2500) DEFAULT NULL,
  `KWRD` varchar(100) DEFAULT NULL,
  `OTHBC_AT` char(1) DEFAULT NULL,
  `KNWLDG_EVL` char(1) DEFAULT NULL,
  `COLCT_DE` char(20) DEFAULT NULL,
  `EVL_DE` char(20) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `DSUSE_DE` char(20) DEFAULT NULL,
  PRIMARY KEY (`KNWLDG_ID`),
  UNIQUE KEY `COMTNDAMKNOIFM_PK` (`KNWLDG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndammapkno
CREATE TABLE IF NOT EXISTS `comtndammapkno` (
  `KNWLDG_TY_CODE` varchar(3) NOT NULL,
  `ORGNZT_ID` char(20) DEFAULT NULL,
  `EXPERT_ID` char(20) DEFAULT NULL,
  `KNWLDG_TY_NM` varchar(60) DEFAULT NULL,
  `CL_DE` char(20) DEFAULT NULL,
  `KNWLDG_URL` varchar(255) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`KNWLDG_TY_CODE`),
  UNIQUE KEY `COMTNDAMMAPKNO_PK` (`KNWLDG_TY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndammapteam
CREATE TABLE IF NOT EXISTS `comtndammapteam` (
  `ORGNZT_ID` char(20) NOT NULL,
  `ORGNZT_NM` varchar(20) DEFAULT NULL,
  `CL_DE` char(20) DEFAULT NULL,
  `KNWLDG_URL` varchar(255) DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`ORGNZT_ID`),
  UNIQUE KEY `COMTNDAMMAPTEAM_PK` (`ORGNZT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndampro
CREATE TABLE IF NOT EXISTS `comtndampro` (
  `EXPERT_ID` char(20) NOT NULL,
  `KNWLDG_TY_CODE` varchar(3) NOT NULL,
  `EXPERT_GRAD` char(1) NOT NULL,
  `EXPERT_CONFM_DE` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `EXPERT_DC` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`EXPERT_ID`,`KNWLDG_TY_CODE`,`EXPERT_GRAD`),
  UNIQUE KEY `COMTNDAMPRO_PK` (`EXPERT_ID`,`KNWLDG_TY_CODE`,`EXPERT_GRAD`),
  KEY `COMTNDAMPRO_FK1` (`KNWLDG_TY_CODE`),
  CONSTRAINT `comtndampro_ibfk_1` FOREIGN KEY (`KNWLDG_TY_CODE`) REFERENCES `comtndammapkno` (`KNWLDG_TY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndbmntrng
CREATE TABLE IF NOT EXISTS `comtndbmntrng` (
  `DATA_SOURC_NM` varchar(60) NOT NULL,
  `SERVER_NM` varchar(60) DEFAULT NULL,
  `DBMS_KND` varchar(2) DEFAULT NULL,
  `CECK_SQL` varchar(250) DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`DATA_SOURC_NM`),
  UNIQUE KEY `COMTNDBMNTRNG_PK` (`DATA_SOURC_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndeptjob
CREATE TABLE IF NOT EXISTS `comtndeptjob` (
  `DEPT_JOB_ID` char(20) NOT NULL,
  `DEPT_JOBBX_ID` char(6) NOT NULL,
  `DEPT_JOB_NM` varchar(255) NOT NULL,
  `DEPT_JOB_CN` varchar(2500) NOT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `CHARGER_ID` varchar(20) NOT NULL,
  `PRIORT` char(1) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`DEPT_JOB_ID`),
  UNIQUE KEY `COMTNDEPTJOB_PK` (`DEPT_JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndeptjobbx
CREATE TABLE IF NOT EXISTS `comtndeptjobbx` (
  `DEPT_JOBBX_ID` char(6) NOT NULL,
  `DEPT_JOBBX_NM` varchar(255) NOT NULL,
  `DEPT_ID` varchar(20) NOT NULL,
  `INDICT_ORDR` decimal(6,0) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`DEPT_JOBBX_ID`),
  UNIQUE KEY `COMTNDEPTJOBBX_PK` (`DEPT_JOBBX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndiaryinfo
CREATE TABLE IF NOT EXISTS `comtndiaryinfo` (
  `SCHDUL_ID` char(20) NOT NULL,
  `DIARY_ID` char(20) NOT NULL,
  `DIARY_PROGRSRT` decimal(3,0) DEFAULT NULL,
  `DIARY_NM` varchar(255) DEFAULT NULL,
  `DRCT_MATTER` varchar(2500) DEFAULT NULL,
  `PARTCLR_MATTER` varchar(2500) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`,`DIARY_ID`),
  UNIQUE KEY `COMTNDIARYINFO_PK` (`SCHDUL_ID`,`DIARY_ID`),
  KEY `COMTNDIARYINFO_i01` (`SCHDUL_ID`),
  CONSTRAINT `comtndiaryinfo_ibfk_1` FOREIGN KEY (`SCHDUL_ID`) REFERENCES `comtnschdulinfo` (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtndtausestats
CREATE TABLE IF NOT EXISTS `comtndtausestats` (
  `DTA_USE_STATS_ID` char(20) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `NTT_ID` decimal(20,0) NOT NULL,
  `ATCH_FILE_ID` char(20) NOT NULL,
  `FILE_SN` decimal(10,0) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`DTA_USE_STATS_ID`),
  UNIQUE KEY `COMTNDTAUSESTATS_PK` (`DTA_USE_STATS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnemplyrinfo
CREATE TABLE IF NOT EXISTS `comtnemplyrinfo` (
  `EMPLYR_ID` varchar(20) NOT NULL,
  `ORGNZT_ID` char(20) DEFAULT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  `USER_NM` varchar(60) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `EMPL_NO` varchar(20) DEFAULT NULL,
  `IHIDNUM` varchar(200) DEFAULT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `BRTHDY` char(20) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `HOUSE_ADRES` varchar(100) NOT NULL,
  `PASSWORD_HINT` varchar(100) NOT NULL,
  `PASSWORD_CNSR` varchar(100) NOT NULL,
  `HOUSE_END_TELNO` varchar(4) NOT NULL,
  `AREA_NO` varchar(4) NOT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `ZIP` varchar(6) NOT NULL,
  `OFFM_TELNO` varchar(20) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `OFCPS_NM` varchar(60) DEFAULT NULL,
  `HOUSE_MIDDLE_TELNO` varchar(4) NOT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `PSTINST_CODE` char(8) DEFAULT NULL,
  `EMPLYR_STTUS_CODE` char(1) NOT NULL,
  `CRTFC_DN_VALUE` varchar(100) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`),
  UNIQUE KEY `COMTNEMPLYRINFO_PK` (`EMPLYR_ID`),
  KEY `COMTNEMPLYRINFO_i01` (`ORGNZT_ID`),
  KEY `COMTNEMPLYRINFO_i02` (`GROUP_ID`),
  CONSTRAINT `comtnemplyrinfo_ibfk_1` FOREIGN KEY (`ORGNZT_ID`) REFERENCES `comtnorgnztinfo` (`ORGNZT_ID`) ON DELETE SET NULL,
  CONSTRAINT `comtnemplyrinfo_ibfk_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `comtnauthorgroupinfo` (`GROUP_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnemplyrscrtyestbs
CREATE TABLE IF NOT EXISTS `comtnemplyrscrtyestbs` (
  `SCRTY_DTRMN_TRGET_ID` varchar(20) NOT NULL,
  `MBER_TY_CODE` char(5) DEFAULT NULL,
  `AUTHOR_CODE` varchar(30) NOT NULL,
  PRIMARY KEY (`SCRTY_DTRMN_TRGET_ID`),
  UNIQUE KEY `COMTNEMPLYRSCRTYESTBS_PK` (`SCRTY_DTRMN_TRGET_ID`),
  KEY `COMTNEMPLYRSCRTYESTBS_i04` (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnentrprsmber
CREATE TABLE IF NOT EXISTS `comtnentrprsmber` (
  `ENTRPRS_MBER_ID` varchar(20) NOT NULL DEFAULT '',
  `ENTRPRS_SE_CODE` char(8) DEFAULT NULL,
  `BIZRNO` varchar(10) DEFAULT NULL,
  `JURIRNO` varchar(13) DEFAULT NULL,
  `CMPNY_NM` varchar(60) NOT NULL,
  `CXFC` varchar(50) DEFAULT NULL,
  `ZIP` varchar(6) NOT NULL,
  `ADRES` varchar(100) NOT NULL,
  `ENTRPRS_MIDDLE_TELNO` varchar(4) NOT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `INDUTY_CODE` char(1) DEFAULT NULL,
  `APPLCNT_NM` varchar(50) NOT NULL,
  `APPLCNT_IHIDNUM` varchar(200) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `ENTRPRS_MBER_STTUS` varchar(15) DEFAULT NULL,
  `ENTRPRS_MBER_PASSWORD` varchar(200) DEFAULT NULL,
  `ENTRPRS_MBER_PASSWORD_HINT` varchar(100) NOT NULL,
  `ENTRPRS_MBER_PASSWORD_CNSR` varchar(100) NOT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `ENTRPRS_END_TELNO` varchar(4) NOT NULL,
  `AREA_NO` varchar(4) NOT NULL,
  `APPLCNT_EMAIL_ADRES` varchar(50) NOT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  PRIMARY KEY (`ENTRPRS_MBER_ID`),
  UNIQUE KEY `COMTNENTRPRSMBER_PK` (`ENTRPRS_MBER_ID`),
  KEY `COMTNENTRPRSMBER_i01` (`GROUP_ID`),
  CONSTRAINT `comtnentrprsmber_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `comtnauthorgroupinfo` (`GROUP_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtneventatdrn
CREATE TABLE IF NOT EXISTS `comtneventatdrn` (
  `APPLCNT_ID` varchar(20) NOT NULL,
  `EVENT_ID` char(20) NOT NULL,
  `REQST_DE` char(20) NOT NULL,
  `SANCTNER_ID` varchar(20) NOT NULL,
  `CONFM_AT` char(1) DEFAULT NULL,
  `SANCTN_DT` datetime DEFAULT NULL,
  `RETURN_RESN` varchar(1000) DEFAULT NULL,
  `INFRML_SANCTN_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`APPLCNT_ID`,`EVENT_ID`),
  UNIQUE KEY `COMTNEVENTATDRN_PK` (`APPLCNT_ID`,`EVENT_ID`),
  KEY `COMTNEVENTATDRN_i01` (`EVENT_ID`),
  CONSTRAINT `comtneventatdrn_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `comtneventmanage` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtneventinfo
CREATE TABLE IF NOT EXISTS `comtneventinfo` (
  `EVENT_ID` char(20) NOT NULL,
  `BSNS_YEAR` char(4) DEFAULT NULL,
  `BSNS_CODE` varchar(2) DEFAULT NULL,
  `EVENT_CN` varchar(1000) DEFAULT NULL,
  `EVENT_SVC_BGNDE` char(20) DEFAULT NULL,
  `SVC_USE_NMPR_CO` decimal(10,0) DEFAULT NULL,
  `CHARGER_NM` varchar(50) DEFAULT NULL,
  `PRPARETG_CN` varchar(2500) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `EVENT_SVC_ENDDE` char(20) DEFAULT NULL,
  `EVENT_TY_CODE` char(1) DEFAULT NULL,
  `EVENT_CONFM_AT` char(1) DEFAULT NULL,
  `EVENT_CONFM_DE` char(20) DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`),
  UNIQUE KEY `COMTNEVENTINFO_PK` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtneventmanage
CREATE TABLE IF NOT EXISTS `comtneventmanage` (
  `EVENT_ID` char(20) NOT NULL,
  `EVENT_SE` varchar(2) NOT NULL,
  `EVENT_NM` varchar(60) NOT NULL,
  `EVENT_PURPS` varchar(200) NOT NULL,
  `EVENT_BGNDE` char(20) NOT NULL,
  `EVENT_ENDDE` char(20) NOT NULL,
  `EVENT_AUSPC_INSTT_NM` varchar(60) DEFAULT NULL,
  `EVENT_MNGT_INSTT_NM` varchar(60) DEFAULT NULL,
  `EVENT_PLACE` varchar(200) NOT NULL,
  `EVENT_CN` varchar(1000) DEFAULT NULL,
  `CT_OCCRRNC_AT` char(1) DEFAULT NULL,
  `PARTCPT_CT` decimal(16,0) DEFAULT NULL,
  `GARDEN` decimal(10,0) NOT NULL,
  `REFRN_URL` varchar(1024) DEFAULT NULL,
  `RCEPT_BGNDE` char(20) NOT NULL,
  `RCEPT_ENDDE` char(20) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`),
  UNIQUE KEY `COMTNEVENTMANAGE_PK` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnextrlhrinfo
CREATE TABLE IF NOT EXISTS `comtnextrlhrinfo` (
  `EVENT_ID` char(20) NOT NULL,
  `EXTRL_HR_ID` char(20) NOT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `EXTRL_HR_NM` varchar(60) DEFAULT NULL,
  `OCCP_TY_CODE` char(1) DEFAULT NULL,
  `PSITN_INSTT_NM` varchar(100) DEFAULT NULL,
  `BRTHDY` char(20) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `END_TELNO` varchar(4) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`,`EXTRL_HR_ID`),
  UNIQUE KEY `COMTNEXTRLHRINFO_PK` (`EVENT_ID`,`EXTRL_HR_ID`),
  KEY `COMTNEXTRLHRINFO_i01` (`EVENT_ID`),
  CONSTRAINT `comtnextrlhrinfo_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `comtneventinfo` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnfaqinfo
CREATE TABLE IF NOT EXISTS `comtnfaqinfo` (
  `FAQ_ID` char(20) NOT NULL,
  `QESTN_SJ` varchar(255) DEFAULT NULL,
  `QESTN_CN` varchar(2500) DEFAULT NULL,
  `ANSWER_CN` varchar(2500) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) NOT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `QNA_PROCESS_STTUS_CODE` char(1) DEFAULT NULL,
  PRIMARY KEY (`FAQ_ID`),
  UNIQUE KEY `COMTNFAQINFO_PK` (`FAQ_ID`),
  KEY `COMTNFAQINFO_i01` (`ATCH_FILE_ID`),
  CONSTRAINT `comtnfaqinfo_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `comtnfile` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnfile
CREATE TABLE IF NOT EXISTS `comtnfile` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `CREAT_DT` datetime NOT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`),
  UNIQUE KEY `COMTNFILE_PK` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnfiledetail
CREATE TABLE IF NOT EXISTS `comtnfiledetail` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `FILE_SN` decimal(10,0) NOT NULL,
  `FILE_STRE_COURS` varchar(2000) NOT NULL,
  `STRE_FILE_NM` varchar(255) NOT NULL,
  `ORIGNL_FILE_NM` varchar(255) DEFAULT NULL,
  `FILE_EXTSN` varchar(20) NOT NULL,
  `FILE_CN` mediumtext,
  `FILE_SIZE` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  UNIQUE KEY `COMTNFILEDETAIL_PK` (`ATCH_FILE_ID`,`FILE_SN`),
  KEY `COMTNFILEDETAIL_i01` (`ATCH_FILE_ID`),
  CONSTRAINT `comtnfiledetail_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `comtnfile` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnfilesysmntrng
CREATE TABLE IF NOT EXISTS `comtnfilesysmntrng` (
  `FILE_SYS_ID` char(20) NOT NULL,
  `FILE_SYS_NM` varchar(60) NOT NULL,
  `FILE_SYS_MANAGE_NM` varchar(255) NOT NULL,
  `FILE_SYS_SIZE` decimal(8,0) NOT NULL,
  `FILE_SYS_THRHLD` decimal(8,0) NOT NULL,
  `FILE_SYS_USGQTY` decimal(8,0) DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`FILE_SYS_ID`),
  UNIQUE KEY `COMTNFILESYSMNTRNG_PK` (`FILE_SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnfilesysmntrngloginfo
CREATE TABLE IF NOT EXISTS `comtnfilesysmntrngloginfo` (
  `FILE_SYS_ID` char(20) NOT NULL,
  `FILE_SYS_NM` varchar(60) NOT NULL,
  `FILE_SYS_MANAGE_NM` varchar(255) NOT NULL,
  `FILE_SYS_SIZE` decimal(8,0) NOT NULL,
  `FILE_SYS_THRHLD` decimal(8,0) NOT NULL,
  `FILE_SYS_USGQTY` decimal(8,0) DEFAULT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `LOG_INFO` varchar(2000) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LOG_ID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`FILE_SYS_ID`,`LOG_ID`),
  UNIQUE KEY `COMTNFILESYSMNTRNGLOGINFO_PK` (`FILE_SYS_ID`,`LOG_ID`),
  CONSTRAINT `comtnfilesysmntrngloginfo_ibfk_1` FOREIGN KEY (`FILE_SYS_ID`) REFERENCES `comtnfilesysmntrng` (`FILE_SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnfxtrsmanage
CREATE TABLE IF NOT EXISTS `comtnfxtrsmanage` (
  `FXTRS_CODE` char(14) NOT NULL,
  `FXTRS_NM` varchar(100) NOT NULL,
  `MAKR_NM` varchar(100) DEFAULT NULL,
  `PRICE` decimal(16,0) DEFAULT NULL,
  PRIMARY KEY (`FXTRS_CODE`),
  UNIQUE KEY `COMTNFXTRSMANAGE_PK` (`FXTRS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtngnrlmber
CREATE TABLE IF NOT EXISTS `comtngnrlmber` (
  `MBER_ID` varchar(20) NOT NULL DEFAULT '',
  `PASSWORD` varchar(200) NOT NULL,
  `PASSWORD_HINT` varchar(100) DEFAULT NULL,
  `PASSWORD_CNSR` varchar(100) DEFAULT NULL,
  `IHIDNUM` varchar(200) DEFAULT NULL,
  `MBER_NM` varchar(50) NOT NULL,
  `ZIP` varchar(6) NOT NULL,
  `ADRES` varchar(100) NOT NULL,
  `AREA_NO` varchar(4) NOT NULL,
  `MBER_STTUS` varchar(15) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `END_TELNO` varchar(4) NOT NULL,
  `MBTLNUM` varchar(20) NOT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `MBER_FXNUM` varchar(20) DEFAULT NULL,
  `MBER_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) NOT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  PRIMARY KEY (`MBER_ID`),
  UNIQUE KEY `COMTNGNRLMBER_PK` (`MBER_ID`),
  KEY `COMTNGNRLMBER_i01` (`GROUP_ID`),
  CONSTRAINT `comtngnrlmber_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `comtnauthorgroupinfo` (`GROUP_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnhpcminfo
CREATE TABLE IF NOT EXISTS `comtnhpcminfo` (
  `HPCM_ID` char(20) NOT NULL,
  `HPCM_SE_CODE` char(1) DEFAULT NULL,
  `HPCM_DFN` varchar(1000) DEFAULT NULL,
  `HPCM_DC` varchar(2500) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`HPCM_ID`),
  UNIQUE KEY `COMTNHPCMINFO_PK` (`HPCM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnhttpmon
CREATE TABLE IF NOT EXISTS `comtnhttpmon` (
  `SYS_ID` varchar(20) NOT NULL,
  `SITE_URL` varchar(100) DEFAULT NULL,
  `WEBSVC_KND` varchar(10) DEFAULT NULL,
  `HTTP_STTUS_CODE` varchar(3) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`SYS_ID`),
  UNIQUE KEY `COMTNHTTPMON_PK` (`SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnindvdlinfopolicy
CREATE TABLE IF NOT EXISTS `comtnindvdlinfopolicy` (
  `INDVDL_INFO_POLICY_ID` char(20) NOT NULL DEFAULT '',
  `INDVDL_INFO_POLICY_CN` varchar(2500) DEFAULT NULL,
  `INDVDL_INFO_POLICY_AGRE_AT` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `INDVDL_INFO_POLICY_NM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INDVDL_INFO_POLICY_ID`),
  UNIQUE KEY `COMTNINDVDLINFOPOLICY_PK` (`INDVDL_INFO_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnindvdlpgecntnts
CREATE TABLE IF NOT EXISTS `comtnindvdlpgecntnts` (
  `CNTNTS_ID` varchar(20) NOT NULL DEFAULT '',
  `CNTNTS_NM` varchar(100) NOT NULL,
  `CNTC_URL` varchar(255) NOT NULL,
  `CNTNTS_USE_AT` char(1) NOT NULL,
  `CNTNTS_LINK_URL` varchar(1000) DEFAULT NULL,
  `CNTNTS_DC` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CNTNTS_ID`),
  UNIQUE KEY `COMTNINDVDLPGECNTNTS_PK` (`CNTNTS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnindvdlpgeestbs
CREATE TABLE IF NOT EXISTS `comtnindvdlpgeestbs` (
  `EMPLYR_ID` varchar(20) NOT NULL DEFAULT '',
  `UPEND_IMAGE` varchar(1024) DEFAULT NULL,
  `TITLEBAR_COLOR` char(7) DEFAULT NULL,
  `ALGN_MTHD` char(1) DEFAULT NULL,
  `ALGN_CO` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`),
  UNIQUE KEY `COMTNINDVDLPGEESTBS_PK` (`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnindvdlyrycmanage
CREATE TABLE IF NOT EXISTS `comtnindvdlyrycmanage` (
  `OCCRRNC_YEAR` char(4) NOT NULL,
  `YRYC_OCCRRNC_CO` decimal(5,1) DEFAULT NULL,
  `USE_YRYC_CO` decimal(5,1) DEFAULT NULL,
  `REMNDR_YRYC_CO` decimal(5,1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `USER_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`OCCRRNC_YEAR`,`USER_ID`),
  UNIQUE KEY `COMTNINDVDLYRYCMANAGE_PK` (`OCCRRNC_YEAR`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtninfrmlsanctn
CREATE TABLE IF NOT EXISTS `comtninfrmlsanctn` (
  `INFRML_SANCTN_ID` char(20) NOT NULL,
  `JOB_SE_CODE` char(3) NOT NULL,
  `APPLCNT_ID` varchar(20) NOT NULL,
  `REQST_DE` char(20) NOT NULL,
  `SANCTNER_ID` varchar(20) NOT NULL,
  `CONFM_AT` char(1) NOT NULL,
  `SANCTN_DT` datetime DEFAULT NULL,
  `RETURN_RESN` varchar(1000) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`INFRML_SANCTN_ID`),
  UNIQUE KEY `COMTNINFRMLSANCTN_PK` (`INFRML_SANCTN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtninsttcode
CREATE TABLE IF NOT EXISTS `comtninsttcode` (
  `INSTT_CODE` char(7) NOT NULL,
  `ALL_INSTT_NM` varchar(255) DEFAULT NULL,
  `LOWEST_INSTT_NM` varchar(100) DEFAULT NULL,
  `INSTT_ABRV_NM` varchar(50) DEFAULT NULL,
  `ODR` char(1) DEFAULT NULL,
  `ORD` char(3) DEFAULT NULL,
  `INSTT_ODR` char(2) DEFAULT NULL,
  `UPPER_INSTT_CODE` char(7) DEFAULT NULL,
  `BEST_INSTT_CODE` char(7) DEFAULT NULL,
  `REPRSNT_INSTT_CODE` char(7) DEFAULT NULL,
  `INSTT_TY_LCLAS` char(2) DEFAULT NULL,
  `INSTT_TY_MLSFC` char(2) DEFAULT NULL,
  `INSTT_TY_SCLAS` char(2) DEFAULT NULL,
  `TELNO` varchar(20) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `CREAT_DE` char(20) DEFAULT NULL,
  `ABL_DE` char(20) DEFAULT NULL,
  `ABL_ENNC` char(1) DEFAULT NULL,
  `CHANGE_DE` char(20) DEFAULT NULL,
  `CHANGE_TIME` varchar(6) DEFAULT NULL,
  `BSIS_DE` char(20) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`INSTT_CODE`),
  UNIQUE KEY `COMTNINSTTCODE_PK` (`INSTT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtninsttcoderecptnlog
CREATE TABLE IF NOT EXISTS `comtninsttcoderecptnlog` (
  `OCCRRNC_DE` char(20) NOT NULL,
  `INSTT_CODE` char(7) NOT NULL,
  `OPERT_SN` decimal(10,0) NOT NULL,
  `CHANGE_SE_CODE` varchar(2) DEFAULT NULL,
  `PROCESS_SE` varchar(2) DEFAULT NULL,
  `ETC_CODE` char(2) DEFAULT NULL,
  `ALL_INSTT_NM` varchar(255) DEFAULT NULL,
  `LOWEST_INSTT_NM` varchar(100) DEFAULT NULL,
  `INSTT_ABRV_NM` varchar(50) DEFAULT NULL,
  `ODR` char(1) DEFAULT NULL,
  `ORD` char(3) DEFAULT NULL,
  `INSTT_ODR` char(2) DEFAULT NULL,
  `UPPER_INSTT_CODE` char(7) DEFAULT NULL,
  `BEST_INSTT_CODE` char(7) DEFAULT NULL,
  `REPRSNT_INSTT_CODE` char(7) DEFAULT NULL,
  `INSTT_TY_LCLAS` char(2) DEFAULT NULL,
  `INSTT_TY_MLSFC` char(2) DEFAULT NULL,
  `INSTT_TY_SCLAS` char(2) DEFAULT NULL,
  `TELNO` varchar(20) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `CREAT_DE` char(20) DEFAULT NULL,
  `ABL_DE` char(20) DEFAULT NULL,
  `ABL_ENNC` char(1) DEFAULT NULL,
  `CHANGE_DE` char(20) DEFAULT NULL,
  `CHANGE_TIME` varchar(6) DEFAULT NULL,
  `BSIS_DE` char(20) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`INSTT_CODE`,`OPERT_SN`),
  UNIQUE KEY `COMTNINSTTCODERECPTNLOG_PK` (`OCCRRNC_DE`,`INSTT_CODE`,`OPERT_SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnintnetsvc
CREATE TABLE IF NOT EXISTS `comtnintnetsvc` (
  `INTNET_SVC_ID` char(20) NOT NULL DEFAULT '',
  `INTNET_SVC_NM` varchar(20) NOT NULL,
  `INTNET_SVC_DC` varchar(200) DEFAULT NULL,
  `REFLCT_AT` char(1) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`INTNET_SVC_ID`),
  UNIQUE KEY `COMTNINTNETSVC_PK` (`INTNET_SVC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnleaderschdul
CREATE TABLE IF NOT EXISTS `comtnleaderschdul` (
  `SCHDUL_ID` char(20) NOT NULL,
  `SCHDUL_SE` char(1) DEFAULT NULL,
  `SCHDUL_NM` varchar(255) NOT NULL,
  `SCHDUL_CN` varchar(2500) NOT NULL,
  `SCHDUL_PLACE` varchar(255) DEFAULT NULL,
  `LEADER_ID` varchar(20) NOT NULL,
  `REPTIT_SE_CODE` char(1) DEFAULT NULL,
  `SCHDUL_BGNDE` char(20) DEFAULT NULL,
  `SCHDUL_ENDDE` char(20) DEFAULT NULL,
  `SCHDUL_CHARGER_ID` varchar(20) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`),
  UNIQUE KEY `COMTNLEADERSCHDUL_PK` (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnleaderschdulde
CREATE TABLE IF NOT EXISTS `comtnleaderschdulde` (
  `SCHDUL_ID` char(20) NOT NULL,
  `SCHDUL_DE` char(8) NOT NULL,
  PRIMARY KEY (`SCHDUL_ID`,`SCHDUL_DE`),
  UNIQUE KEY `COMTNLEADERSCHDULDE_PK` (`SCHDUL_ID`,`SCHDUL_DE`),
  CONSTRAINT `comtnleaderschdulde_ibfk_1` FOREIGN KEY (`SCHDUL_ID`) REFERENCES `comtnleaderschdul` (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnleadersttus
CREATE TABLE IF NOT EXISTS `comtnleadersttus` (
  `LEADER_ID` varchar(20) NOT NULL,
  `LEADER_STTUS` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LEADER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnloginlog
CREATE TABLE IF NOT EXISTS `comtnloginlog` (
  `LOG_ID` char(20) NOT NULL,
  `CONECT_ID` varchar(20) DEFAULT NULL,
  `CONECT_IP` varchar(23) DEFAULT NULL,
  `CONECT_MTHD` char(4) DEFAULT NULL,
  `ERROR_OCCRRNC_AT` char(1) DEFAULT NULL,
  `ERROR_CODE` char(3) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`),
  UNIQUE KEY `COMTNLOGINLOG_PK` (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnloginpolicy
CREATE TABLE IF NOT EXISTS `comtnloginpolicy` (
  `EMPLYR_ID` varchar(20) NOT NULL DEFAULT '',
  `IP_INFO` varchar(23) NOT NULL,
  `DPLCT_PERM_AT` char(1) NOT NULL,
  `LMTT_AT` char(1) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`),
  UNIQUE KEY `COMTNLOGINPOLICY_PK` (`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnloginscrinimage
CREATE TABLE IF NOT EXISTS `comtnloginscrinimage` (
  `IMAGE_ID` char(20) NOT NULL DEFAULT '',
  `IMAGE_NM` varchar(20) NOT NULL,
  `REFLCT_AT` char(1) NOT NULL,
  `IMAGE` varchar(60) NOT NULL,
  `IMAGE_DC` varchar(200) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `IMAGE_FILE` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`IMAGE_ID`),
  UNIQUE KEY `COMTNLOGINSCRINIMAGE_PK` (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmainimage
CREATE TABLE IF NOT EXISTS `comtnmainimage` (
  `IMAGE_ID` char(20) NOT NULL DEFAULT '',
  `IMAGE_NM` varchar(20) NOT NULL,
  `IMAGE` varchar(60) NOT NULL,
  `IMAGE_DC` varchar(200) DEFAULT NULL,
  `REFLCT_AT` char(1) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `IMAGE_FILE` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`IMAGE_ID`),
  UNIQUE KEY `COMTNMAINIMAGE_PK` (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmemoreprt
CREATE TABLE IF NOT EXISTS `comtnmemoreprt` (
  `REPRT_SJ` varchar(255) NOT NULL,
  `REPORT_DE` char(20) NOT NULL,
  `WRTER_ID` varchar(20) NOT NULL,
  `REPORTR_ID` varchar(20) NOT NULL,
  `REPORT_CN` varchar(2500) NOT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `DRCT_MATTER` varchar(2500) DEFAULT NULL,
  `DRCT_MATTER_REGIST_DT` varchar(14) DEFAULT NULL,
  `REPORTR_INQIRE_DT` varchar(14) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `REPRT_ID` char(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`REPRT_ID`),
  UNIQUE KEY `COMTNMEMOREPRT_PK` (`REPRT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmemotodo
CREATE TABLE IF NOT EXISTS `comtnmemotodo` (
  `TODO_ID` char(20) NOT NULL,
  `TODO_SJ` varchar(255) NOT NULL,
  `TODO_BEGIN_TIME` varchar(14) NOT NULL,
  `TODO_END_TIME` varchar(14) NOT NULL,
  `WRTER_ID` varchar(20) NOT NULL,
  `TODO_CN` varchar(2500) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`TODO_ID`),
  UNIQUE KEY `COMTNMEMOTODO_PK` (`TODO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmenucreatdtls
CREATE TABLE IF NOT EXISTS `comtnmenucreatdtls` (
  `MENU_NO` decimal(20,0) NOT NULL,
  `AUTHOR_CODE` varchar(30) NOT NULL,
  `MAPNG_CREAT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MENU_NO`,`AUTHOR_CODE`),
  UNIQUE KEY `COMTNMENUCREATDTLS_PK` (`MENU_NO`,`AUTHOR_CODE`),
  KEY `COMTNMENUCREATDTLS_i02` (`MENU_NO`),
  KEY `COMTNMENUCREATDTLS_i03` (`MAPNG_CREAT_ID`),
  KEY `COMTNMENUCREATDTLS_i04` (`AUTHOR_CODE`),
  CONSTRAINT `comtnmenucreatdtls_ibfk_1` FOREIGN KEY (`MENU_NO`) REFERENCES `comtnmenuinfo` (`MENU_NO`) ON DELETE CASCADE,
  CONSTRAINT `comtnmenucreatdtls_ibfk_2` FOREIGN KEY (`MAPNG_CREAT_ID`) REFERENCES `comtnsitemap` (`MAPNG_CREAT_ID`) ON DELETE CASCADE,
  CONSTRAINT `comtnmenucreatdtls_ibfk_3` FOREIGN KEY (`AUTHOR_CODE`) REFERENCES `comtnauthorinfo` (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmenuinfo
CREATE TABLE IF NOT EXISTS `comtnmenuinfo` (
  `MENU_NM` varchar(60) NOT NULL,
  `PROGRM_FILE_NM` varchar(60) NOT NULL,
  `MENU_NO` decimal(20,0) NOT NULL,
  `UPPER_MENU_NO` decimal(20,0) DEFAULT NULL,
  `MENU_ORDR` decimal(5,0) NOT NULL,
  `MENU_DC` varchar(250) DEFAULT NULL,
  `RELATE_IMAGE_PATH` varchar(100) DEFAULT NULL,
  `RELATE_IMAGE_NM` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`MENU_NO`),
  UNIQUE KEY `COMTNMENUINFO_PK` (`MENU_NO`),
  KEY `COMTNMENUINFO_FK2` (`PROGRM_FILE_NM`),
  KEY `COMTNMENUINFO_i02` (`UPPER_MENU_NO`),
  CONSTRAINT `comtnmenuinfo_ibfk_1` FOREIGN KEY (`PROGRM_FILE_NM`) REFERENCES `comtnprogrmlist` (`PROGRM_FILE_NM`) ON DELETE CASCADE,
  CONSTRAINT `comtnmenuinfo_ibfk_2` FOREIGN KEY (`UPPER_MENU_NO`) REFERENCES `comtnmenuinfo` (`MENU_NO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmtginfo
CREATE TABLE IF NOT EXISTS `comtnmtginfo` (
  `MTG_ID` char(20) NOT NULL,
  `MTG_NM` varchar(255) DEFAULT NULL,
  `MTG_MTR_CN` varchar(1000) DEFAULT NULL,
  `MTG_SN` decimal(10,0) DEFAULT NULL,
  `MTG_CO` decimal(5,0) DEFAULT NULL,
  `MTG_DE` char(20) DEFAULT NULL,
  `MTG_PLACE` varchar(255) DEFAULT NULL,
  `MTG_BEGIN_TM` varchar(14) DEFAULT NULL,
  `MTG_END_TM` varchar(14) DEFAULT NULL,
  `CLSDR_MTG_AT` char(1) DEFAULT NULL,
  `READNG_BGNDE` char(20) DEFAULT NULL,
  `READNG_AT` char(1) DEFAULT NULL,
  `MTG_RESULT_CN` varchar(1000) DEFAULT NULL,
  `MTG_RESULT_ENNC` char(1) DEFAULT NULL,
  `ETC_MATTER` varchar(1000) DEFAULT NULL,
  `MNGT_DEPT_ID` varchar(20) DEFAULT NULL,
  `MNAER_ID` varchar(20) DEFAULT NULL,
  `MNAER_DEPT_ID` varchar(20) DEFAULT NULL,
  `MTG_AT` char(1) DEFAULT NULL,
  `NONATDRN_CO` decimal(10,0) DEFAULT NULL,
  `ATDRN_CO` decimal(10,0) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MTG_ID`),
  UNIQUE KEY `COMTNMTGINFO_PK` (`MTG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmtgplacefxtrs
CREATE TABLE IF NOT EXISTS `comtnmtgplacefxtrs` (
  `MTGRUM_ID` char(20) NOT NULL,
  `FXTRS_CODE` char(14) NOT NULL,
  `QY` decimal(20,0) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`MTGRUM_ID`,`FXTRS_CODE`),
  UNIQUE KEY `COMTNMTGPLACEFXTRS_PK` (`MTGRUM_ID`,`FXTRS_CODE`),
  KEY `COMTNMTGPLACEFXTRS_FK1` (`FXTRS_CODE`),
  KEY `COMTNMTGPLACEFXTRS_i01` (`MTGRUM_ID`),
  CONSTRAINT `comtnmtgplacefxtrs_ibfk_1` FOREIGN KEY (`MTGRUM_ID`) REFERENCES `comtnmtgplacemanage` (`MTGRUM_ID`),
  CONSTRAINT `comtnmtgplacefxtrs_ibfk_2` FOREIGN KEY (`FXTRS_CODE`) REFERENCES `comtnfxtrsmanage` (`FXTRS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmtgplacemanage
CREATE TABLE IF NOT EXISTS `comtnmtgplacemanage` (
  `MTGRUM_ID` char(20) NOT NULL,
  `MTGRUM_NM` varchar(255) NOT NULL,
  `OPN_BEGIN_TM` varchar(6) NOT NULL,
  `OPN_END_TM` varchar(6) NOT NULL,
  `ACEPTNC_POSBL_NMPR` decimal(10,0) NOT NULL,
  `LC_SE` char(5) DEFAULT NULL,
  `LC_DETAIL` varchar(200) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`MTGRUM_ID`),
  UNIQUE KEY `COMTNMTGPLACEMANAGE_PK` (`MTGRUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnmtgplaceresve
CREATE TABLE IF NOT EXISTS `comtnmtgplaceresve` (
  `RESVE_ID` char(20) NOT NULL,
  `MTGRUM_ID` char(20) NOT NULL,
  `MTG_SJ` varchar(100) NOT NULL,
  `RSVCTM_ID` varchar(20) NOT NULL,
  `RESVE_DE` char(8) NOT NULL,
  `RESVE_BEGIN_TM` varchar(14) NOT NULL,
  `RESVE_END_TM` varchar(14) NOT NULL,
  `ATNDNC_NMPR` decimal(10,0) DEFAULT NULL,
  `MTG_CN` varchar(2500) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`RESVE_ID`),
  UNIQUE KEY `COMTNMTGPLACERESVE_PK` (`RESVE_ID`),
  KEY `COMTNMTGPLACERESVE_i01` (`MTGRUM_ID`),
  CONSTRAINT `comtnmtgplaceresve_ibfk_1` FOREIGN KEY (`MTGRUM_ID`) REFERENCES `comtnmtgplacemanage` (`MTGRUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnncrd
CREATE TABLE IF NOT EXISTS `comtnncrd` (
  `NCRD_ID` char(20) NOT NULL,
  `NCRD_TRGTER_ID` varchar(20) DEFAULT NULL,
  `NM` varchar(50) NOT NULL,
  `TELNO` varchar(20) DEFAULT NULL,
  `NATION_NO` varchar(10) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `END_TELNO` varchar(4) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `IDNTFC_NO` varchar(10) DEFAULT NULL,
  `MIDDLE_MBTLNUM` varchar(4) DEFAULT NULL,
  `END_MBTLNUM` varchar(4) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `CMPNY_NM` varchar(60) DEFAULT NULL,
  `DEPT_NM` varchar(60) DEFAULT NULL,
  `ADRES` varchar(100) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `OFCPS_NM` varchar(60) DEFAULT NULL,
  `CLSF_NM` varchar(60) DEFAULT NULL,
  `EXTRL_USER_AT` char(1) DEFAULT NULL,
  `OTHBC_AT` char(1) NOT NULL,
  `RM` varchar(2500) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NCRD_ID`),
  UNIQUE KEY `COMTNNCRD_PK` (`NCRD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnncrduser
CREATE TABLE IF NOT EXISTS `comtnncrduser` (
  `NCRD_ID` char(20) NOT NULL,
  `REGIST_SE_CODE` char(6) NOT NULL,
  `USE_AT` char(1) NOT NULL,
  `CREAT_DT` datetime NOT NULL,
  `EMPLYR_ID` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`NCRD_ID`,`EMPLYR_ID`),
  UNIQUE KEY `COMTNNCRDUSER_PK` (`NCRD_ID`,`EMPLYR_ID`),
  KEY `COMTNNCRDUSER_i03` (`NCRD_ID`),
  CONSTRAINT `comtnncrduser_ibfk_1` FOREIGN KEY (`NCRD_ID`) REFERENCES `comtnncrd` (`NCRD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnnewsinfo
CREATE TABLE IF NOT EXISTS `comtnnewsinfo` (
  `NEWS_ID` char(20) NOT NULL,
  `NEWS_SJ` varchar(100) DEFAULT NULL,
  `NEWS_CN` varchar(2500) DEFAULT NULL,
  `NEWS_ORIGIN` varchar(250) DEFAULT NULL,
  `NTCE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) NOT NULL,
  `NTCE_DE` char(20) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  PRIMARY KEY (`NEWS_ID`),
  UNIQUE KEY `COMTNNEWSINFO_PK` (`NEWS_ID`),
  KEY `COMTNNEWSINFO_i01` (`ATCH_FILE_ID`),
  CONSTRAINT `comtnnewsinfo_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `comtnfile` (`ATCH_FILE_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnnote
CREATE TABLE IF NOT EXISTS `comtnnote` (
  `NOTE_ID` char(20) NOT NULL,
  `NOTE_SJ` varchar(255) DEFAULT NULL,
  `NOTE_CN` varchar(4000) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`NOTE_ID`),
  UNIQUE KEY `COMTNNOTE_PK` (`NOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnnoterecptn
CREATE TABLE IF NOT EXISTS `comtnnoterecptn` (
  `NOTE_ID` char(20) NOT NULL,
  `NOTE_TRNSMIT_ID` char(20) NOT NULL,
  `NOTE_RECPTN_ID` char(20) NOT NULL,
  `RCVER_ID` char(20) DEFAULT NULL,
  `OPEN_YN` char(1) DEFAULT NULL,
  `RECPTN_SE` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`NOTE_ID`,`NOTE_TRNSMIT_ID`,`NOTE_RECPTN_ID`),
  UNIQUE KEY `COMTNNOTERECPTN_PK` (`NOTE_ID`,`NOTE_TRNSMIT_ID`,`NOTE_RECPTN_ID`),
  KEY `COMTNNOTERECPTN_i01` (`NOTE_ID`,`NOTE_TRNSMIT_ID`),
  CONSTRAINT `comtnnoterecptn_ibfk_1` FOREIGN KEY (`NOTE_ID`, `NOTE_TRNSMIT_ID`) REFERENCES `comtnnotetrnsmit` (`NOTE_ID`, `NOTE_TRNSMIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnnotetrnsmit
CREATE TABLE IF NOT EXISTS `comtnnotetrnsmit` (
  `NOTE_ID` char(20) NOT NULL,
  `NOTE_TRNSMIT_ID` char(20) NOT NULL,
  `TRNSMITER_ID` char(20) DEFAULT NULL,
  `DELETE_AT` char(8) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`NOTE_ID`,`NOTE_TRNSMIT_ID`),
  UNIQUE KEY `COMTNNOTETRNSMIT_PK` (`NOTE_ID`,`NOTE_TRNSMIT_ID`),
  KEY `COMTNNOTETRNSMIT_i01` (`NOTE_ID`),
  CONSTRAINT `comtnnotetrnsmit_ibfk_1` FOREIGN KEY (`NOTE_ID`) REFERENCES `comtnnote` (`NOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnntfcinfo
CREATE TABLE IF NOT EXISTS `comtnntfcinfo` (
  `NTCN_NO` decimal(20,0) NOT NULL DEFAULT '0',
  `NTCN_SJ` varchar(60) NOT NULL,
  `NTCN_CN` varchar(100) NOT NULL,
  `NTCN_TM` varchar(14) NOT NULL,
  `BH_NTCN_INTRVL` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NTCN_NO`),
  UNIQUE KEY `COMTNNTFCINFO_PK` (`NTCN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnnttstats
CREATE TABLE IF NOT EXISTS `comtnnttstats` (
  `STATS_ID` char(18) NOT NULL DEFAULT '',
  `NTCE_CO` decimal(10,0) DEFAULT NULL,
  `AVRG_RDCNT` decimal(10,0) DEFAULT NULL,
  `TOP_RDCNT` decimal(10,0) DEFAULT NULL,
  `MUMM_RDCNT` decimal(10,0) DEFAULT NULL,
  `TOP_NTCR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`STATS_ID`),
  UNIQUE KEY `COMTNNTTSTATS_PK` (`STATS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnntwrkinfo
CREATE TABLE IF NOT EXISTS `comtnntwrkinfo` (
  `NTWRK_ID` char(20) NOT NULL,
  `NTWRK_IP` varchar(23) DEFAULT NULL,
  `GTWY` varchar(23) DEFAULT NULL,
  `SUBNET` varchar(23) DEFAULT NULL,
  `DOMN_NM_SERVER` varchar(23) DEFAULT NULL,
  `MANAGE_IEM` char(2) DEFAULT NULL,
  `USER_NM` varchar(60) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `RGSDE` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`NTWRK_ID`),
  UNIQUE KEY `COMTNNTWRKINFO_PK` (`NTWRK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnntwrksvcmntrng
CREATE TABLE IF NOT EXISTS `comtnntwrksvcmntrng` (
  `SYS_IP` varchar(23) NOT NULL,
  `SYS_PORT` decimal(5,0) NOT NULL,
  `SYS_NM` varchar(255) NOT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`SYS_IP`,`SYS_PORT`),
  UNIQUE KEY `COMTNNTWRKSVCMNTRNG_PK` (`SYS_IP`,`SYS_PORT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnntwrksvcmntrngloginfo
CREATE TABLE IF NOT EXISTS `comtnntwrksvcmntrngloginfo` (
  `SYS_IP` varchar(23) NOT NULL,
  `SYS_PORT` decimal(5,0) NOT NULL,
  `SYS_NM` varchar(255) NOT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `LOG_INFO` varchar(2000) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  `LOG_ID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`SYS_IP`,`SYS_PORT`,`LOG_ID`),
  UNIQUE KEY `COMTNNTWRKSVCMNTRNGLOGINFO_PK` (`SYS_IP`,`SYS_PORT`,`LOG_ID`),
  CONSTRAINT `comtnntwrksvcmntrngloginfo_ibfk_1` FOREIGN KEY (`SYS_IP`, `SYS_PORT`) REFERENCES `comtnntwrksvcmntrng` (`SYS_IP`, `SYS_PORT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnonlinemanual
CREATE TABLE IF NOT EXISTS `comtnonlinemanual` (
  `ONLINE_MNL_ID` char(20) NOT NULL DEFAULT '',
  `ONLINE_MNL_SE_CODE` char(3) DEFAULT NULL,
  `ONLINE_MNL_DFN` mediumtext,
  `ONLINE_MNL_DC` mediumtext,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `ONLINE_MNL_NM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ONLINE_MNL_ID`),
  UNIQUE KEY `COMTNONLINEMANUAL_PK` (`ONLINE_MNL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnonlinepolliem
CREATE TABLE IF NOT EXISTS `comtnonlinepolliem` (
  `POLL_IEM_NM` varchar(255) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `POLL_IEM_ID` char(20) NOT NULL,
  `POLL_ID` char(20) NOT NULL,
  PRIMARY KEY (`POLL_ID`,`POLL_IEM_ID`),
  UNIQUE KEY `COMTNONLINEPOLLIEM_PK` (`POLL_ID`,`POLL_IEM_ID`),
  KEY `COMTNONLINEPOLLIEM_i01` (`POLL_ID`),
  CONSTRAINT `comtnonlinepolliem_ibfk_1` FOREIGN KEY (`POLL_ID`) REFERENCES `comtnonlinepollmanage` (`POLL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnonlinepollmanage
CREATE TABLE IF NOT EXISTS `comtnonlinepollmanage` (
  `POLL_ID` char(20) NOT NULL,
  `POLL_NM` varchar(255) DEFAULT NULL,
  `POLL_BGNDE` char(10) DEFAULT NULL,
  `POLL_ENDDE` char(10) DEFAULT NULL,
  `POLL_KND` char(3) DEFAULT NULL,
  `POLL_DSUSE_ENNC` char(1) DEFAULT NULL,
  `POLL_ATMC_DSUSE_ENNC` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`POLL_ID`),
  UNIQUE KEY `COMTNONLINEPOLLMANAGE_PK` (`POLL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnonlinepollresult
CREATE TABLE IF NOT EXISTS `comtnonlinepollresult` (
  `POLL_RESULT_ID` char(20) NOT NULL DEFAULT '',
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `POLL_IEM_ID` char(20) NOT NULL,
  `POLL_ID` char(20) NOT NULL,
  PRIMARY KEY (`POLL_RESULT_ID`,`POLL_IEM_ID`,`POLL_ID`),
  UNIQUE KEY `COMTNONLINEPOLLRESULT_PK` (`POLL_RESULT_ID`,`POLL_IEM_ID`,`POLL_ID`),
  KEY `COMTNONLINEPOLLRESULT_FK1` (`POLL_ID`,`POLL_IEM_ID`),
  KEY `COMTNONLINEPOLLRESULT_i01` (`POLL_IEM_ID`,`POLL_ID`),
  CONSTRAINT `comtnonlinepollresult_ibfk_1` FOREIGN KEY (`POLL_ID`, `POLL_IEM_ID`) REFERENCES `comtnonlinepolliem` (`POLL_ID`, `POLL_IEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnorgnztinfo
CREATE TABLE IF NOT EXISTS `comtnorgnztinfo` (
  `ORGNZT_ID` char(20) NOT NULL DEFAULT '',
  `ORGNZT_NM` varchar(20) NOT NULL,
  `ORGNZT_DC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ORGNZT_ID`),
  UNIQUE KEY `COMTNORGNZTINFO_PK` (`ORGNZT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnpopupmanage
CREATE TABLE IF NOT EXISTS `comtnpopupmanage` (
  `POPUP_ID` varchar(20) NOT NULL DEFAULT '',
  `POPUP_SJ_NM` varchar(1024) DEFAULT NULL,
  `FILE_URL` varchar(1024) DEFAULT NULL,
  `POPUP_WIDTH_LC` varchar(20) DEFAULT NULL,
  `POPUP_WIDTH_SIZE` decimal(10,0) DEFAULT NULL,
  `NTCE_BGNDE` char(20) DEFAULT NULL,
  `NTCE_ENDDE` char(20) DEFAULT NULL,
  `STOPVEW_SETUP_AT` char(1) DEFAULT NULL,
  `NTCE_AT` char(1) DEFAULT NULL,
  `POPUP_VRTICL_LC` varchar(20) DEFAULT NULL,
  `POPUP_VRTICL_SIZE` decimal(10,0) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`POPUP_ID`),
  UNIQUE KEY `COMTNPOPUPMANAGE_PK` (`POPUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnprocessmon
CREATE TABLE IF NOT EXISTS `comtnprocessmon` (
  `PROCS_ID` char(20) NOT NULL,
  `PROCS_NM` varchar(60) DEFAULT NULL,
  `PROCS_STTUS` varchar(3) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`PROCS_ID`),
  UNIQUE KEY `COMTNPROCESSMON_PK` (`PROCS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnprocessmonloginfo
CREATE TABLE IF NOT EXISTS `comtnprocessmonloginfo` (
  `PROCS_ID` char(20) NOT NULL,
  `PROCS_NM` varchar(60) DEFAULT NULL,
  `PROCS_STTUS` varchar(3) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `LOG_INFO` varchar(2000) DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LOG_ID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PROCS_ID`,`LOG_ID`),
  UNIQUE KEY `COMTNPROCESSMONLOGINFO_PK` (`PROCS_ID`,`LOG_ID`),
  CONSTRAINT `comtnprocessmonloginfo_ibfk_1` FOREIGN KEY (`PROCS_ID`) REFERENCES `comtnprocessmon` (`PROCS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnprogrmlist
CREATE TABLE IF NOT EXISTS `comtnprogrmlist` (
  `PROGRM_FILE_NM` varchar(60) NOT NULL DEFAULT '',
  `PROGRM_STRE_PATH` varchar(100) NOT NULL,
  `PROGRM_KOREAN_NM` varchar(60) DEFAULT NULL,
  `PROGRM_DC` varchar(200) DEFAULT NULL,
  `URL` varchar(100) NOT NULL,
  PRIMARY KEY (`PROGRM_FILE_NM`),
  UNIQUE KEY `COMTNPROGRMLIST_PK` (`PROGRM_FILE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnproxyinfo
CREATE TABLE IF NOT EXISTS `comtnproxyinfo` (
  `PROXY_ID` char(20) NOT NULL,
  `PROXY_NM` varchar(60) DEFAULT NULL,
  `PROXY_IP` varchar(23) DEFAULT NULL,
  `PROXY_PORT` varchar(10) DEFAULT NULL,
  `TRGET_SVC_NM` varchar(255) DEFAULT NULL,
  `SVC_DC` varchar(2000) DEFAULT NULL,
  `SVC_IP` varchar(23) DEFAULT NULL,
  `SVC_PORT` varchar(10) DEFAULT NULL,
  `SVC_STTUS` char(2) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`PROXY_ID`),
  UNIQUE KEY `COMTNPROXYINFO_PK` (`PROXY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnproxyloginfo
CREATE TABLE IF NOT EXISTS `comtnproxyloginfo` (
  `PROXY_ID` char(20) NOT NULL,
  `CLNT_IP` varchar(23) DEFAULT NULL,
  `CLNT_PORT` varchar(10) DEFAULT NULL,
  `CONECT_TIME` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LOG_ID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PROXY_ID`,`LOG_ID`),
  UNIQUE KEY `COMTNPROXYLOGINFO_PK` (`PROXY_ID`,`LOG_ID`),
  CONSTRAINT `comtnproxyloginfo_ibfk_1` FOREIGN KEY (`PROXY_ID`) REFERENCES `comtnproxyinfo` (`PROXY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnqainfo
CREATE TABLE IF NOT EXISTS `comtnqainfo` (
  `QA_ID` char(20) NOT NULL,
  `QESTN_SJ` varchar(255) DEFAULT NULL,
  `QESTN_CN` varchar(2500) DEFAULT NULL,
  `WRITNG_DE` char(20) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `QNA_PROCESS_STTUS_CODE` char(1) DEFAULT NULL,
  `WRTER_NM` varchar(20) DEFAULT NULL,
  `ANSWER_CN` varchar(2500) DEFAULT NULL,
  `WRITNG_PASSWORD` varchar(20) DEFAULT NULL,
  `ANSWER_DE` char(20) DEFAULT NULL,
  `EMAIL_ANSWER_AT` char(1) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `END_TELNO` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`QA_ID`),
  UNIQUE KEY `COMTNQAINFO_PK` (`QA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnqestnrinfo
CREATE TABLE IF NOT EXISTS `comtnqestnrinfo` (
  `QUSTNR_TMPLAT_ID` char(20) NOT NULL,
  `QESTNR_ID` char(20) NOT NULL,
  `QUSTNR_SJ` varchar(255) DEFAULT NULL,
  `QUSTNR_PURPS` varchar(1000) DEFAULT NULL,
  `QUSTNR_WRITNG_GUIDANCE_CN` varchar(2000) DEFAULT NULL,
  `QUSTNR_TRGET` varchar(1000) DEFAULT NULL,
  `QUSTNR_BGNDE` char(20) DEFAULT NULL,
  `QUSTNR_ENDDE` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`QUSTNR_TMPLAT_ID`,`QESTNR_ID`),
  UNIQUE KEY `COMTNQESTNRINFO_PK` (`QUSTNR_TMPLAT_ID`,`QESTNR_ID`),
  KEY `COMTNQESTNRINFO_i01` (`QUSTNR_TMPLAT_ID`),
  CONSTRAINT `comtnqestnrinfo_ibfk_1` FOREIGN KEY (`QUSTNR_TMPLAT_ID`) REFERENCES `comtnqustnrtmplat` (`QUSTNR_TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnqustnriem
CREATE TABLE IF NOT EXISTS `comtnqustnriem` (
  `QUSTNR_TMPLAT_ID` char(20) NOT NULL,
  `QESTNR_ID` char(20) NOT NULL,
  `QUSTNR_QESITM_ID` char(20) NOT NULL,
  `QUSTNR_IEM_ID` varchar(20) NOT NULL,
  `IEM_SN` decimal(5,0) DEFAULT NULL,
  `IEM_CN` varchar(1000) DEFAULT NULL,
  `ETC_ANSWER_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`QUSTNR_TMPLAT_ID`,`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_IEM_ID`),
  UNIQUE KEY `COMTNQUSTNRIEM_PK` (`QUSTNR_TMPLAT_ID`,`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_IEM_ID`),
  KEY `COMTNQUSTNRIEM_FK1` (`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_TMPLAT_ID`),
  KEY `COMTNQUSTNRIEM_i01` (`QUSTNR_QESITM_ID`,`QESTNR_ID`,`QUSTNR_TMPLAT_ID`),
  CONSTRAINT `comtnqustnriem_ibfk_1` FOREIGN KEY (`QESTNR_ID`, `QUSTNR_QESITM_ID`, `QUSTNR_TMPLAT_ID`) REFERENCES `comtnqustnrqesitm` (`QESTNR_ID`, `QUSTNR_QESITM_ID`, `QUSTNR_TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnqustnrqesitm
CREATE TABLE IF NOT EXISTS `comtnqustnrqesitm` (
  `QESTNR_ID` char(20) NOT NULL,
  `QUSTNR_QESITM_ID` char(20) NOT NULL,
  `QUSTNR_TMPLAT_ID` char(20) NOT NULL,
  `QESTN_SN` decimal(10,0) DEFAULT NULL,
  `QESTN_TY_CODE` char(1) DEFAULT NULL,
  `QESTN_CN` varchar(2500) DEFAULT NULL,
  `MXMM_CHOISE_CO` decimal(5,0) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_TMPLAT_ID`),
  UNIQUE KEY `COMTNQUSTNRQESITM_PK` (`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_TMPLAT_ID`),
  KEY `COMTNQUSTNRQESITM_FK1` (`QUSTNR_TMPLAT_ID`,`QESTNR_ID`),
  KEY `COMTNQUSTNRQESITM_i02` (`QESTNR_ID`,`QUSTNR_TMPLAT_ID`),
  CONSTRAINT `comtnqustnrqesitm_ibfk_1` FOREIGN KEY (`QUSTNR_TMPLAT_ID`, `QESTNR_ID`) REFERENCES `comtnqestnrinfo` (`QUSTNR_TMPLAT_ID`, `QESTNR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnqustnrrespondinfo
CREATE TABLE IF NOT EXISTS `comtnqustnrrespondinfo` (
  `QUSTNR_TMPLAT_ID` char(20) NOT NULL,
  `QESTNR_ID` char(20) NOT NULL,
  `QUSTNR_RESPOND_ID` char(20) NOT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `OCCP_TY_CODE` char(1) DEFAULT NULL,
  `RESPOND_NM` varchar(50) DEFAULT NULL,
  `BRTHDY` char(20) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `END_TELNO` varchar(4) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`QUSTNR_TMPLAT_ID`,`QESTNR_ID`,`QUSTNR_RESPOND_ID`),
  UNIQUE KEY `COMTNQUSTNRRESPONDINFO_PK` (`QUSTNR_TMPLAT_ID`,`QESTNR_ID`,`QUSTNR_RESPOND_ID`),
  KEY `COMTNQUSTNRRESPONDINFO_i01` (`QESTNR_ID`,`QUSTNR_TMPLAT_ID`),
  CONSTRAINT `comtnqustnrrespondinfo_ibfk_1` FOREIGN KEY (`QUSTNR_TMPLAT_ID`, `QESTNR_ID`) REFERENCES `comtnqestnrinfo` (`QUSTNR_TMPLAT_ID`, `QESTNR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnqustnrrspnsresult
CREATE TABLE IF NOT EXISTS `comtnqustnrrspnsresult` (
  `QUSTNR_RSPNS_RESULT_ID` char(20) NOT NULL,
  `QESTNR_ID` char(20) NOT NULL,
  `QUSTNR_QESITM_ID` char(20) NOT NULL,
  `QUSTNR_TMPLAT_ID` char(20) NOT NULL,
  `RESPOND_ANSWER_CN` varchar(1000) DEFAULT NULL,
  `ETC_ANSWER_CN` varchar(1000) DEFAULT NULL,
  `RESPOND_NM` varchar(50) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `QUSTNR_IEM_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`QUSTNR_RSPNS_RESULT_ID`,`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_TMPLAT_ID`),
  UNIQUE KEY `COMTNQUSTNRRSPNSRESULT_PK` (`QUSTNR_RSPNS_RESULT_ID`,`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_TMPLAT_ID`),
  KEY `COMTNQUSTNRRSPNSRESULT_i01` (`QESTNR_ID`,`QUSTNR_QESITM_ID`,`QUSTNR_TMPLAT_ID`),
  CONSTRAINT `comtnqustnrrspnsresult_ibfk_1` FOREIGN KEY (`QESTNR_ID`, `QUSTNR_QESITM_ID`, `QUSTNR_TMPLAT_ID`) REFERENCES `comtnqustnrqesitm` (`QESTNR_ID`, `QUSTNR_QESITM_ID`, `QUSTNR_TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnqustnrtmplat
CREATE TABLE IF NOT EXISTS `comtnqustnrtmplat` (
  `QUSTNR_TMPLAT_ID` char(20) NOT NULL,
  `QUSTNR_TMPLAT_TY` varchar(100) DEFAULT NULL,
  `QUSTNR_TMPLAT_DC` varchar(2000) DEFAULT NULL,
  `QUSTNR_TMPLAT_PATH_NM` varchar(100) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `QUSTNR_TMPLAT_IMAGE_INFO` blob,
  PRIMARY KEY (`QUSTNR_TMPLAT_ID`),
  UNIQUE KEY `COMTNQUSTNRTMPLAT_PK` (`QUSTNR_TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnrecentsrchwrd
CREATE TABLE IF NOT EXISTS `comtnrecentsrchwrd` (
  `SRCHWRD_MANAGE_ID` char(20) NOT NULL,
  `RECENT_SRCHWRD_ID` char(20) NOT NULL,
  `RECENT_SRCHWRD_NM` varchar(255) DEFAULT NULL,
  `RECENT_SRCHWRD_CO` decimal(20,0) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`RECENT_SRCHWRD_ID`),
  UNIQUE KEY `COMTNRECENTSRCHWRD_PK` (`RECENT_SRCHWRD_ID`),
  KEY `COMTNRECENTSRCHWRD_FK1` (`SRCHWRD_MANAGE_ID`),
  CONSTRAINT `comtnrecentsrchwrd_ibfk_1` FOREIGN KEY (`SRCHWRD_MANAGE_ID`) REFERENCES `comtnrecentsrchwrdmanage` (`SRCHWRD_MANAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnrecentsrchwrdmanage
CREATE TABLE IF NOT EXISTS `comtnrecentsrchwrdmanage` (
  `SRCHWRD_MANAGE_ID` char(20) NOT NULL DEFAULT '',
  `SRCHWRD_MANAGE_NM` varchar(255) DEFAULT NULL,
  `SRCHWRD_CONECT_URL` varchar(255) DEFAULT NULL,
  `USER_SEARCH_AT` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`SRCHWRD_MANAGE_ID`),
  UNIQUE KEY `COMTNRECENTSRCHWRDMANAGE_PK` (`SRCHWRD_MANAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnrecomendsiteinfo
CREATE TABLE IF NOT EXISTS `comtnrecomendsiteinfo` (
  `RECOMEND_SITE_ID` char(20) NOT NULL,
  `RECOMEND_SITE_NM` varchar(100) DEFAULT NULL,
  `RECOMEND_SITE_URL` varchar(255) DEFAULT NULL,
  `RECOMEND_SITE_DC` varchar(1000) DEFAULT NULL,
  `RECOMEND_RESN_CN` varchar(1000) DEFAULT NULL,
  `RECOMEND_CONFM_AT` char(1) DEFAULT NULL,
  `CONFM_DE` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RECOMEND_SITE_ID`),
  UNIQUE KEY `COMTNRECOMENDSITEINFO_PK` (`RECOMEND_SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnreprtstats
CREATE TABLE IF NOT EXISTS `comtnreprtstats` (
  `REPRT_ID` char(6) NOT NULL DEFAULT '',
  `REPRT_NM` varchar(20) NOT NULL,
  `REPRT_STTUS` char(2) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `REPRT_TY` char(2) DEFAULT NULL,
  PRIMARY KEY (`REPRT_ID`),
  UNIQUE KEY `COMTNREPRTSTATS_PK` (`REPRT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnrestde
CREATE TABLE IF NOT EXISTS `comtnrestde` (
  `RESTDE_NO` decimal(6,0) NOT NULL,
  `RESTDE` char(8) DEFAULT NULL,
  `RESTDE_NM` varchar(60) DEFAULT NULL,
  `RESTDE_DC` varchar(200) DEFAULT NULL,
  `RESTDE_SE_CODE` varchar(2) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RESTDE_NO`),
  UNIQUE KEY `COMTNRESTDE_PK` (`RESTDE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnroleinfo
CREATE TABLE IF NOT EXISTS `comtnroleinfo` (
  `ROLE_CODE` varchar(50) NOT NULL DEFAULT '',
  `ROLE_NM` varchar(60) NOT NULL,
  `ROLE_PTTRN` varchar(300) DEFAULT NULL,
  `ROLE_DC` varchar(200) DEFAULT NULL,
  `ROLE_TY` varchar(80) DEFAULT NULL,
  `ROLE_SORT` varchar(10) DEFAULT NULL,
  `ROLE_CREAT_DE` char(20) NOT NULL,
  PRIMARY KEY (`ROLE_CODE`),
  UNIQUE KEY `COMTNROLEINFO_PK` (`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnroles_hierarchy
CREATE TABLE IF NOT EXISTS `comtnroles_hierarchy` (
  `PARNTS_ROLE` varchar(30) NOT NULL,
  `CHLDRN_ROLE` varchar(30) NOT NULL,
  PRIMARY KEY (`PARNTS_ROLE`,`CHLDRN_ROLE`),
  UNIQUE KEY `COMTNROLES_HIERARCHY_PK` (`PARNTS_ROLE`,`CHLDRN_ROLE`),
  UNIQUE KEY `COMTNROLES_HIERARCHY_i01` (`PARNTS_ROLE`),
  KEY `COMTNROLES_HIERARCHY_i02` (`CHLDRN_ROLE`),
  CONSTRAINT `comtnroles_hierarchy_ibfk_1` FOREIGN KEY (`PARNTS_ROLE`) REFERENCES `comtnauthorinfo` (`AUTHOR_CODE`) ON DELETE CASCADE,
  CONSTRAINT `comtnroles_hierarchy_ibfk_2` FOREIGN KEY (`CHLDRN_ROLE`) REFERENCES `comtnauthorinfo` (`AUTHOR_CODE`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnrss
CREATE TABLE IF NOT EXISTS `comtnrss` (
  `RSS_ID` char(20) NOT NULL,
  `TRGET_SVC_NM` varchar(255) NOT NULL,
  `TRGET_SVC_TABLE` varchar(255) NOT NULL,
  `TRGET_SVC_LIST_CO` decimal(5,0) NOT NULL,
  `HDER_TITLE` varchar(255) NOT NULL,
  `HDER_LINK` varchar(255) NOT NULL,
  `HDER_DC` varchar(4000) NOT NULL,
  `HDER_TAG` varchar(255) DEFAULT NULL,
  `HDER_ETC` varchar(250) DEFAULT NULL,
  `BDT_TITLE` varchar(255) DEFAULT NULL,
  `BDT_LINK` varchar(255) DEFAULT NULL,
  `BDT_DC` varchar(4000) DEFAULT NULL,
  `BDT_TAG` varchar(255) DEFAULT NULL,
  `BDT_ETC_TAG` varchar(255) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`RSS_ID`),
  UNIQUE KEY `COMTNRSS_PK` (`RSS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnrwardmanage
CREATE TABLE IF NOT EXISTS `comtnrwardmanage` (
  `RWARD_ID` char(20) NOT NULL,
  `RWARDWNR_ID` varchar(20) NOT NULL,
  `RWARD_CODE` char(2) NOT NULL,
  `RWARD_DE` char(20) NOT NULL,
  `RWARD_NM` varchar(255) NOT NULL,
  `PBLEN_CN` varchar(1000) DEFAULT NULL,
  `SANCTNER_ID` varchar(20) NOT NULL,
  `CONFM_AT` char(1) DEFAULT NULL,
  `SANCTN_DT` datetime DEFAULT NULL,
  `RETURN_RESN` varchar(1000) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `INFRML_SANCTN_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`RWARD_ID`),
  UNIQUE KEY `COMTNRWARDMANAGE_PK` (`RWARD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnschdulinfo
CREATE TABLE IF NOT EXISTS `comtnschdulinfo` (
  `SCHDUL_ID` char(20) NOT NULL,
  `SCHDUL_SE` char(1) DEFAULT NULL,
  `SCHDUL_DEPT_ID` varchar(20) DEFAULT NULL,
  `SCHDUL_KND_CODE` char(1) DEFAULT NULL,
  `SCHDUL_BGNDE` char(20) DEFAULT NULL,
  `SCHDUL_ENDDE` char(20) DEFAULT NULL,
  `SCHDUL_NM` varchar(255) DEFAULT NULL,
  `SCHDUL_CN` varchar(2500) DEFAULT NULL,
  `SCHDUL_PLACE` varchar(255) DEFAULT NULL,
  `SCHDUL_IPCR_CODE` char(1) DEFAULT NULL,
  `SCHDUL_CHARGER_ID` varchar(20) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `REPTIT_SE_CODE` char(1) DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`),
  UNIQUE KEY `COMTNSCHDULINFO_PK` (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnscrap
CREATE TABLE IF NOT EXISTS `comtnscrap` (
  `SCRAP_ID` char(20) NOT NULL,
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `SCRAP_NM` varchar(100) NOT NULL,
  `USE_AT` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SCRAP_ID`),
  UNIQUE KEY `COMTNSCRAP_PK` (`SCRAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnservereqpmninfo
CREATE TABLE IF NOT EXISTS `comtnservereqpmninfo` (
  `SERVER_EQPMN_ID` varchar(20) NOT NULL,
  `SERVER_EQPMN_NM` varchar(60) DEFAULT NULL,
  `SERVER_EQPMN_IP` varchar(23) DEFAULT NULL,
  `SERVER_EQPMN_MNGR` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `OPERSYSM_INFO` varchar(2000) DEFAULT NULL,
  `CPU_INFO` varchar(2000) DEFAULT NULL,
  `MORY_INFO` varchar(2000) DEFAULT NULL,
  `HDDISK` char(18) DEFAULT NULL,
  `ETC_INFO` varchar(250) DEFAULT NULL,
  `RGSDE` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`SERVER_EQPMN_ID`),
  UNIQUE KEY `COMTNSERVEREQPMNINFO_PK` (`SERVER_EQPMN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnservereqpmnrelate
CREATE TABLE IF NOT EXISTS `comtnservereqpmnrelate` (
  `SERVER_EQPMN_ID` varchar(20) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `SERVER_ID` char(20) NOT NULL,
  PRIMARY KEY (`SERVER_EQPMN_ID`,`SERVER_ID`),
  UNIQUE KEY `COMTNSERVEREQPMNRELATE_PK` (`SERVER_EQPMN_ID`,`SERVER_ID`),
  KEY `COMTNSERVEREQPMNRELATE_FK1` (`SERVER_ID`),
  CONSTRAINT `comtnservereqpmnrelate_ibfk_1` FOREIGN KEY (`SERVER_EQPMN_ID`) REFERENCES `comtnservereqpmninfo` (`SERVER_EQPMN_ID`),
  CONSTRAINT `comtnservereqpmnrelate_ibfk_2` FOREIGN KEY (`SERVER_ID`) REFERENCES `comtnserverinfo` (`SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnserverinfo
CREATE TABLE IF NOT EXISTS `comtnserverinfo` (
  `SERVER_ID` char(20) NOT NULL,
  `SERVER_NM` varchar(60) DEFAULT NULL,
  `SERVER_KND` char(2) DEFAULT NULL,
  `RGSDE` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`SERVER_ID`),
  UNIQUE KEY `COMTNSERVERINFO_PK` (`SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnserverresrceloginfo
CREATE TABLE IF NOT EXISTS `comtnserverresrceloginfo` (
  `SERVER_EQPMN_ID` varchar(20) NOT NULL,
  `CPU_USE_RT` decimal(3,0) DEFAULT NULL,
  `MORY_USE_RT` decimal(3,0) DEFAULT NULL,
  `SVC_STTUS` char(2) DEFAULT NULL,
  `LOG_INFO` varchar(2000) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `SERVER_ID` char(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LOG_ID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`SERVER_EQPMN_ID`,`SERVER_ID`,`LOG_ID`),
  UNIQUE KEY `COMTNSERVERRESRCELOGINFO_PK` (`SERVER_EQPMN_ID`,`SERVER_ID`,`LOG_ID`),
  CONSTRAINT `comtnserverresrceloginfo_ibfk_1` FOREIGN KEY (`SERVER_EQPMN_ID`, `SERVER_ID`) REFERENCES `comtnservereqpmnrelate` (`SERVER_EQPMN_ID`, `SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnsitelist
CREATE TABLE IF NOT EXISTS `comtnsitelist` (
  `SITE_ID` char(20) NOT NULL,
  `SITE_NM` varchar(100) DEFAULT NULL,
  `SITE_URL` varchar(100) DEFAULT NULL,
  `SITE_DC` varchar(1000) DEFAULT NULL,
  `SITE_THEMA_CL_CODE` varchar(2) DEFAULT NULL,
  `ACTVTY_AT` char(1) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  UNIQUE KEY `COMTNSITELIST_PK` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnsitemap
CREATE TABLE IF NOT EXISTS `comtnsitemap` (
  `MAPNG_CREAT_ID` varchar(30) NOT NULL,
  `CREATR_ID` varchar(20) NOT NULL,
  `MAPNG_FILE_NM` varchar(60) NOT NULL,
  `MAPNG_FILE_PATH` varchar(100) NOT NULL,
  PRIMARY KEY (`MAPNG_CREAT_ID`),
  UNIQUE KEY `COMTNSITEMAP_PK` (`MAPNG_CREAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnsms
CREATE TABLE IF NOT EXISTS `comtnsms` (
  `SMS_ID` char(20) NOT NULL DEFAULT '',
  `TRNSMIS_TELNO` varchar(12) NOT NULL,
  `TRNSMIS_CN` varchar(80) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`SMS_ID`),
  UNIQUE KEY `COMTNSMS_PK` (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnsmsrecptn
CREATE TABLE IF NOT EXISTS `comtnsmsrecptn` (
  `SMS_ID` char(20) NOT NULL,
  `RECPTN_TELNO` varchar(12) NOT NULL DEFAULT '',
  `RESULT_CODE` varchar(4) DEFAULT NULL,
  `RESULT_MSSAGE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`SMS_ID`,`RECPTN_TELNO`),
  UNIQUE KEY `COMTNSMSRECPTN_PK` (`SMS_ID`,`RECPTN_TELNO`),
  KEY `COMTNSMSRECPTN_i01` (`SMS_ID`),
  CONSTRAINT `comtnsmsrecptn_ibfk_1` FOREIGN KEY (`SMS_ID`) REFERENCES `comtnsms` (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnstplatinfo
CREATE TABLE IF NOT EXISTS `comtnstplatinfo` (
  `USE_STPLAT_ID` char(20) NOT NULL,
  `USE_STPLAT_NM` varchar(100) DEFAULT NULL,
  `USE_STPLAT_CN` mediumtext,
  `INFO_PROVD_AGRE_CN` mediumtext,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USE_STPLAT_ID`),
  UNIQUE KEY `COMTNSTPLATINFO_PK` (`USE_STPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnstsfdg
CREATE TABLE IF NOT EXISTS `comtnstsfdg` (
  `STSFDG_NO` decimal(20,0) NOT NULL,
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `WRTER_ID` varchar(20) DEFAULT NULL,
  `WRTER_NM` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `STSFDG` decimal(1,0) NOT NULL,
  `STSFDG_CN` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`STSFDG_NO`),
  UNIQUE KEY `COMTNSTSFDG_PK` (`STSFDG_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnsynchrnserverinfo
CREATE TABLE IF NOT EXISTS `comtnsynchrnserverinfo` (
  `SERVER_ID` char(20) NOT NULL,
  `SERVER_NM` varchar(60) DEFAULT NULL,
  `SERVER_IP` varchar(23) DEFAULT NULL,
  `SERVER_PORT` varchar(10) DEFAULT NULL,
  `FTP_ID` varchar(20) DEFAULT NULL,
  `FTP_PASSWORD` varchar(20) DEFAULT NULL,
  `SYNCHRN_LC` varchar(255) DEFAULT NULL,
  `REFLCT_AT` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`SERVER_ID`),
  UNIQUE KEY `COMTNSYNCHRNSERVERINFO_PK` (`SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnsyslog
CREATE TABLE IF NOT EXISTS `comtnsyslog` (
  `REQUST_ID` varchar(20) NOT NULL,
  `JOB_SE_CODE` char(3) DEFAULT NULL,
  `INSTT_CODE` char(7) DEFAULT NULL,
  `OCCRRNC_DE` char(20) DEFAULT NULL,
  `RQESTER_IP` varchar(23) DEFAULT NULL,
  `RQESTER_ID` varchar(20) DEFAULT NULL,
  `TRGET_MENU_NM` varchar(255) DEFAULT NULL,
  `SVC_NM` varchar(255) DEFAULT NULL,
  `METHOD_NM` varchar(60) DEFAULT NULL,
  `PROCESS_SE_CODE` char(3) DEFAULT NULL,
  `PROCESS_CO` decimal(10,0) DEFAULT NULL,
  `PROCESS_TIME` varchar(14) DEFAULT NULL,
  `RSPNS_CODE` char(3) DEFAULT NULL,
  `ERROR_SE` char(1) DEFAULT NULL,
  `ERROR_CO` decimal(10,0) DEFAULT NULL,
  `ERROR_CODE` char(3) DEFAULT NULL,
  PRIMARY KEY (`REQUST_ID`),
  UNIQUE KEY `COMTNSYSLOG_PK` (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnsystemcntc
CREATE TABLE IF NOT EXISTS `comtnsystemcntc` (
  `CNTC_ID` char(8) NOT NULL DEFAULT '',
  `CNTC_NM` varchar(100) DEFAULT NULL,
  `PROVD_INSTT_ID` char(8) DEFAULT NULL,
  `PROVD_SYS_ID` char(8) DEFAULT NULL,
  `PROVD_SVC_ID` char(8) DEFAULT NULL,
  `REQUST_INSTT_ID` char(8) DEFAULT NULL,
  `REQUST_SYS_ID` char(8) DEFAULT NULL,
  `CONFM_AT` char(1) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `VALID_BGNDE` char(20) DEFAULT NULL,
  `VALID_ENDDE` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `CNTC_TY` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`CNTC_ID`),
  UNIQUE KEY `COMTNSYSTEMCNTC_PK` (`CNTC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtntmplatinfo
CREATE TABLE IF NOT EXISTS `comtntmplatinfo` (
  `TMPLAT_ID` char(20) NOT NULL DEFAULT '',
  `TMPLAT_NM` varchar(255) DEFAULT NULL,
  `TMPLAT_COURS` varchar(2000) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `TMPLAT_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`TMPLAT_ID`),
  UNIQUE KEY `COMTNTMPLATINFO_PK` (`TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtntroblinfo
CREATE TABLE IF NOT EXISTS `comtntroblinfo` (
  `TROBL_ID` char(20) NOT NULL,
  `TROBL_NM` varchar(60) DEFAULT NULL,
  `TROBL_KND` char(2) DEFAULT NULL,
  `TROBL_DC` varchar(2000) DEFAULT NULL,
  `TROBL_OCCRRNC_TIME` varchar(14) DEFAULT NULL,
  `TROBL_RQESTER_NM` varchar(60) DEFAULT NULL,
  `TROBL_REQUST_TIME` varchar(14) DEFAULT NULL,
  `TROBL_PROCESS_RESULT` varchar(2000) DEFAULT NULL,
  `TROBL_OPETR_NM` varchar(60) DEFAULT NULL,
  `TROBL_PROCESS_TIME` varchar(14) DEFAULT NULL,
  `PROCESS_STTUS` char(1) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`TROBL_ID`),
  UNIQUE KEY `COMTNTROBLINFO_PK` (`TROBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtntrsmrcvlog
CREATE TABLE IF NOT EXISTS `comtntrsmrcvlog` (
  `REQUST_ID` varchar(20) NOT NULL,
  `OCCRRNC_DE` char(20) DEFAULT NULL,
  `TRSMRCV_SE_CODE` char(3) DEFAULT NULL,
  `CNTC_ID` char(8) DEFAULT NULL,
  `PROVD_INSTT_ID` char(8) DEFAULT NULL,
  `PROVD_SYS_ID` char(8) DEFAULT NULL,
  `PROVD_SVC_ID` char(8) DEFAULT NULL,
  `REQUST_INSTT_ID` char(8) DEFAULT NULL,
  `REQUST_SYS_ID` char(8) DEFAULT NULL,
  `REQUST_TRNSMIT_TM` varchar(14) DEFAULT NULL,
  `REQUST_RECPTN_TM` varchar(14) DEFAULT NULL,
  `RSPNS_TRNSMIT_TM` varchar(14) DEFAULT NULL,
  `RSPNS_RECPTN_TM` varchar(14) DEFAULT NULL,
  `RESULT_CODE` varchar(4) DEFAULT NULL,
  `RESULT_MSSAGE` varchar(4000) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `RQESTER_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`REQUST_ID`),
  UNIQUE KEY `COMTNTRSMRCVLOG_PK` (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtntrsmrcvmntrng
CREATE TABLE IF NOT EXISTS `comtntrsmrcvmntrng` (
  `CNTC_ID` char(8) NOT NULL,
  `TEST_CLASS_NM` varchar(255) DEFAULT NULL,
  `MNGR_NM` varchar(60) DEFAULT NULL,
  `MNGR_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MNTRNG_STTUS` char(2) DEFAULT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime NOT NULL,
  PRIMARY KEY (`CNTC_ID`),
  UNIQUE KEY `COMTNTRSMRCVMNTRNG_PK` (`CNTC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtntwitter
CREATE TABLE IF NOT EXISTS `comtntwitter` (
  `USER_ID` varchar(20) NOT NULL,
  `CNSMR_KEY` varchar(50) NOT NULL,
  `CNSMR_SECRET` varchar(50) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `COMTNTWITTER_PK` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnunitylink
CREATE TABLE IF NOT EXISTS `comtnunitylink` (
  `UNITY_LINK_ID` char(20) NOT NULL DEFAULT '',
  `UNITY_LINK_GROUP` varchar(255) DEFAULT NULL,
  `UNITY_LINK_NM` varchar(255) DEFAULT NULL,
  `UNITY_LINK_URL` varchar(255) DEFAULT NULL,
  `UNITY_LINK_DC` varchar(2500) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `UNITY_LINK_SE_CODE` char(3) DEFAULT NULL,
  PRIMARY KEY (`UNITY_LINK_ID`),
  UNIQUE KEY `COMTNUNITYLINK_PK` (`UNITY_LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnuserabsnce
CREATE TABLE IF NOT EXISTS `comtnuserabsnce` (
  `EMPLYR_ID` varchar(20) NOT NULL DEFAULT '',
  `USER_ABSNCE_AT` char(1) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`),
  UNIQUE KEY `COMTNUSERABSNCE_PK` (`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnuserlog
CREATE TABLE IF NOT EXISTS `comtnuserlog` (
  `OCCRRNC_DE` char(20) NOT NULL DEFAULT '',
  `RQESTER_ID` varchar(20) NOT NULL DEFAULT '',
  `SVC_NM` varchar(255) NOT NULL DEFAULT '',
  `METHOD_NM` varchar(60) NOT NULL DEFAULT '',
  `CREAT_CO` decimal(10,0) DEFAULT NULL,
  `UPDT_CO` decimal(10,0) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `DELETE_CO` decimal(10,0) DEFAULT NULL,
  `OUTPT_CO` decimal(10,0) DEFAULT NULL,
  `ERROR_CO` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`RQESTER_ID`,`SVC_NM`,`METHOD_NM`),
  UNIQUE KEY `COMTNUSERLOG_PK` (`OCCRRNC_DE`,`RQESTER_ID`,`SVC_NM`,`METHOD_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnvcatnmanage
CREATE TABLE IF NOT EXISTS `comtnvcatnmanage` (
  `APPLCNT_ID` varchar(20) NOT NULL,
  `VCATN_SE` char(2) NOT NULL,
  `BGNDE` char(8) NOT NULL,
  `ENDDE` char(8) NOT NULL,
  `VCATN_RESN` varchar(200) NOT NULL,
  `REQST_DE` char(20) NOT NULL,
  `OCCRRNC_YEAR` char(4) DEFAULT NULL,
  `SANCTNER_ID` varchar(20) DEFAULT NULL,
  `CONFM_AT` char(1) DEFAULT NULL,
  `SANCTN_DT` datetime DEFAULT NULL,
  `RETURN_RESN` varchar(1000) DEFAULT NULL,
  `INFRML_SANCTN_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `NOON_SE` char(1) DEFAULT NULL,
  PRIMARY KEY (`APPLCNT_ID`,`VCATN_SE`,`BGNDE`,`ENDDE`),
  UNIQUE KEY `COMTNVCATNMANAGE_PK` (`APPLCNT_ID`,`VCATN_SE`,`BGNDE`,`ENDDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnweblog
CREATE TABLE IF NOT EXISTS `comtnweblog` (
  `REQUST_ID` varchar(20) NOT NULL,
  `OCCRRNC_DE` char(20) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `RQESTER_ID` varchar(20) DEFAULT NULL,
  `RQESTER_IP` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`REQUST_ID`),
  UNIQUE KEY `COMTNWEBLOG_PK` (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnwikibkmk
CREATE TABLE IF NOT EXISTS `comtnwikibkmk` (
  `WIKI_BKMK_ID` char(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `WIKI_BKMK_NM` varchar(1000) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`WIKI_BKMK_ID`,`USER_ID`),
  UNIQUE KEY `COMTNWIKIBKMK_PK` (`WIKI_BKMK_ID`,`USER_ID`),
  KEY `COMTNWIKIBKMK_FK1` (`USER_ID`),
  CONSTRAINT `comtnwikibkmk_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `comtntwitter` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnwikmnthngreprt
CREATE TABLE IF NOT EXISTS `comtnwikmnthngreprt` (
  `REPRT_ID` char(6) NOT NULL,
  `REPRT_SE` char(1) NOT NULL,
  `REPRT_SJ` varchar(255) NOT NULL,
  `REPORT_DE` char(20) NOT NULL,
  `WRTER_ID` varchar(20) NOT NULL,
  `REPORTR_ID` varchar(20) NOT NULL,
  `REPORT_BGNDE` char(20) NOT NULL,
  `REPORT_ENDDE` char(20) NOT NULL,
  `THSWIK_REPORT_CN` mediumtext NOT NULL,
  `NEXTWIK_REPORT_CN` mediumtext NOT NULL,
  `PARTCLR_MATTER` varchar(2500) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `CONFM_DT` varchar(14) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`REPRT_ID`),
  UNIQUE KEY `COMTNWIKMNTHNGREPRT_PK` (`REPRT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtnworddicaryinfo
CREATE TABLE IF NOT EXISTS `comtnworddicaryinfo` (
  `WORD_ID` char(20) NOT NULL,
  `WORD_NM` varchar(255) DEFAULT NULL,
  `ENG_NM` varchar(60) DEFAULT NULL,
  `WORD_DC` varchar(4000) DEFAULT NULL,
  `SYNONM` varchar(100) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`WORD_ID`),
  UNIQUE KEY `COMTNWORDDICARYINFO_PK` (`WORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtrdnmadrzip
CREATE TABLE IF NOT EXISTS `comtrdnmadrzip` (
  `RDMN_CODE` varchar(12) NOT NULL,
  `SN` decimal(10,0) NOT NULL,
  `CTPRVN_NM` varchar(20) DEFAULT NULL,
  `SIGNGU_NM` varchar(20) DEFAULT NULL,
  `RDMN` varchar(60) DEFAULT NULL,
  `BDNBR_MNNM` varchar(5) DEFAULT NULL,
  `BDNBR_SLNO` varchar(5) DEFAULT NULL,
  `BULD_NM` varchar(60) DEFAULT NULL,
  `DETAIL_BULD_NM` varchar(60) DEFAULT NULL,
  `ZIP` varchar(6) NOT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SN`),
  UNIQUE KEY `COMTRDNMADRZIP_PK` (`RDMN_CODE`,`SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtsbbssummary
CREATE TABLE IF NOT EXISTS `comtsbbssummary` (
  `OCCRRNC_DE` char(20) NOT NULL DEFAULT '',
  `STATS_SE` varchar(10) NOT NULL DEFAULT '',
  `DETAIL_STATS_SE` varchar(10) NOT NULL DEFAULT '',
  `CREAT_CO` decimal(10,0) DEFAULT NULL,
  `TOT_RDCNT` decimal(10,0) DEFAULT NULL,
  `AVRG_RDCNT` decimal(10,0) DEFAULT NULL,
  `TOP_INQIRE_BBSCTT_ID` varchar(20) DEFAULT NULL,
  `MUMM_INQIRE_BBSCTT_ID` varchar(20) DEFAULT NULL,
  `TOP_NTCR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`STATS_SE`,`DETAIL_STATS_SE`),
  UNIQUE KEY `COMTSBBSSUMMARY_PK` (`OCCRRNC_DE`,`STATS_SE`,`DETAIL_STATS_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtssyslogsummary
CREATE TABLE IF NOT EXISTS `comtssyslogsummary` (
  `OCCRRNC_DE` char(20) NOT NULL,
  `SVC_NM` varchar(255) NOT NULL,
  `METHOD_NM` varchar(60) NOT NULL,
  `CREAT_CO` decimal(10,0) DEFAULT NULL,
  `UPDT_CO` decimal(10,0) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `DELETE_CO` decimal(10,0) DEFAULT NULL,
  `OUTPT_CO` decimal(10,0) DEFAULT NULL,
  `ERROR_CO` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`SVC_NM`,`METHOD_NM`),
  UNIQUE KEY `COMTSSYSLOGSUMMARY_PK` (`OCCRRNC_DE`,`SVC_NM`,`METHOD_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtstrsmrcvlogsummary
CREATE TABLE IF NOT EXISTS `comtstrsmrcvlogsummary` (
  `OCCRRNC_DE` char(20) NOT NULL DEFAULT '',
  `TRSMRCV_SE_CODE` char(3) NOT NULL DEFAULT '',
  `PROVD_INSTT_ID` char(8) NOT NULL DEFAULT '',
  `PROVD_SYS_ID` char(8) NOT NULL DEFAULT '',
  `PROVD_SVC_ID` char(8) NOT NULL DEFAULT '',
  `REQUST_INSTT_ID` char(8) NOT NULL DEFAULT '',
  `REQUST_SYS_ID` char(8) NOT NULL DEFAULT '',
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `ERROR_CO` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`TRSMRCV_SE_CODE`,`PROVD_INSTT_ID`,`PROVD_SYS_ID`,`PROVD_SVC_ID`,`REQUST_INSTT_ID`,`REQUST_SYS_ID`),
  UNIQUE KEY `COMTSTRSMRCVLOGSUMMARY_PK` (`OCCRRNC_DE`,`TRSMRCV_SE_CODE`,`PROVD_INSTT_ID`,`PROVD_SYS_ID`,`PROVD_SVC_ID`,`REQUST_INSTT_ID`,`REQUST_SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtsusersummary
CREATE TABLE IF NOT EXISTS `comtsusersummary` (
  `OCCRRNC_DE` char(20) NOT NULL DEFAULT '',
  `STATS_SE` varchar(10) NOT NULL DEFAULT '',
  `DETAIL_STATS_SE` varchar(10) NOT NULL DEFAULT '',
  `USER_CO` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`STATS_SE`,`DETAIL_STATS_SE`),
  UNIQUE KEY `COMTSUSERSUMMARY_PK` (`OCCRRNC_DE`,`STATS_SE`,`DETAIL_STATS_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. comtsweblogsummary
CREATE TABLE IF NOT EXISTS `comtsweblogsummary` (
  `OCCRRNC_DE` char(20) NOT NULL DEFAULT '',
  `URL` varchar(100) NOT NULL DEFAULT '',
  `RDCNT` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OCCRRNC_DE`,`URL`),
  UNIQUE KEY `COMTSWEBLOGSUMMARY_PK` (`OCCRRNC_DE`,`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 뷰 tadpole의 구조를 덤프합니다. comvnusermaster
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `comvnusermaster` (
	`ESNTL_ID` CHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`USER_ID` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`PASSWORD` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`USER_NM` VARCHAR(60) NOT NULL COLLATE 'utf8_general_ci',
	`USER_ZIP` VARCHAR(6) NOT NULL COLLATE 'utf8_general_ci',
	`USER_ADRES` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`USER_EMAIL` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`GROUP_ID` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`USER_SE` VARCHAR(3) NOT NULL COLLATE 'utf8_general_ci',
	`ORGNZT_ID` VARCHAR(20) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 테이블 tadpole의 구조를 덤프합니다. consumableinventory
CREATE TABLE IF NOT EXISTS `consumableinventory` (
  `nttNo` int(11) NOT NULL AUTO_INCREMENT,
  `bbsId` char(50) DEFAULT NULL,
  `codeId` char(50) DEFAULT NULL,
  `useCn` char(50) DEFAULT NULL,
  `inventory` char(50) DEFAULT NULL,
  `takeOut` char(50) DEFAULT NULL,
  `ntceBgnde` char(50) DEFAULT NULL,
  `receiveName` char(50) DEFAULT NULL,
  `note` char(100) DEFAULT NULL,
  `useAt` char(50) DEFAULT NULL,
  `schdulDeptId` char(50) DEFAULT NULL,
  `frstRegisterId` char(50) DEFAULT NULL,
  `frstRegisterPnttm` char(50) DEFAULT NULL,
  `lastUpdusrId` char(50) DEFAULT NULL,
  `lastUpdusrPnttm` char(50) DEFAULT NULL,
  PRIMARY KEY (`nttNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. consumableuse
CREATE TABLE IF NOT EXISTS `consumableuse` (
  `nttNo` int(11) NOT NULL AUTO_INCREMENT,
  `bbsId` char(50) DEFAULT NULL,
  `codeId` char(50) DEFAULT NULL,
  `facility` char(50) DEFAULT NULL,
  `mode` char(50) DEFAULT NULL,
  `pm` char(50) DEFAULT NULL,
  `consumable` char(50) DEFAULT NULL,
  `useCn` char(50) DEFAULT NULL,
  `consumable_1` char(50) DEFAULT NULL,
  `useCn_1` char(50) DEFAULT NULL,
  `consumable_2` char(50) DEFAULT NULL,
  `useCn_2` char(50) DEFAULT NULL,
  `consumable_3` char(50) DEFAULT NULL,
  `useCn_3` char(50) DEFAULT NULL,
  `consumable_4` char(50) DEFAULT NULL,
  `useCn_4` char(50) DEFAULT NULL,
  `consumable_5` char(50) DEFAULT NULL,
  `useCn_5` char(50) DEFAULT NULL,
  `ntceBgnde` char(50) DEFAULT NULL,
  `schdulDeptId` char(50) DEFAULT NULL,
  `useAt` char(50) DEFAULT NULL,
  `frstRegisterId` char(50) DEFAULT NULL,
  `frstRegisterPnttm` char(50) DEFAULT NULL,
  `lastUpdusrId` char(50) DEFAULT NULL,
  `lastUpdusrPnttm` char(50) DEFAULT NULL,
  PRIMARY KEY (`nttNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. cons_cleanroller_inventory
CREATE TABLE IF NOT EXISTS `cons_cleanroller_inventory` (
  `nttNo` int(11) NOT NULL AUTO_INCREMENT,
  `bbsId` char(50) DEFAULT NULL,
  `codeId` char(50) DEFAULT NULL,
  `takeOut` char(50) DEFAULT NULL,
  `useAt` char(50) DEFAULT NULL,
  `frstRegisterId` char(50) DEFAULT NULL,
  `frstRegisterPnttm` char(50) DEFAULT NULL,
  `lastUpdusrId` char(50) DEFAULT NULL,
  `lastUpdusrPnttm` char(50) DEFAULT NULL,
  PRIMARY KEY (`nttNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. floorplan
CREATE TABLE IF NOT EXISTS `floorplan` (
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `NTT_NO` decimal(20,0) DEFAULT NULL,
  `MODEL` varchar(100) DEFAULT NULL,
  `NTT_SJ` varchar(2000) DEFAULT NULL,
  `NTT_CN` mediumtext,
  `ANSWER_AT` char(1) DEFAULT NULL,
  `PARNTSCTT_NO` decimal(10,0) DEFAULT NULL,
  `ANSWER_LC` decimal(8,0) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `NTCE_BGNDE` char(20) DEFAULT NULL,
  `NTCE_ENDDE` char(20) DEFAULT NULL,
  `NTCR_ID` varchar(20) DEFAULT NULL,
  `NTCR_NM` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `DIVISION` varchar(100) DEFAULT NULL,
  `REV` varchar(50) DEFAULT NULL,
  `NAME_01` varchar(100) DEFAULT NULL,
  `NAME_02` varchar(100) DEFAULT NULL,
  `SPEC` varchar(100) DEFAULT NULL,
  `SPEC_01` varchar(50) DEFAULT NULL,
  `SPEC_02` varchar(50) DEFAULT NULL,
  `SPEC_03` varchar(50) DEFAULT NULL,
  `SPEC_04` varchar(50) DEFAULT NULL,
  `SIZE` varchar(50) DEFAULT NULL,
  `LOCATION` varchar(200) DEFAULT NULL,
  `NUMBER` varchar(50) DEFAULT NULL,
  `CHANGEDATE` char(50) DEFAULT NULL,
  `NOTE` char(50) DEFAULT NULL,
  `OFFSET` char(50) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NTT_ID`,`BBS_ID`),
  UNIQUE KEY `DIFLOORPLAN_PK` (`NTT_ID`,`BBS_ID`),
  KEY `DIFLOORPLAN_i01` (`BBS_ID`),
  CONSTRAINT `DIFLOORPLAN_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `floorplanmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. floorplanmaster
CREATE TABLE IF NOT EXISTS `floorplanmaster` (
  `BBS_ID` char(20) NOT NULL,
  `BBS_NM` varchar(255) NOT NULL,
  `BBS_INTRCN` varchar(2400) DEFAULT NULL,
  `BBS_TY_CODE` char(8) NOT NULL,
  `BBS_ATTRB_CODE` char(8) NOT NULL,
  `REPLY_POSBL_AT` char(1) DEFAULT NULL,
  `FILE_ATCH_POSBL_AT` char(1) NOT NULL,
  `ATCH_POSBL_FILE_NUMBER` decimal(2,0) NOT NULL,
  `ATCH_POSBL_FILE_SIZE` decimal(8,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `TMPLAT_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`),
  UNIQUE KEY `DIFLOORPLANMASTER_PK` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. floorplanmasteroptn
CREATE TABLE IF NOT EXISTS `floorplanmasteroptn` (
  `BBS_ID` char(20) NOT NULL,
  `ANSWER_AT` char(1) NOT NULL,
  `STSFDG_AT` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`),
  UNIQUE KEY `FLOORPLANMASTEROPTN_PK` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. floorplanuse
CREATE TABLE IF NOT EXISTS `floorplanuse` (
  `BBS_ID` char(20) NOT NULL,
  `TRGET_ID` char(20) NOT NULL DEFAULT '',
  `USE_AT` char(1) NOT NULL,
  `REGIST_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`,`TRGET_ID`),
  UNIQUE KEY `DIFLOORPLANUSE_PK` (`BBS_ID`,`TRGET_ID`),
  KEY `DIFLOORPLANUSE_i01` (`BBS_ID`),
  CONSTRAINT `DIFLOORPLANUSE_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `floorplanmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. ids
CREATE TABLE IF NOT EXISTS `ids` (
  `IDGEN_TABLE_NM` varchar(20) NOT NULL,
  `IDGEN_NEXT_ID` decimal(30,0) NOT NULL,
  PRIMARY KEY (`IDGEN_TABLE_NM`),
  UNIQUE KEY `IDS_PK` (`IDGEN_TABLE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. imgtemp
CREATE TABLE IF NOT EXISTS `imgtemp` (
  `ORGNZT_CODE` varchar(10) NOT NULL,
  `ERNCSL_SE` varchar(2) NOT NULL,
  `IMAGE_INFO` blob NOT NULL,
  `IMAGE_TY` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ORGNZT_CODE`,`ERNCSL_SE`),
  UNIQUE KEY `IMGTEMP_PK` (`ORGNZT_CODE`,`ERNCSL_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. j_attachfile
CREATE TABLE IF NOT EXISTS `j_attachfile` (
  `FILE_ID` varchar(13) NOT NULL,
  `FILE_SEQ` int(11) NOT NULL,
  `FILE_NAME` varchar(100) NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `FILE_MASK` varchar(100) DEFAULT NULL,
  `DOWNLOAD_COUNT` int(11) DEFAULT NULL,
  `DOWNLOAD_EXPIRE_DATE` varchar(8) DEFAULT NULL,
  `DOWNLOAD_LIMIT_COUNT` int(11) DEFAULT NULL,
  `REG_DATE` datetime DEFAULT NULL,
  `DELETE_YN` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`,`FILE_SEQ`),
  UNIQUE KEY `J_ATTACHFILE_PK` (`FILE_ID`,`FILE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. mtbbs
CREATE TABLE IF NOT EXISTS `mtbbs` (
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `NTT_NO` decimal(20,0) DEFAULT NULL,
  `NTT_SJ` varchar(2000) DEFAULT NULL,
  `NTT_CN` mediumtext,
  `ANSWER_AT` char(1) DEFAULT NULL,
  `PARNTSCTT_NO` decimal(10,0) DEFAULT NULL,
  `ANSWER_LC` decimal(8,0) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `NTCE_BGNDE` char(20) DEFAULT NULL,
  `NTCE_ENDDE` char(20) DEFAULT NULL,
  `NTCR_ID` varchar(20) DEFAULT NULL,
  `NTCR_NM` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `ORGNZT_ID` varchar(20) DEFAULT NULL,
  `KIND` varchar(100) DEFAULT NULL,
  `MODEL` varchar(100) DEFAULT NULL,
  `REV` varchar(50) DEFAULT NULL,
  `NAME_01` varchar(100) DEFAULT NULL,
  `NAME_02` varchar(100) DEFAULT NULL,
  `SPEC_01` varchar(50) DEFAULT NULL,
  `SPEC_02` varchar(50) DEFAULT NULL,
  `SPEC_03` varchar(50) DEFAULT NULL,
  `SIZE` varchar(50) DEFAULT NULL,
  `LOCATION` varchar(200) DEFAULT NULL,
  `NUMBER` varchar(50) DEFAULT NULL,
  `CHANGEDATE` char(50) DEFAULT NULL,
  `NEXTDATE` char(50) DEFAULT NULL,
  PRIMARY KEY (`NTT_ID`,`BBS_ID`),
  UNIQUE KEY `MTBBS_PK` (`NTT_ID`,`BBS_ID`),
  KEY `MTBBS_i01` (`BBS_ID`),
  CONSTRAINT `mtbbs_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `mtbbsmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. mtbbsmaster
CREATE TABLE IF NOT EXISTS `mtbbsmaster` (
  `BBS_ID` char(20) NOT NULL,
  `BBS_NM` varchar(255) NOT NULL,
  `BBS_INTRCN` varchar(2400) DEFAULT NULL,
  `BBS_TY_CODE` char(8) NOT NULL,
  `BBS_ATTRB_CODE` char(8) NOT NULL,
  `REPLY_POSBL_AT` char(1) DEFAULT NULL,
  `FILE_ATCH_POSBL_AT` char(1) NOT NULL,
  `ATCH_POSBL_FILE_NUMBER` decimal(2,0) NOT NULL,
  `ATCH_POSBL_FILE_SIZE` decimal(8,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `TMPLAT_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`),
  UNIQUE KEY `MTBBSMASTER_PK` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. mtbbsuse
CREATE TABLE IF NOT EXISTS `mtbbsuse` (
  `BBS_ID` char(20) NOT NULL,
  `TRGET_ID` char(20) NOT NULL DEFAULT '',
  `USE_AT` char(1) NOT NULL,
  `REGIST_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`,`TRGET_ID`),
  UNIQUE KEY `MTBBSUSE_PK` (`BBS_ID`,`TRGET_ID`),
  KEY `MTBBSUSE_i01` (`BBS_ID`),
  CONSTRAINT `mtbbsuse_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `mtbbsmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. mtbmasteroptn
CREATE TABLE IF NOT EXISTS `mtbmasteroptn` (
  `BBS_ID` char(20) NOT NULL,
  `ANSWER_AT` char(1) NOT NULL,
  `STSFDG_AT` char(1) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`),
  UNIQUE KEY `MTBMASTEROPTN_PK` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. salarydata
CREATE TABLE IF NOT EXISTS `salarydata` (
  `ESNTL_ID` varchar(20) NOT NULL,
  `EMPLYR_ID` char(20) DEFAULT NULL,
  `USER_NM` varchar(60) DEFAULT NULL,
  `TIME_SALARY` char(50) DEFAULT NULL,
  `JOB_TIME` char(50) DEFAULT NULL,
  `FULL_WORKING_PENSION` char(50) DEFAULT NULL,
  `PRO_PENSION` char(50) DEFAULT NULL,
  `HOLIDAY_PENSION` char(50) DEFAULT NULL,
  `HOLIDAY_AFTER_PENSION` char(50) DEFAULT NULL,
  `FAMILY_PENSION` char(50) DEFAULT NULL,
  `LONGEVITY_PENSION` char(50) DEFAULT NULL,
  `NIGHT_PENSION` char(50) DEFAULT NULL,
  `TEXES` char(50) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`ESNTL_ID`),
  UNIQUE KEY `SALARYDATA_PK` (`ESNTL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. salarymoney
CREATE TABLE IF NOT EXISTS `salarymoney` (
  `SCHDUL_ID` char(20) NOT NULL,
  `SCHDUL_SE` char(1) DEFAULT NULL,
  `SCHDUL_PRO` char(10) DEFAULT NULL,
  `SCHDUL_LATE` char(10) DEFAULT NULL,
  `SCHDUL_BGNDE` char(20) DEFAULT NULL,
  `SCHDUL_ENDDE` char(20) DEFAULT NULL,
  `SCHDUL_PROTIME` char(20) DEFAULT NULL,
  `SCHDUL_LATETIME` char(20) DEFAULT NULL,
  `SCHDUL_NIGHTTIME` char(20) DEFAULT NULL,
  `SCHDUL_CHARGER_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`),
  UNIQUE KEY `SALARYMONEY_PK` (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. sudoku_grid
CREATE TABLE IF NOT EXISTS `sudoku_grid` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `grid` char(81) NOT NULL,
  `inquiry` int(11) NOT NULL DEFAULT '0',
  `correct` int(11) NOT NULL DEFAULT '0',
  `incorrect` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. sudoku_score
CREATE TABLE IF NOT EXISTS `sudoku_score` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `grid_seq` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `cost` time NOT NULL,
  PRIMARY KEY (`seq`),
  KEY `grid_seq` (`grid_seq`),
  CONSTRAINT `sudoku_score_ibfk_1` FOREIGN KEY (`grid_seq`) REFERENCES `sudoku_grid` (`seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 tadpole의 구조를 덤프합니다. yearlyschdulinfo
CREATE TABLE IF NOT EXISTS `yearlyschdulinfo` (
  `SCHDUL_ID` char(20) NOT NULL,
  `SCHDUL_SE` char(1) DEFAULT NULL,
  `SCHDUL_KND_CODE` char(1) DEFAULT NULL,
  `SCHDUL_BGNDE` char(20) DEFAULT NULL,
  `SCHDUL_ENDDE` char(20) DEFAULT NULL,
  `SCHDUL_NM` varchar(255) DEFAULT NULL,
  `SCHDUL_CN` varchar(2500) DEFAULT NULL,
  `SCHDUL_CHARGER_ID` varchar(20) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`),
  UNIQUE KEY `YEARLYSCHDULINFO_PK` (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 뷰 tadpole의 구조를 덤프합니다. comvnusermaster
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `comvnusermaster`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `comvnusermaster` AS SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNGNRLMBER
		
	UNION ALL
		SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
		FROM COMTNEMPLYRINFO
	UNION ALL
		SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNENTRPRSMBER 
ORDER BY ESNTL_ID ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
