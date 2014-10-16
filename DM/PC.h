//
//  PC.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 16/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Atributes, Race, Skill, UserClass, Weapon;

@interface PC : NSManagedObject

@property (nonatomic, retain) NSNumber * armorclass;
@property (nonatomic, retain) NSNumber * failsaves;
@property (nonatomic, retain) NSNumber * hitdices;
@property (nonatomic, retain) NSNumber * hitpoints;
@property (nonatomic, retain) NSNumber * intiative;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * perception;
@property (nonatomic, retain) NSString * player;
@property (nonatomic, retain) NSNumber * proficencybonus;
@property (nonatomic, retain) NSNumber * speed;
@property (nonatomic, retain) NSNumber * successsaves;
@property (nonatomic, retain) Atributes *atributes;
@property (nonatomic, retain) Race *race;
@property (nonatomic, retain) NSSet *skills;
@property (nonatomic, retain) UserClass *userclass;
@property (nonatomic, retain) NSSet *weapons;
@end

@interface PC (CoreDataGeneratedAccessors)

- (void)addSkillsObject:(Skill *)value;
- (void)removeSkillsObject:(Skill *)value;
- (void)addSkills:(NSSet *)values;
- (void)removeSkills:(NSSet *)values;

- (void)addWeaponsObject:(Weapon *)value;
- (void)removeWeaponsObject:(Weapon *)value;
- (void)addWeapons:(NSSet *)values;
- (void)removeWeapons:(NSSet *)values;

@end
