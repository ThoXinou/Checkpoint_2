# Exercice 3

## Q.3.1

Le matériel réseau A est un switch (ou commutateur), situé sur la couche 2 du modèle OSI
Son rôle est de pemettre à tous les ordinateurs reliés à lui de communiquer entre eux

## Q.3.2
Le matériel B est un routeur, situé sur la couche 3 du modèle OSI
Il permet aux ordinateurs situés sur le réseau 10.10.0.0/16 de communiquer sur le réseau 10.12.2.0/24, et également de de communiquer sur le réseau 172.16.5.0/24 via le routeur R2

## Q.3.3
f0/0 et g1/0 représentent les interfaces du routeur

## Q.3.4
Le /16 correspond au CIDR, cela indique que son masque de sous réseau est 255.255.0.0

## Q.3.5
L'adresse 10.10.255.254 est l'adresse d'une des interfaces du routeur B, il sert de passerelle au PC2 pour communiquer avec les hôtes situés en dehors de la plage réseau 10.10.0.0/16

## Q.3.6
| | Adresse de réseau | Première adresse disponible | Dernière adresse disponible | Adresse de diffusion (Broadcast) |
| -- | -- | -- | -- | -- |
| PC1 | 10.10.0.0/16 | 10.10.0.1 | 10.10.255.254 | 10.10.255.555 |
| PC2 | 10.11.0.0/16 | 10.11.0.1 | 10.11.255.254 | 10.11.255.555 |
| PC5 | 10.10.0.0/15 | 10.10.0.1 | 10.11.255.254 | 10.11.255.555 |

## Q.3.7
Les ordinateurs qui peuvent communiquer entre eux sont : PC1, PC3, PC4, et PC5; situés sur le même réseau 10.10.0.0/16
Suite à la question précédente, nous pouvons aussi dire que le PC2 ne peux communiquer qu'avec le PC5 (Même adresse de braodcast)

## Q.3.8
Les ordinateurs étant tous reliés sur le routeur, les 5 PC pourront atteindre le réseau 172.16.5.0/24

## Q.3.9
Aucune incident lors de l'inversion de ports, les ordinateurs étant sur le même réseau.

## Q.3.10
Il suffit de mettre en place un serveur DHCP.

## Q.3.11
L'adresse MAC qui intialise la connexion est 00:50:79:66:68:00, il s'agit de PC1.

## Q.3.12
Oui la communication a réussi, Il s'agit d'un ping entre PC1 et PC4

## Q.3.13
Comme il s'agit d'un ping, le "request" et le "reply" correspond  la communication entre les deux ordinateurs PC1 et PC4
PC1 envoie le request à PC4 (IP : 10.10.4.1; MAC : 00.50.79.66.68.00)
PC4 envoie le reply à PC1 (IP : 10.10.4.2, MAC : 00.50.79.66.68.03)

## Q.3.14
Le paquet n°2 est un ARP, il associe une adresse IP à un hôte

## Q.3.15
La matériel A étant un switch, il permet aux ordinateurs de communiquer entre eux, sans qu'ils soient directement reliés.
Le matériel B n'intrervient pas

## Q.3.16
C'est l'ordineteur qui dispose de l'adresse IP 10.10.80.3 qui intialise le communication, il s'agit donc de PC3

## Q.3.17
Il s'agit du protocole ICMP, il permet de signaler des erreurs sur le réseaux, et aussi de faire des diagnostics réseaux

## Q.3.18
Non la communication n'a pas fonctionné, comme on a vu précédemment que PC2 et PC3 ne peuvent pas communiquer entre eux.

## Q.3.19
Cette ligne indique que la communication avec l'ordinateur ayant l'IP 10.11.80.2 (PC2) n'est pas accessible via la passerelle 10.10.255.254

## Q.3.20
Le switch A a permis d'indiquer à PC3 d'etre relié au routeur B
Le routeur B a reçu un paquet provenant de PC3, mais a indiqué une erreur car PC2 ne se situe pas sur sa table de routage.

## Q.3.21
La source est un appareil possédant l'adresse IP 10.10.4.2, donc il s'agit de PC4
La destination est un appareil possédant l'adresse IP 172.16.5.253, situé sur le réseau 172.16.5.0/24, donc après le routeur R2

## Q.3.22
L'adresse MAC source est CA:03:9E:EF:00:38
L'adresse MAC destination est CA:01:DA:D2:00:1C
Les deux appareils en communication disposent d'adresses MAC et sont connectées sur les réseaux 10.10.0.0/16 et 172.16.5.0/24

## Q.3.23
Comme les deux appareils sont situés dans des réseaux séparés par deux routeurs, il semblerait que cette comunnication ait eu lieu entre les deux routeurs B et R2.



