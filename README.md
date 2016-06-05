# iOSND-P2-L3-TextFieldsChallenge

For zip code UITextField:
    resignFirstResponse() will be called when the count of numbers input meets 5
    
    
For cash UITextField:
    if user input is number:
      1 convert text existed in UITextField to number by NSNumberFormatter
      2 time the number by 10
      3 convert the result number to text as resultText, but eliminate the last character "0"
      4 make the UITextField.text as resultText
      5 (So in a real device or simulator, the text in UITextField will be composed by resultText followed by the string user input)
    
    if user input is backspace:
      1 get the text existed in UITextField
      2 make a substring from that string but eliminating the last character
      3 convert the substring to a value as resultValue by NSNumberFormatter
      4 devide resultValue by 10
      5 convert resultValue to text as resultText by NSNumberFormatter
      6 append the resultText with an space character " " （This extra space character will absorb the backspace character user input)
      7 make the UITextField.text as resultText
      
For lockable UITextField:
     in the shouldChangeCharactersInRange delegate: simply return lockSwitch.on
