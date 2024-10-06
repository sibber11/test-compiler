# test-compiler
this is a custom compiler.
  - lexical analyzer using `flex`
  - syntax analyzer using `bison` (make AST) `https://astexplorer.net/`
  - intermediate code generation (todo)
  - generate assembly code for Linux (todo)


# How to run

`bison -d parser.y && flex lexer.l && g++ parser.tab.c lex.yy.c -lfl && ./a.out < input.txt`