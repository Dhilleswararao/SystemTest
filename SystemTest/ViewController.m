//
//  ViewController.m
//  SystemTest
//
//  Created by Dhilleswar on 17/11/16.
//  Copyright © 2016 Sparshcommunications. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    NSArray *citiyImagesArray;
    NSArray *cityNamesArray;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    citiyImagesArray=[[NSArray alloc]initWithObjects:@"india.jpg",@"newYork.jpg",@"italy.jpg",@"Rom.jpg",@"parisBG.jpg" ,@"india.jpg",@"newYork.jpg",@"italy.jpg",@"Rom.jpg",@"parisBG.jpg" ,nil];
    cityNamesArray=[[NSArray alloc]initWithObjects:@"India",@"NewYork",@"Italy",@"Rom",@"Paris" ,@"India",@"NewYork",@"Italy",@"Rom",@"Paris",nil];
    self.homeTableView.dataSource=self;
    self.homeTableView.delegate=self;
    [self.homeTableView setBackgroundColor:[UIColor clearColor]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TabelViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell ;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    [cell setTintColor:[UIColor whiteColor]];
    cell.backgroundColor = [UIColor clearColor];
    cell.alpha=0.3f;
    tableView.backgroundColor =[UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell addSubview:[self contentViewCreation:indexPath]];
    return cell;
    
    
}

/**
 creating the cell it contains with collection view with horizontal scroling
 
 @param indexPath index path value
 
 @return it returns the interface of uitableview cell
 */
-(UIView *)contentViewCreation:(NSIndexPath *)indexPath{
    
    CGFloat width = self.homeTableView.frame.size.width;
    UIView * contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 110)];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    UICollectionView *homeCollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, contentView.frame.size.width, 110) collectionViewLayout:layout];
    [homeCollectionView setBackgroundColor:[UIColor clearColor]];
    homeCollectionView .bounces=NO;
    homeCollectionView.tag=indexPath.row;
    [contentView addSubview:homeCollectionView];
    [homeCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"collectionCellIdentifier %ld", (long)indexPath.row]];
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    homeCollectionView.delegate=self;
    homeCollectionView.dataSource=self;
    contentView.backgroundColor = [UIColor clearColor];
    contentView.backgroundColor = [UIColor clearColor];
    contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    contentView.layer.borderWidth = 1;
    return contentView;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIView * view = [self contentViewCreation:indexPath];
    
    return view.frame.size.height;
}

#pragma mark - CollecionDelegateMethods


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return citiyImagesArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"collectionCellIdentifier %ld", (long)collectionView.tag] forIndexPath:indexPath];
    for (UILabel *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            [lbl removeFromSuperview];
        }
    }
    for (UIImageView *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UIImageView class]])
        {
            [lbl removeFromSuperview];
        }
    }
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:[citiyImagesArray objectAtIndex:indexPath.row]]];
    imageView.layer.cornerRadius = imageView.frame.size.width/2;
    imageView.layer.masksToBounds = YES;
    [cell.contentView addSubview:imageView];
    
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), cell.frame.size.width,20)];
    nameLabel.text=[cityNamesArray objectAtIndex:indexPath.row];
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:12]];
    [cell.contentView addSubview:nameLabel];
    [cell setTintColor:[UIColor whiteColor]];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(82, 82);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 10, 10); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0;
}

@end
