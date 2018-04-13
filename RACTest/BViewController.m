//
//  BViewController.m
//  RACTest
//
//  Created by pxx on 2018/4/12.
//  Copyright © 2018年 平晓行. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(cleanRoomWith:)]) {
        [self.delegate cleanRoomWith:@"mop"];
    }
}

@end
