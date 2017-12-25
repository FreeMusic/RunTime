//
//  ViewController.m
//  RunTime_动态添加方法
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"
#import "Sunxy.h"
#import "Game+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Sunxy *sxy = [[Sunxy alloc] init];
    [sxy setAge:@""];
    SEL selector = NSSelectorFromString(@"");
    
    //Method method = class_getInstanceMethod([sxy class], selector);
    //class_addMethod([sxy class], selector, (IMP)eat, method_getTypeEncoding(method));
    class_addMethod([sxy class], selector, (IMP)eat, "V@:");
    if ([sxy respondsToSelector:selector]) {
        ((void (*)(id, SEL))[sxy methodForSelector:selector])(sxy, selector);
    } else{
        NSLog(@"Sorry,I don't eat");
    }
    
    Game *game = [[Game alloc] init];
    SEL sel = NSSelectorFromString(@"over");
    //[game performSelector:sel withObject:@"12452"];
    ((void (*)(id, SEL, NSString *))[game methodForSelector:sel])(game, sel, @"11212");
}
void eat(id self,SEL _cmd){
    
    Sunxy *sxy = (Sunxy *)self;
    
    NSLog(@"sxy eat  %@", sxy.age);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
