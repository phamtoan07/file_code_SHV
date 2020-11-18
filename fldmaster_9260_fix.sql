select TL.*, CF.DBCODE CFDBCODE from vw_objlog_all tl, CFMAST CF 
where (batchname = 'DAY') AND TL.cfcustodycd = CF.custodycd(+) and tl.TLTXCD = '9285';


select * from tlprofiles where tlid='0000';

-------
select * from fldmaster where objname = '9260';

SELECT AUTOID VALUECD, AUTOID VALUE, CREATEDBY DISPLAY, CREATEDBY EN_DISPLAY, CREATEDBY DESCRIPTION 
FROM FAFUNDACCTSF where CREATEDBY <> ' '

select * from fldmaster where objname like '%FAFUNDACCTSF%';
select * from fldmaster where objname like '%FAFUNDACCTBNK%';

select * from FAFUNDACCTBNK;
select * from FAFUNDACCTSF;

select t.AUTOID FILTERCD, t.AUTOID VALUECD, t.AUTOID VALUE, t.CREATEDBY DISPLAY, CREATEDBY EN_DISPLAY, CREATEDBY DESCRIPTION
from FAFUNDACCTSF t, FAFUNDACCTBNK f, members m, roles r, sbfundetf sb
where f.autoid = t.rebank and t.CREATEDBY<> ' '
      and m.autoid = f.mbid
      and m.autoid = r.mbid
      and r.rolecode = 'AP'
      and r.dbcode = sb.dbcodevsd
      and to_char(sb.autoid) = '<$TAGFIELD>' and '<$TAGFIELD>' is not null and length('<$TAGFIELD>') > 0
union all
select t.AUTOID FILTERCD, t.AUTOID VALUECD, t.AUTOID VALUE, t.CREATEDBY DISPLAY, CREATEDBY EN_DISPLAY, CREATEDBY DESCRIPTION
from FAFUNDACCTSF t, FAFUNDACCTBNK f, members m, roles r
where f.autoid = t.rebank and t.CREATEDBY<> ' '
      and m.autoid = f.mbid
      and m.autoid = r.mbid
      and '<$TAGFIELD>' is null or length('<$TAGFIELD>') = 0
;

select r.dbcode into v_dbcode from roles r, members m
          where m.autoid = r.mbid and r.rolecode = 'AP' and m.mbcode = v_mbcode

select * from members;

select * from fldmaster where objname = '9451';
select * from fldmaster where taglist is not null;-- = '9451';


SELECT DISTINCT A.MBCODE VALUE, A.MBNAME DISPLAY, A.MBNAME EN_DISPLAY
FROM MEMBERS A, FMEMBERS B 
WHERE  B.MBID=A.AUTOID AND B.ROLECODE='AP' 
AND B.CODEID = '<$TAGFIELD>'
AND EXISTS (SELECT MBCODE FROM FATANOTICETX WHERE FUNDCODEID = B.CODEID AND MBCODE = A.MBCODE AND DELTD = 'N')
ORDER BY DISPLAY
