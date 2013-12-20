//
//  Book.h
//  Bibliotech
//
//  Created by Tim Hise on 12/1/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (nonatomic) BOOL shelved; //Yes if book is in a shelf array


@end
