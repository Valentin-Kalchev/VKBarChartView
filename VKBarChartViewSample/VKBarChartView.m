//
//  VKBarChartView.m
//  iSaveScore
//
//  Created by Valentin Kalchev on 03/11/2014.
//  Copyright (c) 2014 ValentinKalchev. All rights reserved.
//

#import "VKBarChartView.h"

@implementation VKBarChartView
{
    NSArray *barsColors;
    NSArray *barsViews;
    NSArray *barsPercentageViews;
    NSArray *barsPercentageConstraints;
    NSArray *barsTitles;
    
    IBOutlet UIView *view;
    
    IBOutlet UILabel *view1Text;
    IBOutlet UILabel *view2Text;
    IBOutlet UILabel *view3Text;
    IBOutlet UILabel *view4Text;
    IBOutlet UILabel *view5Text;
    IBOutlet UILabel *view6Text;
    IBOutlet UILabel *view7Text;
    IBOutlet UILabel *view8Text;
    
    IBOutlet UIView *view1;
    IBOutlet UIView *view2;
    IBOutlet UIView *view3;
    IBOutlet UIView *view4;
    IBOutlet UIView *view5;
    IBOutlet UIView *view6;
    IBOutlet UIView *view7;
    IBOutlet UIView *view8;
    
    IBOutlet UIView *percentageView1;
    IBOutlet UIView *percentageView2;
    IBOutlet UIView *percentageView3;
    IBOutlet UIView *percentageView4;
    IBOutlet UIView *percentageView5;
    IBOutlet UIView *percentageView6;
    IBOutlet UIView *percentageView7;
    IBOutlet UIView *percentageView8;
    
    IBOutlet NSLayoutConstraint *percentageView1TopConstraint;
    IBOutlet NSLayoutConstraint *percentageView2TopConstraint;
    IBOutlet NSLayoutConstraint *percentageView3TopConstraint;
    IBOutlet NSLayoutConstraint *percentageView4TopConstraint;
    IBOutlet NSLayoutConstraint *percentageView5TopConstraint;
    IBOutlet NSLayoutConstraint *percentageView6TopConstraint;
    IBOutlet NSLayoutConstraint *percentageView7TopConstraint;
    IBOutlet NSLayoutConstraint *percentageView8TopConstraint;
}

#pragma mark - Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        [[NSBundle mainBundle] loadNibNamed:@"VKBarChartView" owner:self options:nil];
        view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:view];
    }
    return self;
}

- (void)awakeFromNib {
    
    barsViews = [[NSArray alloc] initWithObjects: view1, view2, view3, view4, view5, view6, view7, view8, nil];
    
    barsPercentageViews = [[NSArray alloc] initWithObjects: percentageView1, percentageView2, percentageView3, percentageView4, percentageView5, percentageView6, percentageView7, percentageView8, nil];
    
    barsPercentageConstraints = [[NSArray alloc] initWithObjects:percentageView1TopConstraint, percentageView2TopConstraint, percentageView3TopConstraint, percentageView4TopConstraint, percentageView5TopConstraint, percentageView6TopConstraint, percentageView7TopConstraint, percentageView8TopConstraint, nil];
    
    barsTitles = [[NSArray alloc] initWithObjects:view1Text, view2Text, view3Text, view4Text, view5Text, view6Text, view7Text, view8Text, nil];
}

#pragma mark - Public

- (void)createBarsWithTitles:(NSArray *)titles withBarsColors:(NSArray *)colors withBarsValues:(NSArray *)values {
    
    if (titles.count != values.count) {
        NSLog(@"Warning: Number of bar titles should be equal to number of bar values passed");
        return;
    }
    
    // Views need to be updated from unallocated bars onwards e.g. | | | |X|X|X|X|X|
    int currentBar = 0;
    
    int highestValue = [[values valueForKeyPath:@"@max.intValue"] intValue];
    
    for (int i = 0; i < barsViews.count; i++) {
        
        UIView *barBackgroundView = barsViews[i];
        
        if (i >= (barsViews.count - titles.count)) {
            
            // Get percentage view for current bar
            UIView *barPercentageView = barsPercentageViews[i];
            
            // Get color for current bar
            UIColor *barColor = colors != nil ? colors[currentBar] : barPercentageView.backgroundColor;
            
            // Change bar's background color
            barPercentageView.backgroundColor = barColor;
            
            double barScore = [values[currentBar] doubleValue];
            
            // Get constraint for bar's percentage view
            NSLayoutConstraint *barTopConstraint = barsPercentageConstraints[i];
            
            const CGFloat *components = CGColorGetComponents(barColor.CGColor);
            barBackgroundView.backgroundColor = [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:0.5f];
            barBackgroundView.hidden = NO;
            
            // Assign bar initial to bar label
            UILabel *barInitialLabel = barsTitles[i];
            barInitialLabel.text = titles[currentBar];
            
            barTopConstraint.constant = barBackgroundView.frame.size.height;
            [barBackgroundView layoutIfNeeded];
            
            // Animate bar percentage view using top constraint
            [UIView animateWithDuration:2.0f animations:^{
                barTopConstraint.constant = (1 - barScore / highestValue) * barBackgroundView.frame.size.height;
                [barBackgroundView layoutIfNeeded];
            }];
            
            currentBar ++;
            
        } else {
            barBackgroundView.hidden = YES;
        }
    }
}

@end
