//
//  ViewController.m
//  RACTest
//
//  Created by pxx on 2018/4/8.
//  Copyright © 2018年 平晓行. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()<MyDelegate>
@property (nonatomic,assign) NSInteger value;
@property (nonatomic,  copy) NSString *name;

@property (nonatomic,assign) BOOL myEnable;
@property (nonatomic,  copy) NSString *userName;
@property (nonatomic,  copy) NSString *psd;

@property (weak, nonatomic) IBOutlet UIButton *myBtn;


@property (nonatomic,  copy) NSString *value2;

@property (nonatomic,  copy) NSString *valueA;
@property (nonatomic,  copy) NSString *valueB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     1.RACCommand--代替button的target action点击
     */
//    self.myBtn.rac_command = [[RACCommand alloc]initWithSignalBlock:^(UIButton  *btn) {
//        NSLog(@"点击了%@" , btn.titleLabel.text);
//        return [RACSignal empty];
//    }];
//
//    [[self.myBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x){
//        NSLog(@"change");
//    }];
    
    
    /*
     2.rac_signalForSelector:fromProtocol:--将protocol转化为信号，
     */
    //    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    pushBtn.frame = CGRectMake(20, 100, 100, 40);
    //    [pushBtn setTitle:@"push To B" forState:UIControlStateNormal];
    //    pushBtn.backgroundColor = [UIColor grayColor];
    //    @weakify(self);
    //    pushBtn.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
    //        @strongify(self);
    //        BViewController *bVC = [BViewController new];
    //        bVC.delegate = self;
    //        [self.navigationController pushViewController:bVC animated:YES];
    //        return [RACSignal empty];
    //    }];
    //    [self.view addSubview:pushBtn];
    //
    //    RACSignal *signal = [self rac_signalForSelector:@selector(cleanRoomWith:) fromProtocol:@protocol(MyDelegate)];
    //    [signal subscribeNext:^(RACTuple* x) {
    //        //传过来的元祖中安顺序存放着回掉函数的参数
    //        NSLog(@"%@" , x[0]);
    //    }];
    
    
    /*
     3.kvo--监听
     RACObserve--创建一个新的RACSignal信号对象，当self的value变化时，发送信号到订阅者并发送新的value值，并调用subscribeNext的block
     */
//    @weakify(self);
//    [RACObserve(self , value) subscribeNext:^(id  _Nullable x) {
//        @strongify(self);
//        NSLog(@"你变了--%@" , x);
//    }];
//    self.value = 10;
//    self.value = 20;
    
    
    /*
     4.将广播转化为信号
     */
//    [[NSNotificationCenter.defaultCenter rac_addObserverForName:@"123" object:nil]subscribeNext:^(NSNotification * _Nullable x) {
//        NSLog(@"%@"  , x.userInfo);
//    }];
//    [NSNotificationCenter.defaultCenter postNotificationName:@"123" object:nil userInfo:@{@"name":@"jim" , @"age":@"12"}];
    

    
    
    /*
     5.filter--筛选
     filter会返回一个新的RACSignal信号对象，只有当filert返回yes时，才会发送信号进入subscribeNext
     */
//    [[RACObserve(self , name) filter:^(NSString *newName) {
//        return [newName hasPrefix:@"j"];
//    }] subscribeNext:^(NSString *newName) {
//        NSLog(@"你变了，且是j开头的--%@" , newName);
//    }];
//    self.name = @"weqe";
//    self.name = @"jdasd";
    
    
    /*
     6.RAC--将一个信号绑定到一个属性上
     +combineLatest:reduce:--第一个参数是一个数组，里面存放信号，当至少一个信号的触发时，会调用reduce的方法并返回一个新的信号对象并返回每个信号的值
     combineLatest--将多个信号量进行合并，当其中一个信号量发出Value事件时，如果另一个信号量之前也发送过Value事件，那么就取出最后一个事件的Value值与当前发送的事件值进行合并，然后将合并后的值发送给新的信号量的观察者。如果其中一个未发送过任何Value，那么将不会向合并后的信号量的观察者发送事件。
     */
//    NSLog(@"%d" , self.myEnable);
//    RAC(self,myEnable) = [RACSignal combineLatest:@[RACObserve(self, userName),RACObserve(self, psd)]
//                                           reduce:^(NSString *userName , NSString *psd){
//        NSLog(@"回调了myEnable=%d username=%@ psd=%@" , self.myEnable , userName , psd);
//        //这里的@()是语法糖装箱值变量
//        return @([userName isEqualToString:psd]);
//    }];
//    self.userName = @"111";
//    self.psd = @"111";
//    NSLog(@"%d" , self.myEnable);
    
    
    /*
     7.merge--合并多个信号，当他们都执行完之后，再继续subscribeCompleted，可用于多个异步请求
     */
//    [[RACSignal merge:@[] ] subscribeCompleted:^{
//        NSLog(@"都执行完之后执行");
//    }];
    
    
    /*
     8.map--映射,将原来信号的返回值，进行转换后返回一个新的信号和新的返回值
     */
//    RACSignal *signalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@"唱歌"];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//    NSLog(@"%@" , _value2);
//    RAC(self,value2) = [signalA map:^id _Nullable(id  _Nullable value) {
//        return [value isEqualToString:@"唱歌"] ? @"1" : @"2";
//    }];
//    NSLog(@"%@" , _value2);

    
    /*
     9.RACChannelTerminal--信号双向绑定，当A信号触发时，相应改变B信号的值，反之也成立
     */
//    RACChannelTerminal *channelA = RACChannelTo(self, valueA);
//    RACChannelTerminal *channelB = RACChannelTo(self, valueB);
//
//    [[channelA map:^id _Nullable(id  _Nullable value) {
//        if ([value isEqualToString:@"左边"]) {
//            return @"右边";
//        }
//        return @"";
//    }]subscribe:channelB];
//
//    [[channelB map:^id _Nullable(id  _Nullable value) {
//        if ([value isEqualToString:@"上边"]) {
//            return @"下边";
//        }
//        return @"";
//    }]subscribe:channelA];
//    //监听下A和B的改变
//    [RACObserve(self, valueA) subscribeNext:^(id  _Nullable x) {
//        NSLog(@"A---%@" , x);
//    }];
//
//    [RACObserve(self, valueB) subscribeNext:^(id  _Nullable x) {
//        NSLog(@"B---%@" , x);
//    }];
//
//    self.valueA = @"左边";
//    self.valueA = @"左边1";
//    self.valueB = @"上边";
//    self.valueB = @"上边1";
    
    
    
    
    
    
    
    
    
}






@end
