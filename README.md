# MBFileDownloader

[![Version](https://img.shields.io/cocoapods/v/MBFileDownloader.svg?style=flat)](http://cocoadocs.org/docsets/MBFileDownloader)
[![License](https://img.shields.io/cocoapods/l/MBFileDownloader.svg?style=flat)](http://cocoadocs.org/docsets/MBFileDownloader)
[![Platform](https://img.shields.io/cocoapods/p/MBFileDownloader.svg?style=flat)](http://cocoadocs.org/docsets/MBFileDownloader)

Simple file downloader for iOS based on <a href="https://developer.apple.com/library/prerelease/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURLConnection_Class/index.html">NSURLConnection</a>.<br>
Downloader writes the data into file, not into memory.
<br>
## How to install
<b>CocoaPods</b>:
<pre>
pod 'MBFileDownloader'
</pre>
<b>Manual</b>:
<pre>
<i>Just copy the following files into your project:</i>

MBFileDownloader.h
MBFileDownloader.mm
</pre>
## How to use
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

## License

MBFileDownloader is available under the MIT license. See the LICENSE file for more info.
