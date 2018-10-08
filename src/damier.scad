module damier(
// Taille de chaque case du damier et de chaque pion
taille=1, 
// Épaisseur de chaque pion
epaisseurCase=0.1,
// Taille de la case d'un damier et d'un pion
epaisseurPion=0.25,
// Couleur des pions blancs
couleurPionNoir=[0, 0, 1],
// Couleur des pions noirs
couleurPionBlanc=[1, 0, 0], 
// Couleur des cases noires du damier
couleurCaseNoire=[0, 0, 0], 
// Couleur des cases blanches du damier
couleurCaseBlanche=[1, 1, 1]
){
    //Variable permettant d'arrondir les pièces [0:360]
    $fn = 360;
    
    //Nombre de case du damier sur une dimension
    nbCase = 10;
    
    //Tableau d'itération du damier sur une dimension
    tabDamier = [1:nbCase];
    
    //Création et unification des cases
    union()
    {
        for(i = tabDamier)
        {
            for(j = tabDamier)
            {
                couleurCase = (i + j) % 2 == 1 ? couleurCaseBlanche : couleurCaseNoire;
                positionCase = [taille * (i - nbCase/2 - 1), taille * (j - nbCase/2 - 1), 0];
                
                //Position
                translate(positionCase) 
                //Couleur
                color(couleurCase)
                //Forme
                cube([taille, taille, epaisseurCase]);
            }
        }
    }
    
    //Création des pions
    for(i = tabDamier)
    {
        for(j = tabDamier)
        {
            //Vérifie si c'est une case noir n'appartenant pas au 2 lignes du centre du damier
            if((i + j) % 2 == 0 && (j < 5 || j > 6) )
            {
                couleurPion = j < 5 ? couleurPionBlanc : couleurPionNoir;
                positionPion = [taille * (i  - (nbCase + 1) / 2), taille * (j - (nbCase + 1) / 2), epaisseurCase];
                rayonPion = taille/2;
                
                //Position
                translate(positionPion)
                //Couleur
                color(couleurPion) 
                //Forme
                cylinder(r1=rayonPion, r2=rayonPion, h=epaisseurPion);
            }
        }
    }
}

damier();
