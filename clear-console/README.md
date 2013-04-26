### Description

This is a function to clear the Aptana Scripting Console view

### How to use

```ruby
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

command 'Command name' do |cmd|
  cmd.input = :none
  cmd.output = :discard
  cmd.scope = :all
  cmd.invoke do |context|

    clearCosole() # this will clear the console view

    # put your code here

  end
end
```

or

```ruby
require 'ruble'
require 'clear_console'

command 'Command name' do |cmd|
  cmd.input = :none
  cmd.output = :discard
  cmd.scope = :all
  cmd.invoke do |context|

    clearCosole() # this will clear the console view

    # put your code here

  end
end
```