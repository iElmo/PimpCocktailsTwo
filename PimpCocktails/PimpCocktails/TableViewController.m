//
//  TableViewController.m
//  MVC_Cocktails
//
//  Created by Dan on 09/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"
#import "DisplayController.h"
#import "CustomCellBackground.h"

@implementation TableViewController
@synthesize recipe, recipeArray;

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        recipeArray = [[NSMutableArray alloc] init];
        
        recipe = [[Recipe alloc] init];
        
        recipe.name = @"Sex on the Beach";
		recipe.instructions = @"1 1/2 oz Vodka\1/2 oz Peach Schnapps\n 2 oz Cranberry Juice\n 2oz Orange Juice";
		recipe.image = [UIImage imageNamed:@"sex_on_the_beach.jpg"];
		[recipeArray addObject:recipe];
		[recipe release];
        
		recipe = [[Recipe alloc] init];
		recipe.name = @"Mojito";
		recipe.instructions = @"1.25 oz Captain Morgans\n12 Mint Leaves\n1 tsp Sugar\n2 oz Soda";
		recipe.image = [UIImage imageNamed:@"mojito.jpg"];
		[recipeArray addObject:recipe];
		[recipe release];
        
		recipe = [[Recipe alloc] init];
		recipe.name = @"Pina Colada";
		recipe.instructions = @"3 oz Light Rum\n3tbsp Coconut Cream\n3 tbsp Crush Pineapples";
		recipe.image = [UIImage imageNamed:@"pina.jpg"];
		[recipeArray addObject:recipe];
		[recipe release];  
        
        
    }
    return self;
}

- (void)dealloc
{
    [recipeArray release];
    [super dealloc];

}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = 60;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [recipeArray count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];

        cell.backgroundView = [[[CustomCellBackground alloc] init ] autorelease];
        cell.selectedBackgroundView = [[[CustomCellBackground alloc] init] autorelease];
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
        
    }
    
    recipe = [recipeArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = recipe.name;
    cell.imageView.image = recipe.image;
    
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Cocktails";
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisplayController *newView = [[DisplayController alloc] init];
    
    newView.recipe = [recipeArray objectAtIndex:indexPath.row];
    NSLog(@"Failcake?");
    [self.navigationController pushViewController:newView animated:YES];
    
    [newView release];
}

@end
