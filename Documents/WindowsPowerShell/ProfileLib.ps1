Function cs($expr) {
	$ClassName = "Test" + (Get-Random)
	Add-Type -TypeDefinition @"
using System;

public class $ClassName { 
	public void test() { 
		Console.WriteLine($expr);
	}
}
"@
	(New-Object $ClassName).test()
}

Function AppendUserPath($path) {
    if (-not (Test-Path $path)) {
        Write-Error "AppendUserPath: $path does not exist!"
        return
    }
    $oldpath = [Environment]::GetEnvironmentVariable("PATH", "User")
    if ($oldpath -ne $null) {
        if ($oldpath.Contains($path)) {
            $path = $oldpath
        } else {
            $path = $oldpath + ";" + $path
        }
    }
    [Environment]::SetEnvironmentVariable("PATH", $path, "User")
}

Function SetupEnv() {
    AppendUserPath 'C:\Program Files (x86)\Putty'
    AppendUserPath 'C:\Program Files (x86)\Vim\vim73'
    [Environment]::SetEnvironmentVariable("GIT_SSH", "plink", "User")
}

Set-Alias vi gvim
