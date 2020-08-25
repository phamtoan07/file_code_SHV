drop table cbfaoddexchagetx;
create table cbfaoddexchagetx(
autoid number,
custodycd varchar2(50),
seacctno  varchar2(50),
txqtty number default 0,
txblock number default 0,
caqtty number default 0,
parvalue number(38,10) default 0,
feeamt   number(38,10) default 0,
taxamt   number(38,10) default 0,
txdorc varchar2(1),
refsymbol varchar2(20),
tocustodycd varchar2(50),
toseacctno  varchar2(50),
txdate date,
busdate date,
txnum varchar2(50),
description varchar2(100),
status varchar2(1),
globalid varchar2(50),
inward varchar2(10),
outward varchar2(10)
);

create sequence seq_cbfa_oddexchagetx;
