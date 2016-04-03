namespace DiskInfoLibConsoleTest;

interface

uses
  DiskInfoLib;

type
  DiskInfoConsoleTestApp = class
  public
    class method Main(args: array of String);
  end;

implementation

class method DiskInfoConsoleTestApp.Main(args: array of String);
var
  di: DiskInfo := new DiskInfo;
  free_space, total_space: Int64;
begin
  Console.WriteLine('Current drive = {0}', di.CurrentDiskName);
  Console.WriteLine('Volume label = {0}', di.VolumeName(di.CurrentDiskName));
  total_space := di.TotalDiskSize(di.CurrentDiskName) / 1024 / 1024;
  free_space := di.TotalDiskFree(di.CurrentDiskName) / 1024 / 1024;
  if (total_space > 99999) and (free_space > 99999) then
    Console.WriteLine('Free Space = {0} GB / {1} GB', free_space / 1024, total_space / 1024)
  else
    Console.WriteLine('Free Space = {0} MB / {1} MB', free_space, total_space);
  Console.WriteLine;

  Console.Write('Press Enter... ');
  Console.ReadLine;
end;

end.
