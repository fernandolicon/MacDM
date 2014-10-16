//
//  NPC.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 16/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Race;

@interface NPC : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSString * job;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Race *race;

@end
