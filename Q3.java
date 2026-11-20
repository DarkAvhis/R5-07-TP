public class Q3
{
    public static void main( String[] arguments )
    {
        int nombre = Integer.parseInt( arguments[ 0 ] );
        StringBuilder ligne = new StringBuilder();

        for ( int i = nombre; i >= 1; i-- )
        {
            ligne.append( i );
            if ( i > 1 )
            {
                ligne.append( " " );
            }
        }

        System.out.println( ligne );
    }
}
