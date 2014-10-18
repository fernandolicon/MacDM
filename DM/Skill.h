//
//  Skill.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 17/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PC;

@interface Skill : NSManagedObject

@property (nonatomic, retain) NSNumber * bonus;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *pc;
@end

@interface Skill (CoreDataGeneratedAccessors)

- (void)addPcObject:(PC *)value;
- (void)removePcObject:(PC *)value;
- (void)addPc:(NSSet *)values;
- (void)removePc:(NSSet *)values;

@end
