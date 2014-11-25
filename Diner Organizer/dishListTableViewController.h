//
//  dishListTableViewController.h
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface dishListTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dishes;
@property (strong, nonatomic) IBOutlet UITableView *dishListTableView;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end
