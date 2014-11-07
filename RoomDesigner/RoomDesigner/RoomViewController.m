//
//  RoomViewController.m
//  RoomDesigner
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "RoomViewController.h"
#import "TableViewCell.h"
#import "ImageWithTitle.h"

@interface RoomViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RoomViewController

static NSString* cellIdentifier=@"TableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //_content = [[NSMutableArray alloc] initWithObjects:@"John",@"Ron",@"Don",@"Shawn",@"Ion",@"Gaston",@"Tron", nil];
    _content=[[NSMutableArray alloc] init];
    
    _furnitureImages =[[NSMutableArray alloc] init];
    UINib* nib = [UINib nibWithNibName:cellIdentifier bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:cellIdentifier];
    // Initialization code
    ImageWithTitle *image = [[ImageWithTitle alloc] init];
    image.name = @"John";
    UIImage* pic = [UIImage imageNamed:@"img1.jpeg"];
    image.image=pic;
    for(int i=0; i<10;i++){
        [_content addObject:image];
    }
    
    
    [self.table setDelegate:self];
    [self.table setDataSource:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sample:(id)sender {
    if(_sampler.selectedSegmentIndex == 0)            // Checking which segment is selected using the segment index value
        
    {
        //implement changing datasource for table
        
        self.view.backgroundColor = [UIColor redColor];          // Change the background color to red
        
    }
    
    else
        
        if(_sampler.selectedSegmentIndex == 1)
            
        {
            //implement changing datasource for table
            self.view.backgroundColor = [UIColor greenColor];
            
        }
    
        else
            
            if(_sampler.selectedSegmentIndex == 2)
                
            {
                //implement changing datasource for table
                self.view.backgroundColor = [UIColor blueColor];
                
            }
    
}

-(NSInteger) numberOfSections{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _content.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    NSLog(@"created");
    
    //cell.label.text = [_content objectAtIndex:indexPath.row];
    ImageWithTitle* cellData=[_content objectAtIndex:indexPath.row];
    cell.label.text=cellData.name;
    cell.productImage.image=cellData.image;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ImageWithTitle* cellData=[_content objectAtIndex:indexPath.row];
    
    
    CGRect applicationFrame= CGRectMake (self.view.frame.origin.x, self.view.frame.origin.y,cellData.image.size.width/2, cellData.image.size.height/2);
    
    NSLog(@"%f",cellData.image.size.width);
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:applicationFrame];
    contentView.image=cellData.image;
    //self.view = contentView;
    
    //levelView = [[LevelView alloc] initWithFrame:applicationFrame viewController:self];
    [self.view addSubview:contentView];
}

@end
