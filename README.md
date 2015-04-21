# MBFileDownloader

Simple file downloader for iOS based on <i>NSURLConnection</i>.

<b>How to install:</b>
Using Cocoapods:
<pre>
pod 'MBFileDownloader'
</pre>
Just copy the following file to your project.
<pre>
MBFileDownloader.h
MBFileDownloader.mm
</pre>

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
