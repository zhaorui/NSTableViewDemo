//
//  ComplexTableDemo.m
//  TableDemo
//
//  Created by 赵睿 on 13/6/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "ComplexTableDemo.h"

const NSUInteger MAX_ITEM_NUM_PER_GROUP = 5;

@interface ComplexTableDemo () <NSTableViewDataSource,NSTableViewDelegate>

@property (assign) IBOutlet NSTableView *tableview;
@property (retain, nonatomic) NSMutableArray* content;
@end

@implementation ComplexTableDemo

- (void)windowDidLoad {
  [super windowDidLoad];
  self.content = [NSMutableArray arrayWithObjects:@{@"title": @"bill"}, nil];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
  NSInteger num = [self.content count] + [self.content count] / MAX_ITEM_NUM_PER_GROUP;
  if (self.content.count % MAX_ITEM_NUM_PER_GROUP) {
    num += 1;
  }
  return num;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
  if (row % (MAX_ITEM_NUM_PER_GROUP + 1)) {
    NSTableCellView* cellView = [tableView makeViewWithIdentifier:@"ContentCell" owner:nil];
    cellView.textField.stringValue = self.content[row - row / (MAX_ITEM_NUM_PER_GROUP + 1) - 1][@"title"];
    return cellView;
  } else {
    NSTextField* textCellView = [tableView makeViewWithIdentifier:@"HeaderCell" owner:nil];
    textCellView.stringValue = [NSString stringWithFormat:@"Row %lu", row / MAX_ITEM_NUM_PER_GROUP];
    return textCellView;
  }
}

// We want to make "group rows" for the folders.
- (BOOL)tableView:(NSTableView *)tableView isGroupRow:(NSInteger)row {
  if (row % (MAX_ITEM_NUM_PER_GROUP + 1)) {
    return NO;
  } else {
    return YES;
  }
}


// We make the "group rows" have the standard height, while all other image rows have a larger height.
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
  
  if (row % (MAX_ITEM_NUM_PER_GROUP + 1)) {
    return 20;
  } else {
    return 30;
  }
}

- (IBAction)append:(NSTextField *)sender {
  [self.content addObject:@{@"title": sender.stringValue}];
  [self.tableview reloadData];
  
}

@end
