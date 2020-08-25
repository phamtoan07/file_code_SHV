SELECT filecode VALUE, filecode || ': ' || filename DISPLAY, 
       filecode || ': ' || filename EN_DISPLAY,
       filecode LSTODR 
FROM filemaster WHERE DELTD<>'Y' AND eori='T'  and CMDCODE = '" & Me.ModuleCode & "' ORDER BY filecode

select * from filemaster where cmdcode IN ('FA','SB') ;


Select M.CMDID CMDID, M.PRID PRID, FILEMAP.FILECODE || ': ' || FILEMAP.FILENAME CMDNAME, 
       FILEMAP.FILECODE || ': ' || FILEMAP.FILENAME EN_CMDNAME, 
       M.LEV LEV, M.LAST LAST, decode(M.LAST, 'Y', 3, 'N', 0) IMGINDEX, M.MODCODE MODCODE, M.OBJNAME OBJNAME,
       'T' MENUTYPE,
       M.AUTHCODE AUTHCODE, 'YYYY' STRAUTH,
       FILEMAP.TLTXCD,M.MNVIEWCODE, M.MNVIEWTYPE, 'M' TXTYPE
     from CMDMENU M,
          (SELECT FILECODE, FILENAME, CMDCODE,
                 DECODE (FILECODE,'I007','9205','I008','9206','I009','9207','I012','9228','I013','9229','I018','9289','I021','9362',
                         'I022','9362','I023','9362','I043','','I044','9298','I061','9297','I062','9295','I063','','I064','9362','I065','9362',
                         'I066','9362','I067','9362','I077','9362','I080','9422','I081','9362')
                 TLTXCD
          FROM filemaster where cmdcode IN ('FA','SB') ) FILEMAP
     WHERE FILEMAP.TLTXCD IS NOT NULL AND LENGTH(FILEMAP.TLTXCD) > 0
           AND M.cmdid in ('924050','929105') And M.Modcode = FILEMAP.CMDCODE
           
           
select * from cmdauth;
