// 2>nul||goto :start
/*
:start
@echo off
cls
set "csc="
for /r "%SystemRoot%\Microsoft.NET\Framework\" %%# in ("*csc.exe") do set "csc=%%#"

if not exist "%csc%" echo Can't find NET.Framework&&exit

call %csc% /nologo /warn:0 /out:"%UserProfile%\%~n0.exe" "%~dpsfnx0"
call "%UserProfile%\%~n0.exe%"

::call %csc% /nologo /warn:0 /out:"%TEMP%\%~n0.exe" "%~dpsfnx0"
::call "%TEMP%\%~n0.exe%"
::del "%TEMP%\%~n0.exe%">nul
exit
*/

using System;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Windows.Forms;

namespace Gosha{
    public class Program{

        [DllImport("kernel32.dll")]
        static extern IntPtr GetConsoleWindow();

        [DllImport("user32.dll")]
        static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

        private static void CMDHIDE(){
            var cmdbatexe = GetConsoleWindow();
            ShowWindow(cmdbatexe, 0);
        }
        
        private static void Main(string[] args){CMDHIDE();
            
            MessageBox.Show("Привет Мир");
            
        }

        


    }


}