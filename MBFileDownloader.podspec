Pod::Spec.new do |s|
	s.name         = "MBFileDownloader"
	s.version      = "0.1"
	s.summary      = "File Downloader"
	s.description  = "Simple iOS File Downloader"
	s.homepage     = "https://github.com/maximbilan/MBFileDownloader"
	s.license      = { :type => "MIT" }
	s.author             = { "Maxim Bilan" => "maximb.mail@gmail.com" }
	s.platform     = :ios, "6.0"
	s.source       = { :git => "https://github.com/maximbilan/MBFileDownloader.git", :tag => "0.1" }
	s.source_files  = "Classes", "MBFileDownloader/Sources/**/*.{h,m}"
	s.requires_arc = true
end