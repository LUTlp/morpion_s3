Voici le fameux jeu du morpion.

Il a été fait avec Maï Lan et Perrine (trio de choc !)

Le programme doit avoir 4 classes :

    Board : c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie.
    BoardCase : c'est une case. Il devrait y avoir 9 instances de cette classe dans ta partie
    Player : ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie
    Game : c'est la partie. Elle initialise tout et lance le jeu

Du coup, je t'invite à dessiner tes classes, que doivent-elles faire, que doivent-elles lancer à leur initialisation ? Chacune des classes doit répondre à un but précis. Nous te conseillons de prendre un peu de temps à dessiner le but de tes classes avant de te lancer à tête baissée dans le code.


Commence par définir tes classes. Chaque classe doit avoir des rôles bien précis :

    Board : à l'initialisation, le plateau doit instancier 9 BoardCases. Le plateau doit s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases (de empty à X ou O), vérifie en fonction de la combinaison des BoardCases si un joueur enchaine trois symboles d'affichés.
    BoardCase : un BoardCase renseigne de l'état d'une case : soit elle est vide (personne n'a joué dessus), soit elle a comme valeur X, soit elle a comme valeur O
    Player : un joueur a un nom (habile), et un état (victoire s'il a gagné)
    Game : cette classe s'occupe de gérer toute la partie. À l'initialisation elle créé 2 instance de Player, et 1 instance de Board (l'instance de Board, initialise 9 instances de BoardCases). Game s'occupe de finir la partie si un joueur a gagné, de demander aux utilisateurs où ils veulent jouer à chaque tour

Comment afficher ? Pour afficher le plateau, c'est plus simple que cela en a l'air. Il faut afficher une méthode to_s (to_string, une méthode qui marche pour les classes array, integer, etc) qui renvoie le plateau (ou les cases) au format string.
