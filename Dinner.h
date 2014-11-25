//
//  Dinner.h
//  Diner Organizer
//
//  Created by Lion on 11/25/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Dish, Guest;

@interface Dinner : NSManagedObject

@property (nonatomic, retain) NSDate * dinnerDate;
@property (nonatomic, retain) NSString * dinnerTitle;
@property (nonatomic, retain) NSSet *dinnerToGuest;
@property (nonatomic, retain) NSSet *dinnerToDish;
@end

@interface Dinner (CoreDataGeneratedAccessors)

- (void)addDinnerToGuestObject:(Guest *)value;
- (void)removeDinnerToGuestObject:(Guest *)value;
- (void)addDinnerToGuest:(NSSet *)values;
- (void)removeDinnerToGuest:(NSSet *)values;

- (void)addDinnerToDishObject:(Dish *)value;
- (void)removeDinnerToDishObject:(Dish *)value;
- (void)addDinnerToDish:(NSSet *)values;
- (void)removeDinnerToDish:(NSSet *)values;

@end
