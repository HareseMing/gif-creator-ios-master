//
//  NSObject+Helpers.m
//  gifmaker
//
//  Created by KZGifMaker on 1/4/16.
//  Copyright © 2018 KZGifMaker. All rights reserved.
//

#import "NSObject+Helpers.h"

@implementation NSObject (Helpers)

- (BOOL)checkNetworkIsReachable:(UIViewController *)viewController showAlertIfNoNetwork:(BOOL)showAlert {
//    if (showAlert && ![AFNetworkReachabilityManager sharedManager].reachable) {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oh God" message:@"You have no network connection!" preferredStyle:UIAlertControllerStyleAlert];
//        [alertController addAction:[UIAlertAction actionWithTitle:@"Oh my" style:UIAlertActionStyleCancel handler:nil]];
//        [viewController presentViewController:alertController animated:YES completion:nil];
//    }
//
//    return [AFNetworkReachabilityManager sharedManager].reachable;
    
    return YES;
}

@end
