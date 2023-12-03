/// 'java', 'python', 'c', 'cpp', 'cSharp', 'dart', 'go', 'javascript', 'r', 'swift', 'bash', 'ruby'
enum LanguageEnum { java, python, c, cpp, csharp, dart, go, javascript, r, swift, bash, ruby }


extension LanguageFromString on String {
  LanguageEnum? toLanguageEnum() {
    switch (this) {
      case 'java':
        return LanguageEnum.java;
      case 'python':
        return LanguageEnum.python;
      case 'c':
        return LanguageEnum.c;
      case 'cpp':
        return LanguageEnum.cpp;
      case 'csharp':
        return LanguageEnum.csharp;
      case 'dart':
        return LanguageEnum.dart;
      case 'go':
        return LanguageEnum.go;
      case 'javascript':
        return LanguageEnum.javascript;
      case 'r':
        return LanguageEnum.r;
      case 'swift':
        return LanguageEnum.swift;
      case 'bash':
        return LanguageEnum.bash;
      case 'ruby':
        return LanguageEnum.ruby;
      default:
        return null;
    }
  }
}

extension LanguageEnumToString on LanguageEnum {
  String toLanguageString() {
    switch (this) {
      case LanguageEnum.java:
        return 'java';
      case LanguageEnum.python:
        return 'python';
      case LanguageEnum.c:
        return 'c';
      case LanguageEnum.cpp:
        return 'cpp';
      case LanguageEnum.csharp:
        return 'csharp';
      case LanguageEnum.dart:
        return 'dart';
      case LanguageEnum.go:
        return 'go';
      case LanguageEnum.javascript:
        return 'javascript';
      case LanguageEnum.r:
        return 'r';
      case LanguageEnum.swift:
        return 'swift';
      case LanguageEnum.bash:
        return 'bash';
      case LanguageEnum.ruby:
        return 'ruby';
      default:
        return '';
    }
  }
}