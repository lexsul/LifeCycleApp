//
//  ViewController.m
//  LifeCycleApp
//
//  Created by Сулейманов Алексей on 26/04/2019.
//  Copyright © 2019 alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize launchLabel;
- (void)viewDidLoad {
  [super viewDidLoad];

  [[self view] setBackgroundColor:[UIColor whiteColor]];
  CGRect launchLabelFrame = CGRectMake(20, 40, 200, 31);
  launchLabel = [[UILabel alloc] initWithFrame: launchLabelFrame];
  //[launchLabel setText:@"start"];
  [[self view] addSubview:launchLabel];
  
  
  // Do any additional setup after loading the view.
}
//@synthesize featchResultController, managedObjectContext;
@end

