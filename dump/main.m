//
//  main.m
//  dump
//
//  Created by QFish on 3/14/15.
//  Copyright (c) 2015 QFish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QLImageset.h"

// Dump for debug

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        if (argc != 2) {
            printf("Usage: dump <imageset path>.\n");
            exit(EXIT_FAILURE);
        }
        
        const char* filename = argv[1];
        
//        const char* filename = "~/Desktop/QFish.imageset";

        NSLog( @"%@", QLImagesetGetFileForPath([NSString stringWithUTF8String:filename]) );
    }
    return 0;
}
