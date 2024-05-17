# Q.2.1
# Pour récupérer les scripts du serveur vers le client, nous pouvons passer par la Connexion Bureau A Distance
# Une fois connecté sur la serveur via la connexion à distance, faire clic-droit -> Copier sur le dossier Scripts, puis le coller dans le repertoire C:/ sur le PC client.

# Q.2.2

# Lors de l'éxécution du script `Main.ps1`, une fenêtre s'ouvre puis se ferme directement

# Comme le chemin du fichier AddLocalUsers.ps1 n'est pas bon, nous allons modifier la ligne de commande : 
# Start-Process -FilePath "powershell.exe" -ArgumentList "C:\Temp\AddLocalUsers.ps1" -Verb RunAs -WindowStyle Maximized
# par
# Start-Process -FilePath "powershell.exe" -ArgumentList "C:\Scripts\AddLocalUsers.ps1" -Verb RunAs -WindowStyle Maximized

# Q.2.3

# L'option `-Verb RunAS` permet de lancer le programme avec des privilèges plus elevés, dans ce cas, avec des privilèges d'administrateur

# Q.2.4

# L'option `-WindowStyle Maximized` permet de lancer le programme dans une fenêtre agrandie, comme lorsque l'on clique sur le carré en haut à droite d'une fenêtre.

# Q.2.5

# Le 1er utilisateur du fichier Users.csv n'est jamais pris en compte à cause de la ligne suivante : 
# $Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description","mail","mobile","scriptPath","telephoneNumber" -Encoding UTF8  | Select-Object -Skip 2
# Le paramètre "-Skip 2"  la fin de la ligne spécifie d'ignorer les deux premières lignes du fichier Users.csv, et comme la deuxième ligne correspond au 1er utilisateur, il ne sera pas pris en compte
# Pour résoudre ce souci, nous allons remplacer le paramètre "-Skip 2" par "-Skip 1" : 
# # $Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description","mail","mobile","scriptPath","telephoneNumber" -Encoding UTF8  | Select-Object -Skip 1

# Q.2.6

# Le champ Description est importé mais non utilisé à cause de la ligne de commande suivante : 
# $Description = "$($user.description) - $($User.fonction)"
# Dans la ligne ci-dessus, la variable $Description prends en compte les champs decription" et "fonction"

# Pour utiliser la champ "fonction", nous allons modifier cette ligne de cette manière : 
# $Description = $($User.description)
# Puis ajouter une ligne sous $UserInfo : 
# Description = "$Description"

# Q.2.7

# Seuls les champs "Prénom", "Nom", et "Decription" sont utilisés
# Nous pouvons donc modifier la ligner suivante : 
# $Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description","mail","mobile","scriptPath","telephoneNumber" -Encoding UTF8  | Select-Object -Skip 1
# par
# $Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description" -Encoding UTF8  | Select-Object -Skip 1

# Q.2.8

# Pour afficher le mot de passe en clair et en vert lors de l'éxécution du script, nous allons modifier la ligne suivante : 
# Write-Host "L'utilisateur $Prenom.$Nom a été crée"
# par
# Write-Host "L'utilisateur $Prenom.$Nom a été crée avec le mot de passe $Pass" -ForegroundColor Green

# Q.2.9
# Copier le contenu du fichier Functions.ps1 en dessous de la 1ère ligne du script AddLocalUsers.ps1
# Le contenu de la fonction Log doit être modifié de cette façon : 


function Log
{
    param([string]$Content) -> Suppression du paramètre "$FilePath"
    $FilePath = "C:\Scripts\log.txt" -> Ligne ajoutée pour définir un fichier de sortie qui s'appellera "log.txt" situé dans le dossier C:\Scripts\
    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath))
    {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}

# Puis ajouter la ligne suivante à la fin du script : 
Log -Content "Création d'utilisateurs"

# Q.2.10
# Ajout de ce bloc de code dans  "foreach ($User in $Users)
    }
    else
    {
    Write-Host = "L'utilisateur $Prenom.$Nom existe déjà" -ForegroundColor Red
    }

# Q.2.11
# La ligne Add-LocalGroupMember -Group "Utilisateur" -Member "$Prenom.$Nom" compte une erreur, il faut ajouter un "s" à "Utilisateur"
# La bonne ligne est donc : Add-LocalGroupMember -Group "Utilisateurs" -Member "$Prenom.$Nom"

# Q.2.12
# Voici la partie du code avec la variable $Name 
foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Name" -ErrorAction SilentlyContinue))
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($User.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Name"
            FullName             = "$Name"
            Description          = "$Description"
            Password             = $Password
            AccountNeverExpires  = $true
            PasswordNeverExpires = $false
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Name"
        Write-Host "L'utilisateur $Name a été crée avec le mot de passe $Pass" -ForegroundColor Green
    }
    else
    {
    Write-Host = "L'utilisateur $Name existe déjà" -ForegroundColor Red
    }
}

# Q.2.13
# Remplacer la ligne suivante : 
PasswordNeverExpires = $false
# par
PasswordNeverExpires = $true

# Q.2.14
# Remplacer la ligne suivante : 
Function Random-Password ($length = 6)
# par
Function Random-Password ($length = 12)

# Q.2.15
# Remplacer la ligne suivante : 
Start-Sleep -Seconds 10
# par
Read-Host "Appuyez sur Entrée pour continuer ... "

# Q.2.16
# La fonction ManageAccentsAndCapitalLetters permet d'ignorer les lettres majuscules et les lettres avec les accents, comme, par exemple, cette commande : 
$Description = "$($user.description) - $($User.fonction)"

# Le script AddLocalUsers.ps1  la fin de l'exercice est le suivant : 


Write-Host "--- Début du script ---"

function Log
{
    param([string]$Content)
    $FilePath = "C:\Scripts\log.txt"
    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath))
    {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}
Function Random-Password ($length = 12)
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description" -Encoding UTF8  | Select-Object -Skip 1

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Name" -ErrorAction SilentlyContinue))
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($user.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Name"
            FullName             = "$Name"
            Description          = "$Description"
            Password             = $Password
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Name"
        Write-Host "L'utilisateur $Name a été crée avec le mot de passe $Pass" -ForegroundColor Green
    }
    else
    {
    Write-Host = "L'utilisateur $Name existe déjà" -ForegroundColor Red
    }
}
Log -Content "Création d'utilisateurs"
pause
Write-Host "--- Fin du script ---"
Read-Host "Appuyez sur Entrée pour continuer ... " 






