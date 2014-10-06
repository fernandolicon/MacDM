//
//  DiceViewcontroller.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DiceViewcontroller : NSViewController{
    __weak IBOutlet NSTextField *txtDice;
    __weak IBOutlet NSTextField *txtMod;
    __weak IBOutlet NSTextField *txtResult;
}

- (IBAction)rollDice:(id)sender;
- (IBAction)addMod:(id)sender;

@end
