-- 9200/9300 -> báo nợ báo có
-- OTCODMAST -> pr_process_GLMASTEXT -> syn_cbfa_glmastext (9376) (khong co bang ben FA?)
-- ODMAST    -> cb_fasfnoticetx -> FA9260 -> 9260
-- ODMASTETF -> cb_fatanoticetx -> FA0055 -> 9287
-- CANCELETF -> cbfacanceletf   -> FA0065 -> 9390
-- DOCSTRANFER -> CBFADOCSTRANFER -> FAxxxx
-- CDGLMAST    -> pr_process_GLMASTEXTCD -> syn_cbfa_glmastext -> 9276,9433,9264,9431
-- CBFAODDEXCHANGE -> CBFAODDEXCHANGETX -> FA9460 ->
-- CATRANSFERCONFIRM -> CBFAGLMASTEXT -> 
-- 'CAALLOCATE','CAALLOCATE_SWITH','CAALLOCATE_RIGHT' -> CBFACONFIRMCA
-- AUTO_9384 ->
-- RIGHT_CAALLOCATE -> CBFACONFIRMCA
-- RIGHT_CANCEL -> ??
-- OTCCONFIRM -> CBFACONFIRMOTC
-- CAMAST -> CBFACAMAST -> 9378...
-- AUTO_EXEC_TRANS -> AUTO transaction

select * from tltx where tltxcd = '9421';
select * from fldmaster where objname = '9445';
select * from fldval where objname = '9445';

select * from tlog where ltexte like '%CRBTXREQ_CITAD_REVERT transactionnumber:%';

-----------

