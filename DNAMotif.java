import java.util.Scanner;
import java.io.File;
import java.util.regex.Pattern;

public class DNAMotif {

    public static void main(String[] args) throws Exception {
        
        String word;
        
        File wordFile = new File("sequences.txt");
        Scanner scan = new Scanner(wordFile);

        String motif = "T..(A|G).C";
        Pattern p = Pattern.compile(motif);
        while (scan.hasNextLine()) {
            word = scan.nextLine();
            if (p.matcher(word).matches()) {
                System.out.println(word + " matches " + motif);
            }
            else {
                System.out.println(word + " does not match " + motif);
            }
        }
    }

}