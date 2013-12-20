//
//  CreateBookVC.m
//  Bibliotech
//
//  Created by Brian Radebaugh on 12/11/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "CreateBookVC.h"

@interface CreateBookVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;
@property (nonatomic, strong, readwrite) Book *addedBook;

@end

@implementation CreateBookVC

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

#define UNWIND_SEGUE_INDENTIFIER @"addedBook"

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:UNWIND_SEGUE_INDENTIFIER]) {
        Book *book = [[Book alloc] init];
        if (book) {
            book.title = self.titleTextField.text;
            book.author = self.authorTextField.text;
            book.shelved = YES;
            
            self.addedBook = book;
        }
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (![self.titleTextField.text length]) {
        [self alert:@"What is the name of your book?"];
        return NO;
    } else if (![self.authorTextField.text length]) {
        [self alert:@"Who wrote this book?"];
        return NO;
    } else {
        return YES;
    }
}

- (void)alert:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:@"Add Book"
                                message:message
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}


@end
