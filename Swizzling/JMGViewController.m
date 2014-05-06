//
//  JMGViewController.m
//  Swizzling
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import "JMGViewController.h"

@interface JMGViewController ()

@end

@implementation JMGViewController

- (IBAction)showViewController1:(id)sender {
    [self performSegueWithIdentifier:@"segue1" sender:nil];
}

- (IBAction)showViewController2:(id)sender {
    [self performSegueWithIdentifier:@"segue2" sender:nil];
}
@end
