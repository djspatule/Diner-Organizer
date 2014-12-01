//
//  editDishViewController.h
//  Diner Organizer
//
//  Created by Lion on 11/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface editDishViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObject *record;

@property (weak, nonatomic) IBOutlet UITextField *dishNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dishRecipeTextField;
@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;
@property (strong, nonatomic) UIImage *editedDishImage;
@property (strong, nonatomic) UIImagePickerController * DishImagePicker;

- (IBAction)chooseImageButtonPressed:(UIButton *)sender;
- (IBAction)saveEditedDishButtonPressed:(UIBarButtonItem *)sender;

@end
