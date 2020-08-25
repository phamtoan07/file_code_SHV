select * from fldmaster where objname = '9268' for update;

select * from fldval where objname = '9268';

select * from fldmaster where objname = '9468' for update;

select * from fapostmap where tltxcd = '9268';

select * from fapostmapexp where tltxcd = '9268';

select * from fapostmapval where tltxcd = '9268';


select * from search where searchcode = 'FASHAREBUYINGODD' for update; --FAODDEXCNOTICETX --FASHAREBUYINGODD

select * from searchfld where searchcode = 'FASHAREBUYINGODD' for update;

---=====
select * from fapostmap where tltxcd = '9468';

select * from fapostmapexp where tltxcd = '9468';

select * from fapostmapval where tltxcd = '9468';


--====postmap 9468

--fapostmap
delete from fapostmap where tltxcd = '9468';

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 1.0000000000, 'D', '02', '13101000', '@STOK', '81', '16', 'Giá trị vốn', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', '09', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 1.0000000000, 'C', '02', '12100101', '@STOK', '@NORM', '16', 'Giá trị vốn', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 2.0000000000, 'D', '02', '64101010', '@STOK', '90', '12', 'Phí', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 2.0000000000, 'C', '02', '33100101', '@STOK', '81', '12', 'Phí', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 3.0000000000, 'D', '02', '13101000', '@STOK', '81', '15', 'Giá trị lãi', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', '09', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 3.0000000000, 'C', '02', '51111010', '@STOK', '@NORM', '15', 'Giá trị lãi', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 4.0000000000, 'D', '02', '63210101', '@STOK', '90', '14', 'Giá trị lỗ', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9468', 4.0000000000, 'C', '02', '13101000', '@STOK', '81', '14', 'Giá trị lỗ', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', '09', 'DEF', 'DEF', 'DEF', null, null);

commit;
--==postmapexp
delete from fapostmapexp where tltxcd = '9468';

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '12100101', null, 'DEF', 'TYPE', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 2427);

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '33100101', null, 'DEF', 'TYPE', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 2365);

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '51111010', null, 'DEF', 'TYPE', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 2425);

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '63210101', null, 'DEF', 'TYPE', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 2426);

commit;

--==postmapval
DELETE fapostmapval WHERE TLTXCD = '9468';

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '12100101', '12100199', 'DEF', 'MM', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2423);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '12100101', '12100104', 'DEF', 'OF', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2423);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '12100101', '12100101', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2423);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '12100101', '12100103', 'DEF', 'CC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2423);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '33100101', '33100104', 'DEF', 'OF', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2365);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '33100101', '33100101', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2365);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '33100101', '33100199', 'DEF', 'MM', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2365);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '33100101', '33100103', 'DEF', 'CC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2365);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '51111010', '51111010', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2425);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '51111010', '51111040', 'DEF', 'OF', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2425);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '51111010', '51111030', 'DEF', 'CC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2425);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'C', '51111010', '51111990', 'DEF', 'MM', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2425);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '63210101', '63210104', 'DEF', 'OF', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2426);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '63210101', '63210103', 'DEF', 'CC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2426);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '63210101', '63210101', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2426);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9468', 'D', '63210101', '63210199', 'DEF', 'MM', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 2426);

COMMIT;
