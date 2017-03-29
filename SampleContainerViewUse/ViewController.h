//
//  ViewController.h
//  SampleContainerViewUse
//
//  Created by School of Computing Macbook on 3/29/17.
//  Copyright © 2017 CIRC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ContentManagerViewController.h"

@class ContentManagerViewController;

@protocol ContentManagerViewControllerHolder <NSObject>

-(ContentManagerViewController*)retreiveContentManagerController;

@end

@interface ViewController : NSViewController <ContentManagerViewControllerHolder>

@end

