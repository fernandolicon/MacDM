//
//  NPCViewController.m
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import "NPCViewController.h"

@interface NPCViewController ()

@end

@implementation NPCViewController

@synthesize windowInfo;

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
    [windowInfo makeKeyAndOrderFront:windowInfo];
}

- (IBAction)removeNPC:(id)sender {
}

- (IBAction)closeWindow:(id)sender {
    [windowInfo close];
}

@end
