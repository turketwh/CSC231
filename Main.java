<pre><code>import java.util.ArrayList;

class DFSMIfElse {

    int numberOfStates;
    int numberOfAlphabetSymbols;
    ArrayList&lt;Boolean&gt; acceptingStates;

    // This function, given the current state the machine is in and the next input symbol,
    // returns the next state the machine should be in
    private int nextState(int currentStateArg, char symbolArg) {

        int next;

        // The outer &quot;if/else&quot; is based on the current state
        // The inner &quot;if/else&quot; is based on the current symbol being read
        // The final &quot;else&quot; case in all scenarios handles
        // both moves to the trash state and symbols not in the alphabet
        if (currentStateArg == 0) {
            if (symbolArg == &#39;a&#39;) { next = 0; }
            else if (symbolArg == &#39;b&#39;) { next = 1; }
            else { next = -1; }
        }
        else if (currentStateArg == 1) {
            if (symbolArg == &#39;a&#39;) { next = 0; }
            else if (symbolArg == &#39;b&#39;) { next = 2; }
            else { next = -1; }
        }
        else { // in state 2
            if (symbolArg == &#39;a&#39;) { next = 2; }
            else if (symbolArg == &#39;b&#39;) { next = 2; }
            else { next = -1; }
        }
        return next;
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
        String trace = &quot;&quot;;

        // This variable represents the state the machine is in.
        // The initial state is 0
        int state = 0;

        // This loop determines each state the machine is to enter
        // by looping, updating the state and the symbol from the word
        // being read
        index  = 0;
        while ((index &lt; lengthOfWord) &amp;&amp; (state != -1)) {
            trace = trace + &quot; s&quot; + state;
            state = nextState(state, wordArg.charAt(index));
            index = index + 1;
        }

        // The last state is added to the trace and the trace is printed
        trace = trace + &quot; s&quot; + state;
        trace = trace.trim();
        System.out.println(&quot;Trace: &quot; + trace);

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
    // the number of states, the alphabet, and the accepting states.
    // The rules are embedded in the code in the nextState function.
    public DFSMIfElse() {

        // This variable is used for loops
        int index;

        // This variable represents how many states are in the machine
        numberOfStates = 3;
        // This variable represents the size of the alphabet
        numberOfAlphabetSymbols = 2;

        // This array list contains for each state whether or not it is accepting (true/false)
        acceptingStates = new ArrayList&lt;Boolean&gt;();
        // Initially mark all states as not accepting
        for (index = 0; index &lt; numberOfStates; index++) {
            acceptingStates.add(false);
        }
        // Then record which states are accepting
        acceptingStates.set(2,true);
    }
}

public class Main {
    // This is the main function which constructs an instance of the table-based machine
    // and then tests a word provided by the user for whether the machine accepts or rejects the word.
    public static void main(String[] args) {

        if (args.length != 1) {
            System.out.println(&quot;Usage: java Main word_to_check&quot;);
        }
        else {
            // Create an instance of the DFSM
            DFSMIfElse machine = new DFSMIfElse();

            // This string is the word to verify if in the language encoded by the machine
            String word = args[0];

            boolean result = machine.checkWord(word);
            if (result == true) {
                System.out.println(word + &quot; is accepted by the machine&quot;);
            }
            else {
                System.out.println(word + &quot; is rejected by the machine&quot;);
            }
        }
    }
}</code></pre>
