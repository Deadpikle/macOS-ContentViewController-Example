//
//  ContentManagerViewController.h
//  SampleContainerViewUse
//
//  Created by School of Computing Macbook on 3/29/17.
//  Copyright © 2017 CIRC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ContentManagerViewController : NSViewController

-(void)push:(NSViewController*)viewController;
-(void)pop;
-(void)popToRoot;

@end
