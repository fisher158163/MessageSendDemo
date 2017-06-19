//
//  Person.m
//  MessageSendDemo
//
//  Created by Liyu on 2017/6/17.
//  Copyright © 2017年 liyu. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

- (void)eat:(NSString *)food {
    NSLog(@"吃了%@",food);
}

void run() {
    NSLog(@"running");
}

//当调用了一个没有实现的类方法
//+(BOOL)resolveClassMethod:(SEL)sel

//当调用了一个没有实现的实例方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //添加一个run方法
    //IMP方法就是一个函数指针
    if (sel == @selector(run)) {
        class_addMethod([Person class], @selector(run), (IMP)run, "v");
    }
    return [super resolveInstanceMethod: sel];
}

@end
