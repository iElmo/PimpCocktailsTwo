//
//  Recipe.h
//  MVC_Cocktails
//
//  Created by Dan on 09/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Recipe : NSObject {
    
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *instructions;
@property (nonatomic, retain) UIImage *image;
@end
