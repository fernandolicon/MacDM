//
//  AppDelegate.m
//  DM
//
//  Created by Luis Fernando Mata Licón on 04/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)rollDice:(id)sender {
    NSButton *selected = sender;
    NSString *buttontTitle = selected.title;
    NSArray* items = [buttontTitle componentsSeparatedByString:@"d"];
    NSInteger value = [[items objectAtIndex:1] integerValue];
    int intValue = (int)value;
    
    value = arc4random_uniform(intValue) + 1;
    NSString *diceRoll = [NSString stringWithFormat:@"%li", (long)value];
    
    [txtDice setStringValue:diceRoll];
    
}

- (void)textDidEndEditing:(NSNotification *)aNotification{
    [self addModifier];
}

- (IBAction)addMod:(id)sender {
    if ([txtDice intValue] || [txtMod intValue]) {
        int result = [txtDice intValue] + [txtMod intValue];
        
        NSString *value = [NSString stringWithFormat:@"%i", result];
        [txtResult setStringValue:value];
    }
}

- (void)addModifier{
    if ([txtDice intValue] || [txtMod intValue]) {
        int result = [txtDice intValue] + [txtMod intValue];
        
        NSString *value = [NSString stringWithFormat:@"%i", result];
        [txtResult setStringValue:value];
    }
}

@end
