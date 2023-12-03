import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_syntax_widget/smart_syntax_widget.dart';

void main() {
  const myApp = MaterialApp(
    home: Scaffold(
      body: SmartSyntaxWidget(
        text: '''for i in range:
  print(i)''',
        textStyle: TextStyle(),
      ),
    ),
  );
  testWidgets('testing a python code ui', (tester) async {
    await tester.pumpWidget(myApp);
    expect(find.byType(SmartSyntaxWidget), findsOneWidget); //err
  });
}
