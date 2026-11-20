#!/bin/sh
# Compile et execute un fichier Java.
# Usage : ./run.sh <fichier ou classe> [arguments...]
# Exemples : ./run.sh Q3 5      ./run.sh Q4.java 4

if [ -z "$1" ]
then
    echo "Usage : $0 <fichier.java | nom de classe> [arguments...]"
    exit 1
fi

fichier="$1"
shift

nom="${fichier%.java}"
source="$nom.java"

if [ ! -f "$source" ]
then
    echo "Erreur : fichier introuvable : $source"
    exit 1
fi

dossierSortie="$(mktemp -d)"
trap 'rm -rf "$dossierSortie"' EXIT

if ! javac -d "$dossierSortie" "$source"
then
    echo "Erreur : la compilation de $source a echoue"
    exit 1
fi

java -cp "$dossierSortie" "$(basename "$nom")" "$@"
