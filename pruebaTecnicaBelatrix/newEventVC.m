//
//  newEventVC.m
//  pruebaTecnicaBelatrix
//
//  Created by LTSSetup on 2/2/17.
//  Copyright © 2017 BrunoCardenasTorres. All rights reserved.
//

#import "newEventVC.h"

@interface newEventVC ()
@property (weak, nonatomic) IBOutlet UITextField *txtEventName;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property (weak, nonatomic) IBOutlet UITextField *txtInitialDate;
@property (weak, nonatomic) IBOutlet UITextField *txtEndDate;
@property (weak, nonatomic) IBOutlet UITextField *txtForum;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;

@end

@implementation newEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClickSave:(id)sender {
    if (![_txtEventName.text isEqualToString:@""] && ![_txtDescription.text isEqualToString:@""] && ![_txtInitialDate.text isEqualToString:@""] ) {
        
        NSDictionary *dictEvent =@{@"date":@"05/02/2017",@"hourStart":_txtInitialDate.text,@"hourEnds":_txtEndDate.text,@"numPeople":_txtForum.text,@"name":_txtEventName.text,@"location":_txtLocation.text,@"description":_txtDescription.text};
        [[NSUserDefaults standardUserDefaults] setObject:dictEvent forKey:@"newEvent"];
        
        [self.navigationController popViewControllerAnimated:YES];

        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"receiveTestNotification"
         object:self];
        
        
    }
    else
    {
    
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please complete the required fields" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];

        
    }
    
  
}
- (IBAction)onClickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
