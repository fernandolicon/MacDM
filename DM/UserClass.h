//
//  UserClass.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 16/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserClass : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *pcs;
@end

@interface UserClass (CoreDataGeneratedAccessors)

- (void)addPcsObject:(NSManagedObject *)value;
- (void)removePcsObject:(NSManagedObject *)value;
- (void)addPcs:(NSSet *)values;
- (void)removePcs:(NSSet *)values;

@end
