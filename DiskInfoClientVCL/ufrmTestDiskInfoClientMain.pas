unit ufrmTestDiskInfoClientMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uDiskInfoService_Intf, uROSOAPMessage, uROMessage, uROBinMessage,
  uROBaseConnection, uROTransportChannel, uROBaseHTTPClient, uROIndyHTTPChannel,
  uROComponent, uROChannelAwareComponent, uRORemoteService,
  uROWinInetHttpChannel;

type
  TfrmTestDiskInfoClientMain = class(TForm)
    edtServiceURL: TLabeledEdit;
    btnGetServerTime: TButton;
    btnGetCurrDiskType: TButton;
    btnGetCurrDiskName: TButton;
    btnGetCurrVolName: TButton;
    btnGetCurrDiskSize: TButton;
    btnGetCurrDiskFree: TButton;
    lbResults: TListBox;
    Label1: TLabel;
    RORemoteService: TRORemoteService;
    ROBinMessage: TROBinMessage;
    ROWinInetHTTPChannel: TROWinInetHTTPChannel;
    procedure btnGetServerTimeClick(Sender: TObject);
    procedure btnGetCurrDiskTypeClick(Sender: TObject);
    procedure btnGetCurrDiskNameClick(Sender: TObject);
    procedure btnGetCurrVolNameClick(Sender: TObject);
    procedure btnGetCurrDiskSizeClick(Sender: TObject);
    procedure btnGetCurrDiskFreeClick(Sender: TObject);
  private
    procedure AddResults(const NewResult: string);
  end;

var
  frmTestDiskInfoClientMain: TfrmTestDiskInfoClientMain;

implementation

{$R *.dfm}

uses
  StrUtils;

procedure TfrmTestDiskInfoClientMain.AddResults(const NewResult: string);
begin
  lbResults.Items.Add(NewResult);
  lbResults.ItemIndex := lbResults.Items.Count - 1;
end;

procedure TfrmTestDiskInfoClientMain.btnGetCurrDiskFreeClick(Sender: TObject);
var
  disk_services: IDiskInfoService;
  curr_disk_name: AnsiString;
  disk_free: Int64;
  mb, gb: Int64;
begin
  ROWinInetHTTPChannel.TargetUrl := edtServiceURL.Text;
  disk_services := RORemoteService as IDiskInfoService;
  curr_disk_name := disk_services.CurrentDiskName;
  disk_free := disk_services.TotalDiskFree(curr_disk_name);
  mb := disk_free div 1024;
  gb := mb div 1024 div 1024;
  AddResults(Format('Current Disk Free: %d bytes, %d MB, %d GB', [disk_free, mb, gb]));
end;

procedure TfrmTestDiskInfoClientMain.btnGetCurrDiskNameClick(Sender: TObject);
begin
  ROWinInetHTTPChannel.TargetUrl := edtServiceURL.Text;
  AddResults('Current Disk Name: ' + (RORemoteService as IDiskInfoService).CurrentDiskName);
end;

procedure TfrmTestDiskInfoClientMain.btnGetCurrDiskSizeClick(Sender: TObject);
var
  disk_services: IDiskInfoService;
  curr_disk_name: AnsiString;
  disk_size: Int64;
  mb, gb: Int64;
begin
  ROWinInetHTTPChannel.TargetUrl := edtServiceURL.Text;
  disk_services := RORemoteService as IDiskInfoService;
  curr_disk_name := disk_services.CurrentDiskName;
  disk_size := disk_services.TotalDiskSize(curr_disk_name);
  mb := disk_size div 1024;
  gb := mb div 1024 div 1024;
  AddResults(Format('Current Disk Size: %d bytes, %d MB, %d GB', [disk_size, mb, gb]));
end;

procedure TfrmTestDiskInfoClientMain.btnGetCurrDiskTypeClick(Sender: TObject);
var
  disk_services: IDiskInfoService;
  curr_disk_name: AnsiString;
begin
  ROWinInetHTTPChannel.TargetUrl := edtServiceURL.Text;
  disk_services := RORemoteService as IDiskInfoService;
  curr_disk_name := disk_services.CurrentDiskName;
  AddResults('Current Disk Type: ' + disk_services.DiskType(curr_disk_name));
end;

procedure TfrmTestDiskInfoClientMain.btnGetCurrVolNameClick(Sender: TObject);
var
  disk_services: IDiskInfoService;
  curr_disk_name: AnsiString;
begin
  ROWinInetHTTPChannel.TargetUrl := edtServiceURL.Text;
  disk_services := RORemoteService as IDiskInfoService;
  curr_disk_name := disk_services.CurrentDiskName;
  AddResults('Current Volume Name: ' + disk_services.VolumeName(curr_disk_name));
end;

procedure TfrmTestDiskInfoClientMain.btnGetServerTimeClick(Sender: TObject);
var
  dt: TDateTime;
begin
  ROWinInetHTTPChannel.TargetUrl := edtServiceURL.Text;
  dt := (RORemoteService as IDiskInfoService).GetServerTime;

  AddResults('Server time is: ' +
               FormatDateTime('yyyy-mmm-dd hh:nn:ss', dt));
end;

end.
