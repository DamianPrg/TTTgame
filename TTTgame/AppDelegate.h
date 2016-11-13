//
//  AppDelegate.h
//  TTTgame
//
//  Created by DamianPro on 13.11.2016.
//  Copyright © 2016 Damian Balandowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

