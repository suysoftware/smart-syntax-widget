import 'package:flutter/material.dart';
import 'package:smart_syntax_widget/smart_syntax_widget.dart';
import 'package:smart_syntax_widget/theme/smart_syntax_widget_theme_collection.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainApp createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  SmartSyntaxWidget _smartSyntaxWidget = SmartSyntaxWidget();

  String _text = '''
Certainly! Flutter is a popular framework for building cross-platform mobile applications using a single codebase. It uses the Dart programming language. I'll provide you with a simple example of Flutter code and explain what each part does.

Here's a basic Flutter application that displays a simple "Hello World" message on the screen:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Uygulama Sayfası'),
        ),
        body: Center(
          child: Text(
            'Merhaba, bu bir uygulama sayfasıdır!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
```

This line imports the Material package from Flutter, which provides a lot of standard UI components.

```dart
appBar: AppBar(
  title: Text('Hello World App'),
),
body: Center(
  child: Text('Hello World!'),
),
```
''';

  final ScrollController scrollController = ScrollController();
  _MainApp() {
    initializeTheme();
    print(_smartSyntaxWidget.slicedSpans(_text).first.standartElementValue);
  }
  List<Widget> mainWidgets() => [
        Expanded(
            child: SingleChildScrollView(
                child: Container(
          width: 500,
          height: 1000,
          color: Colors.black.withOpacity(0.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: [
                SmartSyntaxWidget(
                    text: _text,
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
              ],
            ),
          ),
        ))),
        Container(
          width: 500,
          height: 1000,
          color: Colors.black.withOpacity(0.25),
          child: TextField(
            minLines: 1,
            maxLines: 1000,
            onChanged: (String v) {
              setState(() {
                _text = v;
              });
            },
          ),
        ),
      ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(children: mainWidgets()));
  }

  void initializeTheme() {}
}

class Props {
  Color color;
  String weight, style;
  static String? fontFamily;
  static double? letterSpacing = 1, wordSpacing, fontSize;
  static bool lineNumbers = false, isSelectableText = true, hasCopyButton = false;
  static Set<String> fontFeatures = {};
  Props(this.color, this.weight, this.style);
}
