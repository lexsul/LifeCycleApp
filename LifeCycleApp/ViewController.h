//
//  ViewController.h
//  LifeCycleApp
//
//  Created by Сулейманов Алексей on 26/04/2019.
//  Copyright © 2019 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController
{
  UILabel *launchLabel;
  UILabel *StopLabel;
  UILabel *foregroundActive;
  UILabel *background;
  UILabel *suspended;
}
@property UILabel *launchLabel;
//@property (nonatomic, strong) NSFetchedResultsController *featchResultController;
//@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

