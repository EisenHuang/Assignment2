//
//  DetailedViewController.h
//  Assignment2
//
//  Created by Eisen Huang on 10/1/18.
//  Copyright © 2018 Eisen Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailedViewController : UIViewController;
@property NSString *studentName , *imagePath, *address;

-(void) showStudent;
@end

NS_ASSUME_NONNULL_END
