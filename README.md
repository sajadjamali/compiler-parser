compiler projetc by cup and jflex tools.
The scanner takes the input file and returns the tokens based on the regular expressions defined in the lexical.flex file.
The parser takes the in.java file as an input and tries to create a parsing tree of its tokens with the grammars defined in the java12.cup file.

command for making cup classes:
java -jar cup.jar java12.cup
