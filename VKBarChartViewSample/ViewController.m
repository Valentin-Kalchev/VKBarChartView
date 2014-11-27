//
//  ViewController.m
//  VKBarChartViewSample
//
//  Created by Valentin Kalchev on 26/11/2014.
//  Copyright (c) 2014 Valentin Kalchev. All rights reserved.
//

#import "ViewController.h"
#import "VKBarChartView.h"
#import "UIColor+ExtraColours.h"

@interface ViewController ()
{
    IBOutlet VKBarChartView *vkBarChartView;
}
@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSArray *titlesArray = @[@"Bar1", @"Bar2", @"Bar3", @"Bar4", @"Bar5", @"Bar6", @"Bar7", @"Bar8"];
    
    NSArray *colorsArray = @[[UIColor player1Color], [UIColor player2Color], [UIColor player3Color], [UIColor player4Color], [UIColor player5Color], [UIColor player6Color], [UIColor player7Color], [UIColor player8Color]];
    
    NSArray *valuesArray = @[@22, @11, @33, @66, @55, @44, @77, @5];
    
    [vkBarChartView createBarsWithTitles:titlesArray withBarsColors:colorsArray withBarsValues:valuesArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
