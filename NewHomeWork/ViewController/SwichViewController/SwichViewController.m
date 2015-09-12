//
//  SwichViewController.m
//  NewHomeWork
//
//  Created by rex man  on 15/9/5.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "SwichViewController.h"

@interface SwichViewController ()
@property (strong, nonatomic) IBOutlet UISwitch *leftSwich;
@property (strong, nonatomic) IBOutlet UISwitch *rightSwich;
@property (strong, nonatomic) IBOutlet UILabel *SliderValue;

@end

@implementation SwichViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initNavigation];

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)touchDown:(id)sender {
    if(self.leftSwich.hidden==YES)
    {
        self.rightSwich.hidden=NO;
        self.leftSwich.hidden=NO;
    }else{
        
        self.rightSwich.hidden=YES;
        self.leftSwich.hidden=YES;
    }
}
- (IBAction)sliderValueChange:(id)sender {
    UISlider *slider=(UISlider *)sender;
    int progressAsInt=(int) (slider.value +0.5f);
    NSString *newText=[[NSString alloc] initWithFormat:@"%d" ,progressAsInt];
    self.SliderValue.text=newText;
}
-(void)initNavigation{
    self.title =@"Swich";
}
- (IBAction)rightSwichValueChanged:(id)sender {
    if ([_rightSwich isOn]) {
      //  NSString *showMessage=[[NSString ]]
        [self alertMessage:@"leftSwich"];
    }
    else{
        [self alertMessage:@"leftSwich No"];

    }
}
- (IBAction)leftSwichValueChanged:(id)sender {
    if ([_leftSwich isOn]) {
        [self alertMessage:@"rightSwich Yes"];
        
    }else{
        [self alertMessage:@"leftSwich No"];
        
    }
}

-(void) alertMessage:(NSString *) message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Really reset?" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"Yes"];
    [alert show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
