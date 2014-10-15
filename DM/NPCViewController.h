//
//  NPCViewController.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NPCViewController : NSViewController{
    
    
    //New NPC form's fields
    __weak IBOutlet NSTextField *nameTxt;
    __weak IBOutlet NSTextField *ageTxt;
    __weak IBOutlet NSTextField *jobTxt;
    __weak IBOutlet NSTextField *commentsTxt;
    __weak IBOutlet NSPopUpButton *racePopUp;
    
    //Edit NPC form's fields
    __weak IBOutlet NSButton *editBttn;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong) IBOutlet NSWindow *windowInfo;
@property (strong) IBOutlet NSArrayController *npcArrayController;
@property (strong) IBOutlet NSWindow *editWindow;

- (IBAction)addNPC:(id)sender;
- (IBAction)openForm:(id)sender;
- (IBAction)openEditWindow:(id)sender;
- (IBAction)editNPC:(id)sender;
- (IBAction)closeEdit:(id)sender;

- (IBAction)closeWindow:(id)sender;

@end
