#
# Be sure to run `pod lib lint EDSlideMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EDSlideMenu'
  s.version          = '1.0.0'
s.summary          = 'Swipe Left Or Right, just like drawermenu in android..'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

 #  s.description      = <<-DESC
#  TODO: Add long description of the pod here.
 #                       DESC

  s.homepage         = 'https://github.com/eneadume/EDSlideMenuRepo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EneaDume' => 'eneadume@gmail.com' }
  s.source           = { :git => 'https://github.com/eneadume/EDSlideMenuRepo.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/enea-dume-257b33b2/'

  s.ios.deployment_target = '8.0'

  s.source_files = 'EDSlideMenu/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EDSlideMenu' => ['EDSlideMenu/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
