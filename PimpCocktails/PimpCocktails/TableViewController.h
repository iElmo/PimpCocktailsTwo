//
//  TableViewController.h
//  MVC_Cocktails
//
//  Created by Dan on 09/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface TableViewController : UITableViewController {
    
}

@property (nonatomic, retain) NSMutableArray *recipeArray;
@property (nonatomic, retain) Recipe *recipe;

@end
