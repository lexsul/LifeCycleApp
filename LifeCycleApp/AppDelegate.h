//
//  AppDelegate.h
//  LifeCycleApp
//
//  Created by Сулейманов Алексей on 26/04/2019.
//  Copyright © 2019 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
