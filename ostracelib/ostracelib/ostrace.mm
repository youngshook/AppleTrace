//
//  ostrace.m
//  ostracelib
//
//  Created by everettjf on 2017/9/12.
//  Copyright © 2017年 everettjf. All rights reserved.
//


#import "ostrace.h"
#include <map>
#include <vector>
#include <string>
#include <pthread.h>
#include <mach/mach_time.h>

class OSTrace{
private:
    
    
public:
    
    void BeginSection(const char *name){
        pthread_t thread = pthread_self();
        __uint64_t thread_id=0;
        pthread_threadid_np(thread,&thread_id);
        uint64_t time = mach_absolute_time();
        
    }
    
    void EndSection(const char* name){
        
    }
    
    
};


void OSTBeginSection(const char* name){
    
}

void OSTEndSection(const char* name){
    
}
