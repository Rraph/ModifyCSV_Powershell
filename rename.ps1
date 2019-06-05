# ================================================================== #
#                          AUTHOR : RAPHAEL BEGHIN                   #
#                          NAME : rename.ps1                         #
#                          DATE : 05/06/2019                         #
#  FONCTION : remet en forme les prénom et nom des users dans un csv #
# ================================================================== #

# Variables
$path = "Your .csv file"
$path_2 = "Your new .csv file"
$users = Import-Csv -Path $path -Delimiter ";" -Header FirstName, Name

# loop which modify firstname in CamelCase and Name in Upper
foreach($user in $users)
{
    $user.FirstName = $user.FirstName.replace($user.Firstname, (Get-Culture).TextInfo.ToTitleCase($user.FirstName))
    $user.Name = $user.Name.replace($user.Name, $user.Name.ToUpper())
}
$users | Export-Csv $path_2 -NoTypeInformation -Encoding UTF8 #modify file export