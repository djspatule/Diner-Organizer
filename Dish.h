//
//  Dish.h
//  Diner Organizer
//
//  Created by Lion on 11/25/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Dinner;

@interface Dish : NSManagedObject

@property (nonatomic, retain) NSString * dishName;
@property (nonatomic, retain) NSString * dishRecipe;
@property (nonatomic, retain) NSData * dishImage;
@property (nonatomic, retain) NSSet *dishToDinner;
@end

@interface Dish (CoreDataGeneratedAccessors)

- (void)addDishToDinnerObject:(Dinner *)value;
- (void)removeDishToDinnerObject:(Dinner *)value;
- (void)addDishToDinner:(NSSet *)values;
- (void)removeDishToDinner:(NSSet *)values;

@end
