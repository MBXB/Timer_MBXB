//
//  main.m
//  RunloopDemo_MBXB
//
//  Created by Oboe_b on 2017/12/15.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"okle%@",[NSThread currentThread]);//可以搞定
        //在UIApplicationMain有一个死循环,开启了当前线程的Runloop循环
        int ceshi = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        NSLog(@"啦啦啦");
        return  ceshi;
    }
}
