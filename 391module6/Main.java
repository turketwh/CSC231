import java.util.ArrayList;
import java.util.regex.*;

public class Main {

    public static ArrayList<String> compareRegexAgainstList(String regularExpressionArg, ArrayList<String> listArg) {
        int index;
        String word;
        ArrayList<String> returnList = new ArrayList<String>();
        Pattern p = Pattern.compile(regularExpressionArg);
        for (index = 0; index < listArg.size(); index++) {
            word = listArg.get(index);
            if (p.matcher(word).matches() == true) {
                returnList.add(word);
            }
        }
        return returnList;
    }

    public static void main(String[] args) {

        ArrayList<String> filenames = new ArrayList<String>();
        filenames.add("description1.txt");
        filenames.add("description2.txt");
        filenames.add("description3.txt");
        filenames.add("description42.txt");
        filenames.add("output1.pdf");
        filenames.add("results.pdf");
        filenames.add("input1.dat");

        ArrayList<String> resultList = compareRegexAgainstList("---CHANGE ME---", filenames);
        System.out.println("Matching filenames:");
        for (String word : resultList) {
            System.out.println(word);
        }
    }
}