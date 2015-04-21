//
//  MBFileDownloader.m
//  MBFileDownloader
//
//  Created by Maxim Bilan on 4/19/15.
//  Copyright (c) 2015 Maxim Bilan. All rights reserved.
//

#import "MBFileDownloader.h"

@interface MBFileDownloader () <NSURLConnectionDelegate>
{
	NSFileHandle *fileHandle;
	NSURLConnection *urlConnection;
	long long contentLength;
	long long downloadedLength;
	
	void(^successBlock)(void);
	void(^failureBlock)(NSError* error);
	void(^updateBlock)(float progress);
}

@property (nonatomic, readwrite) NSURL *url;
@property (nonatomic, readwrite) NSString *filePath;
@property (nonatomic, readwrite) MBFileDownloaderState state;
@property (nonatomic, readwrite) BOOL isDownloaded;

@end

@implementation MBFileDownloader

- (id)initWithURL:(NSURL *)url toFilePath:(NSString *)filePath
{
	if ((self = [super init])) {
		_url = url;
		_filePath = filePath;
		_state = MBFileDownloaderStateIdle;
		_isDownloaded = NO;
	}
	return self;
}

- (void)downloadWithSuccess:(void(^)(void))success
					 update:(void(^)(float value))update
					failure:(void(^)(NSError *error))failure
{
	successBlock = [success copy];
	updateBlock = [update copy];
	failureBlock = [failure copy];
	
	NSError *error;
	[[NSFileManager defaultManager] createFileAtPath:_filePath contents:nil attributes:nil];
	fileHandle = [NSFileHandle fileHandleForWritingToURL:[NSURL fileURLWithPath:_filePath] error:&error];
	if (!fileHandle) {
		failureBlock(error);
		return;
	}
	
	_state = MBFileDownloaderStateProcessing;
	
	urlConnection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:_url]
													delegate:self];
	[urlConnection start];
}

- (void)cancel
{
	if (_state != MBFileDownloaderStateSuccess) {
		[urlConnection cancel];
		urlConnection = nil;
		[self stopAndDelete:YES];
	}
}

- (void)stopAndDelete:(BOOL)delete
{
	[fileHandle closeFile];
	
	if (delete) {
		NSError *error;
		[[NSFileManager defaultManager] removeItemAtPath:_filePath error:&error];
	}
	
	_state = MBFileDownloaderStateIdle;
}

- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	NSInteger code = [httpResponse statusCode];
	
	if (code == 200) {
		contentLength = [response expectedContentLength];
	}
	else {
		_state = MBFileDownloaderStateFailure;
		failureBlock([[NSError alloc] initWithDomain:@"MBFileDownloader"
												code:code
											userInfo:@{ NSLocalizedDescriptionKey: [NSString stringWithFormat:@"HTTP response error code: %@", @(code)] }]);
		[self stopAndDelete:YES];
	}
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
	if (_state != MBFileDownloaderStateProcessing) {
		return;
	}
	
	[fileHandle writeData:data];
	
	downloadedLength += [data length];
	if (contentLength) {
		updateBlock((float)downloadedLength / (float)contentLength);
	}
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	if (_state != MBFileDownloaderStateProcessing) {
		return;
	}
	
	_state = MBFileDownloaderStateFailure;
	[self stopAndDelete:YES];
	failureBlock(error);
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
	if (_state != MBFileDownloaderStateProcessing) {
		return;
	}
	
	_state = MBFileDownloaderStateSuccess;
	[self stopAndDelete:NO];
	successBlock();
}

@end
