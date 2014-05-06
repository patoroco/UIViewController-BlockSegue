//
//  UIViewController+BlockSegue.m
//  Swizzling
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import "UIViewController+BlockSegue.h"
#import <objc/runtime.h>

@implementation UIViewController (BlockSegue)


static const void *UIViewControllerBlockKey = &UIViewControllerBlockKey;


__attribute__((constructor))
void BlockSegue(void) {
    fprintf(stdout, "I'm swizzling, baby");
    
    Class class = [UIViewController class];

    SEL originalSel = @selector(prepareForSegue:sender:);
    SEL swizzledSel = @selector(jmg_prepareForSegue:sender:);
    
    Method original = class_getInstanceMethod(class, originalSel);
    IMP swizzledImp = class_getMethodImplementation(class, swizzledSel);

    method_setImplementation(original, swizzledImp);
}


-(void)jmg_prepareForSegue:(id)par1 sender:(id)par2 {
    NSLog(@"Swizzled method called!");
    UIViewControllerSegueBlock b = objc_getAssociatedObject(self, UIViewControllerBlockKey);
    b();
}

-(void)setSegue:(NSString *)identifier withBlock:(UIViewControllerSegueBlock)block {
    objc_setAssociatedObject(self, UIViewControllerBlockKey, block, OBJC_ASSOCIATION_COPY);
}

@end