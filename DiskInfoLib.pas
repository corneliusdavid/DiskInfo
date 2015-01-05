namespace DiskInfoLib;

interface

type
  IDiskInfo = public interface
    method CurrentDiskName: String;
    method DiskType(DiskName: String := ''): String;
    method VolumeName(DiskName: String := ''): String;
    method TotalDiskSize(DiskName: String := ''): Int64;
    method TotalDiskFree(DiskName: String := ''): Int64;
  end;

  DiskInfo = public class(IDiskInfo)
  public
    method CurrentDiskName: String;
    method DiskType(DiskName: String := ''): String;
    method VolumeName(DiskName: String := ''): String;
    method TotalDiskSize(DiskName: String := ''): Int64;
    method TotalDiskFree(DiskName: String := ''): Int64;
  end;
  
implementation

uses
  System.IO;

method DiskInfo.CurrentDiskName: String;
begin
  result := Path.GetPathRoot(Directory.GetCurrentDirectory);
end;

method DiskInfo.DiskType(DiskName: String := ''): String;
var
  di: DriveInfo;
begin
  if DiskName.Length = 0 then
    di := new DriveInfo(CurrentDiskName)
  else
    di := new DriveInfo(DiskName);

  case di.DriveType of
    DriveType.CDRom:
      result := 'CDROM';
    DriveType.Fixed:
      result := 'Fixed';
    DriveType.Network:
      result := 'Network';
    DriveType.Ram:
      result := 'RAM';
    DriveType.Removable:
      result := 'Removable';
    else 
      result := 'unknown';
  end;
end;

method DiskInfo.VolumeName(DiskName: String := ''): String;
var
  di: DriveInfo;
begin
  if DiskName.Length = 0 then
    di := new DriveInfo(CurrentDiskName)
  else
    di := new DriveInfo(DiskName);

  result := di.VolumeLabel;
end;

method DiskInfo.TotalDiskSize(DiskName: String := ''): Int64;
var
  di: DriveInfo;
begin
  if DiskName.Length = 0 then
    di := new DriveInfo(CurrentDiskName)
  else
    di := new DriveInfo(DiskName);

  result := di.TotalSize;
end;

method DiskInfo.TotalDiskFree(DiskName: String := ''): Int64;
var
  di: DriveInfo;
begin
  if DiskName.Length = 0 then
    di := new DriveInfo(CurrentDiskName)
  else
    di := new DriveInfo(DiskName);

  result := di.TotalFreeSpace;
end;

end.
