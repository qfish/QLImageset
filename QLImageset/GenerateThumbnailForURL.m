/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 QFish <im@QFi.sh>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifdef __OBJC__
#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>
#endif

#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>
#import "QLImageset.h"

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize);
void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail);

/* -----------------------------------------------------------------------------
    Generate a thumbnail for file

   This function's job is to create thumbnail for designated file as fast as possible
   ----------------------------------------------------------------------------- */

#if QLIMAGESET_USE_DEFAULT

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize)
{
    NSString * dir   = ((__bridge NSURL *)(url)).path;
    NSString * file  = QLImagesetGetFileForPath(dir);
    
    CGImageSourceRef source = CGImageSourceCreateWithURL((__bridge CFURLRef)[NSURL fileURLWithPath:file], NULL);
    CGImageRef image = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    CFRelease(source);
    
    QLThumbnailRequestSetImage(thumbnail, image, NULL);
    CFRelease(image);
    
    return noErr;
}

#else // #if QLIMAGESET_USE_DEFAULT

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize)
{
    NSSize thumbSize = NSMakeSize((maxSize.width * (600.0/800.0)), maxSize.height);
    
    NSString * dir   = ((__bridge NSURL *)(url)).path;
    NSString * file  = QLImagesetGetFileForPath(dir);
    
    CGContextRef context =
    QLThumbnailRequestCreateContext(thumbnail, thumbSize, false, NULL);
    
    if (context) {
        QLImagesetDrawImageInContentWithURL(context, (__bridge CFURLRef)[NSURL fileURLWithPath:file], thumbSize);
        QLThumbnailRequestFlushContext(thumbnail, context);
        CFRelease(context);
    }
    
    return noErr;
}

#endif // #if QLIMAGESET_USE_DEFAULT

void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail)
{
    // Implement only if supported
}
