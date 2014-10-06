//
//  MainView.m
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import "MainView.h"
#import "NPCViewController.h"
#import "DiceViewcontroller.h"

@interface MainView ()

@end

@implementation MainView

@synthesize npcView;
@synthesize diceView;

- (id) init{
    self = [super initWithWindowNibName:@"MainView"];
    
    if (self) {
        
    }
    
    return self;
    
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    currentViewTag = 1;
    
    npcView = [[NPCViewController alloc] init];
    self.window.contentView = npcView.view;
}

- (NSView *) getNewViewforTag: (NSInteger) tag{
    NSView *view;
    
    switch (tag) {
        case 1:
        {
            if (!npcView) {
                npcView = [[NPCViewController alloc] init];
            }
            view = npcView.view;
            return view;
            break;
        }
        case 0:
        {
            if (!diceView) {
                diceView = [[DiceViewcontroller alloc] initWithNibName:@"DiceViewcontroller" bundle:nil];
            }
            view = diceView.view;
            return view;
            break;
        }
    }
    
    return nil;
}

- (BOOL)validateToolbarItem:(NSToolbarItem *)theItem{
    if (theItem.tag == currentViewTag) {
        return NO;
    }else{
        return YES;
    }
}

- (void)presentNewView:(id)sender{
    NSInteger tag = [sender tag];
    NSView *view = [self getNewViewforTag:tag];
    currentViewTag = tag;
    
    self.window.contentView = view;
}

@end
