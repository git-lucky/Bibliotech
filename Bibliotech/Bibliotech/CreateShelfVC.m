//
//  CreateShelfVC.m
//  Bibliotech
//
//  Created by Brian Radebaugh on 12/11/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "CreateShelfVC.h"


@interface CreateShelfVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong, readwrite) Shelf *addedShelf;

@end

@implementation CreateShelfVC

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)cancelButton {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#define UNWIND_SEGUE_INDENTIFIER @"addedShelf"

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:UNWIND_SEGUE_INDENTIFIER]) {
        Shelf *shelf = [[Shelf alloc] init];
        if (shelf) {
            shelf.name = self.nameTextField.text;
            self.addedShelf = shelf;
        }
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (![self.nameTextField.text length]) {
        [self alert:@"Please name your shelf."];
        return NO;
    } else {
        return YES;
    }
}

- (void)alert:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:@"Add Shelf"
                                     message:message
                                    delegate:nil
                           cancelButtonTitle:nil
                     otherButtonTitles:@"OK", nil] show];
}

@end
