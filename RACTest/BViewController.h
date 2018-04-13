//
//  BViewController.h
//  RACTest
//
//  Created by pxx on 2018/4/12.
//  Copyright © 2018年 平晓行. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 */
@protocol MyDelegate<NSObject>
- (void)cleanRoomWith:(NSString *)toolName;
@end


@interface BViewController : UIViewController

@property (nonatomic,assign) id<MyDelegate>delegate;

@end
