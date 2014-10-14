//
//  Race.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 14/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NPC;

@interface Race : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NPC *npcs;

@end
