//
//  Administration.m
//  Bibliotech
//
//  Created by Tim Hise on 12/18/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "Administration.h"

@implementation Administration

- (void)addLibraryToAdministrationWithName:(NSString *)name
{
    Library *library = [[Library alloc] init];
    library.name = name;
    [self.libraries addObject:library];
}

// gives us a few libraries to work with
- (NSMutableArray *)libraries
{
    if (!_libraries) {
        _libraries = [[NSMutableArray alloc] init];
        
        [self addLibraryToAdministrationWithName:@"Bibliotech"];
        [self addLibraryToAdministrationWithName:@"библиотека"];
        [self addLibraryToAdministrationWithName:@"Knihovna"];
    }
    
    return _libraries;
}


@end
