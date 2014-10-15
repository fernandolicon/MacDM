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
    
    [self.window setBackgroundColor:[NSColor whiteColor]];
    
    currentViewTag = 1;
    
    npcView = [[NPCViewController alloc] init];
    [self.window setContentSize:npcView.view.frame.size];
    self.window.contentView = npcView.view;
    
    [[[self window] contentView] setWantsLayer:YES];
}

#pragma mark - Set new frames

- (NSRect) newFrameForNewContentView: (NSView *) view{
    NSWindow *window = self.window;
    NSRect newFrameRect = [window frameRectForContentRect:view.frame];
    NSRect oldFrameRect = window.frame;
    NSSize newSize = newFrameRect.size;
    NSSize oldSize = oldFrameRect.size;
    
    NSRect frame = [window frame];
    frame.size = newSize;
    frame.origin.y -= (newSize.height - oldSize.height);
    
    return frame;
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
    NSView *previousView = [self getNewViewforTag:currentViewTag];
    currentViewTag = tag;
    
    NSRect newFrame = [self newFrameForNewContentView:view];
    
    [NSAnimationContext beginGrouping];
    
    if ([[NSApp currentEvent] modifierFlags] & NSShiftKeyMask) {
        [[NSAnimationContext currentContext] setDuration:1.0];
    }
    
        [[self.window.contentView animator] replaceSubview:previousView with:view];
        [[self.window animator] setFrame:newFrame display:YES];
        self.window.contentView = view;
    
        [NSAnimationContext endGrouping];
    
}

@end
