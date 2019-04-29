//
//  AppDelegate.m
//  LifeCycleApp
//
//  Created by Сулейманов Алексей on 26/04/2019.
//  Copyright © 2019 alex. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  //Config window
  CGRect windowsFrame = [[UIScreen mainScreen] bounds];
  UIWindow *theWindow = [[UIWindow alloc] initWithFrame:windowsFrame];
  viewController = [[ViewController alloc] init];
  [theWindow setUserInteractionEnabled:true];
  [theWindow setRootViewController:viewController];
  [self setWindow:theWindow];
  // Override point for customization after application launch.
  
  NSManagedObjectContext *context = [[self persistentContainer] viewContext];
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Launch"
                                            inManagedObjectContext:context];
  [request setEntity:entity];
  NSArray *result = [context executeFetchRequest:request error:nil];
  NSLog(@"launch %lu", (unsigned long)[result count]);
  
  NSEntityDescription *terminatedEntity = [NSEntityDescription entityForName:@"Terminate"
                                                      inManagedObjectContext:context];
  [request setEntity:terminatedEntity];
  result = [context executeFetchRequest:request error:nil];
  NSLog(@"terminated %lu", (unsigned long)[result count]);
  
  NSEntityDescription *resignActiveEntity = [NSEntityDescription entityForName:@"ResignActive"
                                                      inManagedObjectContext:context];
  [request setEntity:resignActiveEntity];
  result = [context executeFetchRequest:request error:nil];
  NSLog(@"resignActive %lu", (unsigned long)[result count]);
  
  
  NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Launch"
                                                          inManagedObjectContext:context];
  [object setValue:@"App Start!" forKey:@"launch"];
  [self saveContext];
  
  [[viewController launchLabel] setText:@"tettee"];
  
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

  [self insertContext:@"ResignActive" :@"resignActive"];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  [self insertContext:@"EnterBackground" :@"enterBackground"];
  
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
 [self insertContext:@"EnterForeground" :@"enterForeground"];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  
}


- (void)applicationWillTerminate:(UIApplication *)application {
  NSManagedObjectContext *context = [[self persistentContainer] viewContext];
  NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Terminate"
                                                          inManagedObjectContext:context];
  [object setValue:@"App Terminate!" forKey:@"terminate"];
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
  [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"LifeCycleApp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)insertContext:(NSString *)entityName :(NSString *)keyName {
  NSManagedObjectContext *context = [[self persistentContainer] viewContext];
  NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                          inManagedObjectContext:context];
  NSString *objectValue = [NSString stringWithFormat:@"App is %@", keyName];
  NSLog(@"%@",objectValue);
  [object setValue:objectValue forKey:keyName];
  [self saveContext];
}
@end
