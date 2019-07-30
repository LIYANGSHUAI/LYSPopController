Pod::Spec.new do |s|
s.name         = "LYSPopController"
s.version      = "0.0.7"
s.summary      = "简单的实现一个弹窗组件"
s.description  = <<-DESC
简单的实现一个弹窗组件,简单的实现一个弹窗组件,简单的实现一个弹窗组件,简单的实现一个弹窗组件
DESC
s.homepage     = "https://github.com/LIYANGSHUAI/LYSPopController"

s.platform     = :ios, "8.0"
s.license      = "MIT"
s.author             = { "LIYANGSHUAI" => "liyangshuai163@163.com" }

s.source       = { :git => "https://github.com/LIYANGSHUAI/LYSPopController.git", :tag => s.version }

s.source_files  = "LYSPopController", "LYSPopController/*.{h,m}"
end
