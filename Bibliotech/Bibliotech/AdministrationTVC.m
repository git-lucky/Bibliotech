//
//  AdministrationTVC.m
//  Bibliotech
//
//  Created by Tim Hise on 12/18/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "AdministrationTVC.h"
#import "LibraryTVC.h"

@implementation AdministrationTVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (Administration *)network
{
    if (!_network) _network = [[Administration alloc] init];
    
    return _network;
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
    return [self.network.libraries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Library Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Library *libraryObject = [self.network.libraries objectAtIndex:indexPath.row];
    cell.textLabel.text = libraryObject.name;
    
    return cell;
}


// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    Return NO if you do not want the specified item to be editable.
//        return YES;
//}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.network.libraries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Library *library = [self.network.libraries objectAtIndex:fromIndexPath.row];
    [self.network.libraries removeObjectAtIndex:fromIndexPath.row];
    [self.network.libraries insertObject:library atIndex:toIndexPath.row];
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToLibrary"]) {
        if ([segue.destinationViewController isKindOfClass:[LibraryTVC class]]) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            LibraryTVC *destTVC = segue.destinationViewController;
            destTVC.library = [self.network.libraries objectAtIndex:indexPath.row];
        }
    }
}



@end
