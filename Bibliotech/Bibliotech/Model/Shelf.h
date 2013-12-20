//
//  Shelf.h
//  Bibliotech
//
//  Created by Tim Hise on 12/1/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Shelf : NSObject

@property (strong, nonatomic) NSString *name; //designates the category of shelf
@property (strong, nonatomic) NSMutableArray *books; //array to hold books

- (void)listBooks;  //outputs all books on this shelf to NSLog

// These are shelf methods bc I thought they work well here
- (void)enshelf:(Book *)book;  //will assign book to this shelf if not already shelved

- (void)unshelf:(Book *)book;  //will remove a book from this shelf

@end
