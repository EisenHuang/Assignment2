//
//  ViewController.m
//  Assignment2
//
//  Created by Eisen Huang on 9/28/18.
//  Copyright © 2018 Eisen Huang. All rights reserved.
//

#import "ViewController.h"
#import "Student_Info.h"
#import "DetailedViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressLabel;
@property (weak, nonatomic) IBOutlet UITextField *midtermLabel;
@property (weak, nonatomic) IBOutlet UITextField *finalLabel;
@property (weak, nonatomic) IBOutlet UITextField *homework1Label;
@property (weak, nonatomic) IBOutlet UITextField *homework2Label;
@property (weak, nonatomic) IBOutlet UITextField *homework3Label;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UISlider *recordSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *infoControl;

@end

// NSMutable Array *course
int currentIndex = 0;
int incrementCount = 0;

@implementation ViewController


- (IBAction)pageControl:(id)sender {
    DetailedViewController * vC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    Student_Info * student = course[currentIndex];
    switch(_infoControl.selectedSegmentIndex){
        case 0:
            break;
        case 1:
            vC.studentName = student.studentName;//_studentLabel.text;
            vC.address = student.address; //_addressLabel.text;
            vC.imagePath = student.imagePath;
            vC.view.backgroundColor = UIColor.blueColor;
            
            [vC showStudent];
            [self showViewController:vC sender:NULL];
            
            break;
        default:
            break;
    }
    
    
}

- (IBAction)previousStudent:(id)sender {
    if (currentIndex == 1) {
        [_previousButton setEnabled:false];
    }
    
    if (currentIndex == [course count] - 1) {
        [_nextButton setEnabled:true];
    }
    currentIndex = (currentIndex - 1) % [course count];
    [self showDisplayAtIndex:currentIndex];
    [_recordSlider setValue:currentIndex animated:YES];
}

- (IBAction)nextStudent:(id)sender {
    if (currentIndex == [course count] - 2) {
        [_nextButton setEnabled:false];
    }
    
    if (currentIndex == 0) {
        [_previousButton setEnabled:true];
    }
    currentIndex = (currentIndex + 1) % [course count];
    [self showDisplayAtIndex:currentIndex];
    [_recordSlider setValue:currentIndex animated:YES];
}


- (IBAction)sliderMoved:(id)sender {
    UISlider *mySlider = (UISlider *) sender;
    int recordToDisplay = (int) mySlider.value;
    [self showDisplayAtIndex:recordToDisplay];
    if(recordToDisplay == 0) {
        [_previousButton setEnabled:false];
    } else {
        [_previousButton setEnabled:true];
    }

    if(recordToDisplay == [course count] - 1) {
        [_nextButton setEnabled:false];
    } else {
        [_nextButton setEnabled:true];
    }
    currentIndex = recordToDisplay;
}


- (void) showDisplayAtIndex:(int)index{
        if(index == 0) {
            //[_previousButton setEnabled:false];
           // [_nextButton setEnabled:true];
            [_recordSlider setValue:0 animated:YES];
            [_recordSlider setMaximumValue:[course count] - 1];
            currentIndex = 0;
        }
    
        Student_Info *object = [course objectAtIndex:index];
        _studentLabel.text = [object studentName];
        _addressLabel.text = [object address];
        _midtermLabel.text = [NSString stringWithFormat:@"%f",[object midtermScore]];
        _finalLabel.text = [NSString stringWithFormat:@"%f",[object finalScore]];
        _homework1Label.text = [NSString stringWithFormat:@"%d",[object homework1]];
        _homework2Label.text = [NSString stringWithFormat:@"%d",[object homework2]];
        _homework3Label.text = [NSString stringWithFormat:@"%d",[object homework3]];
    
        UIImageView *imageview = [[UIImageView alloc] init];
        UIImage *myimg = [UIImage imageNamed:[object imagePath]];
        imageview.image = myimg;
        imageview.frame = CGRectMake(90, 75, 200, 150); // pass your frame here
        [self.view addSubview:imageview];
    }


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    course = [[NSMutableArray alloc] init];
  //  Student_Info * student = [Student_Info new];
    
    [course addObject:[[Student_Info alloc] init:@"King Richard III" :@"Leicester Castle, England" :72 :45 :9 :10 :00 : @"richard_iii"]];
    [course addObject:[[Student_Info alloc] init:@"Prince Hamlet" :@"Elsinore Castle, Denmark" :100 :0 :10 :10 :10: @"hamlet"]];
    [course addObject:[[Student_Info alloc] init:@"King Lear" :@"Leicester Castle, England" :100 :22 :10 :6 :0 : @"king_lear"]];
    [course addObject:[[Student_Info alloc] init:@"King Henry VIII" :@"Whitehall Palace, England" :62 :60 :7 :6 :7: @"henry_VIII"]];
    [course addObject:[[Student_Info alloc] init:@"Queen Elizabeth" :@"Richmond Palace, England" :62 :60 :7 :6 :7: @"queen_elizabeth"]];
    [self showDisplayAtIndex:0];
}
@end

