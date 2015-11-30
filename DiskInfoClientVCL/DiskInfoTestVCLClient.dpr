program DiskInfoTestVCLClient;

uses
  Forms,
  ufrmTestDiskInfoClientMain in 'ufrmTestDiskInfoClientMain.pas' {frmTestDiskInfoClientMain},
  uDiskInfoService_Intf in 'uDiskInfoService_Intf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestDiskInfoClientMain, frmTestDiskInfoClientMain);
  Application.Run;
end.
