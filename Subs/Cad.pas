unit Cad;
 
 interface 
 uses windows; 
 
 function RegisterServiceProcess(dwProcessID, dwType: Integer): Integer; 
 stdcall; external 'KERNEL32.DLL'; 
 function ShowHideInCad(ProcessID: Integer; Show: Boolean): boolean;
 function TakeProcessID(WindowTitle: string): Integer; 
 function TakeMyApplicationProcessID: Integer; 
 
 implementation 
 
 //Получение дескриптора процесса любого окна, по заголовку этого окна 
 
 function TakeProcessID(WindowTitle: string): Integer; 
 var 
 WH: THandle; 
 begin 
 result := 0; 
 WH := FindWindow(nil, pchar(WindowTitle)); 
 if WH <> 0 then 
  GetWindowThreadProcessID(WH, @Result); 
 end; 
 
 //Получение дескриптора процесса собственного приложения 
 
 function TakeMyApplicationProcessID: Integer; 
 begin 
 Result := GetCurrentProcessID; 
 end; 
 
 //Отображение/Скрытие процесса в CTRL+ALT+DEL 
 
 function ShowHideInCAD(ProcessID: Integer; Show: Boolean): Boolean; 
 begin 
 result := true; 
 try 
  //если show = true , то отображаем процесс в CAD, иначе - прячем 
  if Show = True then 
  RegisterServiceProcess(ProcessID, 0) 
  else 
  RegisterServiceProcess(ProcessID, 1); 
 except result := false; 
 end; 
 end; 
 
 end.


 