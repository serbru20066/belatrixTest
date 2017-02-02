//
//  eventDetailVC.m
//  pruebaTecnicaBelatrix
//
//  Created by LTSSetup on 2/2/17.
//  Copyright © 2017 BrunoCardenasTorres. All rights reserved.
//

#import "eventDetailVC.h"

@interface eventDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextView *txtDescrip;
@property (weak, nonatomic) IBOutlet UILabel *lblStart;
@property (weak, nonatomic) IBOutlet UILabel *lblEnds;
@property (weak, nonatomic) IBOutlet UILabel *lblParticipant;

@property (weak, nonatomic) IBOutlet UILabel *lblLocation;

@end

@implementation eventDetailVC
- (IBAction)onClickBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"detailDataDictionary"];
    
    _lblStart.text = [dict objectForKey:@"hourStart"];
    _lblEnds.text = [dict objectForKey:@"hourEnds"];
    _lblTitle.text =  [dict objectForKey:@"name"];
    _txtDescrip.text =  [dict objectForKey:@"description"];
    _lblLocation.text =  [dict objectForKey:@"location"];
}

@end
