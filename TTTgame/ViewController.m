//
//  ViewController.m
//  TTTgame
//
//  Created by DamianPro on 13.11.2016.
//  Copyright © 2016 Damian Balandowski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.currentPlayerString = @"X";
    
    self.board = [[NSMutableArray alloc] initWithObjects:@"N", @"N", @"N",
                  @"N", @"N", @"N",
                  @"N", @"N", @"N", nil];

    [self updateCurrentPlayerButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click0:(id)sender {
    [self placeMarkForCurrentPlayer:0 andButton:self.button0];
}
- (IBAction)click1:(id)sender {
    [self placeMarkForCurrentPlayer:1 andButton:self.button1];
}
- (IBAction)click2:(id)sender {
    [self placeMarkForCurrentPlayer:2 andButton:self.button2];
}
- (IBAction)click3:(id)sender {
    [self placeMarkForCurrentPlayer:3 andButton:self.button3];
}
- (IBAction)click4:(id)sender {
    [self placeMarkForCurrentPlayer:4 andButton:self.button4];
}
- (IBAction)click5:(id)sender {
    [self placeMarkForCurrentPlayer:5 andButton:self.button5];
}
- (IBAction)click6:(id)sender {
    [self placeMarkForCurrentPlayer:6 andButton:self.button6];
}
- (IBAction)click7:(id)sender {
    [self placeMarkForCurrentPlayer:7 andButton:self.button7];
}
- (IBAction)click8:(id)sender {
    [self placeMarkForCurrentPlayer:8 andButton:self.button8];
}
- (IBAction)resetGameClick:(id)sender {
    [self clearGame];
}

- (void)placeMarkForCurrentPlayer: (int)atIndex andButton:(UIButton*)button;
 {
    
    NSString* thisIndexStr = self.board[atIndex];
    
    if([thisIndexStr isEqualToString:@"N"])
    {
        self.board[atIndex] = self.currentPlayerString;
        
        [button setBackgroundImage:[UIImage imageNamed:self.currentPlayerString] forState:UIControlStateNormal];
        
        if([self.currentPlayerString isEqualToString:@"X"])
        {
            self.currentPlayerString = @"O";
        }
        else
        {
            self.currentPlayerString = @"X";
        }
        
        [self updateCurrentPlayerButton];
        
        if([self checkWin:@"X"])
        {
            [self showWinScreen:@"X"];
        }
        if([self checkWin:@"O"])
        {
            [self showWinScreen:@"O"];
        }
    }
     

    
}

- (void)updateCurrentPlayerButton
{
    [self.currentPlayerButton setBackgroundImage:[UIImage imageNamed:self.currentPlayerString] forState:UIControlStateNormal];
}

- (BOOL)checkWin: (NSString*)forPlayerWithString
{
    
    // first row
    if( [self.board[0] isEqualToString:forPlayerWithString] &&
       [self.board[1] isEqualToString:forPlayerWithString] &&
       [self.board[2] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    // second row
    if( [self.board[3] isEqualToString:forPlayerWithString] &&
       [self.board[4] isEqualToString:forPlayerWithString] &&
       [self.board[5] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    // third row
    if( [self.board[6] isEqualToString:forPlayerWithString] &&
       [self.board[7] isEqualToString:forPlayerWithString] &&
       [self.board[8] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    if( [self.board[0] isEqualToString:forPlayerWithString] &&
       [self.board[3] isEqualToString:forPlayerWithString] &&
       [self.board[6] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    if( [self.board[1] isEqualToString:forPlayerWithString] &&
       [self.board[4] isEqualToString:forPlayerWithString] &&
       [self.board[7] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    if( [self.board[2] isEqualToString:forPlayerWithString] &&
       [self.board[5] isEqualToString:forPlayerWithString] &&
       [self.board[8] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    if( [self.board[0] isEqualToString:forPlayerWithString] &&
       [self.board[4] isEqualToString:forPlayerWithString] &&
       [self.board[8] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    if( [self.board[2] isEqualToString:forPlayerWithString] &&
       [self.board[4] isEqualToString:forPlayerWithString] &&
       [self.board[6] isEqualToString:forPlayerWithString])
    {
        return true;
    }
    
    return false;
}

- (void)showWinScreen: (NSString*)forPlayerWithString
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Win!"
                                  message:[NSString stringWithFormat:@"Player %@ wins!", forPlayerWithString]
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self clearGame];
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

-(void)clearGame
{
    // note: I could have added them to NSMutableArray and iterate but whatever xD
    [self.button0 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button1 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button2 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button3 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button4 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button5 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button6 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button7 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    [self.button8 setBackgroundImage:[UIImage imageNamed:@"N"] forState:UIControlStateNormal];
    
    for(int i = 0; i < 9; i++)
    {
        self.board[i] = @"N";
    }

    
    _currentPlayerString = @"O";
    [self updateCurrentPlayerButton];
}

@end
