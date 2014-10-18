//
//  UserClass.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 17/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PC;

@interface UserClass : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *pcs;
@end

@interface UserClass (CoreDataGeneratedAccessors)

- (void)addPcsObject:(PC *)value;
- (void)removePcsObject:(PC *)value;
- (void)addPcs:(NSSet *)values;
- (void)removePcs:(NSSet *)values;

@end
