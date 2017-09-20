//
//  ostracelib.h
//  ostracelib
//
//  Created by everettjf on 2017/9/12.
//  Copyright © 2017年 everettjf. All rights reserved.
//



#import <Foundation/Foundation.h>

FOUNDATION_EXPORT void OSTBeginSection(const char* name);
FOUNDATION_EXPORT void OSTEndSection(const char* name);
FOUNDATION_EXPORT void OSTTest();


// Objective C class method
#define OSTBegin OSTBeginSection([NSString stringWithFormat:@"[%@]%@",self,NSStringFromSelector(_cmd)].UTF8String)
#define OSTEnd OSTEndSection([NSString stringWithFormat:@"[%@]%@",self,NSStringFromSelector(_cmd)].UTF8String)
