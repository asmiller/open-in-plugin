//
//  AppDelegate+openin.m
//
//  Created by Andrew Miller
//
//

#import "AppDelegate+openin.h"
#import <objc/runtime.h>

@implementation AppDelegate (notification)

-(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if (url != nil && [url isFileURL]) {
        NSFileManager *man = [NSFileManager defaultManager];
        NSDictionary *attrs = [man attributesOfItemAtPath: [url path] error: NULL];

        NSArray *parts = [[url absoluteString] componentsSeparatedByString:@"/"];
        NSString *filename = [parts objectAtIndex:[parts count]-1];

        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        filename, @"filename",
                                        [url absoluteString], @"url",
                                        [attrs valueForKey:@"NSFileSize"], @"size", nil];

        [[NSNotificationCenter defaultCenter]
            postNotificationName:OpenInNotificationConst
                    object:dict];
    }
    return YES;
}

//Deprecated
-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {

    if (url != nil && [url isFileURL]) {
        [[NSNotificationCenter defaultCenter]
            postNotificationName:OpenInNotificationConst
                    object:url];
    }
    return YES;
}

@end