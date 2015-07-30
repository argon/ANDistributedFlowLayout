Pod::Spec.new do |s|
  s.name             = "ANDistributedFlowLayout"
  s.version          = "1.0.1"
  s.summary          = "Distributes cells across the width of the collection view."

  s.homepage         = "https://github.com/argon/ANDistributedFlowLayout"
  s.license          = 'MIT'
  s.author           = { "keighl" => "keighl@keighl.com", "argon" => "argon@mkbot.net" }
  s.source           = { :git => "https://github.com/argon/ANDistributedFlowLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/argon'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'ANDistributedFlowLayout.{h,m}'

  s.frameworks = 'UIKit'

end
