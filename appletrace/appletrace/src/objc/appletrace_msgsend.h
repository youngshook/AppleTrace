//
//  appletrace_msgsend.h
//  appletrace
//
//  Created by everettjf on 28/09/2017.
//  Copyright © 2017 everettjf. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT void APTEnable(BOOL enable);
FOUNDATION_EXPORT BOOL APTIsEnable();
FOUNDATION_EXPORT BOOL APTIsIgnoredClass(const char* name);
