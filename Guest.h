//
//  Guest.h
//  Diner Organizer
//
//  Created by Lion on 11/25/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Dinner;

@interface Guest : NSManagedObject

@property (nonatomic, retain) NSString * guestDislikes;
@property (nonatomic, retain) NSString * guestFirst;
@property (nonatomic, retain) NSData * guestImage;
@property (nonatomic, retain) NSString * guestLast;
@property (nonatomic, retain) NSString * guestLikes;
@property (nonatomic, retain) NSSet *guestToDinner;
@end

@interface Guest (CoreDataGeneratedAccessors)

- (void)addGuestToDinnerObject:(Dinner *)value;
- (void)removeGuestToDinnerObject:(Dinner *)value;
- (void)addGuestToDinner:(NSSet *)values;
- (void)removeGuestToDinner:(NSSet *)values;

@end
