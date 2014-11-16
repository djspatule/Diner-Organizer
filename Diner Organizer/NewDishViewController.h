//
//  NewDishViewController.h
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDishViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dishNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dishRecipeTextField;
@property (weak, nonatomic) IBOutlet UIImageView *NewDishImageView;
@property (strong, nonatomic) UIImage *chosenDishImage;
@property (strong, nonatomic) UIImagePickerController * DishImagePicker;

- (IBAction)saveDish:(UIBarButtonItem *)sender;


@end
