//
//  wtime.m
//
//
//  Created by F T on 06/01/2015.
//  Copyright (c) 2015 FT. All rights reserved.
//

//#import <Foundation/Foundation.h

#import "WTime.h"






@implementation WTime





- (NSString *)getDateStringFromDate
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    NSDate *date = [NSDate date];
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
       
        dateFormatter.dateFormat = @"EEEE dd-MM-YYYY HH:mm:ss";
        // Friday 03-01-2015 11:05:59
        dateFormatter.dateFormat = @" EEEE  dd-MM-YYYY";
         // Friday 03-01-2015
    });
    
    return [dateFormatter stringFromDate:date];
}



@end