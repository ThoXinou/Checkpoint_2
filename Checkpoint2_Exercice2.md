# Exercice 2

## Q.2.1

Pour récupérer les scripts du serveur sur le client, nous allons passer par la Connexion Bureau A Distance : 

![2024-05-17 10_41_58-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/11fca645-f635-4d3c-9992-d8b201577ec5)

![2024-05-17 10_44_26-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/8058e095-6614-49ec-bb7a-be430afb882b)

![2024-05-17 10_46_40-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/8b77231d-4d38-4239-91e6-1000d3557db0)

![2024-05-17 10_47_10-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/24d629de-50d0-4f28-9dd3-01fcde9bab86)

## Q.2.2

Lors de l'éxécution du script `Main.ps1`, une fenêtre s'ouvre puis se ferme directement

Comme le chemin du fichier AddLocalUsers.ps1 n'est pas bon, nous allons modifier la ligne de commande : 

```powershell
Start-Process -FilePath "powershell.exe" -ArgumentList "C:\Temp\AddLocalUsers.ps1" -Verb RunAs -WindowStyle Maximized
```

par

```powershell
Start-Process -FilePath "powershell.exe" -ArgumentList "C:\Scripts\AddLocalUsers.ps1" -Verb RunAs -WindowStyle Maximized
```


## Q.2.2

L'option `-Verb RunAS` permet de lancer le programme avec des privilèges plus elevés, dans ce cas, avec des privilèges d'administrateur

## Q.2.3

L'option `-WindowStyle Maximized` permet de lancer le programme dans une fenêtre agrandie, comme lorsque l'on clique sur le carré en haut à droite d'une fenêtre.


