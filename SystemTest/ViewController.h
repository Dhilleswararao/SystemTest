//
//  ViewController.h
//  SystemTest
//
//  Created by Dhilleswar on 17/11/16.
//  Copyright © 2016 Sparshcommunications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

@end

