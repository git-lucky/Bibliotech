//
//  Shelf.m
//  Bibliotech
//
//  Created by Tim Hise on 12/1/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "Shelf.h"

@interface Shelf ()

@end




@implementation Shelf

- (void)listBooks
{
    NSLog(@"Book Titles for Shelf: %@", self.name);
    for (Book *book in self.books) {
        NSLog(@"%@", book.title);
    }
}

- (void)enshelf:(Book *)book
{
    if (book.shelved == NO) {
        [self.books addObject:book];
        book.shelved = YES;
    } else {
        NSLog(@"%@ is already shelved.", book);
    }
}

- (void)unshelf:(Book *)book
{
    if (book.shelved == YES) {
        [self.books removeObject:book];
        book.shelved = NO;
    } else {
        NSLog(@"%@ is already not on a shelf.", book);
    }
}

- (NSMutableArray *)books
{
    if (!_books) {
        _books = [[NSMutableArray alloc] init];
        Book *book;
        
        //  This instantiates our libraries with a few good books
        
        if ([self.name isEqualToString:@"Non-Fiction"]) {
            book = [[Book alloc] init];
            book.title = @"Washington: A Life";
            book.author = @"Ron Chernow";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Outliers";
            book.author = @"Malcolm Gladwell";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"A Short History of Nearly Everything";
            book.author = @"Bill Bryson";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Giants";
            book.author = @"John Stauffer";
            [self enshelf:book];

        }
        
        if ([self.name isEqualToString:@"Fiction"]) {
            book = [[Book alloc] init];
            book.title = @"The Casual Vacancy";
            book.author = @"J. K. Rowling";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"The Hobbit";
            book.author = @"J. R. R. Tolkien";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"1984";
            book.author = @"George Orwell";
            [self enshelf:book];
        }
        
        if ([self.name isEqualToString:@"Children"]) {
            book = [[Book alloc] init];
            book.title = @"The Cat in the Hat";
            book.author = @"Dr. Seuss";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Where the Wild Things Are";
            book.author = @"Maurice Sendak";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Children of the Corn";
            book.author = @"Stephen King";
            [self enshelf:book];
        }
        
        if ([self.name isEqualToString:@"Science Fiction"]) {
            book = [[Book alloc] init];
            book.title = @"Ender's Game";
            book.author = @"Orson Scott Card";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Dune";
            book.author = @"Frank Herbert";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"The Foundation";
            book.author = @"Isaac Asimov";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Stranger in a Strange Land";
            book.author = @"Robert Heinlein";
            [self enshelf:book];

        }
        
        if ([self.name isEqualToString:@"Sports"]) {
            book = [[Book alloc] init];
            book.title = @"The Sweet Science";
            book.author = @"A. J. Liebling";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"The Boys of Summer";
            book.author = @"Roger Kahn";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Friday Night Lights";
            book.author = @"H. G. Bissinger";
            [self enshelf:book];
        }
        
        if ([self.name isEqualToString:@"Romance"]) {
            book = [[Book alloc] init];
            book.title = @"Dark Lover";
            book.author = @"J. R. Ward";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Twilight";
            book.author = @"Stephanie Meyer";
            [self enshelf:book];
            
            book = [[Book alloc] init];
            book.title = @"Pleasure Unbound";
            book.author = @"Larissa Ione";
            [self enshelf:book];
        }


    }
    
    return _books;
}

@end
