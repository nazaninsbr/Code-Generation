del *.class
del *.tokens
del *.java
java org.antlr.v4.Tool Smoola.g4
javac *.java
java org.antlr.v4.runtime.misc.TestRig Smoola program  < ./Tests/p3.sml
cd J_FILES
java -jar jasmin.jar *.j
java JavaMain
cd ..

