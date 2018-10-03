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
@property (weak, nonatomic) IBOutlet UIButton *addStudent;

@end

// NSMutable Array *course
int currentIndex = 0;
int incrementCount = 0;

@implementation ViewController


-(Boolean) Add_Student : (NSString *) name : (NSString *) address : (NSString *) image : (float) midtermScore : (float) finalScore : (int) homework1: (int) homework2 :(int) homework3 {
    Student_Info *student = [Student_Info new];
    //student.studentName = name;
    [student setStudentName:name];
    [student setFinalScore:finalScore];
    [student setMidtermScore:midtermScore];// = midtermScore;
    [student setHomework1:homework1];// = homework1;
    [student setHomework2:homework2];// = homework2;
    [student setHomework3:homework3];// = homework3;
    student.address = address;
    student.imagePath = image;
    [course addObject:student];
    return true;
    
}

-(Boolean) Update_Test : (float) score : (NSString *) test : (NSInteger) index {
    Student_Info *student = course[index];
    
    if([test isEqualToString:@"midterm"]){
        [student setMidtermScore:score];
        if([student midtermScore] == score){
            return true;
        }
            return false;
    }else{
        [student setFinalScore: score];
        if([student finalScore] == score){
                return true;
        }
        return false;
    
    }
    return false;
}

- (IBAction)addStudent:(id)sender {
    [self Add_Student: _studentLabel.text :_addressLabel.text : @"" : [_midtermLabel.text floatValue] : [_finalLabel.text floatValue] : [_homework1Label.text doubleValue] : [_homework2Label.text doubleValue] : [_homework3Label.text doubleValue]];
    [_studentLabel setText:@""];
    [_addressLabel setText:@""];
    [_midtermLabel setText:@""];
    [_finalLabel setText:@""];
    [_homework1Label setText:@""];
    [_homework2Label setText:@""];
    [_homework3Label setText:@""];
    [_recordSlider setHidden: true];
    currentIndex = course.count - 1;
   
}

- (IBAction)pageControl:(id)sender {
    DetailedViewController * vC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    
    
    Student_Info * student = course[currentIndex];
    switch(_infoControl.selectedSegmentIndex){
        case 0:
            //
            [_previousButton setHidden: false];
            [_nextButton setHidden: false];
            [_recordSlider setHidden: false];
            [_addStudent setHidden:true];
            [self check];
            break;
        case 1:
            [self showViewController:vC sender:NULL];
            vC.studentName = student.studentName;//_studentLabel.text;
            vC.address = [student address]; //_addressLabel.text;
            vC.imagePath = student.imagePath;
            [vC showStudent];
            [_recordSlider setHidden: false];
            break;
            
        default:
            [_studentLabel setText:@""];
            [_addressLabel setText:@""];
            [_midtermLabel setText:@""];
            [_finalLabel setText:@""];
            [_homework1Label setText:@""];
            [_homework2Label setText:@""];
            [_homework3Label setText:@""];
            [_previousButton setHidden: true];
            [_nextButton setHidden: true];
            [_addStudent setHidden: false];
            [_recordSlider setHidden: false];
            break;
    }
    
    
}

-(void) check{
    //currentIndex = (currentIndex - 1) % [course count];
    [_previousButton setEnabled:true];
    [_nextButton setEnabled:true];
    
    if (currentIndex == 0) {
        [_previousButton setEnabled:false];
    }
    
    if (currentIndex == [course count] - 1) {
        [_nextButton setEnabled:false];
    }
    
    [self showDisplayAtIndex:currentIndex];
    
    [_recordSlider setMaximumValue:[course count] - 1];
    [_recordSlider setValue:currentIndex animated:YES];
    
}


- (IBAction)previousStudent:(id)sender {
        //check();
    currentIndex -= 1;
    [self check];

}

- (IBAction)nextStudent:(id)sender {
    currentIndex += 1;
    [self check];

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
        [_addStudent setHidden: true];
        Student_Info *object = [course objectAtIndex:index];
        _studentLabel.text = [object studentName];
        _addressLabel.text = [object address];
        _midtermLabel.text = [NSString stringWithFormat:@"%f",[object midtermScore]];
        _finalLabel.text = [NSString stringWithFormat:@"%f",[object finalScore]];
        _homework1Label.text = [NSString stringWithFormat:@"%d",[object homework1]];
        _homework2Label.text = [NSString stringWithFormat:@"%d",[object homework2]];
        _homework3Label.text = [NSString stringWithFormat:@"%d",[object homework3]];

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
    [self check];
}
@end

