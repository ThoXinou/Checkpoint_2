# Exercice 1

## Q.1.1

Le ping entre le serveur et le client ne fonctionne pas et retourne une erreur :

![2024-05-17 09_21_24-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/3e77a5a2-386e-42d8-8f6d-841f44219079)

Cela signifie que le serveur envoie un paquet à destination du client, mais ne reçoit pas de réponse : Le serveur et le client ne sont donc pas sur le même réseau

Nous allons donc modifier l'adresse IP du client afin que celui-çi et le serveur soient sur le même réseau

Comme l'adresse IP du serveur est `172.16.10.10/24`, nous pouvons prendre par exemple l'adresse IP `172.16.10.11/24` pour le client (Comme le serveur a une adresse IP en `/24`, seul le dernier octet de l'adresse IP peut être modifié)

![2024-05-17 09_26_12-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/29bc364e-2ddf-4cbe-a141-8dc7ba60a712)

![2024-05-17 09_27_21-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/9ee05c45-e24e-4588-a189-3a02cb1fe309)

Une fois la modification effectuée, nous pouvons relancer un ping entre le serveur et le client : 

![2024-05-17 09_28_14-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/68a23cfe-385b-4be6-ae70-dee234d41f4d)

Cette-fois-ci, le ping fonctionne, le serveur et le client sont donc dorénavant sur le même réseau !

## Q.1.2

Nous allons commencer par récupérer le nom de la machine client, qui est `Client1`

![2024-05-17 09_47_13-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/29082441-4a2b-4919-ba03-163f247c935f)

Nous allons ensuite exécuter la commande ping avec le nom de machine client, depuis le serveur :
```cmd
ping Client1
```

![2024-05-17 09_49_04-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/e11746c7-4cf4-4a21-9c3e-1925fc71235d)

Nous remarquons que, cette fois-çi, le ping se fait depuis les adresses `IPv6`. Ceci est dû aux préférences du système d'exploitation à utiliser l'`IPv6` au lieu de l'`IPv4`.

## Q.1.3

Nous désactivons l'`IPv6` sur le client : 

![2024-05-17 09_53_07-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/4104e9be-227f-4806-805d-cb66622f6cab)

Nous relançons un ping depuis le serveur avec la même commande que précédemment : 

![2024-05-17 09_55_12-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/70691f0b-c9c8-4a89-ba13-db5afcb53010)

Nous remarquons que, cette fois-ci, ce sont les adresses `IPv4` qui ont été prises en compte, aucune autre modification n'a été nécéssaire

## Q.1.4

En ce qui concerne le DHCP, nous remarquons que le rôle DHCP est dejà actif et configuré sur le serveur : 

![2024-05-17 09_59_31-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/2711264f-864b-4ff9-a7ad-d03898337349)

Nous allons juste modifier la configuration IP du client : 

![2024-05-17 10_00_29-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/706ddbba-7b5b-44bb-8259-94110a6cbeed)

Puis nous allons vérifier que cette modification a fonctionné : 

![2024-05-17 10_01_47-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/f1934c23-43c8-43ab-ae2d-45f2c1fc9691)

La nouvelle adresse IP du client a donc été attribué via le DHCP, et est maintenant `172.16.10.20`









