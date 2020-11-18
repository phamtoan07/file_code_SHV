--fapostmap
delete from fapostmap where tltxcd = '9415';
insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9415', 1.0000000000, 'C', '02', '13201010', '@STOCK', '81', '37', 'Số tiền kì trước', null, null, null, seq_fapostmap.nextval, 'DEF', '81', 'DEF', '42', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9415', 1.0000000000, 'D', '02', '51520101', '@STOCK', '81', '37', 'Số tiền kì trước', null, null, null, seq_fapostmap.nextval, 'DEF', '81', 'DEF', '42', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9415', 2.0000000000, 'D', '02', '13201010', '@STOCK', '81', '38', 'Số tiền kì này', null, null, null, seq_fapostmap.nextval, 'DEF', '81', 'DEF', '42', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9415', 2.0000000000, 'C', '02', '51520101', '@STOCK', '81', '38', 'Số tiền kì này', null, null, null, seq_fapostmap.nextval, 'DEF', '81', 'DEF', '42', 'DEF', 'DEF', null, null);

--fapostmapexp
delete from fapostmapexp where tltxcd = '9415';
insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13201010', 'DEF', 'TYEX', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 3619);

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520101', 'DEF', 'TYEX', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 3618);

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13201010', 'DEF', 'TYEX', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 3619);

insert into fapostmapexp (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520101', 'DEF', 'TYEX', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapexp.nextval, 3618);

--fapostmapval
delete from fapostmapval where tltxcd = '9415';
insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13201010', 'DEF', 'ES.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13202000', 'DEF', 'ES.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13201040', 'DEF', 'OF.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13202000', 'DEF', 'OF.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13201990', 'DEF', 'MM.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13202000', 'DEF', 'MM.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13204030', 'DEF', 'GB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13203010', 'DEF', 'GB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13204070', 'DEF', 'DC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13203070', 'DEF', 'DC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13204060', 'DEF', 'DB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13203060', 'DEF', 'DB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13201030', 'DEF', 'CC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '13201010', '13202000', 'DEF', 'CC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13201010', 'DEF', 'ES.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13202000', 'DEF', 'ES.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13201040', 'DEF', 'OF.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13202000', 'DEF', 'OF.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13201990', 'DEF', 'MM.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13202000', 'DEF', 'MM.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13204030', 'DEF', 'GB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13203010', 'DEF', 'GB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13204070', 'DEF', 'DC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13203070', 'DEF', 'DC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13204060', 'DEF', 'DB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13203060', 'DEF', 'DB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13201030', 'DEF', 'CC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '13201010', '13202000', 'DEF', 'CC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3619);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520406', 'DEF', 'DB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520306', 'DEF', 'DB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520301', 'DEF', 'GB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520403', 'DEF', 'GB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520103', 'DEF', 'CC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520203', 'DEF', 'CC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520199', 'DEF', 'MM.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520299', 'DEF', 'MM.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520104', 'DEF', 'OF.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520202', 'DEF', 'OF.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520202', 'DEF', 'ES.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520101', 'DEF', 'ES.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520407', 'DEF', 'DC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'C', '51520101', '51520307', 'DEF', 'DC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520406', 'DEF', 'DB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520306', 'DEF', 'DB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520301', 'DEF', 'GB.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520403', 'DEF', 'GB.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520103', 'DEF', 'CC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520203', 'DEF', 'CC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520199', 'DEF', 'MM.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520299', 'DEF', 'MM.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520104', 'DEF', 'OF.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520202', 'DEF', 'OF.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520202', 'DEF', 'ES.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520101', 'DEF', 'ES.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520407', 'DEF', 'DC.OTC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9415', 'D', '51520101', '51520307', 'DEF', 'DC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', seq_fapostmapval.nextval, 3618);


