//
//  MainWindowController.m
//  TableDemo
//
//  Created by 赵睿 on 12/6/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "MainWindowController.h"
#import "BasicTabbleDemo.h"

@interface MainWindowController ()

@property (retain, nonatomic) NSMutableArray* tableContents;
@property (assign) IBOutlet NSTextField *textField;
@property (assign) IBOutlet NSTableView *tableview;

@end

@implementation MainWindowController

-(void)awakeFromNib {
  
  self.tableContents = [[NSMutableArray alloc] initWithObjects: @{@"title":@"123",@"id":@"hsdfsdfiu"},
                        @{@"title": @"hello", @"id": @"lsjdfoi"}, @{@"title":@"why", @"id" : @"osidjf"}, nil];
  
}

- (IBAction)append:(id)sender {
  if ([self.textField.stringValue length] > 0) {
    [self willChangeValueForKey:@"tableContents"];
    [self.tableContents addObject:@{@"title": self.textField.stringValue}];
    [self didChangeValueForKey:@"tableContents"];
    NSLog(@"%@", self.tableContents);
  }
}


- (IBAction)nextDemo:(NSButton *)sender {
  BasicTabbleDemo* basic_demo = [[BasicTabbleDemo alloc] initWithWindowNibName:@"BasicTabbleDemo"];
  [basic_demo showWindow:self];
  [[self window] close];
}

- (IBAction)clickon:(NSTableView *)sender {
  NSLog(@"click on %ld", self.tableview.selectedRow);
}

- (IBAction)doubleclickon:(NSTableView *)sender {
  NSLog(@"double click on %ld", self.tableview.selectedRow);
}

@end
