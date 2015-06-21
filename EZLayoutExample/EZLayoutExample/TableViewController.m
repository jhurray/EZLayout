//
//  TableViewController.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/8/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "TableViewController.h"
#import "EZLayoutExampleTableViewCell.h"

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[EZLayoutExampleTableViewCell class] forCellReuseIdentifier:@"ezLayoutIdentifier"];
    
}

# pragma mark - UItableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EZLayoutExampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ezLayoutIdentifier" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
