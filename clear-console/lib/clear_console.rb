require 'ruble'
require 'java'

java_import org.eclipse.ui.console.ConsolePlugin
java_import org.eclipse.ui.console.IConsole

def clearCosole()
  consoleCollection = ConsolePlugin.getDefault().getConsoleManager().getConsoles()
  consoleCollection.each {|console|
    console.clearConsole() if console.getType() == "org.eclipse.ui.MessageConsole" && ["Aptana Scripting Console", "Studio Console"].include?(console.getName().to_s)
  }
end