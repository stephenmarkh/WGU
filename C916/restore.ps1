# Author: Stephen Henderson, Student ID: #000815615
try
{
    $FinanceOU='OU=finance,DC=ucertify,dc=com'
    if (Get-AdOrganizationalUnit -Filter "distinguisedName -eq '$FinanceOU'") {
      Write-Host "WARN: finance OU already exists"
    } else {
      New-AdOrganizationalUnit -Name "finance"
    }
	$ADUsers = Import-csv .\financePersonnel.csv
	foreach ($User in $ADUsers)
	{
	    # Some comment goes here
		$FirstName = $User.First_Name
        $LastName = $User.Last_Name
        $PostalCode = $User.PostalCode
        $MobilePhone = $User.MobilePhone
        $OfficePhone = $User.OfficePhone
    
        New-ADUser `
        -Name "$FirstName $Lastname" `
        -Surname "$LastName" `
        -GivenName "$FirstName" `
		-DisplayName "$Firstname $Lastname" `
		-OfficePhone $OfficePhone `
		-MobilePhone $MobilePhone `
        -Path "OU=finance,dc=ucertify,dc=com"
	}
}
catch [System.OutOfMemoryException]
{
Break
}
