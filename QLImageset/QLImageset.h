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

#import <Foundation/Foundation.h>

/**
 *  You can see logs in the ·Console.app· with prefix ·【QLImageset 1.0】:·
 */
#define QLImagesetVer      @"1.0"
#define QLImagesetLog(...) NSLog(@"【QLImageset "QLImagesetVer"】:"__VA_ARGS__)

#undef  QLIMAGESET_USE_DEFAULT
#define QLIMAGESET_USE_DEFAULT 1

/*!
 * @function QLImagesetGetFileForPath
 * @abstract Get the appropriate size image under the target dir, the default
             order is .png > @2x.png > @3x.png > jpg.
 * @param path The path of thae target directory.
 * @discussion Currently used any png file to be the target file.
 */
NSString * QLImagesetGetFileForPath(NSString * path);
#if !QLIMAGESET_USE_DEFAULT
void QLImagesetDrawImageInContentWithURL(CGContextRef context, CFURLRef url, CGSize size)
;
#endif // #if QLIMAGESET_USE_DEFAULT