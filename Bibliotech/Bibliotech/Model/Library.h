//
//  Library.h
//  Bibliotech
//
//  Created by Tim Hise on 12/1/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shelf.h"

@interface Library : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, readonly) NSMutableArray *shelves;
@property (nonatomic, strong) NSArray *allBooks;

-(void)listAllBooks;  //reports all books in the library in NSLog

-(NSString *)listShelves;  //returns a string containing all shelf names in this library and outputs to the log

-(void)addShelfToLibraryWithName:(NSString *)name; 

-(void)createNewBookWithTitle:(NSString *)title byAuthor:(NSString *)author;


@end
