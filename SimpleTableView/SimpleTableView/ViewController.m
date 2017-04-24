//
//  ViewController.m
//  SimpleTableView
//
//  Created by Filipe Augusto de Souza Rosa on 24/04/17.
//  Copyright © 2017 Filipe Augusto de Souza Rosa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize table data
    tableData = [NSArray arrayWithObjects:@"Cheetah", @"Puma", @"Jaguar", @"Panther", @"Tiger", @"Leopard", @"Snow Leopard", @"Lion", @"Mountain Lion", @"Mavericks", @"Yosemite", @"El Capitan", @"Sierra", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"TableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

@end
