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
    NPC *newNPC = [NSEntityDescription
                                    insertNewObjectForEntityForName:@"NPC"
                                    inManagedObjectContext:managedObjectContext];
    newNPC.name = nameTxt.stringValue;
    newNPC.race = raceTxt.stringValue;
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    newNPC.age = [f numberFromString:ageTxt.stringValue];
    newNPC.comments = [[commentsTxt textStorage] string];
    
}

- (IBAction)openForm:(id)sender {
    [windowInfo makeKeyAndOrderFront:windowInfo];
}

- (IBAction)closeWindow:(id)sender {
    [windowInfo close];
}

@end
