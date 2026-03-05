---
marp: true
theme: default
style: |
  @import '../_shared/tech.css';
paginate: true
_paginate: false
title: "GitOps : simplifier les déploiements grâce à Git"
footer: GitOps : simplifier les déploiements grâce à Git
class: lead
---

# 🔹 GitOps : simplifier les déploiements grâce à Git
## Faire de Git la source unique de vérité

Les Tisserands de la Tech — Vendredi 6 mars — Quai5

---

## 👋 Qui suis-je ?

- Consultant et formateur indépendant
- Développeur depuis 15 ans
- Passionné par le GitOps, Kubernetes et l’observabilité
- Curieux et fan de l'amélioration continue


![width:200px bg right:30%](../_shared/Mathieu-2025.jpg)


### ➡️ [linkedin.com/in/mathieulaude](https://www.linkedin.com/in/mathieulaude/)

---

# 🎯 Objectif de la session

À la fin de cette présentation, vous saurez :

- Comprendre ce qu’est GitOps (sans jargon)
- Identifier les problèmes qu’il résout
- Expliquer son fonctionnement simplement
- Connaître les bonnes pratiques essentielles
- Visualiser un déploiement automatique via Git


---

# Cycle de vie d'un logiciel

<br>

Valable pour :
- **un site Web**
- une app mobile
- un logiciel Windows


[![bg right:45% height:90%](https://mermaid.ink/img/pako:eNpdkU1uwjAQha8SzTrQ_OD8eNFFiSqx6K7dlHRh4gGsOnbkOLQUcSDOwcXqBJrSemPP-L33jTQHqDRHoLCW-qPaMmO956JUnjsLjmy54OcTenfeClstlFefT1agebsoCtwti_Nph1I3Ddao7PXjoROSL-datdZ0lRVajY5G6n1vcre4tbxYIUXLem2pfgfwJpP7njMCh8aQf4O6qvrsW87Q_hP8j-QEj4h8xar3dgSBDxsjOFA3O_pQo6lZX8Kh95dgt27uEqh7clyzTtoSSnV0toapV63rH6fR3WYLdM1k66qu4cxiIdjGsHrsGlQczVx3ygKNST6EAD3AJ9AwiqZRQOIoz3IShDmJfdgDzdIpIbMkiEmaJEkQJkcfvgZsME0jEpIsjbN4lgeE-IBcWG2eLjseVn38Bqxqn9w?type=png)](https://mermaid.live/edit#pako:eNpdkU1uwjAQha8SzTrQ_OD8eNFFiSqx6K7dlHRh4gGsOnbkOLQUcSDOwcXqBJrSemPP-L33jTQHqDRHoLCW-qPaMmO956JUnjsLjmy54OcTenfeClstlFefT1agebsoCtwti_Nph1I3Ddao7PXjoROSL-datdZ0lRVajY5G6n1vcre4tbxYIUXLem2pfgfwJpP7njMCh8aQf4O6qvrsW87Q_hP8j-QEj4h8xar3dgSBDxsjOFA3O_pQo6lZX8Kh95dgt27uEqh7clyzTtoSSnV0toapV63rH6fR3WYLdM1k66qu4cxiIdjGsHrsGlQczVx3ygKNST6EAD3AJ9AwiqZRQOIoz3IShDmJfdgDzdIpIbMkiEmaJEkQJkcfvgZsME0jEpIsjbN4lgeE-IBcWG2eLjseVn38Bqxqn9w)

---

# Pourquoi doit-on déployer un site Web ?

Une application web ne sert à rien tant qu’elle reste sur l’ordinateur du développeur.

Le **déploiement** permet de :

- rendre l’application accessible aux utilisateurs
- publier une nouvelle version
- corriger les bugs
- ajouter des fonctionnalités

👉 Déployer = **mettre l'application à disposition des utilisateurs**

---

# 🧩 Déploiement traditionnel

<br><br><br><br><br><br><br><br>

[![bg width:90%](https://mermaid.ink/img/pako:eNpNkM9ugzAMxl8l8plWUCBADr2sx-2yaZcBh4gYiBQICgn7U_WB9hx7saXQavPF_uzfZ0s-Q6MFAoNW6fem58aSx-dqJD5OuJSnn-8FlZ4mdKYmu92RvDRGTrbcElG64are-FtrhdAs3lHeMhFIJqOFa6zU4x2_za78q5VKztx6PZf_RQ0BdEYKYNY4DGBAM_CrhPN1SwW2xwErYL4U2HKnbAXVePG2iY9vWg93p9Gu64G1XM1euUn4AyfJO8P_EBwFmgftRgusWDcAO8MHsCzbR0kaRVGYx0WexHkAn8AO6T4NaZzRA6VJViTF4RLA13oz3OdZFtMijWPvCBNKA0AhrTZP27vXr19-AW3Ne5A?type=png)](https://mermaid.live/edit#pako:eNpNkM9ugzAMxl8l8plWUCBADr2sx-2yaZcBh4gYiBQICgn7U_WB9hx7saXQavPF_uzfZ0s-Q6MFAoNW6fem58aSx-dqJD5OuJSnn-8FlZ4mdKYmu92RvDRGTrbcElG64are-FtrhdAs3lHeMhFIJqOFa6zU4x2_za78q5VKztx6PZf_RQ0BdEYKYNY4DGBAM_CrhPN1SwW2xwErYL4U2HKnbAXVePG2iY9vWg93p9Gu64G1XM1euUn4AyfJO8P_EBwFmgftRgusWDcAO8MHsCzbR0kaRVGYx0WexHkAn8AO6T4NaZzRA6VJViTF4RLA13oz3OdZFtMijWPvCBNKA0AhrTZP27vXr19-AW3Ne5A)

---

# 🧩 Déploiement traditionnel

- Opération manuelle
- Parfois semi-automatisée avec un script
- Peu de traçabilité
- Difficulté à revenir en arrière
- "Ça marche sur ma machine"


### 👉 Stress + Incertitude = 🤯

---

# Et si le déploiement devenait simple ?

Objectifs :

- déployer **plus souvent** et **plus sereinement**
- savoir **qui a changé quoi**
- pouvoir **revenir en arrière facilement**

👉 C’est exactement ce que propose **GitOps**.

---

# 📘 Pré-requis : qu’est-ce que Git ?

<br>

Git est un outil qui permet :

- De sauvegarder du code
- De suivre les modifications
- De collaborer

👉 C’est un historique fiable de changements.

--- 

# 📘 Tout est *Commit*

👉 Un **commit** = 
- l'enregistrement d'un changement
- **un point dans l'historique du projet**
- une photo instantanée de l'ensemble des fichiers

Les commits sont **chaînés** : ils forment un historique des modifications.

---

# Services basés sur Git

Git est un outil, mais on l’utilise généralement **en ligne** pour permettre de :

- partager les dépôts Git de façon centrale
- collaborer et relire le code produit en équipe
- automatiser des actions

Exemples de plateformes :
- **GitHub**, GitLab, Bitbucket, SourceForge, Forgejo, Gitea ...


---
# 🧩 GitOps =

<div class="container"><div class="col">

## Git

Dans le dépôt Git on décrit <br>l'état souhaité du système :

- le code de l'application
- les fichiers de configuration
- l'infrastructure (Docker, Terraform, ...)

</div><div class="col">

## + Ops

Désigne toutes les **opérations** <br>d'exploitation :
- Mettre à jour une version applicative
- Modifier une configuration
- Améliorer les performances

</div></div>

---

# 💡 GitOps : l’idée centrale

Git devient :

> La source unique de vérité

Cela signifie :

- L’**état** désiré du système est décrit dans Git
- Les déploiements sont déclenchés **automatiquement**
- L’environnement s’aligne sur ce qui est écrit dans Git

---


# 🔄 Fonctionnement global du GitOps

<br><br><br><br><br><br><br><br><br>

[![bg 90%](https://mermaid.ink/img/pako:eNp1UktOwzAUvIr12KZVmzRp4gUSohIb2LRCQiRdmPilteTEwbELpe2BOAcXw_kUZYMt2Z43bzwjyyfIFUegUEj1ke-ZNuRxnVXEjRUe0tXP9wGlqmu0eksmk9vzy5lsci1qk_YbkSpncttLhpLrIxvUBydKh51wJLVW3OZGqMq1t_NfF_IgTLrGWjXCKH1s4eDgTl3D3Q4rk3YrYdaokhnxbnHo6uujGEO8IUtLPBshRcOMw006BttrssYcJXaGhZCS3jCfvzF_zPU2YxY82GnBgRpt0YMSdclaCKdWl4HZY4kZUHfkWDArTQZZdXGymlWvSpVXpVZ2twdaMNk4ZGvuwq0E22lW_lU1Vhz1vbKVAeovFt0lQE_wCTSOpsEiDPx5FIb-MmjJI9AgniZRkkRRHMcLf-nqFw--OtvZdJkEfjILw8gPWnbuAfL2-Z_6D9L9k8svu8m27w?type=png)](https://mermaid.live/edit#pako:eNp1UktOwzAUvIr12KZVmzRp4gUSohIb2LRCQiRdmPilteTEwbELpe2BOAcXw_kUZYMt2Z43bzwjyyfIFUegUEj1ke-ZNuRxnVXEjRUe0tXP9wGlqmu0eksmk9vzy5lsci1qk_YbkSpncttLhpLrIxvUBydKh51wJLVW3OZGqMq1t_NfF_IgTLrGWjXCKH1s4eDgTl3D3Q4rk3YrYdaokhnxbnHo6uujGEO8IUtLPBshRcOMw006BttrssYcJXaGhZCS3jCfvzF_zPU2YxY82GnBgRpt0YMSdclaCKdWl4HZY4kZUHfkWDArTQZZdXGymlWvSpVXpVZ2twdaMNk4ZGvuwq0E22lW_lU1Vhz1vbKVAeovFt0lQE_wCTSOpsEiDPx5FIb-MmjJI9AgniZRkkRRHMcLf-nqFw--OtvZdJkEfjILw8gPWnbuAfL2-Z_6D9L9k8svu8m27w)

---

# 🎯 Ce que GitOps résout concrètement

## 1️⃣ Traçabilité

Chaque modification :

- A un auteur
- A une date
- A une justification

---

## 2️⃣ Reproductibilité

Si un serveur tombe :

👉 On relit Git
👉 On reconstruit exactement le même état

---

## 3️⃣ Retour arrière immédiat


Git stocke tout l'historique des modifications.
➡️ Revenir en arrière = retour au commit précédent dans Git.

---

## 4️⃣ Collaboration simplifiée

Au lieu de :

### 😱 "Tu peux déployer stp ? Le script ne fonctionne pas sur mon poste" 😱

On a :

### 😎 "J'ai fait une modification dans Git, ça sera déployé dès que les tests seront validés" 😎

---

# 🏗 Les principes fondamentaux du GitOps

---

# 📌 Principe 1 : Déclaratif

On décrit l’état souhaité.

Exemple (simplifié) :

> Je veux 2 serveurs
> Version 1.4
> Port 8080

On ne décrit pas *comment faire*, on décrit *ce qu’on veut*.
Le **comment** sera la responsabilité de l'outil de synchronisation.

---

# 📌 Principe 2 : Git = source unique de vérité

Tout doit être dans Git :

- Configuration
- Versions
- Paramètres
- Environnements

Rien ne doit être modifié en dehors : aucune action manuelle en production.

---

# 📌 Principe 3 : Synchronisation continue

Le système vérifie en permanence :

"Est-ce que l’infrastructure correspond à Git ?"

Si oui : 😎
Si non : 👉 Correction automatique

---

# 🧪 Démonstration

Scénario :

1. On change la version de l’application dans Git
2. On valide par un commit
3. L’agent détecte le changement
4. Déploiement automatique

---

![bg](https://i.makeagif.com/media/4-10-2024/_myoOd.gif)

---

# 🖥 Schéma détaillé de la démonstration

<br><br><br><br><br><br><br><br><br><br><br><br>


[![bg width: 90%](https://mermaid.ink/img/pako:eNptkkFugzAQRa9izZogAoaAF5GiROoq3XRXsbHwQCyBTY2N2kbZ9gC9Rc6Rm_QkdSCpKrXe2DPz_h-N7SNUWiAwGPDFoapwJ3ljeFcq4hevrDZkhyPhA9ldziO2uu_Rmbncc2NlJXuuLHmQ9m9y06D6J_2EZpxM5pL3X6zX3oCRvRaylkhGNIPUiizDhHx9fPqdzqynFh6ejBl51G5E7kilu05aIi5ni5W9nGd2gjx8a8fIpu9b6cckLSfqKm3bn1az5Ib-arHVqpam43ZiSgUBNEYKYNY4DKBDX7uGcLw6lGAP2GEJzB8F1ty1toRSnbzMj_6sdXdXGu2aA7Cat4OPXC-4vV_-T9agEmi22ikLLC3SyQTYEV6BJauwiCIaFVmR0zxLkgDegOUhXcZpkeR0mabxKqGnAN6nrlFY5GmWxDSOsjylq7gIAIX0D7yff8D0EU7fCnet-w?type=png)](https://mermaid.live/edit#pako:eNptkkFugzAQRa9izZogAoaAF5GiROoq3XRXsbHwQCyBTY2N2kbZ9gC9Rc6Rm_QkdSCpKrXe2DPz_h-N7SNUWiAwGPDFoapwJ3ljeFcq4hevrDZkhyPhA9ldziO2uu_Rmbncc2NlJXuuLHmQ9m9y06D6J_2EZpxM5pL3X6zX3oCRvRaylkhGNIPUiizDhHx9fPqdzqynFh6ejBl51G5E7kilu05aIi5ni5W9nGd2gjx8a8fIpu9b6cckLSfqKm3bn1az5Ib-arHVqpam43ZiSgUBNEYKYNY4DKBDX7uGcLw6lGAP2GEJzB8F1ty1toRSnbzMj_6sdXdXGu2aA7Cat4OPXC-4vV_-T9agEmi22ikLLC3SyQTYEV6BJauwiCIaFVmR0zxLkgDegOUhXcZpkeR0mabxKqGnAN6nrlFY5GmWxDSOsjylq7gIAIX0D7yff8D0EU7fCnet-w)

---

# 🔙 Démonstration : retour arrière

1. Bug détecté
2. On revient au **commit** précédent
3. Synchronisation **automatique**
4. Ancienne version restaurée

> Sans SSH
> Sans script manuel
> Sans stress

---

# GitOps dans le monde réel

Dans les environnements de production, on utilise des outils spécialisés :

- **ArgoCD** / **Flux** : synchronisation automatique dans Kubernetes
- **Terraform + Git** : gérer l’infrastructure en continu  
- **GitLab CI / GitHub Actions** : pipelines de déploiement CICD

👉 Le principe reste le même :

**Git devient la source de vérité pour piloter l’infrastructure et les déploiements.**

---

# Contraintes et limites


- **Tout doit être déclaratif**  
  L’état du système doit **obligatoirement** être décrit dans des fichiers

- **Les secrets doivent être gérés correctement**  
  On ne peut pas stocker des mots de passe en clair dans Git

- **La discipline d’équipe est essentielle**  
  **Tous** les changements doivent passer par Git

- **Peut devenir complexe à grande échelle**  
  Gestion de nombreux dépôts, environnements et configurations

---

<!-- _class: center -->

### La pratique GitOps ne résout pas les problèmes d’organisation… 
### mais elle les rend visibles et traçables.

---

# 👥 Bonnes pratiques en équipe

---

## ✅ 1. Toujours passer par *Pull Request*

- Relecture
- Discussion
- Validation

---

## ✅ 2. Séparer les environnements

- Développement
- Test
- Production

Chaque environnement peut avoir :

- Son dossier
- Sa configuration

---

## ✅ 3. Interdire les modifications manuelles

Règle d’or :

> Si ce n’est pas dans Git, ça n’existe pas.

---

# ⚠️ GitOps n’est pas

-  magique
-  réservé aux expert.e.s
-  obligatoirement complexe

C’est une discipline + des bonnes pratiques.

---

# 📈 Bénéfices à long terme

- Moins d’erreurs humaines
- Moins de dépendance à une personne clé
- Plus de visibilité
- Déploiements prévisibles
- Meilleure collaboration

---

# 🏁 Résumé

GitOps, c’est :

- Décrire l’état désiré dans Git
- Automatiser le déploiement
- Synchroniser en continu
- Garder une traçabilité complète
- Pouvoir revenir en arrière facilement

---

# 🚀 Conclusion

Déployer ne devrait pas être un acte héroïque.

Avec GitOps :
👉 C’est un simple commit.

![bg height:60% right:50%](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExamMxN2wyeTZoczExbWx4cTVwdTI3czVrajRyMHBnajI2ZDJtc2VmMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3hrLxUpp67IpmpZT1h/giphy.gif)


