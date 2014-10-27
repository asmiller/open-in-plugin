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
        [[NSNotificationCenter defaultCenter]
            postNotificationName:OpenInNotificationConst
                    object:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [url absoluteString], @"url", nil];
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