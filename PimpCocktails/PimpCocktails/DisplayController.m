//
//  DisplayController.m
//  MVC_Cocktails
//
//  Created by Dan on 09/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DisplayController.h"

@implementation DisplayController
@synthesize textView,imageView, recipe;


- (void)dealloc
{
    [textView release];
    [imageView release];
    [recipe release];
    [super dealloc];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = recipe.name;
    imageView.image = recipe.image;
    textView.text = recipe.instructions;
}



@end
