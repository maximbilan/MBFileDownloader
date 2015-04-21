# MBFileDownloader

Simple file downloader for iOS based on <i>NSURLConnection</i>.

<b>How to install:</b>

Just copy MBFileDownloader.h and MBFileDownloader.mm to your project.

<b>How to use:</b>

<pre>
MBFileDownloader *fileDownloader = [[MBFileDownloader alloc] initWithURL:url
							      toFilePath:filePath];
[fileDownloader downloadWithSuccess:^{
    NSLog(@"success");
} update:^(float value) {
    NSLog(@"%f", value);
} failure:^(NSError *error) {
    NSLog(@"%@", error);
}];
</pre>
