//
//  ViewController.m
//  MBFileDownloader
//
//  Created by Maxim Bilan on 4/19/15.
//  Copyright (c) 2015 Maxim Bilan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *linkTextfile;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

@end

@implementation ViewController

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Downloading

- (void)downloadFile
{
	if (_linkTextfile.text.length > 0) {
		
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
														message:@"Enter the link..."
													   delegate:self
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
		[alert show];
	}
}

#pragma mark - Actions

- (IBAction)downloadAction:(UIButton *)sender
{
	[self downloadFile];
}

- (IBAction)tapOnView:(UITapGestureRecognizer *)sender
{
	[_linkTextfile resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[_linkTextfile resignFirstResponder];
	[self downloadFile];
	return YES;
}

@end
