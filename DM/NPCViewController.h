//
//  NPCViewController.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NPCViewController : NSViewController{
    
    __weak IBOutlet NSTextField *nameTxt;
    __weak IBOutlet NSTextField *raceTxt;
    __weak IBOutlet NSTextField *ageTxt;
    __weak IBOutlet NSTextField *jobTxt;
    __unsafe_unretained IBOutlet NSTextView *commentsTxt;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong) IBOutlet NSWindow *windowInfo;
@property (strong) IBOutlet NSArrayController *npcArrayController;

- (IBAction)addNPC:(id)sender;
- (IBAction)openForm:(id)sender;

- (IBAction)closeWindow:(id)sender;

@end
