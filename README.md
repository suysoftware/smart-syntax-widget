<p align="center">
<img src="https://firebasestorage.googleapis.com/v0/b/think-buddy.appspot.com/o/default_files%2FDALL%C2%B7E%202023-12-04%2001.32.42%20-%20A%20logo%20design%20for%20'SmartSyntaxWidget'%2C%20focusing%20solely%20on%20an%20old-school%20coding%20aesthetic.%20The%20design%20should%20feature%20a%20vintage%20computer%20terminal%20screen.png?alt=media&token=4820318b-547e-450e-b236-15bdc6057a88" height="256" alt="SmartSyntaxWidget" />
</p>

# SmartSyntaxWidget for Flutter

SmartSyntaxWidget is a Flutter package designed to simplify the process of displaying mixed content types, specifically standard text and Dart code snippets, within your Flutter applications. This package offers an efficient way to parse and render text and code seamlessly, enhancing readability and user experience.

## Features

#### Flexible Parsing: 
SmartSyntaxWidget can intelligently differentiate between standard text and Dart code snippets in a given string.
#### Customizable Display:
Render text and code with distinct styles, ensuring clear distinction and readability.
#### Easy Integration
Simple to implement within existing Flutter projects.
## Installation

#### Use this package as a library

##### with Flutter:
```bash
 $ flutter pub add smart_syntax_widget

```
This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```bash
dependencies:
  smart_syntax_widget: ^0.0.1

```
Import it

Now in your Dart code, you can use:
```bash
import 'package:smart_syntax_widget/smart_syntax_widget.dart';
```
## Usage Scenarios

### Scenario 1: Displaying Only Code
For instances where you need to display only Dart code with proper formatting, SmartSyntaxWidget handles this effortlessly.
```dart
     SmartSyntaxWidget(
                    text: "only code text" ,
                    textStyle: TextStyle(color: Colors.black.withOpacity(0.55)),
                    lineNumbers: Props.lineNumbers,
                    isSelectableText: Props.isSelectableText,
                    copyIcon: Icon(
                      Icons.copy_rounded,
                      size: 15,
                      color: Colors.white.withOpacity(0.55),
                    ),
                    hasCopyButton: false,
                    theme: SmartSyntaxWidgetTheme(
                      codeBackgroundDecoration: BoxDecoration(color: Colors.black.withOpacity(0.70)),
                      codeHeaderDecoration: BoxDecoration(color: Colors.black.withOpacity(0.90)),
                      codeHeaderTextStyle: TextStyle(color: Colors.black.withOpacity(0.55)),
                    )),
```


### Scenario 2: Mixed Text and Code String
When dealing with a string that contains both text and Dart code snippets, SmartSyntaxWidget seamlessly parses and displays them.

```dart
     SmartSyntaxWidget(
                    text: "code and text together" ,
                    textStyle: TextStyle(color: Colors.black.withOpacity(0.55)),
                    lineNumbers: Props.lineNumbers,
                    isSelectableText: Props.isSelectableText,
                    copyIcon: Icon(
                      Icons.copy_rounded,
                      size: 15,
                      color: Colors.white.withOpacity(0.55),
                    ),
                    hasCopyButton: false,
                    theme: SmartSyntaxWidgetTheme(
                      codeBackgroundDecoration: BoxDecoration(color: Colors.black.withOpacity(0.70)),
                      codeHeaderDecoration: BoxDecoration(color: Colors.black.withOpacity(0.90)),
                      codeHeaderTextStyle: TextStyle(color: Colors.black.withOpacity(0.55)),
                    )),
```

### Scenario 3: Utilizing Package Functions
SmartSyntaxWidget offers a straightforward API for parsing and rendering mixed content types.

1. Create an Instance:
```dart
SmartSyntaxWidget _smartSyntaxWidget = SmartSyntaxWidget();
```

2. Send String Value to Function:

```dart
List<MessageElement> elements = _smartSyntaxWidget.slicedSpans(_text);
```

3. Use Element Data:
```dart
class MessageElement {
  String standartElementValue;
  TextTypesEnum elementType;
  LanguageEnum? elementLanguage;
  List<TextSpan> textSpans;

  MessageElement({
    required this.standartElementValue,
    required this.elementType,
    this.elementLanguage,
    this.textSpans = const [],
  });
}
```
Depending on the elementType (TextTypesEnum.text or TextTypesEnum.code), you can utilize standartElementValue for text or textSpans for code segments.



### Example Implementation

```dart
String _text = '''
// Your mixed content with text and Dart code
''';

SmartSyntaxWidget _smartSyntaxWidget = SmartSyntaxWidget();
List<MessageElement> elements = _smartSyntaxWidget.slicedSpans(_text);

Widget _highlighter() => Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _smartSyntaxWidget
          .slicedSpans(_text)
          .map((e) => e.elementType == TextTypesEnum.text
              ? _smartSyntaxWidget.standartTextReturn(e)
              : e.elementType == TextTypesEnum.code
                  ? _smartSyntaxWidget.codeArea(_smartSyntaxWidget.richTextReturn(messageElement: e), e)
                  : _smartSyntaxWidget.standartTextReturn(e))
          .toList(),
    );

Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
    child: _highlighter()
);

```
Feel free to customize the implementation as per your application needs.


## Screenshots

### Input  & Output 
<p align="left">
<img src="https://firebasestorage.googleapis.com/v0/b/think-buddy.appspot.com/o/default_files%2Fa111.png?alt=media&token=0b4951b6-760f-4302-9029-e254410fc6ea" height="400" alt="SmartSyntaxWidgeti1" />
<img src="https://firebasestorage.googleapis.com/v0/b/think-buddy.appspot.com/o/default_files%2Fa222.png?alt=media&token=2e2ce3e6-5d4b-4ae3-9f92-f3fbc877df77" height="400" alt="SmartSyntaxWidgeto1" />
</p>



### Input  & Output 
<p align="left">
<img src="https://firebasestorage.googleapis.com/v0/b/think-buddy.appspot.com/o/default_files%2Fb111.png?alt=media&token=55c60170-84a9-4556-b0aa-b3c7d8b2fa57" height="400" alt="SmartSyntaxWidgeti2" />
<img src="https://firebasestorage.googleapis.com/v0/b/think-buddy.appspot.com/o/default_files%2Fb222.png?alt=media&token=b6871cb7-8470-448b-bbe7-9ff18bbad2b8" height="400" alt="SmartSyntaxWidgeto2" />
</p>


## Who's using it?


- ThinkBuddy - Made for native MacOS experience integrated with AI


## 🚀 About Me
Hello, I'm Sezer Ufuk, the Co-Founder & CTO at ThinkBuddy, LLC. I specialize in leading technical development and innovation, with a passion for creating valuable packages for Flutter developers in my spare time. Explore my work and contributions on GitHub.
## Authors

- [@suysoftware](https://www.github.com/suysoftware.)


## License

[MIT](https://choosealicense.com/licenses/mit/)
