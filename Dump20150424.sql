-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: WebEmailClient
-- ------------------------------------------------------
-- Server version	5.6.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Contacts`
--

DROP TABLE IF EXISTS `Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contacts` (
  `contact_Id` int(11) NOT NULL AUTO_INCREMENT,
  `ContactName` varchar(45) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `ContactEmail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contact_Id`),
  KEY `FK_lfv1m024lxdx2q115nmk96nw5` (`userId`),
  CONSTRAINT `FK_lfv1m024lxdx2q115nmk96nw5` FOREIGN KEY (`userId`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacts`
--

LOCK TABLES `Contacts` WRITE;
/*!40000 ALTER TABLE `Contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailAccount`
--

DROP TABLE IF EXISTS `EmailAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailAccount` (
  `email_Id` int(11) NOT NULL AUTO_INCREMENT,
  `emailAccount` varchar(255) DEFAULT NULL,
  `emailPassword` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`email_Id`),
  KEY `userId` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailAccount`
--

LOCK TABLES `EmailAccount` WRITE;
/*!40000 ALTER TABLE `EmailAccount` DISABLE KEYS */;
INSERT INTO `EmailAccount` VALUES (16,'emailclient2015@gmail.com','webemailclient',16),(17,'emailclient2015@yahoo.com','webemailclient',17),(18,'admin@gmail.com','admin',19);
/*!40000 ALTER TABLE `EmailAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Messages` (
  `message_Id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `date` datetime NOT NULL,
  `email_Id` int(11) DEFAULT NULL,
  `email_status` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`message_Id`),
  UNIQUE KEY `unique_index` (`date`,`email_Id`,`email_status`),
  KEY `emai_Id_idx` (`email_Id`),
  CONSTRAINT `email_Id` FOREIGN KEY (`email_Id`) REFERENCES `EmailAccount` (`email_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18035 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (142,'<p dir=\"ltr\">Hope it works </p>\r\n','2015-04-17 05:31:56',16,'STARRED','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','From Me'),(143,'<p dir=\"ltr\">Please make it work</p>\r\n','2015-04-17 06:21:21',16,'TRASH','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','What do you want'),(144,'<p dir=\"ltr\">I&#39;m so hungry </p>\r\n<div class=\"gmail_quote\">On Apr 17, 2015 5:31 AM, &quot;Abdulmnem Ben aiad&quot; &lt;<a href=\"mailto:benaiad@gmail.com\">benaiad@gmail.com</a>&gt; wrote:<br type=\"attribution\"><blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\"><p dir=\"ltr\">Hope it works </p>\r\n</blockquote></div>\r\n','2015-04-17 07:51:21',16,'TRASH','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','Re: From Me'),(149,'<html><body><div style=\"color:#000; background-color:#fff; font-family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px\"><div dir=\"ltr\" id=\"yui_3_16_0_1_1429823193499_2819\">hey this is from yahoo!<br></div></div></body></html>','2015-04-23 17:10:17',16,'TRASH','\"emailclient2015@gmail.com\" <emailclient2015@gmail.com>','karishma dalal <emailclient2015@yahoo.com>','from yahoooooo'),(150,'<p dir=\"ltr\">Hi, </p>\r\n<p dir=\"ltr\">I&#39;m trying your email client, I think it&#39;s amazing, finally I have one place to access all of my unofficial email address. </p>\r\n<p dir=\"ltr\">Thank you guys, keep up the work. </p>\r\n<p dir=\"ltr\">Sincerely, </p>\r\n','2015-04-23 20:48:47',16,'TRASH','Email Client <Emailclient2015@gmail.com>','Abdulmnem Ben aiad <benaiad@gmail.com>','Where are you'),(151,'<div dir=\"ltr\"><br></div>\r\n','2015-04-17 07:25:00',16,'Drafts','abd:;','Email Client <emailclient2015@gmail.com>',NULL),(152,'<div dir=\"ltr\">okay</div>\r\n','2015-04-17 07:25:52',16,'Drafts',NULL,'Email Client <emailclient2015@gmail.com>','okay'),(154,'<div dir=\"ltr\">testing</div>\r\n','2015-04-17 07:26:11',16,'Sent Mail','dalalk21@gmail.com','Email Client <emailclient2015@gmail.com>',NULL),(155,'test','2015-04-20 03:40:49',16,'Sent Mail','shubhampats@gmail.com','emailclient2015@gmail.com','test'),(156,'testing...','2015-04-20 23:20:34',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','vishwa test'),(157,'','2015-04-22 09:14:46',16,'Sent Mail','benaiad@gmail.com','emailclient2015@gmail.com','Naeem'),(158,'','2015-04-22 09:16:00',16,'Sent Mail','dalalk21@gmail.com','emailclient2015@gmail.com','GM'),(159,'test2','2015-04-22 13:31:22',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test2@gmail.com'),(160,'test2','2015-04-22 13:31:49',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test2@gmail.com'),(161,'test','2015-04-22 19:49:35',16,'Sent Mail','yashvsehgal@gmail.com','emailclient2015@gmail.com','test'),(162,'test','2015-04-22 19:59:45',16,'Sent Mail','yashvsehgal@gmail.com','emailclient2015@gmail.com','test'),(163,'wr','2015-04-22 20:27:20',16,'Sent Mail','yashvsehgal@gmail.com','emailclient2015@gmail.com','ty'),(164,'velocity test','2015-04-23 13:41:18',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test'),(165,'velocity test2','2015-04-23 13:47:08',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test'),(166,'','2015-04-23 14:20:08',16,'Sent Mail','shruti.chanage09@gmail.com','emailclient2015@gmail.com','hi'),(167,'test2','2015-04-23 15:40:44',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test'),(168,'test2','2015-04-23 15:42:16',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test'),(169,'','2015-04-23 17:16:12',16,'Sent Mail','emailclient2015@yahoo.com','emailclient2015@gmail.com','hey from gmail'),(170,'test3','2015-04-23 19:47:05',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test'),(171,'','2015-04-24 00:00:57',16,'Sent Mail','mehta_199312@yahoo.com','emailclient2015@gmail.com',NULL),(172,'','2015-04-24 00:21:15',16,'Sent Mail','jaiminrptl@gmail.com','emailclient2015@gmail.com','hey hey hey'),(173,'hi<span></span>\r\n','2015-04-17 06:15:39',16,'Trash','emailclient2015@gmail.com','Karishma Dalal <dalalk21@gmail.com>','Hi'),(174,'<p dir=\"ltr\">Bbbbbbnnn</p>\r\n','2015-04-17 06:12:15',16,'Trash','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad.a@husky.neu.edu>','Husky'),(175,'<p dir=\"ltr\">Yyhhhh</p>\r\n','2015-04-17 06:11:28',16,'Trash','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','Yyg'),(176,'<p dir=\"ltr\">Good morning </p>\r\n','2015-04-17 06:07:59',16,'Trash','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','Test 123'),(177,'<p dir=\"ltr\">The world is waiting for your answer.</p>\r\n<p dir=\"ltr\">Regards, </p>\r\n<p dir=\"ltr\">Abdul</p>\r\n','2015-04-17 05:47:51',16,'Trash','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','Hello kari'),(178,'<p dir=\"ltr\">Works </p>\r\n','2015-04-17 05:41:03',16,'Trash','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','Just'),(179,'','2015-04-17 05:40:47',16,'Trash','emailclient2015@gmail.com','Karishma Dalal <dalalk21@gmail.com>','Hey you!'),(180,'Hello, this is sample for to check send email using JavaMailAPI ','2015-04-15 18:03:13',16,'Trash','emailclient2015@gmail.com','shubhampats@gmail.com','Testing Subject'),(181,'Hello, this is sample for to check send email using JavaMailAPI ','2015-04-13 22:26:48',16,'Trash','emailclient2015@gmail.com','shubhampats@gmail.com','Testing Subject'),(182,'','2015-04-13 22:24:43',16,'Trash','emailclient2015@gmail.com','Karishma Dalal <dalalk21@gmail.com>','hey!'),(227,'','2015-04-17 12:39:35',16,'STARRED','Email Client <emailclient2015@gmail.com>','Abdulmnem Ben aiad <benaiad@gmail.com>','Re: thanks!'),(228,'<p dir=\"ltr\">Test</p>\r\n','2015-04-21 02:54:58',16,'INBOX','emailclient2015@gmail.com','Yash Sehgal <yashscool@gmail.com>','Hi'),(230,'','2015-04-23 16:28:34',16,'INBOX','Email Client <Emailclient2015@gmail.com>','Abdulmnem Ben aiad <benaiad@gmail.com>','Test # 99'),(551,'','2015-04-23 17:06:17',17,'Inbox','emailclient2015@yahoo.com','replies@communications.yahoo.com','Welcome to Yahoo! karishma'),(552,'','2015-04-23 17:12:59',17,'Inbox','emailclient2015@yahoo.com','replies@communications.yahoo.com','Get to know your inbox'),(553,'','2015-04-23 17:15:40',17,'Inbox','emailclient2015@yahoo.com','replies@communications.yahoo.com','Read your mail and today’s news from one app'),(554,'','2015-04-23 17:16:13',17,'Inbox','emailclient2015@yahoo.com','emailclient2015@gmail.com','hey from gmail'),(555,'<html><body><div style=\"color:#000; background-color:#fff; font-family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px\"><div dir=\"ltr\" id=\"yui_3_16_0_1_1429823193499_2819\">hey this is from yahoo!<br></div></div></body></html>','2015-04-23 17:07:33',17,'Sent','\"emailclient2015@gmail.com\" <emailclient2015@gmail.com>','karishma dalal <emailclient2015@yahoo.com>','from yahoooooo'),(6761,'<p dir=\"ltr\">Hope it works </p>\r\n','2015-04-17 05:31:56',16,'INBOX','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','From Me'),(7249,'test','2015-04-24 05:45:20',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test'),(8915,'It\'s amazing','2015-04-21 03:51:47',16,'INBOX','emailclient2015@gmail.com','Yash Sehgal <yashscool@gmail.com>','Fwd: The biggest stage for SMEs is coming soon| Reserve your seat now!'),(8958,'<p dir=\"ltr\">Please make it work</p>\r\n','2015-04-17 06:21:21',16,'INBOX','Emailclient2015@gmail.com','Abdulmnem Ben aiad <benaiad@gmail.com>','What do you want'),(9892,'<div class=\"gmail_quote\">---------- Forwarded message ----------<br>From: &quot;Lufthansa India&quot; &lt;<a href=\"mailto:ankit@nextbigwhat.com\">ankit@nextbigwhat.com</a>&gt;<br>Date: Apr 21, 2015 1:55 AM<br>Subject: The biggest stage for SMEs is coming soon| Reserve your seat now!<br>To:  &lt;<a href=\"mailto:yashscool@gmail.com\">yashscool@gmail.com</a>&gt;<br>Cc: <br><br type=\"attribution\"><u></u>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<div>\r\n<img src=\"http://ad.doubleclick.net/ad/N3707.1874352.NEXTBIGWHAT.COM/B8581679.116248161;sz=1x1;ord=%5Btimestamp%5D?\" border=\"0\" width=\"1\" height=\"1\" alt=\"Advertisement\">\r\n<table width=\"587\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n  <tr>\r\n    <td align=\"left\" valign=\"top\" bgcolor=\"#ffb300\" style=\"padding-left:22px;padding-right:22px\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n      <tr>\r\n        <td width=\"52%\" height=\"80\" align=\"left\" valign=\"middle\"><a href=\"http://akshat.us8.list-manage.com/track/click?u=5582268ae1c3bba5f13fb2fa1&amp;id=777d9707d8&amp;e=384b08eb57\" target=\"_blank\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/5826939b-d2e6-42e9-98a2-5417880f9446.gif\" width=\"152\" height=\"48\" alt=\"\"></a></td>\r\n        <td width=\"48%\" height=\"80\" align=\"right\" valign=\"middle\"><a href=\"http://akshat.us8.list-manage2.com/track/click?u=5582268ae1c3bba5f13fb2fa1&amp;id=19b490f941&amp;e=384b08eb57\" target=\"_blank\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/126998dc-b483-4cd9-83f7-30fa788e52ae.gif\" width=\"112\" height=\"52\" alt=\"\"></a></td>\r\n      </tr>\r\n    </table></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"left\" valign=\"top\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/70b07fb7-b9e9-4988-812f-bc2aa2b68126.gif\" width=\"587\" height=\"10\"></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"left\" valign=\"top\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border:1px solid #c9c9c9\">\r\n      <tr>\r\n        <td align=\"left\" valign=\"top\" style=\"padding:10px 17px 10px 17px\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n          <tr>\r\n            <td align=\"left\" valign=\"top\"><a href=\"http://akshat.us8.list-manage.com/track/click?u=5582268ae1c3bba5f13fb2fa1&amp;id=11fa8ebbf2&amp;e=384b08eb57\" target=\"_blank\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/058cfc3f-1f94-46c1-9803-b4eee2ad91dc.jpg\" width=\"553\" height=\"215\"></a></td>\r\n          </tr>\r\n          <tr>\r\n            <td align=\"left\" valign=\"top\" style=\"padding-top:10px;padding-bottom:20px\"><font style=\"font-family:Arial,Helvetica,sans-serif;font-size:20px;color:#000066;font-weight:bold\">Win a Business Class ticket to the US and a seat\r\nat Stanford’s Design Thinking Boot Camp</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td align=\"left\" valign=\"top\"><font style=\"font-family:Arial,Helvetica,sans-serif;font-size:13px;color:#1d1d1d\">It’s your big chance to be mentored by the experts at TiE and register to be on the Runway to Success TV series. Make your mark and you could win a Lufthansa Business Class ticket to the US &amp; a seat at the Design Thinking Boot Camp in Stanford University!\r\n\r\n                <br>\r\n                <br>\r\n                Runway to Success Mentorship camps. Over 100,000 SMEs have discovered their value. Reserve your seat now. It could be the missing link between your business and big success. <br>\r\n              <br>\r\n            </font></td>\r\n          </tr>\r\n          <tr>\r\n            <td align=\"left\" valign=\"top\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n              <tr>\r\n                <td width=\"33%\" align=\"left\" valign=\"middle\"><a href=\"http://akshat.us8.list-manage.com/track/click?u=5582268ae1c3bba5f13fb2fa1&amp;id=e6597d1d18&amp;e=384b08eb57\" target=\"_blank\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/b813e671-9616-4f62-a797-cdc16586f7b4.gif\" width=\"181\" height=\"27\" alt=\"\"></a></td>\r\n                <td width=\"36%\" align=\"left\" valign=\"middle\"> </td>\r\n                <td width=\"31%\" align=\"right\" valign=\"middle\"><a href=\"http://akshat.us8.list-manage.com/track/click?u=5582268ae1c3bba5f13fb2fa1&amp;id=1de6ce5e9b&amp;e=384b08eb57\" target=\"_blank\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/d0d5ff03-abb3-4cc2-ba98-37d23fdf0e92.gif\" width=\"124\" height=\"26\" alt=\"\"></a></td>\r\n              </tr>\r\n            </table></td>\r\n          </tr>\r\n          <tr>\r\n            <td align=\"left\" valign=\"top\" style=\"padding-top:5px\"> </td>\r\n          </tr>\r\n          <tr>\r\n            <td height=\"10\" align=\"left\" valign=\"top\"><font style=\"font-family:Arial,Helvetica,sans-serif;font-size:13px;color:#1d1d1d\"> <strong>#RunwaytoSuccess Join the conversation</strong></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td height=\"10\" align=\"left\" valign=\"top\"></td>\r\n          </tr>\r\n        </table></td>\r\n      </tr>\r\n    </table></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"left\" valign=\"top\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/aa4a617f-ac47-4e59-afa5-79c4dc38252b.gif\" width=\"2\" height=\"2\"></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"left\" valign=\"top\" bgcolor=\"#ffb300\"><a href=\"http://akshat.us8.list-manage.com/track/click?u=5582268ae1c3bba5f13fb2fa1&amp;id=e2f6175e63&amp;e=384b08eb57\" target=\"_blank\"><img src=\"https://gallery.mailchimp.com/280f184a63bf1eec83ea6a43e/images/2ea30162-56a5-4808-8b9c-bf5f276284e7.jpg\" width=\"587\" height=\"66\"></a></td>\r\n  </tr>\r\n</table>\r\n            <center>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"background-color:#ffffff;border-top:1px solid #e5e5e5\">\r\n                    <tr>\r\n                        <td align=\"center\" valign=\"top\" style=\"padding-top:20px;padding-bottom:20px\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                <tr>\r\n                                    <td align=\"center\" valign=\"top\" style=\"color:#606060;font-family:Helvetica,Arial,sans-serif;font-size:11px;line-height:150%;padding-right:20px;padding-bottom:5px;padding-left:20px;text-align:center\">\r\n                                        This email was sent to <a href=\"mailto:yashscool@gmail.com\" style=\"color:#404040!important\" target=\"_blank\">yashscool@gmail.com</a>\r\n                                        <br>\r\n                                        <a href=\"http://akshat.us8.list-manage.com/about?u=5582268ae1c3bba5f13fb2fa1&amp;id=14eeec093d&amp;e=384b08eb57&amp;c=dc07d45963\" style=\"color:#404040!important\" target=\"_blank\"><em>why did I get this?</em></a>    <a href=\"http://akshat.us8.list-manage.com/unsubscribe?u=5582268ae1c3bba5f13fb2fa1&amp;id=14eeec093d&amp;e=384b08eb57&amp;c=dc07d45963\" style=\"color:#404040!important\" target=\"_blank\">unsubscribe from this list</a>    <a href=\"http://akshat.us8.list-manage.com/profile?u=5582268ae1c3bba5f13fb2fa1&amp;id=14eeec093d&amp;e=384b08eb57\" style=\"color:#404040!important\" target=\"_blank\">update subscription preferences</a>\r\n                                        <br>\r\n                                        Lufthansa India · Indiranagar, Bangalore, Karnataka, India · Bangalore 560038 · India\r\n                                        <br>\r\n                                        <br>\r\n                                        <a href=\"http://www.mailchimp.com/monkey-rewards/?utm_source=freemium_newsletter&amp;utm_medium=email&amp;utm_campaign=monkey_rewards&amp;aid=5582268ae1c3bba5f13fb2fa1&amp;afl=1\" target=\"_blank\"><img src=\"http://cdn-images.mailchimp.com/monkey_rewards/MC_MonkeyReward_15.png\" border=\"0\" alt=\"Email Marketing Powered by MailChimp\" title=\"MailChimp Email Marketing\" width=\"139\" height=\"54\"></a>\r\n                                    </td>\r\n                                </tr>\r\n                            </table>\r\n                        </td>\r\n                    </tr>\r\n                </table>\r\n                \r\n            </center><img src=\"http://akshat.us8.list-manage.com/track/open.php?u=5582268ae1c3bba5f13fb2fa1&amp;id=dc07d45963&amp;e=384b08eb57\" height=\"1\" width=\"1\"></div>\r\n</div>\r\n','2015-04-21 03:51:47',16,'Trash','emailclient2015@gmail.com','Yash Sehgal <yashscool@gmail.com>','Fwd: The biggest stage for SMEs is coming soon| Reserve your seat now!'),(11557,'<p dir=\"ltr\">Hi, </p>\r\n<p dir=\"ltr\">I&#39;m trying your email client, I think it&#39;s amazing, finally I have one place to access all of my unofficial email address. </p>\r\n<p dir=\"ltr\">Thank you guys, keep up the work. </p>\r\n<p dir=\"ltr\">Sincerely, </p>\r\n','2015-04-23 20:48:47',16,'INBOX','Email Client <Emailclient2015@gmail.com>','Abdulmnem Ben aiad <benaiad@gmail.com>','Where are you'),(11832,'<html><body><div style=\"color:#000; background-color:#fff; font-family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px\"><div dir=\"ltr\" id=\"yui_3_16_0_1_1429823193499_2819\">hey this is from yahoo!<br></div></div></body></html>','2015-04-23 17:10:17',16,'INBOX','\"emailclient2015@gmail.com\" <emailclient2015@gmail.com>','karishma dalal <emailclient2015@yahoo.com>','from yahoooooo'),(11856,'','2015-04-24 11:35:57',16,'Sent Mail','dalalk21@gmail.com','emailclient2015@gmail.com','hi'),(11929,'.jlgfg','2015-04-24 11:53:11',16,'Sent Mail','shubhampats@gmail.com','emailclient2015@gmail.com','ljvfg'),(11967,'mhf','2015-04-24 12:20:25',16,'Sent Mail','shubhampats@gmail.com','emailclient2015@gmail.com','mhf'),(12386,'.kjbg.jvg','2015-04-24 14:31:21',16,'Sent Mail','shubhampats@gmail.com','emailclient2015@gmail.com','test4'),(12426,'.kjbg.jvg','2015-04-24 14:34:17',16,'Sent Mail','shubhampats@gmail.com','emailclient2015@gmail.com','test4'),(12427,',jvgn,hgku','2015-04-24 14:34:42',16,'Sent Mail','shubhampats@gmail.com','emailclient2015@gmail.com','mhcfmgnd'),(12510,'bmcvmbc','2015-04-24 14:41:50',16,'Sent Mail','shubhampats@gmail.com','emailclient2015@gmail.com',',hf'),(12553,'test mail from application','2015-04-24 14:45:27',16,'Sent Mail','puneetspathak@gmail.com','emailclient2015@gmail.com','test mail'),(15466,'new test','2015-04-24 16:22:04',16,'Sent Mail','vish.240493@gmail.com','emailclient2015@gmail.com','test'),(16008,'Web Email Client test','2015-04-24 16:34:48',16,'Sent Mail','mananjayeshshah@gmail.com','emailclient2015@gmail.com','test');
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `birthDate` datetime DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `profilePicture` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `user_Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (16,'1935-01-01 02:21:01','kari','Female','dalal','kari','ww','kari',''),(17,'1935-01-01 02:44:54','Karishma','Female','Dalal','kd',NULL,'kd',''),(19,'1948-02-04 15:55:38','administrator','Male','administrator','admin',NULL,'admin','');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-24 17:22:14
