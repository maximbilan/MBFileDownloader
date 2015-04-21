# MBFileDownloader

Simple file downloader for iOS based on NSURLConnection.

How to install:

Just copy MBFileDownloader.h and MBFileDownloader.mm to your project.

How to use:

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
