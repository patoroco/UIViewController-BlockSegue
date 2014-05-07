//
//  UIViewController+BlockSegue.h
//  Swizzling
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIViewControllerSegueBlock) (id sender, id destinationVC);

@interface UIViewController (BlockSegue)

-(void)configureSegue:(NSString *)identifier withBlock:(UIViewControllerSegueBlock)block;
-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender withBlock:(UIViewControllerSegueBlock)block;

@end