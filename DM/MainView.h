//
//  MainView.h
//  DM
//
//  Created by Luis Fernando Mata Licón on 06/10/14.
//  Copyright (c) 2014 Luis Fernando Mata. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class NPCViewController;
@class DiceViewcontroller;
@class PCViewController;

@interface MainView : NSWindowController<NSToolbarDelegate>{
    NSInteger currentViewTag;
}

@property (strong, nonatomic) NPCViewController *npcView;
@property (strong, nonatomic) DiceViewcontroller *diceView;
@property (strong, nonatomic) PCViewController *pcView;

- (IBAction)presentNewView:(id)sender;

@end
