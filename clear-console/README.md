clear-console
============

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
    if console.getType() == "org.eclipse.ui.MessageConsole" && console.getName() == "Aptana Scripting Console" then
    	console.clearConsole()
    end
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