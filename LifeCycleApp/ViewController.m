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

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  [[self view] setBackgroundColor:[UIColor whiteColor]];
  CGRect startLabelFrame = CGRectMake(20, 40, 200, 31);
  startLabel = [[UILabel alloc] initWithFrame:startLabelFrame];
  [startLabel setText:@"start"];
  [[self view] addSubview:startLabel];
  
  // Do any additional setup after loading the view.
}
//@synthesize featchResultController, managedObjectContext;
@end

