//
//  dishViewViewController.m
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import "dishViewViewController.h"
#import "editDishViewController.h"

@interface dishViewViewController ()

@end

@implementation dishViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.record) {
        // Update Text Field
        [self.dishNameLabel setText:[self.record valueForKey:@"dishName"]];
        [self.recipeContentLabel setText:[self.record valueForKey:@"dishRecipe"]];
        [self.dishImageImageView setImage:[UIImage imageWithData:[self.record valueForKey:@"dishImage"]]];
    }    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[editDishViewController class]])
    {
        NSLog(@"dishViewViewController's record :%@", self.record);
        //create a view controller object and make it the current segue's destination.
        editDishViewController *nextViewController = [segue destinationViewController];
        // Send the Managed Object Context.
        [nextViewController setManagedObjectContext:self.managedObjectContext];
        if (self.record)
        {
            NSLog(@"dishViewViewController's record :%@", self.record);
            [nextViewController setRecord:self.record];
        }
    }
}

@end
