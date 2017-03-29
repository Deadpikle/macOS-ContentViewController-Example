//
//  ContentManagerViewController.m
//  SampleContainerViewUse
//
//  Created by School of Computing Macbook on 3/29/17.
//  Copyright © 2017 CIRC. All rights reserved.
//

#import "ContentManagerViewController.h"
#import "BackForwardViewController.h"

@interface ContentManagerViewController ()

@property (weak) IBOutlet NSView *subViewControllerManager;

@property NSViewController *currentViewController;
@property NSMutableArray<NSViewController*> *viewControllerStack;

@end

@implementation ContentManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
	self.viewControllerStack = [NSMutableArray array];
}

-(void)showViewController:(NSViewController*)viewController {
	[self addChildViewController:viewController];
	viewController.view.frame = self.currentViewController.view.frame;
	[self.view addSubview:viewController.view];
	self.currentViewController = viewController;
}

-(void)removeCurrentViewControllerFromView {
	[self.currentViewController.view removeFromSuperview];
	[self.currentViewController removeFromParentViewController];
}

-(void)push:(NSViewController*)viewController {
	[self removeCurrentViewControllerFromView];
	[self.viewControllerStack addObject:viewController];
	[self showViewController:viewController];
}

-(void)pop {
	if (self.viewControllerStack.count > 1) {
		[self removeCurrentViewControllerFromView];
		[self.viewControllerStack removeLastObject];
		NSViewController *viewController = [self.viewControllerStack lastObject];
		[self showViewController:viewController];
	}
}

-(void)popToRoot {
	while (self.viewControllerStack.count > 1) {
		[self pop];
	}
}

-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
	// this will be called on the initial embed to set up the first view controller
	self.currentViewController = segue.destinationController;
	[self.viewControllerStack addObject:segue.destinationController];
}

@end
