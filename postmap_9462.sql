select * from fldmaster where objname = '9262' for update;

select * from fldmaster where objname = '9462' for update;

select * from fapostmap where tltxcd = '9262';

select * from fapostmapval where tltxcd = '9262';

select * from fapostmapexp where tltxcd = '9262';

select * from search where searchcode = 'FASHAREBUYINGODD' for update; --FAODDEXCNOTICETX --FASHAREBUYINGODD --FASHARESELLINGODD

select * from searchfld where searchcode = 'FASHAREBUYINGODD' for update;

select * from search where searchcode = 'FASHARESELLINGODD' for update;
 
select * from searchfld where searchcode = 'FASHARESELLINGODD' for update;

select * from fund where symbol= 'FSSVF1';

select * from fasemast where fundcodeid = '000999'

---=====
select * from fapostmap where tltxcd = '9462';

select * from fapostmapexp where tltxcd = '9462';

select * from fapostmapval where tltxcd = '9462';


--====postmap 9462

--fapostmap
delete from fapostmap where tltxcd = '9462';
insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9462', 1.0000000000, 'D', '02', '12100101', '@STOK', '90', '10**40', 'Giá trị', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', 'fn_get_amt_nof', '02##10##12##34');

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9462', 1.0000000000, 'C', '02', '33100101', '@STOK', '81', '10**40', 'Giá trị', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', 'fn_get_amt_nof', '02##10##12##34');

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9462', 2.0000000000, 'D', '02', '63220101', '@STOK', '90', '12**40', 'Phí', null, null, null, seq_fapostmap.nextval, 'DEF', '90', '09', 'DEF', 'DEF', 'DEF', 'fn_get_fee_nof', '02##10##12##34');

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9462', 2.0000000000, 'C', '02', '33100101', '@STOK', '90', '12**40', 'Phí', null, null, null, seq_fapostmap.nextval, 'DEF', '90', '09', 'DEF', 'DEF', 'DEF', 'fn_get_fee_nof', '02##10##12##34');

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9462', 3.0000000000, 'D', '02', '12100101', '@STOK', '90', '((10++12))**41', 'Giá trị + Phí', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', 'fn_get_amtfee_gro', '02##10##12##34');

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9462', 3.0000000000, 'C', '02', '33100101', '@STOK', '81', '((10++12))**41', 'Giá trị + Phí', null, null, null, seq_fapostmap.nextval, 'DEF', '90', '09', 'DEF', 'DEF', 'DEF', 'fn_get_amtfee_gro', '02##10##12##34');

commit;
--==postmapexp 4482 4483 4484
delete from fapostmapexp where tltxcd = '9462';
INSERT INTO FAPOSTMAPEXP (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID)
VALUES ('9462','D','12100101','12100101','DEF','TYPE','DEF','DEF','DEF','DEF',seq_fapostmapexp.nextval,4482);
INSERT INTO FAPOSTMAPEXP (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID)
VALUES ('9462','C','33100101','33100101','DEF','TYPE','DEF','DEF','DEF','DEF',seq_fapostmapexp.nextval,4483);
INSERT INTO FAPOSTMAPEXP (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID)
VALUES ('9462','D','63220101','63220101','DEF','TYPE','DEF','DEF','DEF','DEF',seq_fapostmapexp.nextval,4484);
commit;

--==postmapval
DELETE fapostmapval WHERE TLTXCD = '9462';
insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '12100101', '12100104', 'DEF', 'OF', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4482);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '12100101', '12100199', 'DEF', 'MM', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4482);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '12100101', '12100101', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4482);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '12100101', '12100103', 'DEF', 'CC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4482);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'C', '33100101', '33100101', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4483);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'C', '33100101', '33100103', 'DEF', 'CC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4483);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'C', '33100101', '33100104', 'DEF', 'OF', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4483);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'C', '33100101', '33100199', 'DEF', 'MM', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4483);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '63220101', '63220199', 'DEF', 'MM', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4484);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '63220101', '63220104', 'DEF', 'OF', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4484);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '63220101', '63220103', 'DEF', 'CC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4484);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9462', 'D', '63220101', '63220101', 'DEF', 'ES', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 4484);

COMMIT;
