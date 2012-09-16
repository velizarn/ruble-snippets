clear-console
============

### Description

This is a function to clear the Aptana Scripting Console view

### How to use

```ruby
require 'ruble'
require 'clear_console'

command 'Command name' do |cmd|
  cmd.input = :none
  cmd.output = :discard
  cmd.scope = :all
  cmd.invoke do |context|

    clearCosole()

    # put your code here

  end
end
```