//
//  CustomSearchBar.h
//  CustomSearchBar
//
//  Created by mahaitao on 2017/5/26.
//  Copyright © 2017年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSearchBar : UISearchBar
@property (nonatomic,strong) UIColor* boardColor;
@property (nonatomic,copy)    NSString *placeholderString;
@property (nonatomic,assign) CGFloat boardLineWidth;
- (instancetype) initWithFrame:(CGRect)frame boardColor:(UIColor *)color placeholderString:(NSString *)placehoderString;

@end
