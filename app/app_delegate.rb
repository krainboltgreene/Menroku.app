require "menroku"

class AppDelegate
  attr_accessor :status_menu

  def applicationDidFinishLaunching(notification)
    @app_name = NSBundle.mainBundle.infoDictionary["CFBundleDisplayName"]
    @source = Menroku.new
    @status_menu = @source.menu
    @status_item = @source.item
  end
end
