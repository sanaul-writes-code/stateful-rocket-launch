# Critical Thinking Questions and Answers:

1. You started at 0, pressed Ignite 7 times, moved the slider to 52, then pressed Decrement twice. What exact value and color status did your app show at each step?

Answer: Initial value = 0, Text color = Red
Pressed ignite 7 times, Set of (values, colors) = {(1, orange), 
(2, orange), 
(3, orange), 
(4, orange), 
(5, orange), 
(6, orange), 
(7, orange)}

when the slider moved from 7 to 50 the color stayed orange. when the slider went above 50, at value 51 the color became green, and at value 52, the color stayed green. after hitting decrement twice the value and color were (51, green) and (50, orange).



2. Describe exactly what happened in your app when you attempted to go below 0 and above 100. What logic in your code prevented invalid values?

Answer: The _counter value never went below 0 or above 100. when the value went below 0 in decrement or above 100 in increment function, i set the value back to 0 and 100 respectively each time.

// Code:

void increment() {
    setState(() {
      _counter += 1;
      if (_counter > 100) {
        _counter = 100;
      }
      if (_counter == 100) {
        _showSuccessPopup();
      }
    });
  }

  void decrement() {
    setState(() {
      _counter -= 1;
      if (_counter < 0) {
        _counter = 0;
      }
    });
  }


3. At what exact action did your app switch from numeric display to "LIFTOFF!"? Explain how your condition check works and why it triggers at that point.

Answer:

when the _counter value became 100 either by going from 99 to 100 with increment button or any value to 100 by slider action, the app switched from numeric to liftoff. i just set the text widget in the container to liftoff when _counter == 100.