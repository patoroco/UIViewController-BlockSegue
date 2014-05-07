//
//  JMGViewController.m
//  Swizzling
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import "JMGViewController.h"
#import "UIViewController+BlockSegue.h"

#import "JMGUser.h"
#import "JMGSecondViewController.h"

@implementation JMGViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSegue:@"segue1" withBlock:^(id sender, id destinationVC) {
        NSLog(@"Segue configured fired from storyboard");
    }];
}


#pragma mark - UI Buttons

- (IBAction)showViewController:(id)sender {
    JMGUser *tmpUser = [[JMGUser alloc] init];
    tmpUser.name = @"Richard";
    tmpUser.surname = @"Gere";

    [self performSegueWithIdentifier:@"segue2"
                              sender:nil
                           withBlock:^(id sender, JMGSecondViewController *destinationVC) {
                               NSLog(@"Segue configured inline");
                               destinationVC.user = tmpUser;
                           }];
}

@end