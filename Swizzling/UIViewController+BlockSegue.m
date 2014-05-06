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

__attribute__((constructor))
void BlockSegue(void) {
    fprintf(stdout, "I'm in!");
    
    Class class = [UIViewController class];

    SEL originalSel = @selector(prepareForSegue:sender:);
    SEL swizzledSel = @selector(prueba:par2:);
    
    Method original = class_getInstanceMethod(class, originalSel);
    IMP swizzledImp = class_getMethodImplementation(class, swizzledSel);

    method_setImplementation(original, swizzledImp);
    
}

-(void)prueba:(id)par1 par2:(id)par2 {
    NSLog(@"DENTRO");
}

@end