//
//  UIViewController+BlockSegue.m
//  Swizzling
//
//  Created by Jorge Maroto García on 06/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import "UIViewController+BlockSegue.h"
#import <objc/runtime.h>

static const void *UIViewControllerDictionaryBlockKey = &UIViewControllerDictionaryBlockKey;

@implementation UIViewController (BlockSegue)

__attribute__((constructor))
void BlockSegue(void) {
    Class currentClass = [UIViewController class];

    SEL originalSel = @selector(prepareForSegue:sender:);
    SEL swizzledSel = @selector(jmg_prepareForSegue:sender:);
    
    Method originalMethod = class_getInstanceMethod(currentClass, originalSel);
    IMP swizzledImplementation = class_getMethodImplementation(currentClass, swizzledSel);

    method_setImplementation(originalMethod, swizzledImplementation);
}


-(void)jmg_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (!self.jmg_dictionaryBlock || !self.jmg_dictionaryBlock[segue.identifier]) {
        NSLog(@"Identifier '%@' doesn't exist", segue.identifier);
        return;
    }
    
    UIViewControllerSegueBlock segueBlock = self.jmg_dictionaryBlock[segue.identifier];
    segueBlock(sender, segue.destinationViewController);
}

-(NSMutableDictionary *)jmg_dictionaryBlock {
    return objc_getAssociatedObject(self, UIViewControllerDictionaryBlockKey);
}

-(NSMutableDictionary *)jmg_createDictionaryBlock {
    if (!self.jmg_dictionaryBlock) {
        objc_setAssociatedObject(self, UIViewControllerDictionaryBlockKey, [NSMutableDictionary dictionary], OBJC_ASSOCIATION_RETAIN);
    }
    
    return self.jmg_dictionaryBlock;
}


#pragma mark - Public interface
-(void)configureSegue:(NSString *)identifier withBlock:(UIViewControllerSegueBlock)block {
    NSMutableDictionary *dBlocks = self.jmg_dictionaryBlock ?: [self jmg_createDictionaryBlock];
    [dBlocks setObject:block forKey:identifier];
}

@end