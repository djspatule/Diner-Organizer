//
//  dishViewViewController.h
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"

@interface dishViewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *recipeContentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dishImageImageView;

@property (strong, nonatomic) Dish *dish;
@end
