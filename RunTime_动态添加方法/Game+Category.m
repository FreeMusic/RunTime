//
//  Game+Category.m
//  RunTime_动态添加方法
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "Game+Category.h"
#import <objc/runtime.h>

@implementation Game (Category)

void over(id self, SEL _cmd, NSString *game){
    
    NSLog(@"Game over  %@", game);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    SEL selector = NSSelectorFromString(@"over");
    
    if (sel == selector) {
        class_addMethod([self class], sel, (IMP)over, "v@:@");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
