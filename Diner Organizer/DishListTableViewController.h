//
//  DishList.h
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dishListTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dishes;
@property (strong, nonatomic) IBOutlet UITableView *dishListTableView;

@end
