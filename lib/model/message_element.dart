import 'package:flutter/widgets.dart';
import 'package:smart_syntax_widget/enum/language_enum.dart';
import 'package:smart_syntax_widget/enum/text_types_enum.dart';

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
