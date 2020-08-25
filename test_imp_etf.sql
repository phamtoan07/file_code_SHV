select * from tlog where luser = user order by id desc;

SELECT c.owner,c.object_name,c.object_type,b.sid,b.serial#,b.status,b.osuser,b.machine,
       'ALTER SYSTEM KILL SESSION ' || '''' || b.sid || ',' || b.serial# || ''''
FROM v$locked_object a,v$session b,dba_objects c
WHERE b.sid = a.session_id AND a.object_id = c.object_id;


ALTER SYSTEM KILL SESSION '1104,61891'

select * from ETFRESULT_TEMP where fileid = '15688' for update;

update ETFRESULT_TEMP set status = 'N', deltd = 'N', errmsg = null where fileid = '15685';

select * from user_source where lower(text) like '%fn_get_settlementdate%';
select * from user_source where lower(text) like '%pr_auto_9212_9216%';

fn_get_settlementdate

-----
select f.* from vw_tllogfld_all f, vw_tllog_all t where t.txnum = f.txnum and t.txdate = f.txdate and t.tltxcd = '9212';

select * from fatanoticetx;


SELECT * FROM fatanoticetx t
    WHERE T.TRADINGID = 'DT00120250815' AND t.mbcode = '000006' AND t.txtype = 'S' and t.deltd <> 'Y';
    
select a.mbcode, a.autoid, r.dbcode --into v_ap
              from members a, fmembers b,roles r,fund D
              where b.mbid=a.autoid
              and   b.codeid=d.codeid
              and   b.rolecode='AP'
              and   d.symbol = 'DT005'             
              and r.mbid = a.autoid and r.rolecode = 'AP' 
              and r.dbcode = '086';
              
              
 select * from             ETFRESULT_TEMP; 000005 000006

              
 select * from roles where rolecode = 'AP';
 
 select * from deferror where errnum = '-100129';
 
 select * from members where autoid = '728';
 
 select * from fmembers where mbid = '728' and codeid = '001281';
 
 select m.*,b.rolecode from members m, fmembers b, roles r 
 where b.mbid = m.autoid 
       and b.codeid = '001281'
       and r.mbid = m.autoid 
       and r.rolecode = 'AP' and r.dbcode = '086'
       
 ---
 select * from tltx where tltxcd = '9355' for update;
 
 select * from tllog where tltxcd = '9289' for update; 
 
select * from tllogfld where txnum = '000001000003' and txdate = ''
    
