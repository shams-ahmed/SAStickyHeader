Pod::Spec.new do |s|
  s.name             = "SAStickyHeader"
  s.version          = "0.1.0"
  s.summary          = "A very simple sticky header with multiple image support via swipe gestures"

  s.description      = <<-DESC
                      A very simple sticky header with multiple image support via swipe gestures, allow your users to experience parallax effect with just one line of code. supports portrait and landscape and all iOS devices. tested on iOS 8 and iOS 9
                       DESC
  s.homepage         = "https://github.com/shams-ahmed/SAStickyHeader"
  s.license          = 'MIT'
  s.author           = { "Shams Ahmed" => "shamsahmed@me.com" }
  s.source           = { :git => "https://github.com/shams-ahmed/SAStickyHeader.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shams5035>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*.{h,m,swift}'
  s.resource_bundles = {
    'SAStickyHeader' => ['Pod/Assets/*.png']
  }
end
