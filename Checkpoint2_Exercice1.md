# Exercice 1

## Q.1.1

Le ping entre le seveur et le client ne fonctionne pas et retourne une erreur :

![2024-05-17 09_21_24-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/3e77a5a2-386e-42d8-8f6d-841f44219079)

Cela signifie que le serveur envoie un paquet à destination du client, mais ne reçoit pas de réponse : Le serveur et le client ne sont donc pas sur le même réseau

Nous allons donc modifier l'adresse IP du client afin que celui-çi et le serveur soient sur le même réseau

Comme l'adresse IP du serveur est 172.16.10.10/24, nous pouvons prendre par exemple l'adresse IP 172.16.10.11/24 pour le client (Comme le serveur a une adresse IP en /24, seul le dernier octet de l'adresse IP peut être modifié)

![2024-05-17 09_26_12-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/29bc364e-2ddf-4cbe-a141-8dc7ba60a712)

![2024-05-17 09_27_21-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/9ee05c45-e24e-4588-a189-3a02cb1fe309)

Une fois la modification effectuée, nous pouvons relancer un ping entre le serveur et le client : 

![2024-05-17 09_28_14-VirtualBoxVM](https://github.com/ThoXinou/Checkpoint_2/assets/159007018/68a23cfe-385b-4be6-ae70-dee234d41f4d)

Cette-fois-ci, le ping fonctionne, le serveur et le client sont donc dorénavant sur le même réseau !
