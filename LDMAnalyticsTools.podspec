Pod::Spec.new do |s|
  s.name         = "LDMAnalyticsTools"
  s.version      = "0.0.3"
  s.summary      = "This is analytics tool for ios development. Google Analytics and Flurry out-of-the-box"

  s.description  = <<-DESC
                   These tools needed for analytics engines.
                   If you don't know how to use analytics engines for iOS development, this is the best place to start.
                   Easy to use and some templates are ready after installation.
                   DESC
  s.homepage     = "https://github.com/lolgear/LDMAnalyticsTools"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Dmitry Lobanov" => "gaussblurinc@gmail.com" }

  s.platform     = :ios

  s.ios.deployment_target = "6.0"

  s.source       = {
    :git => "https://github.com/lolgear/LDMAnalyticsTools.git",
    :submodules => true,
    :tag => s.version.to_s
  }

  s.source_files  = "Tools/**/*.{h,m}", "ExternalLibraries/**/*.h", "Submodules/**/*.h"
  s.exclude_files = "Example"
  s.frameworks = "Foundation", "SystemConfiguration", "CoreData"

  s.libraries = "icucore", "z", "sqlite3.0"
  s.vendored_libraries = 'ExternalLibraries/**/*.a'

  s.requires_arc = true
  s.dependency 'Mixpanel'
end