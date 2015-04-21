# MBFileDownloader

Simple file downloader for iOS based on <i>NSURLConnection</i>.
<br>
<br>
<b>How to install:</b><br>
Using Cocoapods:
<pre>
pod 'MBFileDownloader'
</pre>
Just copy the following file to your project.
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
