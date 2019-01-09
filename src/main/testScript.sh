export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
rm *.class
rm *.tokens
rm *.java
java -jar /usr/local/lib/antlr-4.7.1-complete.jar Smoola.g4
javac *.java
java org.antlr.v4.gui.TestRig Smoola program < ./Tests/p1.sml
