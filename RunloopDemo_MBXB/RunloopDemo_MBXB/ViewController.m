//
//  ViewController.m
//  RunloopDemo_MBXB
//
//  Created by Oboe_b on 2017/12/15.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//人的一生唯有学习和锻炼不可辜负
//博客http://www.2bjs.com
//微博https://weibo.com/u/6342211709
//技术交流q群150731459
//微信搜索iOS编程实战

#import "ViewController.h"
#import "MBXBNSThread.h"

@interface ViewController ()
@property (nonatomic,strong)MBXBNSThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //时钟事件.
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:true];
    
 
    //触摸事件
    //当我们添加触摸事件之后,Runloop就去处理触摸事件了,不再管理我们的时钟事件
    //开辟子线程
    MBXBNSThread *thread = [[MBXBNSThread alloc]initWithBlock:^{
        //加入Runloop中
       [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        NSLog(@"okle%@",[NSThread currentThread]);
//        开启Runloop
        [[NSRunLoop currentRunLoop] run];
    }];
    [thread start];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [_thread start];
//}
- (void)timerMethod{
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    static int a = 0;
    NSLog(@"%d--%@",a++,[NSThread currentThread]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
