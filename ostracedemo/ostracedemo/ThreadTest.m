//
//  ThreadTest.m
//  ostracedemo
//
//  Created by everettjf on 2017/9/19.
//  Copyright © 2017年 everettjf. All rights reserved.
//

#import "ThreadTest.h"
#import <ostracelib/ostrace.h>

@implementation ThreadTest

- (void)go{
    OSTBegin;
    usleep(20);
    
    [self goOne];
    
    OSTEnd;
}

- (void)goOne{
    OSTBegin;
    [self goTwo];
    OSTEnd;
}

- (void)goTwo{
    OSTBegin;
    for(int i=0;i<10;i++){
        [self goLoop];
    }
    OSTEnd;
}

- (void)goLoop{
    OSTBegin;
    usleep(20);
    OSTEnd;
}

@end
