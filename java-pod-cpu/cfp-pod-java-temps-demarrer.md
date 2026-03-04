# 🎯🎙️Au secours, mon Pod Java n'a jamais le temps de démarrer !
## 🧩 Description

Lorsqu'une application Java démarre, elle a parfois besoin de **temps... et de beaucoup de CPU** !  
Dilemme classique : **comment minimiser le temps de démarrage** sans exploser le quota CPU de son cluster Kubernetes ?


### 🔍 Ce que vous allez apprendre

- Pourquoi les applications Java ont parfois un démarrage laborieux (JVM, JIT, cold start, etc.)
- Les impacts de ce comportement sur Kubernetes (scheduling, readiness, scalabilité)
- Comment y remédier grâce à des fonctionnalités Kubernetes comme :
  - Les **Startup Probes**
  - Les **Init Containers**
  - Le **VerticalPodAutoscaler (VPA)** et notamment sa **nouvelle capacité in-place update** !
- L’apport potentiel de la **compilation native (GraalVM & co)** pour certains workloads
- Présentation du projet Kube Startup CPU Boost qui adresse cette problématique

Un talk à la croisée du monde Java et des plateformes cloud-native, avec un retour terrain et des cas concrets. C’est aussi l’occasion de **présenter l'attribut `in-place` du VPA**, encore peu connu, et d !


### ✅ À qui s’adresse cette conférence :

Public visé : développeurs, DevOps, SREs, architectes techniques
Ce talk est issu de **retours d’expérience en mission**, dans des contextes variés (applications Spring Boot, services legacy, microservices cloud-native…).  
Les solutions présentées ont été testées en conditions réelles et s’adaptent à différents environnements (dev, prod, CI/CD).


Ce sujet a déjà été présenté devant mes collègues et en meetup à Rennes. Les retours étaient plutôt positifs : https://openfeedback.io/oedOgzfil80M74yZoYKI/0/2BQK3weXUMLvICMYSR0C
Je m'appuie sur mes expériences en mission et les questions récurrentes des équipes chargées de déployer et exploiter des applications Java plus ou moins legacy ;)


J'ai donné cette conférence au meetup du BreizhJug :
https://www.youtube.com/watch?v=AN6NrOpjPW0
Elle sera mise à jour avec les récentes évolutions de la fonctionnalité VPA et du projet Kube Startup CPU Boost ;) 

J'ai déjà présenté des sujets autour du développement et de l'exploitabilité Kubernetes. Je suis également formateur Docker & Kube.
Exemples :
- https://www.youtube.com/watch?v=Ip3CfVBS_C8
- https://www.youtube.com/watch?v=y_If6HBhYs8
