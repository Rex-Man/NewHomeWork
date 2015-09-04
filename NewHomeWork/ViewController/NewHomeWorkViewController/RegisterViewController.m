//
//  RegisterViewController.m
//  NewHomeWork
//
//  Created by admin on 8/13/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "RegisterViewController.h"
#import "ResultViewController.h"
#import "MainPageViewController.h"

@interface RegisterViewController ()
@property (strong, nonatomic) IBOutlet UITableView *registerTableView;
@property (strong,nonatomic) NSArray *sexArry;
@property (strong,nonatomic) NSMutableArray *textfieldArray;
@property (strong,nonatomic) NSMutableDictionary *valueArray;
@property (strong,nonatomic) NSLocale *datelocale;
@property (strong,nonatomic) NSString *tempSex;
@property (retain ,nonatomic) NSMutableArray *selectedCellValue;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //self.navigationController.navigationBarHidden = YES;
     _tempSex=[[NSString alloc]init];
    [self initSexArray];
    [self initTableView];
    [self initNavigationBar];
}

- (void) initNavigationBar {
    self.title=@"Register";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initSexArray
{
    _sexArry=[[NSArray alloc]initWithObjects:@"",@"男",@"女", nil];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = [indexPath row];
    if(row ==0||row ==1||row ==2||row ==3){
        return 60;
    }else{
        return self.view.frame.size.height-60*4;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 5;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    if (row==0) {
        static NSString * userNameCellIdentifier = @"UserNameCellIdentifier";
        UITableViewCell * userNameCell= [self.registerTableView dequeueReusableCellWithIdentifier:userNameCellIdentifier];
        if(userNameCell==nil){
            userNameCell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userNameCellIdentifier];
        }
        UILabel *userName=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, 60, 30)];
        [userName setText:@"Name"];
        [userNameCell addSubview:userName];
        
        UITextField *userNameTF=[[UITextField alloc]initWithFrame:CGRectMake(140, 20, 200, 30)];
        [userNameTF setBorderStyle:UITextBorderStyleRoundedRect];
        userNameTF.delegate=self;
        [_textfieldArray addObject:userNameTF];
        [userNameCell addSubview:userNameTF];
        userNameCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return userNameCell;
        
    }else if(row==1){
        static NSString * sexCellIdentifier = @"SexCellIdentifier";
        UITableViewCell * sexCell= [self.registerTableView dequeueReusableCellWithIdentifier:sexCellIdentifier];
        if(sexCell==nil){
            sexCell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sexCellIdentifier];
        }
        UILabel *sexLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, 60, 30)];
        [sexLabel setText:@"Sex"];
        [sexCell addSubview:sexLabel];
        
        UITextField *sexTF=[[UITextField alloc]initWithFrame:CGRectMake(140, 20, 200, 30)];
        sexTF.delegate=self;
        //sexTF.enabled = false;
       
        [sexTF setBorderStyle:UITextBorderStyleRoundedRect];
        UIPickerView *sexPicker=[[UIPickerView alloc] init];
        sexPicker.dataSource=self;
        sexPicker.delegate=self;
        sexPicker.showsSelectionIndicator=YES;
        sexTF.inputView=sexPicker;
        UIToolbar *toolbar=[[UIToolbar alloc]init];
        toolbar.frame=CGRectMake(0, 0, 320, 44);
        UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(sexChooseComplete)];
        toolbar.items=@[item1,item2];
        sexTF.inputAccessoryView=toolbar;
        [sexTF addTarget:self action:@selector(selectSexController) forControlEvents:UIControlEventTouchUpInside];
        [_textfieldArray addObject:sexTF];
        [sexCell addSubview:sexTF];
        sexCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return sexCell;
    }
    else if(row==2){
        static NSString * birthdayCellIdentifier = @"birthdayCellIdentifier";
        UITableViewCell * birthdayCell= [self.registerTableView dequeueReusableCellWithIdentifier:birthdayCellIdentifier];
        if(birthdayCell==nil){
            birthdayCell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:birthdayCellIdentifier];
        }
        UILabel *birthdayLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, 80, 30)];
        [birthdayLabel setText:@"Birthday"];
        [birthdayCell addSubview:birthdayLabel];
        
        UITextField *birthdayTF=[[UITextField alloc]initWithFrame:CGRectMake(140, 20, 200, 30)];
        birthdayTF.delegate=self;
        //birthdayTF.enabled = false;
        
        [birthdayTF setBorderStyle:UITextBorderStyleRoundedRect];        UIDatePicker *birthdayPicker=[[UIDatePicker alloc]init];
        _datelocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CH"];
        birthdayPicker.locale = _datelocale;
        birthdayTF.inputView=birthdayPicker;
        
        UIToolbar *toolbar=[[UIToolbar alloc]init];
        toolbar.frame=CGRectMake(0, 0, 320, 44);
        UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(birthdayChooseComplete)];
        toolbar.items=@[item1,item2];
        birthdayTF.inputAccessoryView=toolbar;
        [_textfieldArray addObject:birthdayTF];
        [birthdayCell addSubview:birthdayTF];
        
        birthdayCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return birthdayCell;
        
    }
    else if(row==3){
        static NSString * cityCellIdentifier = @"CityCellIdentifier";
        UITableViewCell * cityCell= [self.registerTableView dequeueReusableCellWithIdentifier:cityCellIdentifier];
        if(cityCell==nil){
            cityCell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cityCellIdentifier];
        }
        UILabel *cityLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, 60, 30)];
        [cityLabel setText:@"City"];
        [cityCell addSubview:cityLabel];
        
        UITextField *cityTF=[[UITextField alloc]initWithFrame:CGRectMake(140, 20, 200, 30)];
        cityTF.delegate=self;
        cityTF.enabled = false;
        [cityTF setBorderStyle:UITextBorderStyleRoundedRect];
        [_textfieldArray addObject:cityTF];
        [cityCell addSubview:cityTF];
        cityCell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//        UIButton *chooseButton=[[UIButton alloc]initWithFrame:CGRectMake(345,20,30,30)];
//        [chooseButton setTitle:@">" forState:UIControlStateNormal];
//        [chooseButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        //[cityCell addSubview:chooseButton];
        
        
        
        
        
        
        [cityCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        return cityCell;
        
    }else{
        static NSString * bottomCellIdentifier = @"BottomCellIdentifier";
        UITableViewCell * bottomCell= [self.registerTableView dequeueReusableCellWithIdentifier:bottomCellIdentifier];
        if(bottomCell==nil){
            bottomCell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bottomCellIdentifier];
        }
        CGFloat padding=70;
        CGFloat iconViewX=padding;
        CGFloat iconViewY=20;
        CGFloat iconViewW=231;
        CGFloat iconViewH=40;
        UIButton *registerButton=[[UIButton alloc]initWithFrame:CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH)];
        [registerButton setTitle:@"Register" forState:UIControlStateNormal];
        [registerButton setBackgroundColor:[UIColor colorWithRed:(0.0/255.0) green:(191.0/255.0) blue:(254.0/255.0)alpha:1.0]]; //自定义颜色];
         [registerButton addTarget:self action:@selector(handleRegister) forControlEvents:UIControlEventTouchUpInside];
        registerButton.layer.cornerRadius=5;
        [bottomCell addSubview:registerButton];
        [bottomCell setBackgroundColor:[UIColor blackColor]];
        bottomCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return bottomCell;
    }
}
-(void) selectSexController{
     UITextField *sexTF = [_textfieldArray objectAtIndex:1];
     sexTF.text=[self.sexArry objectAtIndex:0];
}
-(void) initTableView{
    self.registerTableView.bounces = NO;
    _textfieldArray=[[NSMutableArray alloc]init];
}
-(void) sexChooseComplete{
    UITextField *sexTF = [_textfieldArray objectAtIndex:1];
    sexTF.text=_tempSex;
    [sexTF endEditing:YES];
}
-(void) birthdayChooseComplete{
    UITextField *birthdayTF = [_textfieldArray objectAtIndex:2];
    UIDatePicker *birthdayPicker=(UIDatePicker *)birthdayTF.inputView;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd hh24:mm:ss" options:0 locale:_datelocale];
    [formatter setDateFormat:dateFormat];
    [formatter setLocale:_datelocale];
    // 將選取後的日期 填入 UITextField
    birthdayTF.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:birthdayPicker.date]];
    [birthdayTF endEditing:YES];
    }
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     long newRow = [indexPath row];
     UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(newRow==3)
    {
        UITextField *cityTF = [_textfieldArray objectAtIndex:3];
        if(![[cityTF text] isEqual:@""])
        {
            NSArray *needSelectArray=[[cityTF text] componentsSeparatedByString:NSLocalizedString(@";", nil)];
            _selectedCellValue = [NSMutableArray arrayWithArray:needSelectArray];
        }else{
            _selectedCellValue =nil;
        }
        ResultViewController *result = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:nil];
        result.cityViewDelegate = self;
        result.selectCellValues= _selectedCellValue;
        
        [self.navigationController pushViewController:result animated:YES];
    }
        

    
    
}
-(void) handleRegister
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    int i=1;
    for(UITextField *tf in _textfieldArray)
    {
        if(i==1)
        {
            [userDefault setObject:[tf text] forKey:@"username"];
        }else if(i==2)
        {
            [userDefault setObject:[tf text] forKey:@"usersex"];
 
        }else if(i==3)
        {
            [userDefault setObject:[tf text] forKey:@"userbirthday"];
        }else if(i==4)
        {
            [userDefault setObject:[tf text] forKey:@"usercity"];
        }
        
        i++;
    }
    NSString *username = [userDefault objectForKey:@"username"];
    if (username) {
        MainPageViewController *result = [[MainPageViewController alloc]initWithNibName:@"MainPageViewController" bundle:nil];
        //UINavigationController *mainNavigationController=[[UINavigationController alloc] initWithRootViewController:result];
        //[self.navigationController pushViewController:result animated:YES];

        [self.navigationController setViewControllers:@[result]];
    }
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger textFieldIndex = [self.textfieldArray indexOfObject:textField];
    
//    if (textFieldIndex < self.textfieldArray.count - 1) {
//        //[(UITextField *)self.textfieldArray[textFieldIndex + 1] becomeFirstResponder];
//    } else {
        [textField resignFirstResponder];
//            }
    
    return YES;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
     return 1;
}

//每列对应多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    //1.获取当前的列
//    NSArray *arayM= self.sexArry[component];
//    //2.返回当前列对应的行数
//    return arayM.count;
    
    return self.sexArry.count;
}

//每列每行对应显示的数据是什么
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    //1.获取当前的列
//    NSArray *arayM= self.sexArry[component];
    //2.获取当前列对应的行的数据
//   NSString *name=arayM[row];
    return [self.sexArry objectAtIndex:row];
}

#pragma mark-设置下方的数据刷新
// 当选中了pickerView的某一行的时候调用
// 会将选中的列号和行号作为参数传入
// 只有通过手指选中某一行的时候才会调用
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //获取对应列，对应行的数据
  
    _tempSex=self.sexArry[row];
}


-(void)setSelectCity:(NSMutableArray *) selectCity{
    UITextField *cityTF = [_textfieldArray objectAtIndex:3];
    NSString *selectValueString = @"";
    for(NSString *selectValue in selectCity){
        if (selectValue && selectValue.length>0) {
            if(selectValueString.length==0){
                selectValueString =selectValue;
            }else{
                selectValueString = [selectValueString stringByAppendingString:[NSString stringWithFormat:@";%@",selectValue]];
            }
            
        }
    }
    [cityTF setText:selectValueString];
    _selectedCellValue=selectCity;

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
