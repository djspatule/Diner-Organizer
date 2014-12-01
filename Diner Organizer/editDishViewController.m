//
//  editDishViewController.m
//  Diner Organizer
//
//  Created by Lion on 11/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import "editDishViewController.h"

@interface editDishViewController ()

@end

@implementation editDishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.record) {
        // Update Text Field
        NSLog(@"editDishViewController's record :%@", self.record);
        [self.dishNameTextField setText:[self.record valueForKey:@"dishName"]];
        [self.dishRecipeTextField setText:[self.record valueForKey:@"dishRecipe"]];
        [self.dishImageView setImage:[UIImage imageWithData:[self.record valueForKey:@"dishImage"]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Image Picker Implementation

//show and image once chosen (and prepare to save it in saveDish method)
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // remember chosen image from picker in the corresponding controller's property
    self.editedDishImage = info[UIImagePickerControllerOriginalImage];
    // set the chosen image as the once shown in this scene's ImageView
    [self.dishImageView setImage:self.editedDishImage];
    //dismiss the imagepicker now that the image is chosen
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)chooseImageButtonPressed:(UIButton *)sender {
    //initialize an image picker
    self.DishImagePicker = [[UIImagePickerController alloc] init];
    // set the delegate
    self.DishImagePicker.delegate = self;
    // set its sourceType property to configure the picker for browsing saved media as opposed to capturing a new picture or movie
    [self.DishImagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //show the image picker now that everything is set up
    [self presentViewController:self.DishImagePicker animated:YES completion:nil];
}

- (IBAction)saveEditedDishButtonPressed:(UIBarButtonItem *)sender {
    // Helpers
    NSString *dishName = self.dishNameTextField.text;
    NSString *dishRecipe = self.dishRecipeTextField.text;
    NSData *dishImage = UIImagePNGRepresentation(self.editedDishImage);
    
    if (dishName && dishName.length) {
        // Update record
        [self.record setValue:dishName forKey:@"dishName"];
        [self.record setValue:dishRecipe forKey:@"dishRecipe"];
        [self.record setValue:dishImage forKey:@"dishImage"];
        
        // Save Record
        NSError *error = nil;
        
        if ([self.managedObjectContext save:&error])
        {
            // Dismiss View Controller
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            if (error)
            {
                NSLog(@"Unable to save record.");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }
            // Show Alert View
            [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your dish could not be saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }
    else
    {
        // Show Alert View
        [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your dish needs a name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
