//
//  ViewController.m
//  SampleContainerViewUse
//
//  Created by School of Computing Macbook on 3/29/17.
//  Copyright © 2017 CIRC. All rights reserved.
//

#import "ViewController.h"
#import "ContentManagerViewController.h"
#import "BackForwardViewController.h"

@interface ViewController ()

@property ContentManagerViewController *vcController;

-(IBAction)pushViewController:(id)sender;
-(IBAction)popViewController:(id)sender;
-(IBAction)popToRootViewController:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
	if ([[segue destinationController] class] == [ContentManagerViewController class]) {
		self.vcController = segue.destinationController;
	}
}

-(ContentManagerViewController*)retreiveContentManagerController {
	return self.vcController;
}

-(IBAction)pushViewController:(id)sender {
	// note: this works, but then pop is broken via dismissController: since it wasn't done with a segue.
	// Better way is to rig up a manual segue and execute the segue.
	//BackForwardViewController *viewController = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"BackForwardStoryboardID"];
	//[self.vcController push:viewController];
	
	[self performSegueWithIdentifier:@"CustomSegueToBackForward" sender:self];
}

-(IBAction)popViewController:(id)sender {
	[self.vcController pop];
}

-(IBAction)popToRootViewController:(id)sender {
	[self.vcController popToRoot];
}

@end
