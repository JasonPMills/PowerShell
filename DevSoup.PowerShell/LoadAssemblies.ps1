
function Load-DLL($PartialName){
	Write-Host "Loading" $PartialName
	$loadDll = [System.Reflection.Assembly]::LoadWithPartialName($PartialName);
	return $loadDll -ne $null
}

function Add-Assemblies($assemblies)
{		
	$assemblies | Foreach-Object {
		$result = Load-DLL $_
		if($result -eq $null){
			Write-Host "Error Loading" $_
		}
	}
}

$assemblies = "Microsoft.SharePoint.Client", "Microsoft.SharePoint.Client.Runtime", "Microsoft.SharePoint.Client.DocumentManagement.dll";
Add-Assemblies $assemblies

