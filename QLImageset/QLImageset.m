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

#import "QLImageset.h"

NSString * QLImagesetGetFileForPath(NSString * path)
{
    BOOL isDirectory = NO;
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    if ( !exists )
        return nil;
    
    NSError * error;
    NSArray * contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    
    if ( error ) {
        QLImagesetLog(@"%@", error);
        return nil;
    }
    
    if ( !contents.count ) {
        QLImagesetLog(@"no contents in %@", path);
        return nil;
    }

    static NSArray * filters = nil;
    
    if ( !filters ) {
        filters = @[@"png", @"@2x.png", @"@3x.png"];
    }
    
    NSString * content = nil;
    
    for ( int i = 0; i < filters.count; i++ ) {
        NSArray * matches = [contents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF ENDSWITH %@", filters[i]]];
        if ( matches.count ) {
            content = matches.firstObject;
            break;
        }
    }
    
    if ( content )
        return [path stringByAppendingPathComponent:content];
    return nil;

}