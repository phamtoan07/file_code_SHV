select * from tltx where tltxcd = '9427' for update;

select * from tltx where tltxcd = '9428' for update;

select * from tltx where tltxcd = '9272';

select * from tltx where tltxcd = '9273';
--============

select * from fldmaster where objname = '9272';

select * from fldmaster where objname = '9427'; --FABANKTRANSFERTX_DR

---===========================================

select * from fldmaster where objname = '9273';

select * from fldmaster where objname = '9428'; --FACREDITACSET


---===========================================

select * from fldval where objname = '9427';

---===========================================

select * from fapostmap where tltxcd = '9272';
select * from fapostmapexp where  tltxcd = '9272';
select * from fapostmapval where  tltxcd = '9272';

select * from fapostmap where tltxcd = '9427';
select * from fapostmapexp where  tltxcd = '9427' for update;
select * from fapostmapval where  tltxcd = '9427';

--exp
insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9427', 'D', '33100101', '33100101', 'DEF', 'TYEX', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 3839);

--val
insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9427', 'D', '33100101', '33100306', 'DEF', 'DB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3839);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9427', 'D', '33100101', '33100307', 'DEF', 'DC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3839);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9427', 'D', '33100101', '33100101', 'DEF', 'ES.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3839);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9427', 'D', '33100101', '33100103', 'DEF', 'CC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3839);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9427', 'D', '33100101', '33100104', 'DEF', 'OF.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3839);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9427', 'D', '33100101', '33100301', 'DEF', 'GB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3839);

--===========================================
select * from fapostmap where tltxcd = '9273';
select * from fapostmapexp where  tltxcd = '9273';
select * from fapostmapval where  tltxcd = '9273';

select * from fapostmap where tltxcd = '9428';
select * from fapostmapexp where  tltxcd = '9428';
select * from fapostmapval where  tltxcd = '9428';

--exp

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9428', 'C', '13101000', '13101000', 'DEF', 'TYPE', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 3842);

--val
insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9428', 'C', '13101000', '13101000', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3842);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9428', 'C', '13101000', '13102000', 'DEF', 'GB', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3842);


---============================================
select * from cmdmenu where LEV = 1;

select * from cmdmenu where prid = '926000' for update; -- cmdid: 926790 -> 926800, 

select * from cmdmenu where cmdid = '926800';

select * from cmdmenu where prid = '926780';

select * from cmdmenu where prid = '926790' for update; --prid 926790 -> 926800, cmdid 791,792 -> 801,802

select * from cmdmenu where cmdid in ('926801','926802');

select * from cmdmenu where prid = '924013' for update;

---

insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('926790', '926000', 2, 'N', 'A', null, 'FA', null, 'Oddlot - Off exchange ', 'Oddlot - Off exchange ', 'YYYYYYYYYY', null, null, null, null, 'FA', null);

----===
insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('926791', '926790', 3, 'Y', 'A', null, 'FA', null, 'Ghi nhận hợp đồng oddlot - off exchange', 'Oddlot - off exchange contract', 'YYYYYYYYYY', '9460', null, null, null, 'FA', null);

insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('926799', '926790', 3, 'Y', 'O', null, 'FA', 'FA9426', 'Ghi nhận chứng khoán oddlot - off exchange từ CB', 'Results of oddlot - off exchange transactions from CB', 'NNNNYNYNNNN', null, null, 'FA9426', null, 'FA', null);

insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('926793', '926790', 3, 'Y', 'A', null, 'FA', null, 'Thanh toán tiền bán CK oddlot - off exchange', 'Oddlot - off exchange selling stock settlement', 'YYYYYYYYYY', '9428', null, null, null, 'FA', null);

insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('926792', '926790', 3, 'Y', 'A', null, 'FA', null, 'Chuyển tiền mua CK oddlot - off exchange', 'Oddlot - off exchange buying stock settlement', 'YYYYYYYYYY', '9427', null, null, null, 'FA', null);



-------
select * from allcode where cdname = 'CBTXTYPE' for update;

select seq_tltxwf.nextval;
