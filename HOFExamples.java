import java.util.ArrayList;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class HOFExamples {

    public static int max2(int value1, int value2) {
        if (value1 > value2) {
            return value1;
        }
        return value2;
    }

    public static boolean isEven(int value) {
        return (value % 2) == 0;
    }

    public static int flipSign(int value) {
        return -1 * value;
    }

    public static <T> ArrayList<T> convertStreamToArrayList(Stream<T> streamArg) {
        return streamArg.collect(Collectors.toCollection(ArrayList::new));
    }

    public static void main(String[] args) {
        ArrayList<Integer> listOfValues;
        ArrayList<Integer> resultList;

        listOfValues = new ArrayList<Integer>();
        listOfValues.add(2);
        listOfValues.add(1);
        listOfValues.add(-4);
        listOfValues.add(6);
        listOfValues.add(3);

        System.out.println("Initial set of values in an ArrayList");
        System.out.println(listOfValues.toString());

        System.out.println("Calling map with flipSign...");
        resultList = convertStreamToArrayList(listOfValues.stream().map(HOFExamples::flipSign));
        System.out.println(resultList.toString());

        System.out.println("Calling filter with isEven...");
        resultList = convertStreamToArrayList(listOfValues.stream().filter(HOFExamples::isEven));
        System.out.println(resultList.toString());

        System.out.println("Calling reduce with max2...");
        int maxValue = listOfValues.stream().reduce(listOfValues.get(0),HOFExamples::max2);
        System.out.println(maxValue);

        System.out.println("Calling map with lambda expression equivalent to flipSign...");
        resultList = convertStreamToArrayList(listOfValues.stream().map(x -> -1 * x));
        System.out.println(resultList.toString());

        System.out.println("Calling filter with lambda expression equivalent to isEven...");
        resultList = convertStreamToArrayList(listOfValues.stream().filter(x -> (x % 2) == 0));
        System.out.println(resultList.toString());

        System.out.println("Iterating over ArrayList to emulate flipSigns");
        resultList = new ArrayList<Integer>();
        for (int x : listOfValues) {
            resultList.add(-1 * x);
        }
        System.out.println(resultList);

    }
}
