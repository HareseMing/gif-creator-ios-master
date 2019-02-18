//
//  NSObject+Helpers.h
//  gifmaker
//
//  Created by KZGifMaker on 1/4/16.
//  Copyright © 2018 KZGifMaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Helpers)

/*! Check for network connection and show alert if needed. */
- (BOOL)checkNetworkIsReachable:(UIViewController *)viewController showAlertIfNoNetwork:(BOOL)showAlert;

@end
