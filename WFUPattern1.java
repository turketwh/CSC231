import java.util.Scanner;
import java.io.File;
import java.util.regex.Pattern;

public class WFUPattern1 {

    public static void main(String[] args) throws Exception {
        
        String word;
        int numberOfWFULines = 0;
        int totalLines = 0;
        
        File wordFile = new File("WFUUNCDuke.txt");
        Scanner scan = new Scanner(wordFile);

        long startTime = System.nanoTime();
        while (scan.hasNextLine()) {
            word = scan.nextLine();
            if (Pattern.matches("WFU", word)) {
                numberOfWFULines++;
            }
            totalLines++;
        }
        long endTime = System.nanoTime();
        System.out.println(numberOfWFULines + " out of " + totalLines + " were the word WFU");
        System.out.println("Time required: " + (endTime-startTime));
    }

}