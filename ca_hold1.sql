select autoid, trans_type, custodycd, sec_id, trade_date, quantity from odmastcust 
where trans_type = 'NS' and TRANSACTIONTYPE = 'A';

select autoid, trans_type, custodycd, sec_id, trade_date, quantity from odmastcusthist
where trans_type = 'NS' and TRANSACTIONTYPE = 'A' and isodmast = 'Y' ;

select * from fldmaster where objname = '8864';
select * from odmastcust;
---
SELECT CDVAL VALUECD, CDVAL VALUE, cdcontent DISPLAY, EN_CDCONTENT EN_DISPLAY, EN_CDCONTENT DESCRIPTION
FROM ALLCODE where cdtype = 'OD' and cdname = 'TRANSACTIONTYPE' 
O
