library smart_syntax_widget;
/*
this file contains the widget that this package is going to provide SmartSyntaxWidgetText
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_syntax_widget/enum/language_enum.dart';
import 'package:smart_syntax_widget/enum/text_types_enum.dart';
import 'package:smart_syntax_widget/model/message_element.dart';
import 'package:smart_syntax_widget/theme/smart_syntax_widget_theme_collection.dart';
import 'package:smart_syntax_widget/utils/comman_keywords.dart';
import 'package:smart_syntax_widget/utils/regex_collection.dart';
import 'package:smart_syntax_widget/utils/token.dart';
import 'package:smart_syntax_widget/utils/token_types.dart';

/// widget SmartSyntaxWidget this widget will provide the syntax highlighting to input text
class SmartSyntaxWidget extends StatelessWidget {
  /// input text code
  final String? text;

  /// theme for highlighting code
  final SmartSyntaxWidgetTheme theme;

  /// if set true will build a SelectableText.rich() widget, builds RichText otherwise
  final bool isSelectableText; // for building SelectableText.rich() widget

  /// to be passed as textAlign parameter of RichText widget
  final TextAlign textAlign;

  /// to be passed as textDirection parameter of RichText widget
  final TextDirection? textDirection;

  /// to be passed as softWrap parameter of RichText widget
  final bool softWrap;

  /// to be passed as textOverflow parameter of RichText widget
  /// default value is TextOverflow.clip
  final TextOverflow overflow;

  /// to be passed as textScaleFactor parameter of RichText widget
  final double textScaleFactor;

  /// to be passed as maxLines parameter of RichText widget
  final int? maxLines;

  /// to be passed as locale parameter of RichText widget
  final Locale? locale;

  /// to be passed as strutStyle parameter of RichText widget
  final StrutStyle? strutStyle;

  /// to be passed as textWidthBasis parameter of RichText widget
  final TextWidthBasis textWidthBasis;

  /// to be passed as textHeightBehavior parameter of RichText widget
  final TextHeightBehavior? textHeightBehavior;

  /// if true an additional line numbers widget will appear in left hand side
  final bool lineNumbers;

  /// choose google fonts you wish to use
  /// if it's value is null no google fonts will be used
  /// if not null it will use GoogleFonts.getFont(useGoogleFont) to get
  /// that font

  /// set of reserved words for this instance of SmartSyntaxWidget
  /// this allows to create language specific highlighting
  /// user can add desired reserved words for a language by using
  /// `ReservedWords.userReservedWords['language_name'] = {'keyword1', 'keyword2'}`
  /// make sure to import corresponding library before using it
  final Set<LanguageEnum> reservedWordSets;

  /// enable copy button widget at top right corner
  final bool hasCopyButton;

  /// custom icon for copu button
  final Icon copyIcon;

  //textFont
  final TextStyle? textStyle;

  /// SmartSyntaxWidget Widget constructor
  const SmartSyntaxWidget(
      {Key? key,
      this.text = "",
      this.textAlign = TextAlign.start,
      this.textDirection,
      this.softWrap = true,
      this.overflow = TextOverflow.clip,
      this.textScaleFactor = 1.0,
      this.maxLines,
      this.locale,
      this.strutStyle,
      this.textWidthBasis = TextWidthBasis.parent,
      this.textHeightBehavior,
      this.isSelectableText = false,
      this.theme = const SmartSyntaxWidgetTheme(),
      this.reservedWordSets = const {},
      this.lineNumbers = false,
      this.hasCopyButton = false,
      this.copyIcon = const Icon(
        Icons.copy,
        color: Colors.white,
      ),
      this.textStyle})
      : super(key: key);

  /// assertions before building widget
  void assertions() {
    // text must not contain \x00 character asserting before building
    assert(!text!.contains('\x00'));

    // line Numbers is for only RichText widget as of now
    // so both isSelectableText and lineNumbers can't be true one must be false
    // not needed anymore
    // assert((lineNumbers && isSelectableText) == false);
  }

  /// returns the TextStyle defined in theme for a particular type of token
  TextStyle _getStyleByTokenType(dynamic type) {
    switch (type) {
      case TokenTypes.keyword:
        return theme.keyword;

      case TokenTypes.number:
        return theme.number;

      case TokenTypes.classType:
        return theme.classStyle;

      case TokenTypes.function:
        return theme.function;

      case TokenTypes.identifier:
        return theme.identifier;

      case TokenTypes.staticType:
        return theme.staticStyle;

      case TokenTypes.constructor:
        return theme.constructor;

      case TokenTypes.comment:
        return theme.comment;

      case TokenTypes.string:
        return theme.string;

      case TokenTypes.operator:
        return theme.operator;

      case TokenTypes.separator:
        return theme.separator;

      case TokenTypes.method:
        return theme.method;

      case TokenTypes.private:
        return theme.private;

      case TokenTypes.multilineComment:
        return theme.multilineComment;

      case TokenTypes.lineNumber:
        return theme.lineNumber;

      default:
        // will never reach here in real case
        return const TextStyle();
    }
  }

  /// returns a fixed length string value for line number
  String _getLineValue(int value, int maxLength) => '  ${'  ' * (maxLength - '$value'.length)}$value  ';

//mape aktar       List<Map<String,dynamic>>
//if (textParts[0]['textType'] == 'standardText') {
  // add {item: tokenizer result , type: 'code' or 'text', language: 'language name' or 'text'}

  /// create and return TextSpans based on token inputs

/* List<TextSpan> _createSpans() => tokenizer(text)
      .map((token) =>
          TextSpan(text: token.value, style: _getStyleByTokenType(token.type)))
      .toList();
*/

  List<MessageElement> slicedSpans(String value) {
    return splitTextIntoSectionsWithTypes(value).map((e) => e.elementType == TextTypesEnum.text ? e : tokenizer(e)).toList();
  }

  List<MessageElement> _createSpans() => splitTextIntoSectionsWithTypes(text!).map((e) => e.elementType == TextTypesEnum.text ? e : tokenizer(e)).toList();

// slice the input text
// List<Map<String, String>> textParts = splitTextIntoSectionsWithTypes(input);
  static List<MessageElement> splitTextIntoSectionsWithTypes(String text) {
    List<String> parts = text.split('```');

    List<MessageElement> messageElements = [];

    for (int i = 0; i < parts.length; i++) {
      if (i % 2 == 0) {
        // Non-code text
        messageElements.add(MessageElement(elementType: TextTypesEnum.text, standartElementValue: parts[i].trim()));
      } else {
        // Code text
        var codeLines = parts[i].split('\n');
        var language = codeLines.isNotEmpty ? codeLines[0].trim() : 'unknown';
        // Remove the language line from the code text
        var codeContent = codeLines.sublist(1).join('\n').trim();
        messageElements.add(MessageElement(elementType: TextTypesEnum.code, standartElementValue: codeContent, elementLanguage: language.toLanguageEnum()));
      }
    }

    return messageElements;
  }

  /// creates and returns list of tokens from String input
  MessageElement tokenizer(MessageElement element) {
    String input = element.standartElementValue;

    List<Token> tokens = [];

    List<String> stringCommentList = [];

    // string and comment should be calculated at the beginning to avoid ambiguous matches later

    RegexCollection.regExpStringOrComment.allMatches(input).forEach((e) {
      stringCommentList.add(e.group(0)!);

      input = input.replaceFirst(e.group(0)!, RegexCollection.nullChar);
    });

    /*
  some properties of a token depends upon the trailing and upcoming token
  we can keep track of previous and next token to find out the property
   */

    Token? previousToken, currentToken, nextToken;

    final tokenList = RegexCollection.regExpTokenizer.allMatches(input).map((e) => e.group(0)!).toList();

    final listLength = tokenList.length;

    int p = 0, currentLineNumber = 1, maxLength = '${text!.split('\n').length + 1}'.length;

    if (listLength != 0) {
      if (RegexCollection.isNullChar(tokenList[0])) {
        currentToken = getTokenByString(stringCommentList[p]);
        p++;
      } else {
        currentToken = getTokenByString(tokenList[0]);
      }
    }

    if (listLength > 1) {
      if (RegexCollection.isNullChar(tokenList[1])) {
        nextToken = getTokenByString(stringCommentList[p]);

        p++;
      } else {
        nextToken = getTokenByString(tokenList[1]);
      }
    }

    if (lineNumbers) {
      tokens.add(Token(_getLineValue(currentLineNumber++, maxLength), TokenTypes.lineNumber, false));
    }

    for (int i = 0; i < listLength; ++i) {
      if (currentToken?.type == TokenTypes.identifier) {
        if (previousToken != null && previousToken.value.endsWith('.') && previousToken.isClassContext) {
          //static

          currentToken?.type = TokenTypes.staticType;

          currentToken?.isClassContext = true;
        } else {
          if (nextToken != null && nextToken.value.trim().startsWith('(')) {
            // function

            if (previousToken != null && previousToken.value.endsWith('.')) {
              currentToken?.isClassContext = false;

              currentToken?.type = TokenTypes.method;
            } else {
              currentToken?.isClassContext = false;

              currentToken?.type = TokenTypes.function;
            }
          } else {
            // identifier

            if (currentToken != null && RegexCollection.isPrivate(currentToken.value)) {
              currentToken.isClassContext = false;

              currentToken.type = TokenTypes.private;
            } else {
              currentToken?.isClassContext = false;

              currentToken?.type = TokenTypes.identifier;
            }
          }
        }
      } else if (currentToken?.type == TokenTypes.classType) {
        if (nextToken != null && nextToken.value.trim().startsWith('(')) {
          // constructor

          currentToken?.type = TokenTypes.constructor;

          currentToken?.isClassContext = false;
        } else {
          // class

          currentToken?.type = TokenTypes.classType;

          currentToken?.isClassContext = true;
        }
      } else {
        if (currentToken != null && ((currentToken.type == TokenTypes.operator && currentToken.value.endsWith('.')) || currentToken.type == TokenTypes.separator)) {
          currentToken.isClassContext = previousToken == null ? false : previousToken.isClassContext;
        } else {
          currentToken?.isClassContext = false;
        }
      }

      if (currentToken != null && currentToken.value.contains('\n') && lineNumbers) {
        var tkns = <Token>[];
        final splits = currentToken.value.split('\n');
        tkns.add(Token(splits[0], currentToken.type, currentToken.isClassContext));
        for (int i = 1; i < splits.length; ++i) {
          tkns.add(Token('\n${_getLineValue(currentLineNumber++, maxLength)}', TokenTypes.lineNumber, false));
          tkns.add(Token(splits[i], currentToken.type, currentToken.isClassContext));
        }
        tokens.addAll(tkns);
      } else {
        tokens.add(currentToken!);
      }

      if (currentToken.type != TokenTypes.separator) {
        previousToken = currentToken;
      }

      currentToken = nextToken;

      if (i < (listLength - 2)) {
        if (RegexCollection.isNullChar(tokenList[i + 2])) {
          nextToken = getTokenByString(stringCommentList[p]);

          p++;
        } else {
          nextToken = getTokenByString(tokenList[i + 2]);
        }
      } else {
        nextToken = null;
      }
    }

    return MessageElement(
        standartElementValue: input,
        elementType: TextTypesEnum.code,
        elementLanguage: element.elementLanguage,
        textSpans: tokens.map((token) => TextSpan(text: token.value, style: _getStyleByTokenType(token.type))).toList());
  }

  /// this functions initiates the starting properties of a token ,
  /// rest of the properties are calculated on basis of previous and next token
  Token getTokenByString(String value) {
    if (RegexCollection.isString(value)) {
      // String found
      return Token(value, TokenTypes.string, false);
    } else if (RegexCollection.isComment(value)) {
      //comment found
      if (RegexCollection.isSingleLineComment(value)) {
        return Token(value, TokenTypes.comment, false);
      } else {
        return Token(value, TokenTypes.multilineComment, false);
      }
    } else if (RegexCollection.isNumber(value)) {
      //number found
      return Token(value, TokenTypes.number, false);
    } else if (RegexCollection.isIdentifier(value)) {
      if (ReservedWords.isReservedWord(reservedWordSets, value)) {
        // keyword found
        return Token(value, TokenTypes.keyword, false);
      } else if (RegexCollection.isTitle(value)) {
        // class/constructor found
        return Token(value, TokenTypes.classType, true);
      } else {
        // identifier found
        return Token(value, TokenTypes.identifier, false);
      }
    } else if (RegexCollection.isOperator(value)) {
      //operator found
      return Token(value, TokenTypes.operator, false);
    } else {
      // separator found
      return Token(value, TokenTypes.separator, false);
    }
  }

  /// creates main widget if isSelectableText is true returns RichText otherwise SelectableText.rich()
  Widget _highlighter() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createSpans()
            .map((e) => e.elementType == TextTypesEnum.text
                ? standartTextReturn(e)
                : e.elementType == TextTypesEnum.code
                    ? codeArea(richTextReturn(messageElement: e), e)
                    : standartTextReturn(e))
            .toList(),
      );

  Widget standartTextReturn(MessageElement messageElement) {
    if (isSelectableText) {
      return SelectableText(messageElement.standartElementValue, style: textStyle);
    } else {
      return Text(messageElement.standartElementValue, style: textStyle);
    }
  }

  /// floating copy button widget
  Widget messageCopyButton() {
    return IconButton(onPressed: () => Clipboard.setData(ClipboardData(text: text!)), icon: copyIcon);
  }

  Widget codeCopyButton(String codeMessage) {
    return TextButton.icon(
      label: Text(
        "Copy code",
        style: theme.codeHeaderTextStyle,
      ),
      onPressed: () => Clipboard.setData(ClipboardData(text: codeMessage)),
      icon: copyIcon,
    );
  }

  Widget codeArea(Widget codeText, MessageElement messageElement) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: theme.codeBackgroundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: theme.codeHeaderDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      messageElement.elementLanguage!.toLanguageString(),
                      style: theme.codeHeaderTextStyle,
                    ),
                  ),
                  codeCopyButton(messageElement.standartElementValue)
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: codeText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget richTextReturn({required MessageElement messageElement}) {
    if (isSelectableText) {
      return SelectableText.rich(
        TextSpan(text: '', children: messageElement.textSpans),
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    } else {
      return RichText(
        text: TextSpan(
          text: '',
          children: messageElement.textSpans,
        ),
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        locale: locale,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    assertions();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: hasCopyButton
          ? Stack(
              alignment: Alignment.topRight,
              children: [Align(alignment: Alignment.topLeft, child: _highlighter()), messageCopyButton()],
            )
          : _highlighter(),
    );
  }
}
