//
//  Student_Info.h
//  Assignment2
//
//  Created by Eisen Huang on 9/28/18.
//  Copyright © 2018 Eisen Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student_Info : NSObject {
    NSString *address;
}

@property NSString *studentName , *imagePath, *address;
@property double midtermScore, finalScore;
@property int homework1 , homework2 , homework3;
-(id) init: (NSString *) name :  (NSString *) address :  (float) midtermScore :  (float) finalScore :  (int)homework1 :  (int) homework2 :  (int) homework3 ;
- (NSString *) Print_Object;






@end

NS_ASSUME_NONNULL_END
