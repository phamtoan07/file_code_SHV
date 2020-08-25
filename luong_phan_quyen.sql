select * from cmdauth where authid = '0002';
--====Luồng phân quyền (source)
--(*) FillData()
  -- mv_strFuncAuth: biến lưu chuỗi quyền menu của user, gán tại FillData()
  -- hFunctionFilter.Add : Add menu đc phân quyền của user
  -- mv_strFuncAuth_user: tương tự mv_strFuncAuth
  -- hFunctionFilterForGR: Add menu đc phân quyền của user thông qua group
  
--(*) X_FillTransData()
  -- hTLTXworkfollow.Add: lấy tltxwf của gd
  -- hTLTXDesc.Add: lấy txdesc của GD
  -- hTLTXFilter.Add: lấy gd đc phân quyền của user
  -- mv_strTLTXAuth: chuỗi quyền giao dịch của user
  -- mv_strTLTXAuth_user: chuỗi quyền giao dịch của user
  -- hChildrenFilter: child menu
  -- hTLTXFilterForGr: Add tltx đc phân quyền của user thông qua group

--(*) FillRptData() -> Lấy danh sách report phân quyền
  -- hReportFilter.Add: Add report đc phân quyền
  -- mv_strReportAuth: chuỗi quyền report
  -- mv_strReportAuth_user
  -- hChildrenFilter: child menu report
  -- hReportFilterForGr.Add:

--(*) LoadTreeMenu()
  -- GetTreeMenuAll():
     -- + lấy cây menu toàn hệ thống, add menu vào mảng arrTreeMenuFunction
     -- + hTreeMenuFunction: add menu vào
     -- + hTLTXMenuList: add list tltx ứng vs cmdmenu
  -- BindObjectToTreeNode(): Tạo case menu với node parent/child
     -- + chú ý đoạn build strMenuKey -> màu case menu
  -- arrTreeNode.Add: add node vs từng menu
  
--(*) Menu_Click() -> click vào cây menu
  -- ShowAccessRight(): Show các nút phân quyền
  
--(*) X_TransCheckbox_CheckedChanged: Sự kiện click vào checkbox của quyền approve, create (GD)
  -- --> X_DoTransCheckboxChange
  -- --> X_ReplaceTransAllow: build cmdallow
  -- --> X_DoTransEditTLTXFilter: build mv_strTLTXAuth, mv_strTLTXAuth_user, remove giá trị cũ, add gt mới hTLTXFilter
  
--(*) ckbGNRACC_CheckedChanged: Access click
  -- --> DoGnrAccessCheckedChangedMenuGroup -> GnrAccessCheckbox_CheckedChanged -> DoGNRACCCheckboxChange
--(*) ckbGNRACC_Click: Access click
  -- --> DoGnrCheckedChangedMenuGroup       -> GnrCheckbox_CheckedChanged       -> DoGnrCheckboxChange (mv_strFuncAuth)

-- v_strCmdInquiryFunc AddChildAdjustMenu ChangeImageIndex 
-- X_EnableTransAssignment, EnableGnrTranAssignment, EnableFuncTranAssignment



Select M.CMDID CMDID, M.LEV LEV, A.CMDALLOW CMDALLOW, A.STRAUTH STRAUTH 
from CMDMENU M, CMDAUTH A 
where M.CMDID = A.CMDCODE and A.AUTHTYPE = 'G' and A.CMDALLOW = 'Y' and A.AUTHID = '0002' and A.CMDTYPE = 'M'
order by M.CMDID
