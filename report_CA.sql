select * from tltx where tltxcd like '92%' or tltxcd like '93%'

select * from allcode where cdname = 'CATYPE';

select * from search where searchcode = 'FA1002'; --'023'
select * from search where searchcode = 'FA1005'; --'023'
select * from searchtxmapfld where searchcode = 'FA1002' and tltxcd = '9387';

select * from fldmaster where objname = '9383';
select * from search where searchcode = 'FA9383';

9320/9321/9322/9378/9379/9308/9387

--9381 chuyeenr nhượng quyền mua
--

--
--9320 -- 015
--9321 -- 016
--9322 -- 024
--9378 -- 010,011,021,014
--9308 -- 017
--9387 -- 020

 --ETF: 9287
 select * from FATANOTICETX T, SBFUNDTEF S 
 WHERE T.TXNUM = S.TXNUM AND T.TXDATE = S.TXTDATE AND T.DELTD <> 'Y' AND S.DELTD <> 'Y';
 
 --TD/CD TD: 9264, CD: 9276
 select * from GLMASTEXT g where g.acexttype in ('TD','CD') and g.deltd <> 'Y';
 
 -- OTC: 9376
 select * from GLMASTEXT g where g.acexttype in ('US','UB') and g.deltd <> 'Y';
 --
 -- Oddlot - Off exchang 9460
 select * from faoddexcnoticetx g where g.deltd <> 'Y';
