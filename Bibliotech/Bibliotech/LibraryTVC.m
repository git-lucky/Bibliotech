//
//  LibraryViewController.m
//  Bibliotech
//
//  Created by Tim Hise on 12/6/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "LibraryTVC.h"
#import "ShelfTVC.h"
#import "CreateShelfVC.h"

@implementation LibraryTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:self.library.name];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.library.shelves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Shelf Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Shelf *shelfObject = [self.library.shelves objectAtIndex:indexPath.row];
    cell.textLabel.text = shelfObject.name;
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.library.shelves removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Shelf *shelf = [self.library.shelves objectAtIndex:fromIndexPath.row];
    [self.library.shelves removeObjectAtIndex:fromIndexPath.row];
    [self.library.shelves insertObject:shelf atIndex:toIndexPath.row];
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (IBAction)test:(UIBarButtonItem *)sender {
    [self.library listShelves];
}
#pragma mark - Navigation

- (IBAction)addedShelf:(UIStoryboardSegue *)segue
{
    if ([segue.sourceViewController isKindOfClass:[CreateShelfVC class]]) {
        CreateShelfVC *createShelfVC = (CreateShelfVC *)segue.sourceViewController;
        Shelf *addedShelf = createShelfVC.addedShelf;
        if (addedShelf) {
            [self.library addShelfToLibraryWithName:addedShelf.name];

            [self.tableView reloadData];
        }
    }
}

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToShelf"]) {
        if ([segue.destinationViewController isKindOfClass:[ShelfTVC class]]) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            ShelfTVC *destTVC = segue.destinationViewController;
            destTVC.shelf = [self.library.shelves objectAtIndex:indexPath.row];
        }
    }
}



@end
