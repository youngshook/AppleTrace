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


/*
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <unistd.h>
 #include <sys/mman.h>
 main(){
 int fd;
 void *start;
 struct stat sb;
 fd = open("/etc/passwd", O_RDONLY);
fstat(fd, &sb);
start = mmap(NULL, sb.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
if(start == MAP_FAILED)
return;
printf("%s", start); munma(start, sb.st_size);
closed(fd);
}


 */

namespace ost {
    class Logger{
    private:
        
    public:
        void AddLine(const std::string & line){
            
        }
    };
    
    class Trace{
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

}

void OSTBeginSection(const char* name){
    
}

void OSTEndSection(const char* name){
    
}

void OSTTest(){
    
}

