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
# Copier le contenu du fichier Functions.ps1 en dessous de la 1ère ligne du script AddLocalUsers.ps1, puis ajouter "Log" avant la dernière accolade du script



