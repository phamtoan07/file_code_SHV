select f.nvalue, f.cvalue,f.fldcd, m.fldname,m.defname from tllog t, tllogfld f, fldmaster m 
where t.tltxcd = '9304' and f.txnum = t.txnum and f.txdate = t.txdate
      and m.objname = '9304'
      and m.fldname = f.fldcd; 1351,1352,1346
      
select * from fastatementgroup;

select * from fastatement t where INSTR('1352$1351$1346$',to_char(autoid)||'$')>0;

select f.autoid,f.settlementdate
    from fastatement f where INSTR('1352$1351$1346$',to_char(f.autoid)||'$')>0 and f.autoid <> '1346';
    
select * from deferror for update;

-----
insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921363, '[-921363] : Not the same contract type with type of contract fee', '[-921363] : Not the same contract type with type of contract fee', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921362, '[-921362] : Not the same benificiary account', '[-921362] : Not the same benificiary account', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921361, '[-921361] : Not the same setttlement date', '[-921361] : Not the same setttlement date', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921360, '[-921360] : Not the same type', '[-921360] : Not the same type', 'FA', 0);


select s.typecontract from servicecontract s, fastatement t where t.tradingid = to_char(s.autoid);

select s.typecontract
  into v_contractype
  from fastatement f, servicecontract s
  where f.autoid = v_autoid and to_char(s.autoid) = f.tradingid;
