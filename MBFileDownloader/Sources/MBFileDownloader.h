//
//  MBFileDownloader.h
//  MBFileDownloader
//
//  Created by Maxim Bilan on 4/19/15.
//  Copyright (c) 2015 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MBFileDownloaderState)
{
	MBFileDownloaderStateIdle,
	MBFileDownloaderStateProcessing,
	MBFileDownloaderStateSuccess,
	MBFileDownloaderStateFailure
};

@interface MBFileDownloader : NSObject

- (id)initWithURL:(NSURL *)url toFilePath:(NSString *)filePath;
- (void)downloadWithSuccess:(void(^)(void))success
					 update:(void(^)(float value))update
					failure:(void(^)(NSError *error))failure;
- (void)cancel;

@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSString *filePath;
@property (nonatomic, readonly) MBFileDownloaderState state;
@property (nonatomic, readonly) BOOL isDownloaded;

@end
