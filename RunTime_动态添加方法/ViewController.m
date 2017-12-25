//
//  ViewController.m
//  RunTime_动态添加方法
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"
#import "Sunxy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Sunxy *sxy = [[Sunxy alloc] init];
    SEL selector = NSSelectorFromString(@"guess");
    
    Method method = class_getInstanceMethod([sxy class], selector);
    class_addMethod([sxy class], selector, (IMP)eat, method_getTypeEncoding(method));
    if ([sxy respondsToSelector:selector]) {
        ((void (*)(id, SEL))[sxy methodForSelector:selector])(sxy, selector);
    } else{
        NSLog(@"Sorry,I don't know");
    }
}
void eat(id self,SEL _cmd){
    
    NSLog(@"sxy eat");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
