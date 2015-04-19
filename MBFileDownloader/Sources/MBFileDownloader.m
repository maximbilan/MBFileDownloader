//
//  MBFileDownloader.m
//  MBFileDownloader
//
//  Created by Maxim Bilan on 4/19/15.
//  Copyright (c) 2015 Maxim Bilan. All rights reserved.
//

#import "MBFileDownloader.h"

@implementation MBFileDownloader

- (id)initWithURL:(NSURL *)url toFilePath:(NSString *)filePath
{
	return self;
}

- (void)downloadWithSuccess:(void(^)(void))successBlock
					 update:(void(^)(float value))updateBlock
					failure:(void(^)(NSError *error))failureBlock
{
	
}

@end
