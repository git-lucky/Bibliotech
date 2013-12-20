//
//  BookTVC.m
//  Bibliotech
//
//  Created by Tim Hise on 12/9/13.
//  Copyright (c) 2013 FragleRock. All rights reserved.
//

#import "ShelfTVC.h"
#import "CreateBookVC.h"

@implementation ShelfTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // sets the UINavigationControllers title to that of the previously clicked cell
    [self setTitle:self.shelf.name];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (Shelf *)shelf
{
    if (!_shelf) _shelf = [[Shelf alloc] init];
    return _shelf;
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
    return [self.shelf.books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Book Cell";  //to identify prototype cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];  //gets the index of the chosen cell
    
    Book *bookObject = [self.shelf.books objectAtIndex:indexPath.row]; //grabs the object at index
    cell.textLabel.text = bookObject.title;  //names the cell the name of the book
    cell.detailTextLabel.text = bookObject.author;
    
    return cell;
}


// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.shelf.books removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Book *book = self.shelf.books[fromIndexPath.row];
    [self.shelf.books removeObjectAtIndex:fromIndexPath.row];
    [self.shelf.books insertObject:book atIndex:toIndexPath.row];
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

- (IBAction)addedBook:(UIStoryboardSegue *)segue
{
    if ([segue.sourceViewController isKindOfClass:[CreateBookVC class]]) {
        CreateBookVC *createBookVC = (CreateBookVC *)segue.sourceViewController;
        Book *addedBook = createBookVC.addedBook;
        if (addedBook) {
            [self.shelf.books addObject:addedBook];
            
            [self.tableView reloadData];
        }
    }
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}



@end
