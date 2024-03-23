import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    
    // Define your desired window size here
    let desiredWidth: CGFloat = 800
    let desiredHeight: CGFloat = 1000

    // Calculate the center position based on the desired size
    let screenSize = NSScreen.main?.frame.size ?? CGSize(width: desiredWidth, height: desiredHeight)
    let xPos = (screenSize.width - desiredWidth) / 2
    let yPos = (screenSize.height - desiredHeight) / 2
    
    // Create a new window frame with the desired size and position
    let windowFrame = NSRect(x: xPos, y: yPos, width: desiredWidth, height: desiredHeight)
    
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    
    RegisterGeneratedPlugins(registry: flutterViewController)
    
    super.awakeFromNib()
  }
}
