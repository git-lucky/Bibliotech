//
//  Administration.h
//  Bibliotech
//
//  Created by Tim Hise on 12/18/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Library.h"

@interface Administration : NSObject

@property (strong, nonatomic) NSMutableArray *libraries;

- (void)addLibraryToAdministrationWithName:(NSString *)name;

@end