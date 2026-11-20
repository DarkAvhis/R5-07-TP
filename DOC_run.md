# Lancer un programme Java avec run.sh ou run.bat

Les scripts `run.sh` (Linux, macOS, Git Bash) et `run.bat` (Windows) compilent un fichier Java puis l'executent.
Le nom du fichier est donne sur la ligne de commande, suivi des arguments du programme.

## Prerequis

- Un JDK installe (les commandes `javac` et `java` doivent etre accessibles dans le PATH).
  Verification : `javac -version` et `java -version`.
- Se placer dans le dossier qui contient les fichiers `.java` et les scripts.

## Syntaxe

```
./run.sh  <fichier ou classe> [arguments...]
run.bat   <fichier ou classe> [arguments...]
```

Le nom peut etre donne avec ou sans l'extension : `Q3` et `Q3.java` sont equivalents.
Tout ce qui suit le nom est transmis au programme (le `N` de `Q3` et `Q4`, par exemple).

## Avec run.sh (Linux, macOS, Git Bash)

Rendre le script executable une seule fois :

```
chmod +x run.sh
```

Puis le lancer :

```
./run.sh Q3 5
```

Sans `chmod`, on peut aussi utiliser `sh run.sh Q3 5`.

## Avec run.bat (Windows)

Dans l'invite de commandes (cmd) ou PowerShell, dans le dossier du depot :

```
run.bat Q3 5
```

Sous PowerShell, ecrire `.\run.bat Q3 5`.

## Exemples

| Commande | Resultat attendu |
|---|---|
| `./run.sh Q3 5` | `5 4 3 2 1` |
| `./run.sh Q4 4` | `4321`, `321`, `21`, `1` (une ligne chacun) |
| `./run.sh Q5 4` | `x`, `xx`, `xxx`, `xxxx` (une ligne chacun) |
| `./run.sh Q6.java 3` | `x`, `xx`, `xxx` (une ligne chacun) |

Les memes commandes fonctionnent avec `run.bat` a la place de `./run.sh`.

## Fonctionnement

1. Le script verifie qu'un nom de fichier est fourni et que le fichier `.java` existe.
2. Il compile le fichier avec `javac` dans un dossier temporaire (aucun fichier `.class` n'est laisse dans le depot).
3. Il lance le programme avec `java` en lui transmettant les arguments.
4. Il supprime le dossier temporaire.

Le nom de la classe doit etre identique au nom du fichier (`Q3.java` contient `public class Q3`).

## En cas d'erreur

- `javac` ou `java` introuvable : installer un JDK et verifier le PATH.
- `fichier introuvable` : verifier le nom et se placer dans le bon dossier.
- `la compilation a echoue` : lire les messages de `javac` affiches juste avant.
