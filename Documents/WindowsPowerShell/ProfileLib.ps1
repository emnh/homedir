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

Function SetupEnv() {
    [Environment]::SetEnvironmentVariable("GIT_SSH", "plink", "User")
}

Set-Alias vi gvim
