CREATE OR REPLACE FUNCTION fn_chk_group_9304(p_arrautoid varchar2)
  RETURN number IS

  v_autoid number;
  v_txtype varchar2(50);
  v_settlementdate date;
  v_beniciaryacct varchar2(100);
  v_contractype     VARCHAR2(100);
  v_result number;
  v_count  number;
  v_fundcodeid varchar2(50);
BEGIN
  v_result := 0;

  --check Type, fund, settlement date khong duoc de trong
  SELECT COUNT(*) INTO V_COUNT FROM
    (SELECT F.* FROM FASTATEMENT F
            WHERE INSTR(P_ARRAUTOID,TO_CHAR(F.AUTOID)||'$')>0) T
  WHERE (T.TXTYPE IS NULL OR LENGTH(T.TXTYPE) = 0)
        OR (T.SETTLEMENTDATE IS NULL OR LENGTH(T.SETTLEMENTDATE) = 0)
        OR (T.FUNDCODEID IS NULL OR LENGTH(T.FUNDCODEID) = 0);

  IF v_count > 0 THEN return -1;
  END IF;

  select f.autoid,f.txtype,nvl(f.beneficiaryaccount,''),
         nvl(f.settlementdate,to_date('19000101','RRRRMMDD')), f.fundcodeid
  into v_autoid,v_txtype,v_beniciaryacct,v_settlementdate,v_fundcodeid
  from fastatement f where INSTR(p_arrautoid,to_char(f.autoid)||'$')>0 and rownum = 1;
  
   --check trung fund
  FOR rec IN (
    select f.autoid,f.fundcodeid
    from fastatement f where INSTR(p_arrautoid,to_char(f.autoid)||'$')>0 and f.autoid <> v_autoid
  )
  LOOP
    IF rec.fundcodeid is null OR length(rec.fundcodeid) = 0 OR rec.fundcodeid <> v_fundcodeid THEN
      return -2;
    END IF;
  END LOOP;
  
   --check trung type
  FOR rec IN (
    select f.autoid,f.txtype
    from fastatement f where INSTR(p_arrautoid,to_char(f.autoid)||'$')>0 and f.autoid <> v_autoid
  )
  LOOP
    IF rec.txtype is null OR length(rec.txtype) = 0 OR rec.txtype <> v_txtype THEN
      return -3;
    END IF;
  END LOOP;
  
   --check trung typecontract voi txtpe = 'SEVFEE'
  IF v_txtype = 'SEVFEE' THEN
     select s.typecontract into v_contractype
            from fastatement f, servicecontract s
            where f.autoid = v_autoid and to_char(s.autoid) = f.tradingid;
     FOR rec IN (
       select s.typecontract
            from fastatement f, servicecontract s
            where INSTR(p_arrautoid,to_char(f.autoid)||'$')>0 and f.autoid <> v_autoid
                  and to_char(s.autoid) = f.tradingid
       )
     LOOP
       IF rec.typecontract is null OR length(rec.typecontract) = 0 OR
          rec.typecontract <> v_contractype THEN
          return -6;
       END IF;
     END LOOP;
  END IF;
  
  --check trung benificiary account voi type phi co client code
  ---002 004 010 011 012 013 017 014 015
  IF  v_txtype NOT IN ('OPN','CLS','SEVFEE') THEN
     SELECT COUNT(*) INTO V_COUNT FROM
        (SELECT F.* FROM FASTATEMENT F
            WHERE INSTR(P_ARRAUTOID,TO_CHAR(F.AUTOID)||'$')>0) T
     WHERE (T.BENEFICIARYACCOUNT IS NULL OR LENGTH(T.BENEFICIARYACCOUNT) = 0)
        OR (T.BENEFICIARYBANK IS NULL OR LENGTH(T.BENEFICIARYBANK) = 0)
     IF v_count > 0 THEN return -1;
     END IF;
     
      --check trung settlement date
      FOR rec IN (
        select f.autoid,f.settlementdate
        from fastatement f where INSTR(p_arrautoid,to_char(f.autoid)||'$')>0 and f.autoid <> v_autoid
      )
      LOOP
        IF rec.settlementdate is null OR rec.settlementdate <> v_settlementdate THEN
          return -4;
        END IF;
      END LOOP;
     
      --check trung benficiary acct
      FOR rec IN (
        select f.autoid,f.beneficiaryaccount
        from fastatement f where INSTR(p_arrautoid,to_char(f.autoid)||'$')>0 and f.autoid <> v_autoid
      )
      LOOP
        IF rec.beneficiaryaccount is null OR length(rec.beneficiaryaccount) = 0 OR
           rec.beneficiaryaccount <> v_beniciaryacct THEN
          return -5;
        END IF;
      END LOOP;
   ELSIF v_txtype IN ('SEVFEE') AND v_contractype IN ('005','006','007','016') THEN -- khong can check tai khoan chuyen den
     
      --check trung settlement date
      FOR rec IN (
        select f.autoid,f.settlementdate
        from fastatement f where INSTR(p_arrautoid,to_char(f.autoid)||'$')>0 and f.autoid <> v_autoid
      )
      LOOP
        IF rec.settlementdate is null OR rec.settlementdate <> v_settlementdate THEN
          return -4;
        END IF;
      END LOOP;
   ELSIF v_txtype IN ('SEVFEE') AND v_contractype IN ('002', '003', '004', '010', '011', '012', '013', '014', '015', '017') THEN
     --Khong gom bang ke voi loai phi nay
      return -7;
   END IF;
  RETURN v_result;

END;
/
