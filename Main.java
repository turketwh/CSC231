import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.regex.*;

public class Main {

    public static ArrayList<String> compareRegexAgainstList(String regularExpressionArg, ArrayList<String> listArg) {
        ArrayList<String> returnList = new ArrayList<String>();
        // COMPLETE ME
        return returnList;
    }

    public static boolean compareRegexAgainstWord(String regularExpressionArg, String wordArg) {

        Pattern p = Pattern.compile(regularExpressionArg);
        if (p.matcher(wordArg).matches() == true) {
            return true;
        }
        else {
            return false;
        }
    }
    public static void main(String[] args) {

        boolean testProblemA = true;
        boolean testProblemB = false;
        boolean testProblemC = false;
        boolean testProblemD = false;

        if (testProblemA == true) {

            ArrayList<String> expectedResultList = new ArrayList<String>();
            expectedResultList.add("ab");
            expectedResultList.add("aab");
            expectedResultList.add("aaab");

            ArrayList<String> listToTestWith = new ArrayList<String>();
            listToTestWith.addAll(expectedResultList);
            listToTestWith.add("a");
            listToTestWith.add("aba");
            listToTestWith.add("abb");

            ArrayList<String> resultList = compareRegexAgainstList("aa*b", listToTestWith);
            if (resultList.equals(expectedResultList)) {
                System.out.println("compareRegexAgainstList function appears to work correctly.");
            }
            else {
                System.out.println("compareRegexAgainstList function appears to fail.");
                System.out.println("Should return from testing the words: ");
                for (String word : expectedResultList) {
                    System.out.println(word);
                }
                System.out.println("It is actually returning: ");
                for (String word : resultList) {
                    System.out.println(word);
                }
            }
        }

        if (testProblemB == true) {

            String regularExpressionForProblemB = "CHANGE ME";

            ArrayList<String> expectedResultList = new ArrayList<String>();
            expectedResultList.add("10000");
            expectedResultList.add("100000");
            expectedResultList.add("110000");
            expectedResultList.add("1000000");
            expectedResultList.add("1010000");
            expectedResultList.add("1100000");
            expectedResultList.add("1110000");
            expectedResultList.add("10000000");

            ArrayList<String> listToTestWith = new ArrayList<String>();
            listToTestWith.addAll(expectedResultList);
            listToTestWith.add("10001");
            listToTestWith.add("010000");
            listToTestWith.add("10100");
            listToTestWith.add("1");
            listToTestWith.add("10");
            listToTestWith.add("11");
            listToTestWith.add("100");
            listToTestWith.add("101");
            listToTestWith.add("1000");
            
            ArrayList<String> resultList = compareRegexAgainstList(regularExpressionForProblemB, listToTestWith);
            if (resultList.equals(expectedResultList)) {
                System.out.println("regularExpressionForProblemB appears to be correct.");
            }
            else {
                System.out.println("regularExpressionForProblemB appears to be incorrect.");
                System.out.println("Should return from testing the words: ");
                for (String word : expectedResultList) {
                    System.out.println(word);
                }
                System.out.println("It is actually returning: ");
                for (String word : resultList) {
                    System.out.println(word);
                }
            }
        }

        if (testProblemC == true) {

            String regularExpressionForIntegers1 = "(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*";
            String regularExpressionForIntegers2 = "\\p{Digit}\\p{Digit}*";
            String regularExpressionForProblemC = "CHANGE ME";

            ArrayList<String> expectedResultList = new ArrayList<String>();
            expectedResultList.add("mean");
            expectedResultList.add("sum2");
            
            ArrayList<String> listToTestWith = new ArrayList<String>();
            listToTestWith.addAll(expectedResultList);
            listToTestWith.add("47kmrs");
            listToTestWith.add("3.14159");

            ArrayList<String> resultList = compareRegexAgainstList(regularExpressionForProblemC, listToTestWith);
            if (resultList.equals(expectedResultList)) {
                System.out.println("regularExpressionForProblemC appears to be correct.");
            }
            else {
                System.out.println("regularExpressionForProblemC appears to be incorrect.");
                System.out.println("Should return from testing the words: ");
                for (String word : expectedResultList) {
                    System.out.println(word);
                }
                System.out.println("It is actually returning: ");
                for (String word : resultList) {
                    System.out.println(word);
                }
            }
        }

        if (testProblemD == true) {

            String regularExpressionForKeywords = "if|else|for|while|do|until";
            String regularExpressionForProblemD = "CHANGE ME";

            ArrayList<String> toProcess = new ArrayList<String>();
            String code = "while ( index < 5 ) { if ( index % 2 == 0 ) print ( value ) ; }";
            StringTokenizer tokenizer = new StringTokenizer(code);
            while (tokenizer.hasMoreTokens()) {
                toProcess.add(tokenizer.nextToken());
            }

            for (String word : toProcess) {
                if (Pattern.matches(regularExpressionForKeywords,word)) {
                    System.out.println("-- " + word + " -- is a keyword");
                }
                else if (Pattern.matches(regularExpressionForProblemD,word)) { 
                    System.out.println("-- " + word + " -- is an identifier");
                }
                else {
                    System.out.println("Unknown how to process " + word);
                }
            }
        }
    }
}