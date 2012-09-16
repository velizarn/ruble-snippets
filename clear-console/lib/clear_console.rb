require 'ruble'
require 'java'

java_import org.eclipse.ui.console.ConsolePlugin
java_import org.eclipse.ui.console.IConsole

def clearCosole()
  consoleCollection = ConsolePlugin.getDefault().getConsoleManager().getConsoles()
  consoleCollection.each {|console|
    console.clearConsole() if console.getType() == "org.eclipse.ui.MessageConsole" && console.getName() == "Aptana Scripting Console"
  }
end