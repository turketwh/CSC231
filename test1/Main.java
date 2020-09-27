import java.util.regex.*;

public class Main {

    public static void main(String[] args) {

        
      String[] phoneNumbers = new String[8];
      // phone numbers 0 through 3 should be accepted
      phoneNumbers[0] = "336-758-4427";
      phoneNumbers[1] = "336-758-4401";
      phoneNumbers[2] = "336-716-2304";
      phoneNumbers[3] = "336-716-9999";
      //phone numbers 4 through 7 should be rejected
      phoneNumbers[4] = "803-356-2417";
      phoneNumbers[5] = "36-997-6923";
      phoneNumbers[6] = "336-758-44271";
      phoneNumbers[7] = "336-758_4427";

      String regularExpression = ";

      Pattern p = Pattern.compile(regularExpression);

      for (int i = 0; i < 8; i++) {
        if (p.matcher(phoneNumbers[i]).matches() == true) {
          System.out.println("Phone number " + i + ": " + phoneNumbers[i] + " is accepted");
        }
        else {
          System.out.println("Phone number " + i + ": " + phoneNumbers[i] + " is rejected");
        }
      }
    }
}
