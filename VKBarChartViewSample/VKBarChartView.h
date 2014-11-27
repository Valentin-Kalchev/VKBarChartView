//
//  VKBarChartView.h
//  iSaveScore
//
//  Created by Valentin Kalchev on 03/11/2014.
//  Copyright (c) 2014 ValentinKalchev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKBarChartView : UIView

/**
 @discussion
 Use create bars with text to customise your bar chart (supports up to 8 bars).
 @param text
 Array of strings for each of the bars. Determines how many of the bars will be shown.
 @param bar colors
 Pass 'nil' if you want to use the colors from your xib file, otherwise pass your own colors as a NSArray
 @param values
 Array of values for each bar starting from left to right. Highest value will fill the bar. The rest of the bars will be a % filled from the highest value bar. 
 */
- (void)createBarsWithTitles:(NSArray *)titles withBarsColors:(NSArray *)colors withBarsValues:(NSArray *)values;

@end
