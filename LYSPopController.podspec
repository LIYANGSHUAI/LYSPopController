Pod::Spec.new do |s|
s.name         = "LYSPopController"
s.version      = "0.0.1"
s.summary      = "LYSPopController,I hope everyone will give me some advice during the process of use. I want to go further."
s.description  = <<-DESC
LYSPopController is mainly a user page pops up a pop-up window in response to an event, prompting user information
DESC
s.homepage     = "https://github.com/LIYANGSHUAI/LYSPopController"

s.platform     = :ios, "8.0"
s.license      = "MIT"
s.author             = { "李阳帅" => "liyangshuai163@163.com" }

s.source       = { :git => "https://github.com/LIYANGSHUAI/LYSPopController.git", :tag => s.version }

s.source_files  = "LYSPopController", "LYSPopController/*.{h,m}"
end
