//
//  DetailedViewController.m
//  Assignment2
//
//  Created by Eisen Huang on 10/1/18.
//  Copyright © 2018 Eisen Huang. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentInfo;
@property (weak, nonatomic) IBOutlet UITextField *studentAddress;
@property (weak, nonatomic) IBOutlet UIButton *returnButton;
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;


@end

@implementation DetailedViewController

- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


- (void) showStudent{
    [_studentInfo setText:_studentName];
    [_studentAddress setText:_address];
    [_studentImage setImage:[UIImage imageNamed:_imagePath]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
