//
//  GifListViewController.m
//  gifCreator
//
//  Created by Ntgod on 2019/2/13.
//  Copyright © 2019年 remi. All rights reserved.
//

#import "GifListViewController.h"
//#import "GIFSaveVideoActivity.h"
#import "GIFIMessageShareActivity.h"
#import "AKMatrixImageView.h"
#import <SVProgressHUD.h>
@interface GifListViewController ()<MFMessageComposeViewControllerDelegate>

@property(nonatomic,strong)AKMatrixImageView * matrixImageView ;

@end

@implementation GifListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fanhui"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
//    [UIImage imageNamed:@"" ]
    
    
    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *fileURL = [documentsDirectoryURL URLByAppendingPathComponent:@"animated.gif"];
    
    NSData *datafile = [NSData dataWithContentsOfURL:fileURL];

    NSArray * dataarr;
    if (datafile == nil) {
        
        NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"giforce3" ofType:@"gif"];
        
        NSData*  data1=[NSData dataWithContentsOfFile:filePath1];
        
        
        NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"giforce4" ofType:@"gif"];
        
        NSData*  data2=[NSData dataWithContentsOfFile:filePath2];
        
        NSString *filePath3 = [[NSBundle mainBundle] pathForResource:@"giferoce2" ofType:@"gif"];
        
        NSData*  data3=[NSData dataWithContentsOfFile:filePath3];
        
        
        NSString *filePath4 = [[NSBundle mainBundle] pathForResource:@"giforce6" ofType:@"gif"];
        
        NSData*  data4=[NSData dataWithContentsOfFile:filePath4];
        
        dataarr = @[
                    data1,data2,data3,data4
                    ];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-150, 40, 300, 50)];
        self.title = @"Effect of the sample";
        label.text = @"";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:25];
        //    label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        
    }else{
        self.title = @"GIf generated list";
        dataarr = @[
                              datafile
                              ];
        
    }
    
    
    
    
    _matrixImageView = [AKMatrixImageView matrixImageViewEdge:AKEdgeMake(20, 10, 15) imageDatas:dataarr playModel:AKPlayModelSequence];
    
    //    [[AKMatrixImageView matrixImageViewEdge:AKEdgeMake(20, 10, 15) imagesName:arr playModel:AKPlayModelSequence]addImageClick:^(NSInteger index) {
    //        NSLog(@"index: %ld",index);
    //    }];
    
    __weak typeof(self)weakSelf = self;
    
    _matrixImageView.ClickImg = ^(NSData *imgData) {
      
        [weakSelf shareGIFWithData:imgData];
        
//        NSString *textToShare = @"GIF";
//
//        NSData *data = imgData;
////        UIImage *imageToShare = [UIImage imageWithData:data];
//
//
////        NSString*  detailStr = [NSString stringWithFormat:@"%@%@",@"http://api.htxq.net/",_homeListDataModel.detailUrl];
////        NSURL *urlToShare = [NSURL URLWithString:detailStr];
//
//        NSArray *activityItems = @[textToShare, data];
//
//
//        UIActivityViewController *activityViewController =[[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//
//        activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypePostToTwitter, UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop];
//
//
//        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
//            //初始化Block回调方法,此回调方法是在iOS8之后出的，代替了之前的方法
//            UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(NSString *activityType,BOOL completed,NSArray *returnedItems,NSError *activityError)
//            {
//                if (completed) {
//
//                }else {
//
//                }
//
//            };
//
//            // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
//            activityViewController.completionWithItemsHandler = myBlock;
//        }
//
//        if (activityViewController) {
//            [weakSelf presentViewController:activityViewController animated:YES completion:nil];
//        }
        
        
    };
    _matrixImageView.frame = CGRectMake(0, 100, 375, _matrixImageView.matrixImageViewHeight);
    //    _matrixImageView.
    [self.view addSubview:_matrixImageView];
    
    
    
   
    
    //    self.view.frame.size.height - 120
    
    
//    UIButton *cancle = [UIButton buttonWithType:UIButtonTypeCustom];
//    [cancle addTarget:self action:@selector(cancleClick:) forControlEvents:UIControlEventTouchUpInside];
//    [cancle setTitle:@"Back" forState:UIControlStateNormal];
//    cancle.frame = CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height - 120, 300, 50);
//    [self.view addSubview:cancle];
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    if (result == MessageComposeResultSent) {
//        [[GIFAnalyticsManager sharedGIFAnalyticsManager] gifSharedViaIMessage];
        [SVProgressHUD showWithStatus:@"gifSharedViaIMessage"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)shareGIFWithData:(NSData *)data{
    
    GIFIMessageShareActivity *gifIMessageShareActivity = [[GIFIMessageShareActivity alloc] init];
    gifIMessageShareActivity.gifData = data;
    gifIMessageShareActivity.viewController = self;
    
//    GIFSaveVideoActivity *gifsaveVideoActivity = [[GIFSaveVideoActivity alloc] init];
//    gifsaveVideoActivity.gifElement = self.gifElements[index];
    
    // Make sharing controller with our share buttons
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]
                                                        initWithActivityItems:@[]
                                                        applicationActivities:@[gifIMessageShareActivity ]];
    
    // Exclude all system's sharing services (use only our ones)
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo,
                                   UIActivityTypeCopyToPasteboard,
                                   UIActivityTypeOpenInIBooks,
                                   UIActivityTypePostToWeibo,
                                   UIActivityTypeMail,
                                   UIActivityTypeSaveToCameraRoll];
    
    //  UIActivityTypePostToTwitter, UIActivityTypePostToTencentWeibo,UIActivityTypePostToFacebook,
    
    activityViewController.excludedActivityTypes = excludeActivities;
    
    // Present sharing controller to the user
    [self.navigationController presentViewController:activityViewController
                                            animated:YES
                                          completion:^{
                                              // Do something on completion
                                          }];
}

-(void)backClick{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
