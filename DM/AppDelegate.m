//
//  AppDelegate.m
//  DM
//
//  Created by Luis Fernando Mata Licón on 04/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"
#import "NPCViewController.h"
#import "PCViewController.h"

@interface AppDelegate ()

@property (nonatomic,strong) IBOutlet MainView *mainViewController;
@end

@implementation AppDelegate
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // 1. Create the master View Controller
    self.mainViewController = [[MainView alloc] init];
    
    // 2. Add the view controller to the Window's content view
    [self.mainViewController showWindow:nil];
    
    
    self.mainViewController.npcView.managedObjectContext = self.managedObjectContext;
    self.mainViewController.pcView.managedObjectContext = self.managedObjectContext;
    
    
    [self prePopulate];
}



- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag{
    [self.mainViewController showWindow:nil];
    return YES;
}


#pragma mark - Core Data stack

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "LFML.CoreDataExample" in the user's Application Support directory.
    NSURL *appSupportURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    return [appSupportURL URLByAppendingPathComponent:@"DungeonMaster"];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DM" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.)
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationDocumentsDirectory = [self applicationDocumentsDirectory];
    BOOL shouldFail = NO;
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    
    // Make sure the application files directory is there
    NSDictionary *properties = [applicationDocumentsDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    if (properties) {
        if (![properties[NSURLIsDirectoryKey] boolValue]) {
            failureReason = [NSString stringWithFormat:@"Expected a folder to store application data, found a file (%@).", [applicationDocumentsDirectory path]];
            shouldFail = YES;
        }
    } else if ([error code] == NSFileReadNoSuchFileError) {
        error = nil;
        [fileManager createDirectoryAtPath:[applicationDocumentsDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if (!shouldFail && !error) {
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        NSURL *url = [applicationDocumentsDirectory URLByAppendingPathComponent:@"DungeonMaster.storedata"];
        if (![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error]) {
            coordinator = nil;
        }
        _persistentStoreCoordinator = coordinator;
    }
    
    if (shouldFail || error) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        if (error) {
            dict[NSUnderlyingErrorKey] = error;
        }
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return _managedObjectContext;
}

#pragma mark - Core Data Saving and Undo support

- (IBAction)saveAction:(id)sender {
    // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    NSError *error = nil;
    if ([[self managedObjectContext] hasChanges] && ![[self managedObjectContext] save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window {
    // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
    return [[self managedObjectContext] undoManager];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    // Save changes in the application's managed object context before the application terminates.
    
    if (!_managedObjectContext) {
        return NSTerminateNow;
    }
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if (![[self managedObjectContext] hasChanges]) {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    if (![[self managedObjectContext] save:&error]) {
        
        // Customize this code block to include application-specific recovery steps.
        BOOL result = [sender presentError:error];
        if (result) {
            return NSTerminateCancel;
        }
        
        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];
        
        NSInteger answer = [alert runModal];
        
        if (answer == NSAlertFirstButtonReturn) {
            return NSTerminateCancel;
        }
    }
    
    return NSTerminateNow;
}

#pragma mark - Toolbar
- (BOOL)validateToolbarItem:(NSToolbarItem *)theItem{
    return YES;
}

#pragma mark - PrePopulate

-(void)prePopulate {
    
    //First we need to check if there's data of Races
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entitiy = [NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity: entitiy];
    
    NSError *error = nil;
    NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    

    if (array.count == 0) {
        NSManagedObject *human = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [human setValue:@"Humano" forKey:@"name"];
        
        NSManagedObject *elf = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [elf setValue:@"Elfo" forKey:@"name"];
        
        NSManagedObject *dwarf = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [dwarf setValue:@"Enano" forKey:@"name"];
        
        NSManagedObject *halfling = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [halfling setValue:@"Mediano" forKey:@"name"];
        
        NSManagedObject *halfElf = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [halfElf setValue:@"Mitad Elfo" forKey:@"name"];
        
        NSManagedObject *halfOrc = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [halfOrc setValue:@"Mitad Orco" forKey:@"name"];
        
        NSManagedObject *tiefling = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [tiefling setValue:@"Tiefling" forKey:@"name"];
        
        NSManagedObject *dragonBorn = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [dragonBorn setValue:@"Dragonborn" forKey:@"name"];
        
        NSManagedObject *gnome = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Race" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
        [gnome setValue:@"Gnomo" forKey:@"name"];
        
        [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:@"dm_FirstRun"];
    }
}

@end
