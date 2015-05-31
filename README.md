# MBFileDownloader

[![Version](https://img.shields.io/cocoapods/v/SwiftTintedButtonExtension.svg?style=flat)](http://cocoadocs.org/docsets/SwiftTintedButtonExtension)
[![License](https://img.shields.io/cocoapods/l/SwiftTintedButtonExtension.svg?style=flat)](http://cocoadocs.org/docsets/SwiftTintedButtonExtension)
[![Platform](https://img.shields.io/cocoapods/p/SwiftTintedButtonExtension.svg?style=flat)](http://cocoadocs.org/docsets/SwiftTintedButtonExtension)

Simple file downloader for iOS based on <i>NSURLConnection</i>.
Downloader writes the data into file, not into memory.
<br>
<br>
<b>How to install:</b><br>
Using Cocoapods:
<pre>
pod 'MBFileDownloader'
</pre>
Or just copy the following files into your project:
<pre>
MBFileDownloader.h
MBFileDownloader.mm
</pre>
<br>
<b>How to use:</b>
<pre>
MBFileDownloader *fileDownloader = [[MBFileDownloader alloc] initWithURL:url toFilePath:filePath];
[fileDownloader downloadWithSuccess:^{
    NSLog(@"success");
} update:^(float value) {
    NSLog(@"%f", value);
} failure:^(NSError *error) {
    NSLog(@"%@", error);
}];
</pre>
