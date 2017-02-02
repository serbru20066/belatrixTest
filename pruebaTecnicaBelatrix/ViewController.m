//
//  ViewController.m
//  pruebaTecnicaBelatrix
//
//  Created by LTSSetup on 2/2/17.
//  Copyright © 2017 BrunoCardenasTorres. All rights reserved.
//

#import "ViewController.h"
#import "eventTVC.h"
#import "eventDetailVC.h"
#import "newEventVC.h"

@interface ViewController ()
{
    NSMutableDictionary *dictEvents;
    NSMutableArray *arrEvents;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (IBAction)onClickNew:(id)sender {
    newEventVC *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"newEventVC"];
    [self.navigationController pushViewController:VC animated:YES];

}

-(void)viewDidAppear:(BOOL)animated
{



}
- (void) receiveTestNotification:(NSNotification *) notification
{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"newEvent"];
    [arrNext addObject:dict];
    [dictEvents setObject:arrToday forKey:@"Today"];
    [dictEvents setObject:arrNext forKey:@"Next events"];
    
    [_tableView reloadData];

}
#pragma mark LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"receiveTestNotification"
                                               object:nil];
    
    //Inicialization
    dictEvents = [[NSMutableDictionary alloc] init];
    arrEvents = [[NSMutableArray alloc] init];
    
    
    //Data Source
    [arrEvents addObject:@{@"date":@"03/02/2017",@"hourStart":@"8:00",@"hourEnds":@"10:00",@"numPeople":@"8/10",@"name":@"Sport Event 1",@"location":@"Estadio San Marcos",@"description":@"Este es un evento muy interesante para asistir ya que tendrá muchos deportistas exelentes"}];
    
    [arrEvents addObject:@{@"date":@"03/02/2017",@"hourStart":@"8:00",@"hourEnds":@"10:00",@"numPeople":@"4/18",@"name":@"Sport Event 2",@"location":@"Estadio San Marcos",@"description":@"Este es un evento muy interesante para asistir ya que tendrá muchos deportistas exelentes"}];
    
    [arrEvents addObject:@{@"date":@"03/02/2017",@"hourStart":@"8:00",@"hourEnds":@"10:00",@"numPeople":@"3/10",@"name":@"Sport Event3",@"location":@"Estadio San Marcos",@"description":@"Este es un evento muy interesante para asistir ya que tendrá muchos deportistas exelentes"}];
    
    [arrEvents addObject:@{@"date":@"04/11/2017",@"hourStart":@"8:00",@"hourEnds":@"10:00",@"numPeople":@"9/12",@"name":@"Sport Event4",@"location":@"Estadio Matute",@"description":@"Este es un evento muy interesante para asistir ya que tendrá muchos deportistas exelentes"}];
    
    [arrEvents addObject:@{@"date":@"04/11/2017",@"hourStart":@"8:00",@"hourEnds":@"10:00",@"numPeople":@"10/12",@"name":@"Sport Event5",@"location":@"Estadio Matute",@"description":@"Este es un evento muy interesante para asistir ya que tendrá muchos deportistas exelentes"}];
    
    arrToday = [[NSMutableArray alloc] init];
   arrNext = [[NSMutableArray alloc] init];
    
    for (int i=0;i<[arrEvents count]; i++) {
        
        NSDictionary *dictAux = [arrEvents objectAtIndex:i];
        
        if ([[dictAux objectForKey:@"date"] isEqualToString:@"03/02/2017"]) {
            
            [arrToday addObject:dictAux];

        }
        else
        {
        
            [arrNext addObject:dictAux];
            
        }
    }
    
    [dictEvents setObject:arrToday forKey:@"Today"];
    [dictEvents setObject:arrNext forKey:@"Next events"];

    
    NSLog(@"");


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark UitableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return [[dictEvents allKeys] count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *item = [dictEvents objectForKey:[[dictEvents allKeys] objectAtIndex:section]];
    return [item count];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    return 34;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    view.backgroundColor = [UIColor colorWithWhite: 0.80 alpha:1];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];

    label.text = [[dictEvents allKeys] objectAtIndex:sectionIndex];
    
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *item = [dictEvents objectForKey:[[dictEvents allKeys] objectAtIndex:indexPath.section]];
    NSDictionary *dictAux = [item objectAtIndex:indexPath.row];

    eventTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"eventTVC"];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.lblHour.text =[NSString stringWithFormat:@"%@ - %@", [dictAux objectForKey:@"hourStart"],[dictAux objectForKey:@"hourEnds"]];
    cell.lblNumPeople.text = [dictAux objectForKey:@"numPeople"];
    cell.lblEventName.text = [dictAux objectForKey:@"name"];
    cell.lblLocation.text = [dictAux objectForKey:@"location"];

        return  cell;
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSArray *item = [dictEvents objectForKey:[[dictEvents allKeys] objectAtIndex:indexPath.section]];
    NSDictionary *dictAux = [item objectAtIndex:indexPath.row];

    [[NSUserDefaults standardUserDefaults] setObject:dictAux forKey:@"detailDataDictionary"];
    
    eventDetailVC *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"eventDetailVC"];
    [self.navigationController pushViewController:VC animated:YES];
    

}

@end
