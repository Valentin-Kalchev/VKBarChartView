VKBarChartView
==============

Drag &amp; drop custom UIView bar chart with animating bars.

<p align="center"><img src="https://github.com/Valentin-Kalchev/VKBarChartView/blob/master/VKBarChartView.gif"/></p>

# How it works 

1. Create UIView in your storyboard/xib
2. Change Class to VKBarChartView
3. Create IBOutlet 
4. Pass bar titles, colors(optional) and values to the the VKBarChartView using the 

```objc

- (void)createBarsWithTitles:(NSArray *)titles withBarsColors:(NSArray *)colors withBarsValues:(NSArray *)values;
```