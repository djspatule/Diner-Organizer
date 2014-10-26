//
//  NewDishViewController.h
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDishViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *dishNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dishRecipeTextField;

- (IBAction)addDishButtonPressed:(UIBarButtonItem *)sender;


@end
