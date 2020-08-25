create table test_errcode(
 autoid number,
 strchk varchar2(10),
 numberchk number (10,2)
 );

DECLARE
  v_errstr varchar2(1000);
  str_length_larger exception;
  number_length_larger exception;
  pragma exception_init(number_length_larger,-1438);
  pragma exception_init(str_length_larger,-12899);
BEGIN
  BEGIN
  INSERT INTO test_errcode select 1,'1234567890',200000000000 from dual;
   v_errstr := 'no error';
  EXCEPTION 
    WHEN str_length_larger THEN
         v_errstr := sqlerrm || dbms_utility.format_error_backtrace;
    WHEN number_length_larger THEN
         v_errstr := sqlerrm || dbms_utility.format_error_backtrace;
  END;
  dbms_output.put_line (v_errstr);
    
END;
  
select * from deferror order by errnum;

----
select * from crbbankrequesthist;

alter table LOG_NOTIFY_FACB add err_code varchar2(50);
alter table LOG_NOTIFY_FACB add err_msg varchar2(500);

---
alter table LOG_NOTIFY_CBFA add err_code varchar2(50);
alter table LOG_NOTIFY_CBFA add ERR_MESSAGE varchar2(500);

---
alter table CBFA_BANKPAYMENT add err_code VARCHAR2(50);
alter table FACB_STATEMENTGROUP add err_code VARCHAR2(50);
---

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930000, '[-930000] : Error when select/insert/update database', '[-930000] : Error when select/insert/update database', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930001, '[-930001] : Can not find bank account', '[-930001] : Can not find bank account', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930002, '[-930002] : Error when excecute transaction id 9200/9300', '[-930002] : Error when excecute transaction id 9200/9300', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930003, '[-930003] : Can not handle unknown event', '[-930003] : Can not handle unknown event', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930004, '[-930004] : Undifined sync error', '[-930004] : Undifined sync error', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930005, '[-930005] : Error when excute bank transfer', '[-930005] : Error when excute bank transfer', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930006, '[-930006] : CITAD not found', '[-930006] : CITAD not found', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930007, '[-930007] : Cash account not found', '[-930007] : Cash account not found', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930008, '[-930008] : Error when excecute transaction id 9376', '[-930008] : Error when excecute transaction id 9376', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930009, '[-930009] : Error when excecute transaction id 9264/9276', '[-930009] : Error when excecute transaction id 9264/9276', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930010, '[-930010] : Can not find fund account', '[-930010] : Can not find fund account', 'FA', 0);
