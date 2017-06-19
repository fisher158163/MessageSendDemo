//
//  ViewController.m
//  MessageSendDemo
//
//  Created by Liyu on 2017/6/17.
//  Copyright © 2017年 liyu. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Person  *p = [[Person alloc]init];
    //Person  *p = objc_msgSend([Person class], @selector(alloc));
    //纯C语言代码
    Person  *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    //p = objc_msgSend(p, @selector(init));
    p = objc_msgSend(p, sel_registerName("init"));
    
    //[p eat];
    //[p performSelector:@selector(eat)];
    
    //消息发送
    //objc_msgSend(p, @selector(eat));
    objc_msgSend(p, sel_registerName("eat:"),@"banana");
    [p performSelector:@selector(run)];
    
} 


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
