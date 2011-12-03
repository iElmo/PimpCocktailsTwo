//
//  Common.m
//  PimpCocktails
//
//  Created by Dan on 18/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Common.h"

@implementation Common

void drawLinearGradient (CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor){
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat locations [] ={ 0, 1 };
    
    NSArray *colours = [NSArray arrayWithObjects:(id) startColor, (id) endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) colours, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    
    CGContextAddRect(context, rect);
    
    CGContextClip(context);

    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
}

CGRect rectFor1PxStroke (CGRect rect){
    return CGRectMake(rect.origin.x +.5, rect.origin.y +.5 , rect.size.width -1, rect.size.height -1);
}

void draw1PxStroke (CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color){
    
    CGContextSaveGState(context);
    
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    CGContextSetLineWidth(context, 1.0);
    
    CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
    
    CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
    
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
}

@end
