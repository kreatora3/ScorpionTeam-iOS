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
    [self parseImagesWithKey:@"room"];
    //[self parseImages];
    //_content=[[NSMutableArray alloc] init];
    _furnitureImages =[[NSMutableArray alloc] init];
    UINib* nib = [UINib nibWithNibName:cellIdentifier bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:cellIdentifier];
    // Initialization code
    ImageWithTitle *image = [[ImageWithTitle alloc] init];
    image.name = @"John";
    UIImage* pic = [UIImage imageNamed:@"img1.jpeg"];
    image.image=pic;
    /*for(int i=0; i<10;i++){
        [_content addObject:image];
    }*/
    
    
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

-(void) parseImagesWithKey: (NSString *) key{
    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    [query whereKey:@"type" equalTo:key];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %ld scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                
                PFFile* picture=object[@"image"];
                NSData *imageData=[picture getData];
               // NSLog(@"%@", object.objectId);
                NSLog(@"%@",imageData);
                UIImage *image =[UIImage imageWithData:imageData];
                [_content addObject:image];
            }
           
                [self.table reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

- (IBAction)sample:(id)sender {
    if(_sampler.selectedSegmentIndex == 0)            // Checking which segment is selected using the segment index value
        
    {
        //implement changing datasource for table
       _content=[[NSMutableArray alloc] init];
        [self parseImagesWithKey:@"room"];
        //self.view.backgroundColor = [UIColor redColor];          // Change the background color to red
        
    }
    
    else
        
        if(_sampler.selectedSegmentIndex == 1)
            
        {
            
            _content=[[NSMutableArray alloc] init];
            [self parseImagesWithKey:@"kitchen"];
           
            //implement changing datasource for table
            //self.view.backgroundColor = [UIColor greenColor];
            
        }
    
        else
            
            if(_sampler.selectedSegmentIndex == 2)
                
            {
                _content=[[NSMutableArray alloc] init];
                [self parseImagesWithKey:@"bathroom"];
                //implement changing datasource for table
                //self.view.backgroundColor = [UIColor blueColor];
                
            }
    
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint location=[sender locationInView:self.view];

    for (UIImageView *furniture in self.furnitureImages) {
        CGRect rect= CGRectMake(furniture.frame.origin.x, furniture.frame.origin.y, furniture.frame.size.width, furniture.frame.size.height);
        if(location.x>rect.origin.x&location.x<(rect.origin.x+rect.size.width)&location.y>rect.origin.y&location.y<(rect.origin.y+rect.size.height)){
            
            CGRect newLocation= CGRectMake(location.x-rect.size.width/2, location.y-rect.size.height/2, rect.size.width, rect.size.height);
            furniture.frame=newLocation;
             NSLog(@"%f",location.x);
        }
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
   // ImageWithTitle* cellData=[_content objectAtIndex:indexPath.row];
    //cell.label.text=cellData.name;
    //cell.productImage.image=cellData.image;
   // PFObject *object =[_content objectAtIndex:indexPath.row];
   // NSData *imageData=object[@"image"];
    //NSString *name=object[@"name"];
    //UIImage* image= [UIImage imageWithData:imageData];
    cell.productImage.image=[_content objectAtIndex:indexPath.row];
    //cell.label.text= name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImage* cellData=[_content objectAtIndex:indexPath.row];
    
    
    CGRect applicationFrame= CGRectMake (self.view.frame.origin.x, self.view.frame.origin.y,cellData.size.width/2, cellData.size.height/2);
    
    NSLog(@"%f",cellData.size.width);
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:applicationFrame];
    contentView.image=cellData;
    //self.view = contentView;
    //levelView = [[LevelView alloc] initWithFrame:applicationFrame viewController:self];
    [self.view addSubview:contentView];
    [self.furnitureImages addObject:contentView];
}


@end
