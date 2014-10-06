//
//  AppDelegate.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 04/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSToolbarDelegate>{
    NSArray *NPC;
}

@property (assign) IBOutlet NSWindow *window;

// Added for Core Data
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

