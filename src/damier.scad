module damier(tailleCase=1, epaisseurCase=1, epaisseurPion=2, couleurPionNoir = [0, 0, 255], couleurPionBlanc = [255, 0, 0], couleurCaseNoire = [0,0,0], couleurCaseBlanche=[255,255,255])
{
    nbCase = 10;
    tailleDamier = [1:nbCase];
    
    //Case Damier
    union()
    {
        for(i = tailleDamier)
        {
            for(j = tailleDamier)
            {
                couleurCase = (i + j) % 2 == 1 ? couleurCaseBlanche : couleurCaseNoire;
                //Position
                translate([tailleCase * (i - nbCase/2 - 1), tailleCase * (j - nbCase/2 - 1), 0]) 
                //Couleur : Noir/Blanc
                color(couleurCase / 255)
                //Forme : cube aplati
                cube([tailleCase, tailleCase, epaisseurCase]);
            }
        }
    }
    
    //Pion
    for(i = tailleDamier)
    {
        for(j = tailleDamier)
        {
            //Test vérifiant si c'est une case noir n'appartenant pas au 2 lignes de case du milieu
            if((i + j) % 2 == 0 && (j < 5 || j > 6) )
            {
                couleurPion = j < 5 ? couleurPionBlanc : couleurPionNoir;
                
                //Position Pion
                translate([tailleCase * (i  - (nbCase + 1) / 2), tailleCase * (j - (nbCase + 1) / 2), epaisseurCase]) 
                //Couleur
                color(couleurPion / 255) 
                //Forme : cylindrique
                cylinder(r1=tailleCase/2, r2=tailleCase/2, h=epaisseurPion);
            }
        }
    }
}

damier(tailleCase=15, epaisseurCase=1, epaisseurPion = 2);
