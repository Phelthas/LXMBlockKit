
Pod::Spec.new do |s|

  s.name         = "LXMBlockKit"
  s.version      = "0.0.4"
  s.summary      = "LXMBlockKit"
  s.description  = <<-DESC
		Some category adding block API for UIKit
                   DESC
  s.homepage     = "https://github.com/Phelthas/LXMBlockKit"
  s.license      = "MIT"
  s.author             = { "Phelthas" => "https://github.com/Phelthas" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Phelthas/LXMBlockKit.git", :tag => "0.0.4" }
  s.source_files  = "LXMBlockKitDemo/LXMBlockKit"
  s.public_header_files = "LXMBlockKitDemo/LXMBlockKit/*.{h}"
  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end
