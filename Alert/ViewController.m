//
//  ViewController.m
//  Alert
//
//  Created by Darshan Katrumane on 2/22/15.
//  Copyright (c) 2015 Darshan Katrumane. All rights reserved.
//

#import "ViewController.h"
#import "KMDAlert.h"
@interface ViewController ()
- (IBAction)clickButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {
    KMDAlert *alert = [[KMDAlert alloc] initWithFrame:self.view.frame title:@"Information" message:@"You need to fill up the email correctly." ok:@"OK" cancel:@"Cancel"];
    [alert setAlertTag:1];
    [alert setDelegate:self];
    [self.view addSubview:alert];
}
-(void)clickButtonAtIndex:(NSInteger)index buttonWithTag:(NSInteger)tag {
    NSLog(@"tag %lu index %lu ", tag, index);
}
@end
