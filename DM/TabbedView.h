//
//  TabbedView.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 05/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TabbedView : NSViewController<NSApplicationDelegate, NSTextFieldDelegate, NSTableViewDataSource, NSTableViewDelegate>{
    
    __weak IBOutlet NSTextField *txtDice;
    __weak IBOutlet NSTextField *txtMod;
    __weak IBOutlet NSTextField *txtResult;
    
    NSArray *NPC;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)rollDice:(id)sender;
- (IBAction)addMod:(id)sender;
- (IBAction)addNPC:(id)sender;
- (IBAction)removeNPC:(id)sender;

@end
