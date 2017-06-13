//
//  BasicTabbleDemo.m
//  TableDemo
//
//  Created by 赵睿 on 13/6/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "BasicTabbleDemo.h"
#import "ComplexTableDemo.h"

@interface BasicTabbleDemo () <NSTableViewDelegate, NSTableViewDataSource>

@property (retain, nonatomic) NSMutableArray* tableContents;

@property (assign) IBOutlet NSTableView *tableView;

@end

@implementation BasicTabbleDemo

- (void)windowDidLoad {
    [super windowDidLoad];
    
  NSArray *tableData = @[@"NSQuickLookTemplate",
                         @"NSBluetoothTemplate",
                         @"NSIChatTheaterTemplate",
                         @"NSSlideshowTemplate",
                         @"NSActionTemplate",
                         @"NSSmartBadgeTemplate",
                         @"NSIconViewTemplate",
                         @"NSListViewTemplate",
                         @"NSColumnViewTemplate",
                         @"NSFlowViewTemplate",
                         @"NSPathTemplate",
                         @"NSInvalidDataFreestandingTemplate",
                         @"NSLockLockedTemplate",
                         @"NSLockUnlockedTemplate",
                         @"NSGoRightTemplate"];
  
  
  // Load up our sample data.
  self.tableContents = [NSMutableArray array];
  
  // Our model consists of an array of dictionaries with Name/Image key pairs.
  for (NSString *templateImageItem in tableData) {
    NSUInteger length = [templateImageItem length];
    NSDictionary *dictionary = @{@"Name": templateImageItem, @"Length": [NSNumber numberWithUnsignedInteger:length]};
    [self.tableContents addObject:dictionary];
  }
  
  [self.tableView reloadData];
  
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
  return self.tableContents.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
  // Group our "model" object, which is a dictionary
  NSDictionary* dictionary = self.tableContents[row];
  
  NSString* identifier = tableColumn.identifier;
  
  if ([identifier isEqualToString:@"StringCell"]) {
    NSTableCellView* cellView = [tableView makeViewWithIdentifier:identifier owner:self];
    cellView.textField.stringValue = dictionary[@"Name"];
    return cellView;
  } else if ([identifier isEqualToString:@"LengthCell"]) {
    NSTableCellView* cellView = [tableView makeViewWithIdentifier:identifier owner:self];
    cellView.textField.stringValue = dictionary[@"Length"];
    return cellView;
  } else {
    NSAssert1(NO, @"unhandled colum id", identifier);
  }
  return nil;
}

- (IBAction)appendItem:(NSTextField *)sender {
  [self.tableContents addObject:@{@"Name": [sender stringValue],
                                  @"Length": [NSNumber numberWithUnsignedInteger: [[sender stringValue] length]]}];
  [self.tableView reloadData];
  
}

- (IBAction)nextDemo:(NSButton *)sender {
  ComplexTableDemo* complexDemo = [[ComplexTableDemo alloc] initWithWindowNibName:@"ComplexTableDemo"];
  [complexDemo showWindow:nil];
  [self close];
}

@end
