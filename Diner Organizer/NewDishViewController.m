//
//  NewDishViewController.m
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import "NewDishViewController.h"

@interface NewDishViewController ()

@end

@implementation NewDishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)saveDish:(UIBarButtonItem *)sender
{
    // create an instance of the NSUserdefaults
    NSUserDefaults *dishesDB = [NSUserDefaults standardUserDefaults];

    // create a Dish dictionnary object and fill it with screen content
    NSDictionary *newDish = @{@"dishName" : self.dishNameTextField.text, @"dishRecipe" : self.dishRecipeTextField.text};
    
    // save dish in userDefaults dishesDB dictionnary by first loading the DB in memory, completing it before uploading it again.
    NSMutableArray *newList = [[NSMutableArray alloc] init];
    for (int i = 0; i < ((int)[[dishesDB objectForKey:@"dishes"] count]); i++)
    {
        [newList addObject:[[dishesDB objectForKey:@"dishes"] objectAtIndex:i]];
    }
    [newList addObject:newDish];
    NSArray *immutableNewList = [newList copy];
    [dishesDB setObject:immutableNewList forKey:@"dishes"];
    [dishesDB synchronize];
    NSLog(@"the DB contains %lu elements whose last is %@", (unsigned long)[[dishesDB objectForKey:@"dishes"] count], [[dishesDB objectForKey:@"dishes"] lastObject]);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
