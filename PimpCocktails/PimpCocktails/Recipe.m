//
//  Recipe.m
//  MVC_Cocktails
//
//  Created by Dan on 09/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Recipe.h"


@implementation Recipe
@synthesize image, name, instructions;


-(void) dealloc{
    [image release];
    [name release];
    [instructions release];
    [super dealloc];

}

@end
