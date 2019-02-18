//
//  GIFIMessageShareActivity.h
//  gifmaker
//
//  Created by KZGifMaker on 12/23/15.
//  Copyright © 2018 KZGifMaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface GIFIMessageShareActivity : UIActivity

@property (nonatomic, strong) NSData *gifData;
@property (nonatomic, strong) UIViewController<MFMessageComposeViewControllerDelegate> *viewController;

@end
