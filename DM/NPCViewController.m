//
//  NPCViewController.m
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import "NPCViewController.h"
#import "NPC.h"
#import "Race.h"

@interface NPCViewController ()

@end

@implementation NPCViewController

@synthesize windowInfo;
@synthesize editWindow;
@synthesize managedObjectContext;

- (id)init
{
    self = [super initWithNibName:@"NPCViewController" bundle:nil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -  Create NPCs

- (IBAction)addNPC:(id)sender {
    NSString *name = nameTxt.stringValue;
    NSString *job = jobTxt.stringValue;
    int age = (int) ageTxt.stringValue;
    
    if ((age <= 0) || ([ageTxt.stringValue isEqualToString:@""])  || ([name isEqualToString:@""]) || ([job isEqualToString:@""])) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"Ok"];
        [alert setMessageText:@"Datos incorrectos"];
        [alert setInformativeText:@"Por favor llene todos los datos obligatorios."];
        [alert setAlertStyle:NSCriticalAlertStyle];
        [alert beginSheetModalForWindow: windowInfo modalDelegate:self didEndSelector:nil contextInfo:nil];
    }else{
        NPC *newNPC = [NSEntityDescription insertNewObjectForEntityForName:@"NPC" inManagedObjectContext:managedObjectContext];
        newNPC.name = name;
        //newNPC.race = race;
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        newNPC.age = [f numberFromString:ageTxt.stringValue];
        newNPC.job = job;
        newNPC.comments = commentsTxt.stringValue;
        
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entitiy = [NSEntityDescription entityForName:@"Race" inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity: entitiy];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name = %@)", racePopUp.titleOfSelectedItem];
        
        [fetchRequest setPredicate:predicate];
        
        NSError *error = nil;
        NSArray *array = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        Race *selectedRace = [array objectAtIndex:0];
        
        
        newNPC.race = selectedRace;
        
        nameTxt.stringValue = @"";
        ageTxt.stringValue = @"";
        jobTxt.stringValue = @"";
        commentsTxt.stringValue = @"";
        
        [windowInfo makeFirstResponder:nameTxt];
    }
}

- (IBAction)openForm:(id)sender {
    [windowInfo setBackgroundColor:[NSColor whiteColor]];
    [windowInfo makeKeyAndOrderFront:windowInfo];
}

- (IBAction)closeWindow:(id)sender {
    [windowInfo close];
}

#pragma mark - Edit NPC

- (IBAction)openEditWindow:(id)sender {
    [editWindow setBackgroundColor:[NSColor whiteColor]];
    [editWindow makeKeyAndOrderFront:editWindow];
}

- (IBAction)editNPC:(id)sender {
    [editWindow makeFirstResponder:editBttn];
    [editWindow close];
}

- (IBAction)closeEdit:(id)sender {
    [editWindow close];
}

@end
