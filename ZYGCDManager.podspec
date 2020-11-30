
Pod::Spec.new do |spec|

  spec.name         = "ZYGCDManager"
  spec.version      = "0.0.2"
  spec.summary      = "ZYGCDManager"
  spec.description  = "ZYGCDManager for GCD Async/sync Methods"
  spec.homepage     = "https://github.com/zyshaunavayne/ZYGCD"
  spec.license      = "MIT"
  spec.author       = { "zhangyushaunavayne" => "shaunavayne@vip.qq.com" }
  spec.platform     = :ios,"9.0"
  spec.frameworks   = "Foundation","UIKit"
  spec.source       = { git: "https://github.com/zyshaunavayne/ZYGCD.git", tag: spec.version, submodules: true }
  spec.source_files  = "ZYGCD/ZYGCD/*.{h,m}"

end
