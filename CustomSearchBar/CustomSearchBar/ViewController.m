//
//  ViewController.m
//  CustomSearchBar
//
//  Created by mahaitao on 2017/5/26.
//  Copyright © 2017年 summer. All rights reserved.
//

#import "ViewController.h"
#import "CustomSearchBar.h"

@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomSearchBar *customsearchBar = [[CustomSearchBar alloc] initWithFrame:CGRectMake(15,100, self.view.frame.size.width - 30, 40) boardColor:nil placeholderString:@"搜索"];
    customsearchBar.delegate = self;
    [self.view addSubview:customsearchBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar endEditing:YES];
}

//监控文本变化
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
}

@end
