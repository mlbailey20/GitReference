//
//  GRViewController.m
//  GitReference
//
//  Created by Matthew Bailey on 7/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@implementation GRViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
        UIScrollView *scrollView = [[UIScrollView alloc]
                                    initWithFrame:CGRectMake(margin, 20,
                                                             self.view.frame.size.width - (margin * 2) , 1000)];
    scrollView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:scrollView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - (margin * 2), 50)];
    title.text = @"GitReference";
    [scrollView addSubview:title];

    float top = 50;

    
    NSArray *temp = self.gitCommands;
    
    for(int i = 0; i < [temp count]; i++)
    {
        
        
        NSDictionary *tempo = temp[i];
        NSString* comm = tempo[Command];
        NSString* ref = tempo[Reference];
        
        
        UILabel *command = [[UILabel alloc]initWithFrame:CGRectMake(10, top, self.view.frame.size.width - (margin * 2), 50)];
        
        UILabel *reference = [[UILabel alloc]initWithFrame:CGRectMake(60, top+20, self.view.frame.size.width - (margin * 2) , 50)];
        command.text = comm;
        reference.text = ref;
        command.font = [UIFont boldSystemFontOfSize:16];
        
        [scrollView addSubview:command];
        [scrollView addSubview:reference];
        
        top += 50;
    }
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    
    
}


- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}

@end
