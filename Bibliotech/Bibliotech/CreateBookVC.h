//
//  CreateBookVC.h
//  Bibliotech
//
//  Created by Brian Radebaugh on 12/11/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@interface CreateBookVC : UIViewController
//
//@property (nonatomic, strong) NSString *bookTitle;
//@property (nonatomic, strong) NSString *bookAuthor;
@property (nonatomic, strong, readonly) Book *addedBook; //for segue

@end
