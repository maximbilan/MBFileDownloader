Pod::Spec.new do |s|
	s.name         = "MBFileDownloader"
	s.version      = "0.2"
	s.summary      = "File Downloader"
	s.description  = "Simple file downloader for iOS based on NSURLConnection. Downloader writes the data into file, not into memory."
	s.homepage     = "https://github.com/maximbilan/MBFileDownloader"
	s.license      = { :type => "MIT" }
	s.author             = { "Maxim Bilan" => "maximb.mail@gmail.com" }
	s.platform     = :ios, "6.0"
	s.source       = { :git => "https://github.com/maximbilan/MBFileDownloader.git", :tag => "0.2" }
	s.source_files  = "Classes", "MBFileDownloader/Sources/**/*.{h,m}"
	s.requires_arc = true
end