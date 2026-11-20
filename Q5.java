public class Q5
{
    public static void main( String[] arguments )
    {
        int nombre = Integer.parseInt( arguments[ 0 ] );

        for ( int taille = 1; taille <= nombre; taille++ )
        {
            StringBuilder ligne = new StringBuilder();

            for ( int valeur = taille; valeur >= 1; valeur-- )
            {
                ligne.append( valeur );
            }

            System.out.println( ligne );
        }
    }
}
