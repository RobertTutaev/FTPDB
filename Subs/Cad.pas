unit Cad;
 
 interface 
 uses windows; 
 
 function RegisterServiceProcess(dwProcessID, dwType: Integer): Integer; 
 stdcall; external 'KERNEL32.DLL'; 
 function ShowHideInCad(ProcessID: Integer; Show: Boolean): boolean;
 function TakeProcessID(WindowTitle: string): Integer; 
 function TakeMyApplicationProcessID: Integer; 
 
 implementation 
 
 //��������� ����������� �������� ������ ����, �� ��������� ����� ���� 
 
 function TakeProcessID(WindowTitle: string): Integer; 
 var 
 WH: THandle; 
 begin 
 result := 0; 
 WH := FindWindow(nil, pchar(WindowTitle)); 
 if WH <> 0 then 
  GetWindowThreadProcessID(WH, @Result); 
 end; 
 
 //��������� ����������� �������� ������������ ���������� 
 
 function TakeMyApplicationProcessID: Integer; 
 begin 
 Result := GetCurrentProcessID; 
 end; 
 
 //�����������/������� �������� � CTRL+ALT+DEL 
 
 function ShowHideInCAD(ProcessID: Integer; Show: Boolean): Boolean; 
 begin 
 result := true; 
 try 
  //���� show = true , �� ���������� ������� � CAD, ����� - ������ 
  if Show = True then 
  RegisterServiceProcess(ProcessID, 0) 
  else 
  RegisterServiceProcess(ProcessID, 1); 
 except result := false; 
 end; 
 end; 
 
 end.


 