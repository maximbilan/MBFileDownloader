# MBFileDownloader

[![Version](https://img.shields.io/cocoapods/v/MBFileDownloader.svg?style=flat)](http://cocoadocs.org/docsets/MBFileDownloader)
[![License](https://img.shields.io/cocoapods/l/MBFileDownloader.svg?style=flat)](http://cocoadocs.org/docsets/MBFileDownloader)
[![Platform](https://img.shields.io/cocoapods/p/MBFileDownloader.svg?style=flat)](http://cocoadocs.org/docsets/MBFileDownloader)
[![CocoaPods](https://img.shields.io/cocoapods/dt/MBFileDownloader.svg)](https://cocoapods.org/pods/MBFileDownloader)
[![CocoaPods](https://img.shields.io/cocoapods/dm/MBFileDownloader.svg)](https://cocoapods.org/pods/MBFileDownloader)

Simple file downloader for <i>iOS</i> based on <a href="https://developer.apple.com/library/prerelease/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURLConnection_Class/index.html">NSURLConnection</a>.<br>
Downloader writes the data into a file, not into memory.
<br>
## Installation
<b>CocoaPods</b>:
<pre>
pod 'MBFileDownloader'
</pre>
<b>Manual</b>:
<pre>
Just copy the following files into your project:

<i>MBFileDownloader.h
MBFileDownloader.mm</i>
</pre>
## Using
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
