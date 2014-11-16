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

//Image Picker Implementation
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

//show and image once chosen (and prepare to asve it in saveDish method)
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


- (IBAction)saveDish:(UIBarButtonItem *)sender
{
    // create an instance of the NSUserdefaults
    NSUserDefaults *dishesDB = [NSUserDefaults standardUserDefaults];

    // create a Dish dictionnary object and fill it with screen content
    NSDictionary *newDish = @{@"dishName" : self.dishNameTextField.text, @"dishRecipe" : self.dishRecipeTextField.text, @"dishImage" : UIImagePNGRepresentation(self.chosenDishImage)};
    
    // save dish in userDefaults dishesDB dictionnary by first loading the DB in memory, completing it before uploading it again.
    NSMutableArray *newList = [[NSMutableArray alloc] init];
    for (int i = 0; i < ((int)[[dishesDB objectForKey:@"dishes"] count]); i++)
    {
        [newList addObject:[[dishesDB objectForKey:@"dishes"] objectAtIndex:i]];
    }
    [newList addObject:newDish];
    NSArray *immutableNewList = [newList copy];
    [dishesDB setObject:immutableNewList forKey:@"dishes"];
    [dishesDB synchronize];
    NSLog(@"the DB contains %lu elements whose last is %@", (unsigned long)[[dishesDB objectForKey:@"dishes"] count], [[dishesDB objectForKey:@"dishes"] lastObject]);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
