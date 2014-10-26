//
//  Dish.m
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import "Dish.h"

@implementation Dish

+(NSMutableArray *)dishes {
    
    /* Test dictionnary of dishes*/
    Dish *dish1 = [[Dish alloc] init];
    dish1.dishName = @"Pizza";
    dish1.dishRecipe =  @"pizza with salami topping. Recipe can be found on the internet on La Cuisine de Bernard's blog bal bal balba balbalbalba lablbablbl ablb alblbblaa bllblablal balblblalbl alb albab ablba lab ab ablablba lab ablab lablablb blablb  balbalbalablablabl blablabl bal ablb";
    dish1.dishImage = [UIImage imageNamed:@"pizza.jpg"];
    
    Dish *dish2 = [[Dish alloc] init];
    dish2.dishName = @"Tiramisu";
    dish2.dishRecipe =  @"classic tiramisu from Italy";
    dish2.dishImage = [UIImage imageNamed:@"tiramisu.jpg"];
    

    /* put dishes in a mutable array */
    NSMutableArray *dishesArray = [[NSMutableArray alloc]init];
    dishesArray = [NSMutableArray arrayWithObjects:dish1, dish2, nil];
    
    /* Return an NSArray of Dish objects from this class method */
    return dishesArray;

}


@end
