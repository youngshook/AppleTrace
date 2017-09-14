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
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

namespace ost {
    class Logger{
    private:
        static int file_counter;
        int fd_ = 0;
//        int block_size = 16 * 1024 * 1024;  // 16MB
        int block_size = 1 * 1024 * 1024;  // 16MB
        char * file_start_ = NULL;
        char * file_cur_ = NULL;
        size_t cur_size_ = 0;
    public:
        Logger(){
            NSString * tmp_dir = NSTemporaryDirectory();
            NSString * log_name = [NSString stringWithFormat:@"ostrace_%@.ostrace",@(file_counter)];
            NSString * log_path = [tmp_dir stringByAppendingPathComponent:log_name];
            NSLog(@"log path = %@",log_path);
            
            fd_ = open(log_path.UTF8String, O_CREAT|O_RDWR,(mode_t)0600);
            if(fd_ == -1){
                NSLog(@"open file failed");
                return;
            }
            off_t cur_off = lseek(fd_, block_size - 1, SEEK_SET);
            ssize_t wrote_bytes = write(fd_,"",1);
            if(wrote_bytes != 1){
                // error
                NSLog(@"wrote error");
                return;
            }
            lseek(fd_, 0, SEEK_SET);
            
            file_start_ = (char*)mmap(NULL,block_size,PROT_READ|PROT_WRITE,MAP_SHARED,fd_,0);
            if(file_start_ == MAP_FAILED){
                // error
                NSLog(@"map failed");
                return;
            }
            file_cur_ = file_start_;
        }
        ~Logger(){
            munmap(file_start_, block_size);
            close(fd_);
        }
        void AddLine(const char * line){
            size_t len = strlen(line);
            if(cur_size_ + len + 1> block_size){
                NSLog(@"first file full");
                return;
            }
            
            memcpy(file_cur_, line, len);
            file_cur_ += len;
            memcpy(file_cur_, (const char *)"\n",1);
            file_cur_ += 1;
            
            cur_size_ += len + 1;
        }
    };
    
    int Logger::file_counter = 0;
    
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
    ost::Logger log;
    for(int i=0;i< 100;i++){
        log.AddLine("hello");
    }
}

