import os
from colorama import Fore, Style, init

# Initialisation pour Windows
init()

# Couleurs
COLOR_DIR = Fore.GREEN
COLOR_FILE_DART = Fore.BLUE
COLOR_FILE_MEDIA = Fore.YELLOW
COLOR_FILE_FONT = Fore.CYAN
COLOR_RESET = Style.RESET_ALL

def print_tree(directory, prefix="", depth=0, max_depth=2):
    # Arrêter si la profondeur maximale est atteinte
    if depth > max_depth:
        return

    try:
        # Liste les éléments du répertoire
        items = sorted(os.listdir(directory))
    except PermissionError:
        return

    for i, item in enumerate(items):
        path = os.path.join(directory, item)
        is_last = i == len(items) - 1
        connector = "└── " if is_last else "├── "

        # Déterminer la couleur en fonction du type de fichier
        if os.path.isdir(path):
            color = COLOR_DIR
        elif item.endswith(".dart"):
            color = COLOR_FILE_DART
        elif item.endswith((".png", ".jpg", ".jpeg")):
            color = COLOR_FILE_MEDIA
        elif item.endswith(".ttf"):
            color = COLOR_FILE_FONT
        else:
            color = COLOR_RESET

        # Afficher l'élément
        print(f"{prefix}{connector}{color}{item}{COLOR_RESET}")

        # Si c'est un répertoire, appeler récursivement
        if os.path.isdir(path):
            extension = "    " if is_last else "│   "
            print_tree(path, prefix + extension, depth + 1, max_depth)

# Point d'entrée du script
if __name__ == "__main__":
    print("Arborescence du projet :")
    print_tree(".", max_depth=2)

