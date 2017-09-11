//
//  ostracelib.h
//  ostracelib
//
//  Created by everettjf on 2017/9/12.
//  Copyright © 2017年 everettjf. All rights reserved.
//



#import <Foundation/Foundation.h>

void OSTBeginSection(const char* name);
void OSTEndSection(const char* name);


// Objective C class method
#define OSTBegin
#define OSTEnd
