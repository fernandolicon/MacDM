//
//  Race.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 16/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NPC;

@interface Race : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *npcs;
@property (nonatomic, retain) NSSet *pcs;
@end

@interface Race (CoreDataGeneratedAccessors)

- (void)addNpcsObject:(NPC *)value;
- (void)removeNpcsObject:(NPC *)value;
- (void)addNpcs:(NSSet *)values;
- (void)removeNpcs:(NSSet *)values;

- (void)addPcsObject:(NSManagedObject *)value;
- (void)removePcsObject:(NSManagedObject *)value;
- (void)addPcs:(NSSet *)values;
- (void)removePcs:(NSSet *)values;

@end
