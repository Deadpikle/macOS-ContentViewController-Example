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

@property NSViewController *currentViewController;
@property NSMutableArray<NSViewController*> *viewControllerStack;

@end

@implementation ContentManagerViewController

-(instancetype)init {
    self = [super init];
    self.viewControllerStack = [NSMutableArray array];
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    self.viewControllerStack = [NSMutableArray array];
    return self;
}

-(instancetype)initWithNibName:(NSNibName)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.viewControllerStack = [NSMutableArray array];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
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
