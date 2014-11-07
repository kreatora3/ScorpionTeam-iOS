//
//  TableView.m
//  new
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "TableView.h"
#import "TableViewCell.h"
@interface TableView()<UITableViewDelegate, UITableViewDataSource>
@end
@implementation TableView

static NSString* cellIdentifier=@"TableViewCell";

- (void)awakeFromNib {
   // [super awakeFromNib];
    NSLog(@"awakend");
    _content = [[NSMutableArray alloc] initWithObjects:@"John",@"Ron",@"Don",@"Shawn",@"Ion",@"Gaston",@"Tron", nil];    
    
    UINib* nib = [UINib nibWithNibName:cellIdentifier bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:cellIdentifier];
    // Initialization code
    
    self.delegate=self;
    self.dataSource=self;
}

-(NSInteger) numberOfSections{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _content.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell =[self dequeueReusableCellWithIdentifier:cellIdentifier ];
    NSLog(@"created");
    
    cell.label.text = [_content objectAtIndex:indexPath.row];
    
    return cell;
}





/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _content.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    
    cell.label.text = [_content objectAtIndex:indexPath.row];
 
    return cell;
    
}*/


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
