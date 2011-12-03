//
//  CustomCellBackground.m
//  PimpCocktails
//
//  Created by Dan on 18/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"
@implementation CustomCellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    
    CGColorRef grayColor = [UIColor grayColor].CGColor;
    
    CGColorRef custom = [UIColor colorWithRed:208.0/255 green:208.0/255 blue:208.0/255 alpha:1].CGColor;
        
    CGRect paperRect = self.bounds;
    
    drawLinearGradient(context, paperRect, whiteColor, grayColor);
    
    CGRect strokeRect = paperRect;

    strokeRect.size.height -=1;
    
    strokeRect = rectFor1PxStroke(strokeRect);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    
    CGContextSetLineWidth(context, 1);
    
    CGContextStrokeRect(context, strokeRect);
    
    CGPoint startPoint = CGPointMake(paperRect.origin.x, 
                                     paperRect.origin.y + paperRect.size.height - 1);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, 
                                   paperRect.origin.y + paperRect.size.height - 1);
    
    draw1PxStroke(context, startPoint, endPoint, custom );

}


@end
