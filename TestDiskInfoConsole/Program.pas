namespace TestDiskInfoConsole;

interface

uses
  System.Linq;

type
  ConsoleApp = class
  public
    class method Main(args: array of String);
  end;

implementation

uses
  DiskInfoLibrary;

class method ConsoleApp.Main(args: array of String);
var
  di: DiskInfoLib := new DiskInfoLib;
begin
  Console.WriteLine('DiskInfo tests...');
  Console.WriteLine;

  Console.WriteLine('Current disk: ' + di.CurrentDiskName);
  Console.WriteLine('Disk label: ' + di.VolumeName);
  Console.WriteLine('Disk type: ' + di.DiskType);
  Console.WriteLine('Disk size: ' + di.TotalDiskSize.ToString + ' or ' + (di.TotalDiskSize / 1024 / 1024).ToString + ' MB');
  Console.WriteLine('Disk free: ' + di.TotalDiskFree.ToString + ' or ' + (di.TotalDiskFree / 1024 / 1024).ToString + ' MB');

  Console.WriteLine;
  Console.Write('Press ENTER...');

  Console.ReadLine;
end;

end.
