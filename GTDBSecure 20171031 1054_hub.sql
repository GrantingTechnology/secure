-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.22-enterprise-commercial-advanced-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema secure1
--

CREATE DATABASE IF NOT EXISTS secure1;
USE secure1;

--
-- Definition of table `application_name`
--

DROP TABLE IF EXISTS `application_name`;
CREATE TABLE `application_name` (
  `idapplicationname` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idapplicationname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application_name`
--

/*!40000 ALTER TABLE `application_name` DISABLE KEYS */;
INSERT INTO `application_name` (`idapplicationname`,`name`) VALUES 
 (2,'Community_Collaborator'),
 (3,'Community_Release');
/*!40000 ALTER TABLE `application_name` ENABLE KEYS */;


--
-- Definition of table `domain`
--

DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `iddomain` int(10) unsigned NOT NULL,
  `name` varchar(300) NOT NULL,
  `url` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`iddomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `domain`
--

/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;


--
-- Definition of table `key_temp`
--

DROP TABLE IF EXISTS `key_temp`;
CREATE TABLE `key_temp` (
  `idlogin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `datecreate` datetime NOT NULL,
  PRIMARY KEY (`idlogin`),
  CONSTRAINT `FK_key_temp_vs_login` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `key_temp`
--

/*!40000 ALTER TABLE `key_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_temp` ENABLE KEYS */;


--
-- Definition of table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `idlanguage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `culture` char(2) NOT NULL,
  PRIMARY KEY (`idlanguage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`idlanguage`,`culture`) VALUES 
 (1,'pt');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;


--
-- Definition of table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `idlogin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `context` varchar(500) NOT NULL,
  `datelog` datetime NOT NULL,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `idlogin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(25) NOT NULL,
  `datecreate` datetime NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `login_phrase`
--

DROP TABLE IF EXISTS `login_phrase`;
CREATE TABLE `login_phrase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `context` varchar(185) NOT NULL,
  `idlanguage` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_login_phrase_vs_language` (`idlanguage`),
  CONSTRAINT `FK_login_phrase_vs_language` FOREIGN KEY (`idlanguage`) REFERENCES `language` (`idlanguage`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_phrase`
--

/*!40000 ALTER TABLE `login_phrase` DISABLE KEYS */;
INSERT INTO `login_phrase` (`id`,`context`,`idlanguage`) VALUES 
 (1,'Concedendo Tecnologia!',1),
 (2,'O mundo em segundos...!!',1),
 (3,'Facilitando o aprendizado!',1);
/*!40000 ALTER TABLE `login_phrase` ENABLE KEYS */;


--
-- Definition of table `mail_message`
--

DROP TABLE IF EXISTS `mail_message`;
CREATE TABLE `mail_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `to` varchar(45) NOT NULL,
  `from` varchar(45) NOT NULL,
  `co` varchar(45) DEFAULT NULL,
  `cc` varchar(45) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `ticket` varchar(10) NOT NULL,
  `datefail` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_message`
--

/*!40000 ALTER TABLE `mail_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_message` ENABLE KEYS */;


--
-- Definition of table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `idpermission` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) NOT NULL,
  `status` int(1) unsigned NOT NULL,
  PRIMARY KEY (`idpermission`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`idpermission`,`nickname`,`status`) VALUES 
 (1,'Administrator',1),
 (2,'basic',1),
 (3,'secretary',1);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


--
-- Definition of table `rel_domain_user`
--

DROP TABLE IF EXISTS `rel_domain_user`;
CREATE TABLE `rel_domain_user` (
  `idreldomainuser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iddomain` int(10) unsigned NOT NULL,
  `iduser` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idreldomainuser`) USING BTREE,
  KEY `FK_rel_domain_user_vs_user` (`iduser`),
  KEY `FK_rel_domain_user_vs_domain` (`iddomain`),
  CONSTRAINT `FK_rel_domain_user_vs_domain` FOREIGN KEY (`iddomain`) REFERENCES `domain` (`iddomain`),
  CONSTRAINT `FK_rel_domain_user_vs_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rel_domain_user`
--

/*!40000 ALTER TABLE `rel_domain_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_domain_user` ENABLE KEYS */;


--
-- Definition of table `rel_login_history`
--

DROP TABLE IF EXISTS `rel_login_history`;
CREATE TABLE `rel_login_history` (
  `idhistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idlogin` int(10) unsigned NOT NULL,
  `iduser` int(10) unsigned NOT NULL,
  `datemodify` datetime NOT NULL,
  PRIMARY KEY (`idhistory`),
  KEY `FK_rel_login_history_vs_user` (`iduser`),
  CONSTRAINT `FK_rel_login_history_vs_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rel_login_history`
--

/*!40000 ALTER TABLE `rel_login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_login_history` ENABLE KEYS */;


--
-- Definition of table `rel_login_recovery`
--

DROP TABLE IF EXISTS `rel_login_recovery`;
CREATE TABLE `rel_login_recovery` (
  `idloginrecovery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket` varchar(45) NOT NULL,
  `iduser` int(10) unsigned NOT NULL,
  `datesolicitation` datetime NOT NULL,
  PRIMARY KEY (`idloginrecovery`) USING BTREE,
  KEY `FK_rel_mail_recovery_vs_user` (`iduser`),
  CONSTRAINT `FK_rel_mail_recovery_vs_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rel_login_recovery`
--

/*!40000 ALTER TABLE `rel_login_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_login_recovery` ENABLE KEYS */;


--
-- Definition of table `rel_permission_user`
--

DROP TABLE IF EXISTS `rel_permission_user`;
CREATE TABLE `rel_permission_user` (
  `idreluserpermission` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpermission` int(10) unsigned NOT NULL,
  `iduser` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idreluserpermission`),
  KEY `FK_rel_permission_user_vs_user` (`iduser`),
  KEY `FK_rel_permission_user_vs_permission` (`idpermission`),
  CONSTRAINT `FK_rel_permission_user_vs_permission` FOREIGN KEY (`idpermission`) REFERENCES `permission` (`idpermission`),
  CONSTRAINT `FK_rel_permission_user_vs_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rel_permission_user`
--

/*!40000 ALTER TABLE `rel_permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_permission_user` ENABLE KEYS */;


--
-- Definition of table `rel_user_login`
--

DROP TABLE IF EXISTS `rel_user_login`;
CREATE TABLE `rel_user_login` (
  `iduser` int(10) unsigned NOT NULL,
  `idlogin` int(10) unsigned DEFAULT NULL,
  `ticket` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`) USING BTREE,
  KEY `FK_rel_user_login_vs_login` (`idlogin`),
  CONSTRAINT `FK_rel_user_login_vs_login` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`),
  CONSTRAINT `FK_rel_user_login_vs_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rel_user_login`
--

/*!40000 ALTER TABLE `rel_user_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_user_login` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `iduser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`iduser`,`mail`) USING BTREE,
  UNIQUE KEY `iduser_UNIQUE` (`iduser`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of trigger `trg_insert_user_ticket`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_insert_user_ticket`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_insert_user_ticket` AFTER INSERT ON `user` FOR EACH ROW BEGIN

call proc_adm_user_ticket(NEW.iduser);

END $$

DELIMITER ;

--
-- Definition of function `fun_new_ticket`
--

DROP FUNCTION IF EXISTS `fun_new_ticket`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_new_ticket`() RETURNS varchar(10) CHARSET utf8
BEGIN



DECLARE code VARCHAR(10)  ;
SET code = (select concat('GT',left(upper( convert( md5( rand() ) using utf8 )),8)));

RETURN code;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_access_login`
--

DROP PROCEDURE IF EXISTS `proc_adm_access_login`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_access_login`(
in ilogin varchar(45),
in ipassword varchar(45),
in iip varchar(45)
)
BEGIN


declare iiduser int;
declare oireturn int;


BEGIN
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION set oireturn = @@error_count;


                set iiduser = (select c.iduser from rel_user_login b
                inner join user c on(c.iduser = b.iduser)
                inner join login a on(a.idlogin = b.idlogin)
                where a.password = ipassword
                and c.mail = ilogin
                and a.status = 1
                limit 1);

                if iiduser > 0 then

                 



                     SELECT
                     
                        a.iduser,
                        a.mail as login,
                        a.name,
                        b.ticket,
                        CONCAT(e.idpermission, '|', e.nickname,'|', IFNULL(g.name,'...') ,'|', g.iddomain) as permission_nick


                     FROM secure1.user a
                     INNER JOIN secure1.rel_user_login b on(b.iduser = a.iduser)
                     INNER JOIN secure1.login c on(c.idlogin = b.idlogin)
                     INNER JOIN secure1.rel_permission_user d on(d.iduser = a.iduser)
                     INNER JOIN secure1.permission e on(e.idpermission = d.idpermission)
                     INNER JOIN secure1.rel_domain_user f on(f.iduser = a.iduser)
                     INNER JOIN secure1.domain g on(g.iddomain = f.iddomain)
                     WHERE a.iduser = iiduser ;


                End if;


          insert into secure1.log ( context, datelog )
                values (
                        CONCAT('login: ', ilogin, ' senha:', ipassword, ' ip:', iip ),
                        now()
                        );
                        

                        SET oireturn = -1;

END;


END;










END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_confirm_mail_send`
--

DROP PROCEDURE IF EXISTS `proc_adm_confirm_mail_send`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_confirm_mail_send`(
in iemail varchar(255))
BEGIN


      if exists (select 1 from secure1.mail_message where `to` = iemail) then

              delete from secure1.mail_message where `to` = iemail;
              select '0';

      End if;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_del_user`
--

DROP PROCEDURE IF EXISTS `proc_adm_del_user`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_del_user`( in iiduser int, out oiretorno int)
BEGIN

   declare iidlogin int;

  START TRANSACTION;


        BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION set oiretorno = @@error_count;



        delete from secure1.rel_permission_user where iduser = iiduser;
        delete from secure1.rel_user_login where iduser = iiduser;

        set iidlogin = (select idlogin from rel_user_login where iduser =  iiduser );

        delete from secure1.login where idlogin = iidlogin;
        delete from secure1.user where iduser = iiduser;


        END;  



 IF ( oiretorno <> 0 )   then
                ROLLBACK;
 ELSE
                COMMIT;
 END IF;



END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_ins_mail_send`
--

DROP PROCEDURE IF EXISTS `proc_adm_ins_mail_send`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_ins_mail_send`(
in ibody text,
in ito varchar(255),
in ifrom varchar(255),
in ico varchar(255),
in icc varchar(255),
in isubject varchar(300),
in iticket varchar(20)
)
BEGIN


DECLARE ioretorno int;
 SET ioretorno = -1;

BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION set ioretorno = @@error_count;



if not exists( select 1 from mail_message where ticket = iticket ) then
if exists( select 1 from rel_user_login where ticket = iticket ) then

insert into secure1.mail_message (
        body,
        `to`,
        `from`,
        co,
        cc,
        `subject`,
        ticket,
        datefail )

values (

ibody,
ito,
ifrom,
ico,
icc,
isubject,
iticket,
now()


        );

SET ioretorno = 0;

End if;
End if;


End;


select ioretorno;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_login_status`
--

DROP PROCEDURE IF EXISTS `proc_adm_login_status`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_login_status`(
in iidlogin int,
in istatus int)
BEGIN


    update login set status = istatus, datecreate = now() where idlogin = iidlogin;


    select
        idlogin,
        '#' as password,
        datecreate,
        status
    from login where idlogin = iidlogin;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_recovery_login`
--

DROP PROCEDURE IF EXISTS `proc_adm_recovery_login`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_recovery_login`(
in ilogin varchar(45)
)
BEGIN
declare idrel int;
declare idrecovery int;
declare vticket varchar(45);

     set idrel = (select iduser from `user` where mail = ilogin limit 1);

      if idrel > 0 then

      SET vticket = CONCAT('R', fun_new_ticket());

         if exists(select 1 from rel_login_recovery where iduser =  idrel) then

             delete from rel_login_recovery where iduser = idrel;

         End if;

                 insert into rel_login_recovery (ticket,iduser,datesolicitation)
                 values (vticket,idrel,now()); 

         select
                 a.iduser,
                 a.mail,
                 a.name,
                 b.idloginrecovery,
                 b.ticket
         from `user` a
         inner join rel_login_recovery b on(b.iduser = a.iduser)
         where a.iduser = idrel
         order by b.idloginrecovery desc;

      End if;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_redir_domain`
--

DROP PROCEDURE IF EXISTS `proc_adm_redir_domain`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_redir_domain`(
in iduser int,
in iticket varchar(45)
)
BEGIN

        IF EXISTS(select 1 from rel_user_login) THEN

                 select * from rel_user_login;

        END IF;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_user_disable`
--

DROP PROCEDURE IF EXISTS `proc_adm_user_disable`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_user_disable`(in iiduser int, out oiretorn int)
BEGIN
set oiretorn = -1;
               START TRANSACTION;


BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION set oiretorn = @@error_count;

               update secure1.user set status = 0 where iduser = iiduser;

               update secure1.login set status = 0 where idlogin in(
               select idlogin from secure1.rel_user_login where iduser = iiduser
               );

               delete from secure1.rel_user_login where iduser = iiduser;
               set oiretorn = 0;


END;

 IF ( oiretorn <> 0 )   then
               ROLLBACK;
 ELSE
               COMMIT;
 END IF;



END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_user_domain`
--

DROP PROCEDURE IF EXISTS `proc_adm_user_domain`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_user_domain`(in iiddomain int)
BEGIN


 if ( iiddomain = 0 ) then

 select
   a.iddomain,
   a.name as domain,
   a.url
 from domain a
 inner join rel_domain_user b on(b.iddomain = a.iddomain)
 group by
   a.iddomain,
   a.name,
   a.url,
   b.iddomain
 ;

 else

   select
   a.iddomain,
   a.name as domain,
   a.url
 from domain a
 inner join rel_domain_user b on(b.iddomain = a.iddomain)
 where a.iddomain = iiddomain
 group by
   a.iddomain,
   a.name,
   a.url,
   b.iddomain
 ;



 End if;

  

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_user_painel`
--

DROP PROCEDURE IF EXISTS `proc_adm_user_painel`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_user_painel`()
BEGIN

select
        a.iduser,
        a.idlogin,
        b.name,
        b.mail,
        c.datecreate,
        b.status as user_status,
        d.datemodify,
        e.datesolicitation as login_recovery,
        g.name as domain,
        c.status as login_status  ,         
        CONCAT(i.idpermission, '|', i.nickname ) as permission_nick

from secure1.rel_user_login a
inner join secure1.user b on(b.iduser = a.iduser)
inner join secure1.login c on(c.idlogin = a.idlogin)
left join secure1.rel_login_history d on(d.idlogin = a.idlogin)
left join secure1.rel_login_recovery e on(e.iduser = a.iduser)
left join secure1.rel_domain_user f on(f.iduser = a.iduser)
left join secure1.domain g on(g.iddomain = f.iddomain)
left join secure1.rel_permission_user h on(h.iduser = b.iduser)
left join secure1.permission i on(i.idpermission = h.idpermission) ;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_user_status`
--

DROP PROCEDURE IF EXISTS `proc_adm_user_status`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_user_status`(
in iiduser int,
in iidstatus int,
out oireturn int)
BEGIN
   declare status_atual int;

             set iidstatus = (select status from secure1.user where iduser = iiduser) ;

             if (iidstatus = 0) then
                     set status_atual = 1;
             else
                     set status_atual = 0;
             End if;

             update secure1.user set status = status_atual where iduser = iiduser;
             update secure1.login set status = status_atual where idlogin in( select idlogin from secure1.rel_user_login where iduser =  iiduser);


                      set oireturn = status_atual;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `proc_adm_user_ticket`
--

DROP PROCEDURE IF EXISTS `proc_adm_user_ticket`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adm_user_ticket`(
in iiduser int
)
BEGIN

DECLARE vticket VARCHAR(15);
DECLARE oireturn INT;



BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION set oireturn = @@error_count;  

 SET vticket = fun_new_ticket();


 IF NOT EXISTS(SELECT 1 FROM rel_user_login WHERE iduser = iiduser limit 1) THEN
             INSERT INTO rel_user_login (iduser,idlogin,ticket)
    VALUES (iiduser, NULL, vticket);


 End if;


END ;



END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
