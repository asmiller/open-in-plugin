/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "OpenIn.h"

NSString *const OpenInNotificationConst = @"OpenInNotification";

@implementation OpenIn

@synthesize callbackId;

- (void)updateOpenIn:(NSNotification*)notification
{

    if (self.callbackId) {
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:notification.object];
        [result setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:result callbackId:self.callbackId];
    }
}

/* turn on openin monitoring*/
- (void)start:(CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateOpenIn:)
                                                 name:OpenInNotificationConst object:nil];
}

/* turn off openin monitoring */
- (void)stop:(CDVInvokedUrlCommand*)command
{
    self.callbackId = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OpenInNotificationConst object:nil];
}

- (CDVPlugin*)initWithWebView:(UIWebView*)theWebView
{
    self = (OpenIn *)[super initWithWebView:theWebView];
    return self;
}

- (void)dealloc
{
    [self stop:nil];
}

- (void)onReset
{
    [self stop:nil];
}

@end
