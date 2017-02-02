//
//  eventTVC.h
//  pruebaTecnicaBelatrix
//
//  Created by LTSSetup on 2/2/17.
//  Copyright © 2017 BrunoCardenasTorres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eventTVC : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblEventName;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblNumPeople;
@property (weak, nonatomic) IBOutlet UILabel *lblHour;

@end
