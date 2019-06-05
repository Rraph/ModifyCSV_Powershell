# ================================================================== #
#                       AUTHOR : RAPHAEL BEGHIN                      #
#                         NAME : rename.ps1                          #
#                         DATE : 05/06/2019                          #
#                          VERSION : v 1.3                           #
#          FUNCTION : change users format in some csv file           #
# ================================================================== #

# Variables
$ErrorActionPreference = "silentlycontinue"
$path = Read-host "Entrez CORRECTEMENT le chemin du fichier csv a modifie"
$users = Import-Csv -Path $path -Delimiter ";" -Header FirstName, Name

# loop which modify firstname in CamelCase and Name in Upper
foreach($user in $users)
{
    $user.FirstName = $user.FirstName.replace($user.Firstname, (Get-Culture).TextInfo.ToTitleCase($user.FirstName))
    $user.Name = $user.Name.replace($user.Name, $user.Name.ToUpper())
}
$path_2 = Read-host "Entrez le chemin ou s'enregistrera le fichier csv modifie"

# NULL case error gestion
if ($error.Count -ieq 0){
	Write-Host "Tout est Ok" -f Green
}
else{
    Write-Host "Des erreurs d'execution liees a des cases vides dans le fichier ont eu lieu. Elles n'ont pas fraine la bonne execution du script" -f Yellow
}

# File export
$users | Export-Csv $path_2 -NoTypeInformation -Encoding UTF8