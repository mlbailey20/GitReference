//
//  GRViewController.h
//  GitReference
//
//  Created by Matthew Bailey on 7/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UIViewController

- (NSArray *)gitCommands;
- (CGFloat)heightOfReferenceString:(NSString *)reference;

@end
