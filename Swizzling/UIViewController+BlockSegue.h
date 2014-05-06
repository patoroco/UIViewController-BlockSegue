//
//  UIViewController+BlockSegue.h
//  Swizzling
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BlockSegue)



typedef void (^UIViewControllerSegueBlock) (void);

-(void)setSegue:(NSString *)identifier withBlock:(UIViewControllerSegueBlock)block;

@end