//
//  Student_Info.m
//  Assignment2
//
//  Created by Eisen Huang on 9/28/18.
//  Copyright © 2018 Eisen Huang. All rights reserved.
//

#import "Student_Info.h"

@implementation Student_Info
-(id) init: (NSString *) studentName :  (NSString *) address :  (float) midtermScore :  (float) finalScore :  (int)homework1 :  (int) homework2 :  (int) homework3 : (NSString *) image{
    if(self = [super init]){
        _studentName = studentName;
        _address = address;
        _midtermScore = midtermScore;
        _finalScore = finalScore;
        _homework1 = homework1;
        _homework2 = homework2;
        _homework3 = homework3;
        _imagePath = image;
    }
    return self;
}

-(NSString *) Print_Object {
    
    NSString *output = [NSString stringWithFormat:@"Address: %@, Midterm: %f, Final: %f, Homework1: %d, Homework2: %d, Homework3: %d", _address, _midtermScore,_finalScore, _homework1, _homework2, _homework3];
    
    //NSLog(@"%@", output);
    
    return output;
    
}

@end
