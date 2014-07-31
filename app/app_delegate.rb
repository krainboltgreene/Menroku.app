require "menroku"

class AppDelegate
  attr_accessor :status_menu

  def applicationDidFinishLaunching(notification)
    @source = Menroku.new(NSBundle.mainBundle.infoDictionary["CFBundleDisplayName"], "e0373389-154c-49ce-b38e-664793520400")

    @source.to_ns
  end
end
