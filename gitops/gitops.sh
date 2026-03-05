#!/usr/bin/env bash

set -e

REPO="../../gitops-demo"
BRANCH="main"
INTERVAL=5

cd $REPO
echo "Démarrage de l'agent GitOps..."
echo "Branche : $BRANCH"

LAST_COMMIT=$(git rev-parse HEAD)

echo "Commit actuel : $LAST_COMMIT"

docker compose up -d --build

while true
do
    git fetch origin $BRANCH 2>/dev/null

    NEW_COMMIT=$(git rev-parse origin/$BRANCH)

    if [ "$NEW_COMMIT" == "$LAST_COMMIT" ]; then
        echo "Aucun changement détecté. Commit actuel : $LAST_COMMIT"
    else
        echo ""
        echo "Changement détecté !"
        echo "Ancien commit : $LAST_COMMIT"
        echo "Nouveau commit : $NEW_COMMIT"

        git pull origin $BRANCH

        echo "Reconstruction des conteneurs..."
        docker compose up -d --build

        echo "Déploiement terminé"

        LAST_COMMIT=$NEW_COMMIT
    fi

    sleep $INTERVAL
done
