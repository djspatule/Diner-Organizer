//
//  Dish.h
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

@interface Dish : NSObject

@property (strong, nonatomic) NSString *dishName;
@property (strong, nonatomic) NSString *dishRecipe;
@property (strong, nonatomic) UIImage *dishImage;


/* A class method named users that returns an NSArray */
+(NSMutableArray *)dishes;


@end
