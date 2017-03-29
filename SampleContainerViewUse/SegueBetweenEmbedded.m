//
//  SegueBetweenEmbedded.m
//  SampleContainerViewUse
//
//  Created by School of Computing Macbook on 3/29/17.
//  Copyright © 2017 CIRC. All rights reserved.
//

#import "SegueBetweenEmbedded.h"
#import "ContentManagerViewController.h"
#import "ViewController.h"

@interface SegueAnimator : NSObject <NSViewControllerPresentationAnimator>

- (void)animatePresentationOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController;
- (void)animateDismissalOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController;

@end

@implementation SegueAnimator

- (void)animatePresentationOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController {
	NSViewController *parent = [fromViewController parentViewController];
	if (parent && [parent class] == [ContentManagerViewController class]) {
		ContentManagerViewController *manager = (ContentManagerViewController*)parent;
		[manager push:viewController];
	}
	else if ([fromViewController conformsToProtocol:@protocol(ContentManagerViewControllerHolder)]) {
		id<ContentManagerViewControllerHolder> holder = (id<ContentManagerViewControllerHolder>)fromViewController;
		[[holder retreiveContentManagerController] push:viewController];
	}
}

- (void)animateDismissalOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController {
	NSViewController *parent = [viewController parentViewController];
	if ([parent class] == [ContentManagerViewController class]) {
		ContentManagerViewController *manager = (ContentManagerViewController*)parent;
		[manager pop];
	}
}

@end

@implementation SegueBetweenEmbedded

- (void)perform {
	SegueAnimator *animator = [[SegueAnimator alloc] init];
	[self.sourceController presentViewController:self.destinationController
										animator:(id<NSViewControllerPresentationAnimator>)animator];
}

@end
