//
//  JMGViewController.m
//  Swizzling
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import "JMGViewController.h"
#import "UIViewController+BlockSegue.h"

@interface JMGViewController ()

@end

@implementation JMGViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setSegue:@"titulo" withBlock:^{
        NSLog(@"Este es el bloque dentro");
    }];
}

- (IBAction)showViewController1:(id)sender {
    [self performSegueWithIdentifier:@"segue1" sender:nil];
}

- (IBAction)showViewController2:(id)sender {
    [self performSegueWithIdentifier:@"segue2" sender:nil];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"I'm going to prepare segue as usual: %@", segue.identifier);
//}
@end