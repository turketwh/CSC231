import java.util.regex.*;
import java.util.Scanner;
import java.io.File;

class JavaAnalysis {
  public static void main(String[] args) throws Exception {
    Pattern typePattern = Pattern.compile("int|double|void|boolean|char");
    Pattern keywordPattern = Pattern.compile("public|static|class|for|if|else");
    Pattern integerPattern = Pattern.compile("(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*");
    Pattern operatorPattern = Pattern.compile("=|\\*|\\+");
    Pattern floatingPointPattern = Pattern.compile("\\p{Digit}\\p{Digit}*\\.\\p{Digit}\\p{Digit}*");
    
    String word;
    File inputFile = new File(args[0]);
    Scanner scanner = new Scanner(inputFile);
    while (scanner.hasNext()) {
      word = scanner.next();
      if  (typePattern.matcher(word).matches()) {
        System.out.println("Type found: " + word);
      }
      else if (keywordPattern.matcher(word).matches()) {
        System.out.println("Keyword found: " + word);
      }
      else if (operatorPattern.matcher(word).matches()) {
        System.out.println("Operator found: " + word);  
      }
      else if (integerPattern.matcher(word).matches()) {
        System.out.println("Integer literal found: " + word);
      }
      else if (floatingPointPattern.matcher(word).matches()) {
        System.out.println("Floating point literal found: " + word);
      }
      else {
        System.out.println("Unable to assign meaning to: " + word);
      }
    }
  }
}