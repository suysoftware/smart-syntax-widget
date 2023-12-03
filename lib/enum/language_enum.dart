enum LanguageEnum {
  java,
  python,
  c,
  cpp,
  csharp,
  dart,
  go,
  javascript,
  r,
  swift,
  bash,
  ruby,
  sql,
  objectivec,
  php,
  kotlin,
  scala,
  perl,
  matlab,
  html,
  css,
  xml,
  typescript,
  plain,
  ada,
  assembly,
  clojure,
  cobol,
  elixir,
  erlang,
  fortran,
  groovy,
  haskell,
  julia,
  lua,
  pascal,
  prolog,
  rust,
  scheme,
  smalltalk,
  vhdl,
  brainfuck,
  racket,
  fsharp
}

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
      case 'sql':
        return LanguageEnum.sql;
      case 'objective-c':
        return LanguageEnum.objectivec;
      case 'php':
        return LanguageEnum.php;
      case 'kotlin':
        return LanguageEnum.kotlin;
      case 'scala':
        return LanguageEnum.scala;
      case 'perl':
        return LanguageEnum.perl;
      case 'matlab':
        return LanguageEnum.matlab;
      case 'html':
        return LanguageEnum.html;
      case 'css':
        return LanguageEnum.css;
      case 'xml':
        return LanguageEnum.xml;
      case 'typescript':
        return LanguageEnum.typescript;
      case 'plain':
        return LanguageEnum.plain;
      case 'ada':
        return LanguageEnum.ada;
      case 'assembly':
        return LanguageEnum.assembly;
      case 'clojure':
        return LanguageEnum.clojure;
      case 'cobol':
        return LanguageEnum.cobol;
      case 'elixir':
        return LanguageEnum.elixir;
      case 'erlang':
        return LanguageEnum.erlang;
      case 'fortran':
        return LanguageEnum.fortran;
      case 'groovy':
        return LanguageEnum.groovy;
      case 'haskell':
        return LanguageEnum.haskell;
      case 'julia':
        return LanguageEnum.julia;
      case 'lua':
        return LanguageEnum.lua;
      case 'pascal':
        return LanguageEnum.pascal;
      case 'prolog':
        return LanguageEnum.prolog;
      case 'rust':
        return LanguageEnum.rust;
      case 'scheme':
        return LanguageEnum.scheme;
      case 'smalltalk':
        return LanguageEnum.smalltalk;
      case 'vhdl':
        return LanguageEnum.vhdl;
      case 'brainfuck':
        return LanguageEnum.brainfuck;
      case 'racket':
        return LanguageEnum.racket;
      case 'fsharp':
        return LanguageEnum.fsharp;
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
      case LanguageEnum.sql:
        return 'sql';
      case LanguageEnum.objectivec:
        return 'objective-c';
      case LanguageEnum.php:
        return 'php';
      case LanguageEnum.kotlin:
        return 'kotlin';
      case LanguageEnum.scala:
        return 'scala';
      case LanguageEnum.perl:
        return 'perl';
      case LanguageEnum.matlab:
        return 'matlab';
      case LanguageEnum.html:
        return 'html';
      case LanguageEnum.css:
        return 'css';
      case LanguageEnum.xml:
        return 'xml';
      case LanguageEnum.typescript:
        return 'typescript';
      case LanguageEnum.plain:
        return 'plain';
      case LanguageEnum.ada:
        return 'ada';
      case LanguageEnum.assembly:
        return 'assembly';
      case LanguageEnum.clojure:
        return 'clojure';
      case LanguageEnum.cobol:
        return 'cobol';
      case LanguageEnum.elixir:
        return 'elixir';
      case LanguageEnum.erlang:
        return 'erlang';
      case LanguageEnum.fortran:
        return 'fortran';
      case LanguageEnum.groovy:
        return 'groovy';
      case LanguageEnum.haskell:
        return 'haskell';
      case LanguageEnum.julia:
        return 'julia';
      case LanguageEnum.lua:
        return 'lua';
      case LanguageEnum.pascal:
        return 'pascal';
      case LanguageEnum.prolog:
        return 'prolog';
      case LanguageEnum.rust:
        return 'rust';
      case LanguageEnum.scheme:
        return 'scheme';
      case LanguageEnum.smalltalk:
        return 'smalltalk';
      case LanguageEnum.vhdl:
        return 'vhdl';
      case LanguageEnum.brainfuck:
        return 'brainfuck';
      case LanguageEnum.racket:
        return 'racket';
      case LanguageEnum.fsharp:
        return 'fsharp';
      default:
        return '';
    }
  }
}
