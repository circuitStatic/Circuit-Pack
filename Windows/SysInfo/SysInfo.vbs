strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colBIOS = objWMIService.ExecQuery _
    ("Select * from Win32_BIOS")
For each objBIOS in colBIOS
    Wscript.Echo "Manufacturer: " & objBIOS.Manufacturer
    Wscript.Echo "Name: " & objBIOS.Name
    Wscript.Echo "Release Date: " & objBIOS.ReleaseDate
    Wscript.Echo "Service Tag: " & objBIOS.SerialNumber
    Wscript.Echo "Version: " & objBIOS.Version
    Wscript.Echo "Status: " & objBIOS.Status
    Next
