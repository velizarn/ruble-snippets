require 'ruble'
require 'ruble/ui'
require 'open-uri'
require 'net/http'

command 'Shorten URL' do |cmd|
  cmd.input = :selection
  cmd.output = :copy_to_clipboard
  cmd.scope = :all
  cmd.invoke do |context|

    service_url = 'v.gd'

    selection = ENV['TM_SELECTED_TEXT']

    if (selection.nil? || selection.empty?) then
      options = {
        :title => "Enter URL",
        :prompt => "Enter URL for shortening",
        :button1 => "Ok",
        :button2 => "Cancel",
      }
      selection = Ruble::UI.request_string(options)
      if (selection.nil? || selection.empty?) then
        Ruble::Logger.log_error "Empty URL string"
        context.exit_discard()
      end
    end

    url = 'http://'+service_url+'/create.php?format=simple&url='+selection

    uri = URI.parse(url)
    gdResponse = nil

    Net::HTTP.start(uri.host, uri.port) do |http|
      gdResponse = http.get(uri.request_uri)
    end

     if (gdResponse.code != '200') then
       Ruble::Logger.log_error "Error while shortening the selected URL..."
       Ruble::Logger.log_error gdResponse.body
       context.exit_discard()
     end

     puts gdResponse.body

     Ruble::Logger.log_info "Shortened URL "+gdResponse.body+" has been copied to clipboard"

  end
end