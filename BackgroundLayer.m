//
//  BackgroundLayer.m
//  ipicgroup
//
//  Created by bappy on 4/2/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer
+ (CAGradientLayer*) greyGradient {
    UIColor *colorOne = [UIColor colorWithWhite:0.9 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.85 alpha:1.0];
    UIColor *colorThree     = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.7 alpha:1.0];
    UIColor *colorFour = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.4 alpha:1.0];
    
    NSArray *colors =  [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, colorFour.CGColor, nil];
    
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:0.02];
    NSNumber *stopThree     = [NSNumber numberWithFloat:0.99];
    NSNumber *stopFour = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, stopThree, stopFour, nil];
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}

//Blue gradient background
+ (CAGradientLayer*) blueGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(120/255.0) green:(135/255.0) blue:(150/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(57/255.0)  green:(79/255.0)  blue:(96/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}
+ (CAGradientLayer*) greenGradient {
    
    
    UIColor *colorOne = [UIColor colorWithRed:(43/255.0) green:(146/255.0) blue:(54/255.0) alpha:1.0];
    //UIColor *colorTwo = [UIColor colorWithRed:(199/255.0)  green:(52/255.0)  blue:(52/255.0)  alpha:1.0];
    UIColor *colorThree = [UIColor colorWithRed:(136/255.0)  green:(186/255.0)  blue:(29/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor,  colorThree.CGColor,nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    
    NSNumber *stopThree = [NSNumber numberWithFloat:1];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopThree,nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.startPoint = CGPointMake(0.0, 0.5);
    headerLayer.endPoint = CGPointMake(1.0, 0.5);
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;

}

+(CAGradientLayer*) clubGradient {
    
    
    UIColor *colorOne = [UIColor colorWithRed:(27/255.0) green:(106/255.0) blue:(49/255.0) alpha:.8];
    UIColor *colorTwo = [UIColor colorWithRed:(22/255.0)  green:(100/255.0)  blue:(42/255.0)  alpha:1.0];
    UIColor *colorThree = [UIColor colorWithRed:(15/255.0)  green:(78/255.0)  blue:(33/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor,  colorTwo.CGColor, colorThree.CGColor,nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:.8];
    NSNumber *stopThree = [NSNumber numberWithFloat:1];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne,stopTwo,stopThree,nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.startPoint = CGPointMake(0.0, 0.5);
    headerLayer.endPoint = CGPointMake(1.0, 0.5);
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}
@end
