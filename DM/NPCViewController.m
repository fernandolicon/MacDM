//
//  NPCViewController.m
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import "NPCViewController.h"
#import "NPC.h"

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

#pragma mark - NPCs

- (IBAction)addNPC:(id)sender {
    NSString *name = nameTxt.stringValue;
    NSString *race = raceTxt.stringValue;
    NSString *job = jobTxt.stringValue;
    int age = (int) ageTxt.stringValue;
    
    if ((age <= 0) || ([ageTxt.stringValue isEqualToString:@""])  || ([name isEqualToString:@""]) || ([race isEqualToString:@""]) || ([job isEqualToString:@""])) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"Ok"];
        [alert setMessageText:@"Datos incorrectos"];
        [alert setInformativeText:@"Por favor llene todos los datos obligatorios."];
        [alert setAlertStyle:NSCriticalAlertStyle];
        [alert beginSheetModalForWindow: windowInfo modalDelegate:self didEndSelector:nil contextInfo:nil];
    }else{
        NPC *newNPC = [NSEntityDescription insertNewObjectForEntityForName:@"NPC" inManagedObjectContext:managedObjectContext];
        newNPC.name = name;
        newNPC.race = race;
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        newNPC.age = [f numberFromString:ageTxt.stringValue];
        newNPC.job = job;
        newNPC.comments = commentsTxt.stringValue;
    
        nameTxt.stringValue = @"";
        raceTxt.stringValue = @"";
        ageTxt.stringValue = @"";
        jobTxt.stringValue = @"";
        commentsTxt.stringValue = @"";
        
        [windowInfo makeFirstResponder:nameTxt];
    }
}

- (IBAction)openForm:(id)sender {
    [windowInfo makeKeyAndOrderFront:windowInfo];
}

- (IBAction)openEditWindow:(id)sender {
}

- (IBAction)editNPC:(id)sender {
    [editWindow makeKeyAndOrderFront:editWindow];
}

- (IBAction)closeEdit:(id)sender {
    [editWindow close];
}

- (IBAction)closeWindow:(id)sender {
    [windowInfo close];
}



@end
