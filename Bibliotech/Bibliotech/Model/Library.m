//
//  Library.m
//  Bibliotech
//
//  Created by Tim Hise on 12/1/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "Library.h"

@interface Library ()

@property (nonatomic, readwrite) NSMutableArray *shelves;

@end



@implementation Library

-(void)listAllBooks
{
    NSLog(@"Book Titles for Library: %@", self.name);
    for (Shelf *shelf in self.shelves) {
        [shelf listBooks];
    }
}

-(NSArray *)allBooks
{
    for (Shelf *shelf in self.shelves) {
        _allBooks = [_allBooks arrayByAddingObjectsFromArray:shelf.books];
    }
    _allBooks = (_allBooks) ? _allBooks : [[NSArray alloc] init];
    return _allBooks;
}

-(NSString *)listShelves
{
    NSString *string = @"";
    for (Shelf *shelf in self.shelves){
        [string stringByAppendingString:shelf.name];
        NSLog(@"%@", shelf.name);
    }
    return string;
}


-(void)addShelfToLibraryWithName:(NSString *)name
{
    Shelf *shelf = [[Shelf alloc] init];
    shelf.name = name;
    [self.shelves addObject:shelf];
}

-(void)createNewBookWithTitle:(NSString *)title byAuthor:(NSString *)author {
    Book *book = [[Book alloc] init];
    book.shelved = NO;
    book.title = title;
    book.author = author;
    
    for (Shelf *shelf in self.shelves) {
        if ([shelf.name isEqualToString:@"Unshelved"]) {
            [shelf enshelf:book];
        }
    }
}

- (NSMutableArray *)shelves
{
    if (!_shelves) {
        _shelves = [[NSMutableArray alloc] init];
        
        // Standard Shelves for all Libraries
        [self addShelfToLibraryWithName:@"Non-Fiction"];
        [self addShelfToLibraryWithName:@"Fiction"];
        [self addShelfToLibraryWithName:@"Children"];
        [self addShelfToLibraryWithName:@"Science Fiction"];
        [self addShelfToLibraryWithName:@"Sports"];
        [self addShelfToLibraryWithName:@"Romance"];
    }
    
    return _shelves;
}

@end
