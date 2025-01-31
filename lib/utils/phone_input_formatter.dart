import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter{

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    final newLength = newValue.text.length;
    final oldLength = oldValue.text.length;

final int newTextLength = newValue.text.length;
int selectionIndex = newValue.selection.end;
int usedSubstringIndex = 0;
final StringBuffer newText = new StringBuffer();
if (newTextLength >= 3) {
  newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + '-');
  if (newValue.selection.end >= 4)
    selectionIndex ++;
}
if (newTextLength >= 6) {
  newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
  if (newValue.selection.end >= 7)
    selectionIndex++;
}
// Dump the rest.
if (newTextLength >= usedSubstringIndex)
  newText.write(newValue.text.substring(usedSubstringIndex));
return new TextEditingValue(
  text: newText.toString(),
  selection: new TextSelection.collapsed(offset: selectionIndex),
); 

  }

}