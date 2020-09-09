import java.util.ArrayList;

public class DFSMTabular {

    int numberOfStates;
    int numberOfAlphabetSymbols;
    ArrayList<Boolean> acceptingStates;
    int[][] table;

    // This function converts a symbol (character) to an integer
    // --
    // An 'a' in ASCII has the value 97 and 'b' has the value 98
    // This function will turn 'a' into 0 and 'b' into 1
    private int symbolToInt(char symbolArg) {
        int symbolAsciiValue = (int)symbolArg;
        int transformedValue = symbolAsciiValue - 97;
        return transformedValue;
    }

    // This function, given the current state the machine is in and the next input symbol,
    // returns the next state the machine should be in
    private int nextState(int currentStateArg, char symbolArg) {
        int intSymbol = symbolToInt(symbolArg);

        // The "if" part of this if/else handles symbols not in the alphabet
        if ((intSymbol < 0) || (intSymbol >= numberOfAlphabetSymbols)) {
            return -1;
        }
        // The "else does the table lookup based on the current state and input symbol
        else {
            return table[currentStateArg][intSymbol];
        }
    }

    // This function returns true if the word passed in to the function is accepted
    // by the machine and returns false if the word uses inappropriate symbols not
    // in the alphabet or if the word is rejected by the machine
    // It also generates and prints the trace of states visited by the machine.
    public boolean checkWord(String wordArg) {

        // This variable keeps track of which symbol in the word is being read
        int index;

        // This variable is the length of the word (used to determine the end of the word)
        int lengthOfWord = wordArg.length();

        // This string variable is the trace (the record of which states are visited)
        // The trace is initially empty and will have items added to it when
        // states are visited.
        String trace = "";

        // This variable represents the state the machine is in.
        // The initial state is 0
        int state = 0;

        // This loop determines each state the machine is to enter
        // by looping, updating the state and the symbol from the word
        // being read
        index  = 0;
        while ((index < lengthOfWord) && (state != -1)) {
            trace = trace + " s" + state;
            state = nextState(state, wordArg.charAt(index));
            index = index + 1;
        }

        // The last state is added to the trace and the trace is printed
        trace = trace + " s" + state;
        trace = trace.trim();
        System.out.println("Trace: " + trace);

        // Return false (the word is rejected) if -1 is the state
        // Otherwise, return whether or not the state is listed as
        // accepting or rejecting
        if (state == -1) {
            return false;
        }
        else {
            return acceptingStates.get(state);
        }
    }

    // This function is the constructor for the machine.  It defines
    // the number of states, the alphabet, the rules, and the accepting states.
    public DFSMTabular() {

        // This variable is used for loops
        int index;

        // This variable represents how many states are in the machine
        numberOfStates = 3;
        // This variable represents the size of the alphabet
        numberOfAlphabetSymbols = 2;

        // This array list contains for each state whether or not it is accepting (true/false)
        acceptingStates = new ArrayList<Boolean>();
        // Initially mark all states as not accepting
        for (index = 0; index < numberOfStates; index++) {
            acceptingStates.add(false);
        }
        // Then record which states are accepting
        acceptingStates.set(2,true);

        // This 2-d array encodes the transitions/rules of the finite state machine
        table = new int[numberOfStates][numberOfAlphabetSymbols];
        table[0][0] = 0; // encoding of rule 0:a>0
        table[0][1] = 1; // 0:b>1
        table[1][0] = 0; // 1:a>0
        table[1][1] = 2; // 1:b>2
        table[2][0] = 2; // 2:a>2
        table[2][1] = 2; // 2:b>2

    }

    // This is the main function which constructs an instance of the table-based machine
    // and then tests a word provided by the user for whether the machine accepts or rejects the word.
    public static void main(String[] args) {

        // This string is the word to verify if in the language encoded by the machine
        if (args.length != 1) {
            System.out.println("Usage: java DFSMTabular word_to_check");
        }
        else {
            // Create an instance of the DFSM
            DFSMTabular machine = new DFSMTabular();

            String word = args[0];

            boolean result = machine.checkWord(word);
            if (result == true) {
                System.out.println(word + " is accepted by the machine");
            }
            else {
                System.out.println(word + " is rejected by the machine");
            }
        }
    }
}
