//
//  dishViewViewController.m
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import "dishViewViewController.h"

@interface dishViewViewController ()

@end

@implementation dishViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // load dishes data into a local MutableArray called dishes
    NSUserDefaults *dishesDB = [NSUserDefaults standardUserDefaults];
    NSMutableArray *dishes = [[NSMutableArray alloc] init];
    dishes = [[dishesDB objectForKey:@"dishes"] mutableCopy];

    // retrieve info corresponding to selected cell from dishes and display in corresponding labels
    self.dishNameLabel.text = [dishes[self.dishIndexNumber] objectForKey:@"dishName"];
    self.recipeContentLabel.text = [dishes[self.dishIndexNumber] objectForKey:@"dishRecipe"];
    //self.dishImageImageView.image = self.dish.dishImage;
    
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

@end
