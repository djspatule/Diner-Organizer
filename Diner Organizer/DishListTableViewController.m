//
//  DishListTableViewController.m
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import "DishListTableViewController.h"
#import "dishViewViewController.h"

@interface dishListTableViewController ()

@end

@implementation dishListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    // reload the table view with content of the dishes array of dish dictionnaries
    NSUserDefaults *dishesDB = [NSUserDefaults standardUserDefaults];
    self.dishes = [[dishesDB objectForKey:@"dishes"] mutableCopy];
    NSLog(@"self.dishes contains %@", self.dishes);
    [self.dishListTableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.dishes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if ([self.dishes count] < 1)
    {
        cell.textLabel.text = @"This list is empty...add your 1st dish";

    }
    else {
        //create a dictionnary object with the info from the dish in DB (that was transfered in self.dishes)
        NSDictionary *dish = self.dishes[indexPath.row];
        cell.textLabel.text = [dish objectForKey:@"dishName"];
        cell.detailTextLabel.text = [dish objectForKey:@"dishRecipe"];
        //cell.imageView.image = dish.dishImage;

    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender

{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[dishViewViewController class]])
        {
            //create a view controller object and make it the current segue's destination.
            dishViewViewController *nextViewController = segue.destinationViewController;
            //create a path object in which we store the path for the UITableViewCell that started the segue.
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            // transfer to the next view controller the path (or address) of the cell that was clicked on.
            nextViewController.dishIndexNumber = path.row;
        }
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // remove the dish from the temporary copy of dishes
    [self.dishes removeObjectAtIndex:indexPath.row];
    
    // update the DB
    NSUserDefaults *dishesDB = [NSUserDefaults standardUserDefaults];
    // put the updated version of self.dishes in an immutable array
    NSArray *immutableNewList = [self.dishes copy];
    // upload this immutable array in the database (and replace the existing one)
    [dishesDB setObject:immutableNewList forKey:@"dishes"];
    [dishesDB synchronize];
    // reload view
    [self.dishListTableView reloadData];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
