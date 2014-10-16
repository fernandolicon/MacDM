//
//  Atributes.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 16/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Atributes : NSManagedObject

@property (nonatomic, retain) NSNumber * charisma;
@property (nonatomic, retain) NSNumber * constitution;
@property (nonatomic, retain) NSNumber * dexterity;
@property (nonatomic, retain) NSNumber * inteligence;
@property (nonatomic, retain) NSNumber * strength;
@property (nonatomic, retain) NSNumber * wisdon;
@property (nonatomic, retain) NSManagedObject *pc;

@end
