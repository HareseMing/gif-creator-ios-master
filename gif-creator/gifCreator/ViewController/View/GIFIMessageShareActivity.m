//
//  GIFIMessageShareActivity.m
//  gifmaker
//
//  Created by KZGifMaker on 12/23/15.
//  Copyright © 2018 KZGifMaker. All rights reserved.
//

#import "GIFIMessageShareActivity.h"
#import "NSObject+Helpers.h"

@implementation GIFIMessageShareActivity

- (NSString *)activityType {
    return @"gifhelper.Share.iMessage";
}

- (NSString *)activityTitle {
    return @"iMessage";
}


-(void)needSubViewsType{
    
    
}
- (UIImage *)activityImage {
    return [UIImage imageNamed:@"imessageShare"];
}
- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
}

- (UIViewController *)activityViewController {
    return nil;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}


- (void)performActivity {
    // Check for internet connection
    if (![self checkNetworkIsReachable:self.viewController showAlertIfNoNetwork:YES]) {
        return;
    }
    
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        [messageController setMessageComposeDelegate:self.viewController];
        [messageController setRecipients:@[]];
        [messageController setBody:@"Shared with GIF perfect composition!"];
        [messageController addAttachmentData:[NSData dataWithData:self.gifData] typeIdentifier:@"public.movie" filename:@"animation.gif"];
        [self.viewController presentViewController:messageController animated:YES completion:nil];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Can't share via iMessage!" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self.viewController presentViewController:alertController animated:YES completion:nil];
    }
}

@end
