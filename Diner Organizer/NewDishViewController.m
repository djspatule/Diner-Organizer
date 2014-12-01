//
//  NewDishViewController.m
//  Diner Organizer
//
//  Created by Lion on 10/26/14.
//  Copyright (c) 2014 djspatule. All rights reserved.
//

#import "NewDishViewController.h"

@interface NewDishViewController ()

@end

@implementation NewDishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Image Picker Implementation

//show and image once chosen (and prepare to save it in saveDish method)
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // remember chosen image from picker in the corresponding controller's property
    self.chosenDishImage = info[UIImagePickerControllerOriginalImage];
    // set the chosen image as the once shown in this scene's ImageView
    [self.NewDishImageView setImage:self.chosenDishImage];
    //dismiss the imagepicker now that the image is chosen
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)saveDish:(UIBarButtonItem *)sender
{
    // Helpers
    NSString *dishName = self.dishNameTextField.text;
    NSString *dishRecipe = self.dishRecipeTextField.text;
    NSData *dishImage = UIImagePNGRepresentation(self.chosenDishImage);
    
    if (dishName && dishName.length) {
        // Create Entity
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:self.managedObjectContext];
        
        // Initialize Record
        NSManagedObject *record = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        // Populate Record
        [record setValue:dishName forKey:@"dishName"];
        [record setValue:dishRecipe forKey:@"dishRecipe"];
        [record setValue:dishImage forKey:@"dishImage"];

        
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

- (IBAction)chooseDishImage:(UIButton *)sender
{
    //initialize an image picker
    self.DishImagePicker = [[UIImagePickerController alloc] init];
    // set the delegate
    self.DishImagePicker.delegate = self;
    // set its sourceType property to configure the picker for browsing saved media as opposed to capturing a new picture or movie
    [self.DishImagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //show the image picker now that everything is set up
    [self presentViewController:self.DishImagePicker animated:YES completion:nil];
}

- (IBAction)dishNameTyped:(id)sender
{
    [sender resignFirstResponder];
}

@end
