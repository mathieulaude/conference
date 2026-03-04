# 🎯🎙️Au-delà du coeur vert 💚 : Optimiser vos déploiements Kubernetes avec les Custom Health Checks d’Argo CD

## 🧩 Résumé :

Dans cette conférence, nous plongerons dans une fonctionnalité puissante mais souvent sous-estimée d'Argo CD : les **Custom Health Checks**. Si vous utilisez Argo CD pour vos déploiements GitOps, vous vous êtes peut-être déjà demandé pourquoi certaines ressources apparaissent en "Unknown" ou pourquoi un rollout échoue silencieusement. C’est ici que les Custom Health Checks entrent en jeu.

Nous verrons **comment personnaliser les règles d’évaluation de l’état de santé** de vos objets Kubernetes afin de refléter plus fidèlement la réalité de vos déploiements. Cela vous permettra de gagner en visibilité, en fiabilité, et de prévenir les erreurs de production avant qu'elles ne deviennent critiques.

### 🔍 Ce que vous allez apprendre :

- Pourquoi les *Custom Health Checks* sont essentiels pour des déploiements fiables
- Comment Argo CD évalue par défaut l'état de santé des ressources Kubernetes
- Cas d’usage concrets : CRDs, StatefulSets, ApplicationSets, etc.
- Comment écrire vos propres scripts de vérification de santé via Lua

### ✅ À qui s’adresse cette conférence :

- Développeurs et DevOps utilisant Argo CD
- SRE/Platform Engineers souhaitant fiabiliser leurs déploiements
- Toute personne intéressée par l'observabilité et le contrôle dans un environnement GitOps/Kubernetes

## 🚀 Pourquoi ce sujet est important :

- Les erreurs silencieuses sont coûteuses : détecter plus tôt grâce à des statuts de santé personnalisés
- Permet une meilleure **automatisation des rollouts et rollbacks**
- Réduit le risque de *false positives* ou *false negatives* dans l’état des applications
- Améliore la **visibilité des CRDs** non gérés nativement par Argo CD
- Renforce la culture GitOps avec des états déclaratifs **fiables et représentatifs**


Ce sujet est issu d'une problématique rencontré chez mon client actuel, le Ministère de l'Intérieur et sa plateforme CloudPiNative qui est un produit public.
Le retour d'expérience sera donc illustré par des exemples liés à cette plateforme qui utilise uniquement des outils OpenSource.
Je co-présente un talk pour partager la genèse de cette plateforme avec mon client le 16 octobre à la PlatformCon Live Paris


J'ai déjà présenté des sujets autour du développement et de l'exploitabilité Kubernetes. Je suis également formateur Docker & Kube.
Exemples :
- https://www.youtube.com/watch?v=AN6NrOpjPW0
- https://www.youtube.com/watch?v=Ip3CfVBS_C8
- https://www.youtube.com/watch?v=y_If6HBhYs8


