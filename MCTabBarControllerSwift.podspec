Pod::Spec.new do |s|
s.name         = "MCTabBarControllerSwift"
s.version      = "1.0.2"
s.summary      = "A easy way to customize your tabBarController"
s.homepage     = "https://github.com/Ccalary/MCTabBarController"
s.license      = "MIT"
s.author             = { "Ccalary" => "caohouhong@163.com" }
s.platform     = :ios, "8.0"
s.ios.deployment_target = "8.0"
s.source       = { :git => "https://github.com/Ccalary/MCTabBarController.git", :tag => "#{s.version}" }
s.source_files  = "MCTabBarControllerSwift/MCTabBarSwift/**/*"
s.requires_arc = true
s.swift_version = '4.1'
end
