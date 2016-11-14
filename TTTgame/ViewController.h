//
//  ViewController.h
//  TTTgame
//
//  Created by DamianPro on 13.11.2016.
//  Copyright © 2016 Damian Balandowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSMutableArray* board;
@property NSString* currentPlayerString;


@property (weak, nonatomic) IBOutlet UIButton *currentPlayerButton;

- (void)updateCurrentPlayerButton;
- (void)placeMarkForCurrentPlayer: (int)atIndex andButton:(UIButton*)button;
- (BOOL)checkWin: (NSString*)forPlayerWithString;
- (void)showWinScreen: (NSString*)forPlayerWithString;
- (void)clearGame;

@end

