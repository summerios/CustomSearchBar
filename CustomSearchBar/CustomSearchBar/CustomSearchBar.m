//
//  CustomSearchBar.m
//  CustomSearchBar
//
//  Created by mahaitao on 2017/5/26.
//  Copyright © 2017年 summer. All rights reserved.
//

#import "CustomSearchBar.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBAlpha(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]




#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)



#define IS_IOS9 [[UIDevice currentDevice].systemVersion doubleValue] >= 9

#define DefulatBorderColor [UIColor colorWithRed:4/255.0 green:193/255.0 blue:173/255.0 alpha:1.0].CGColor
#define DefulatTintColor UIColorFromRGBAlpha(0xFFFFFF, 0.3)
#define DefulatPlacehoderString @"搜索"
#define TEXTCOLOR UIColorFromRGBAlpha(0xFFFFFF, 0.3)
#define BGCOLOR RGB(54, 56, 65)
@interface CustomSearchBar ()
{
    CGRect _searchBarFrame;
}
@end

@implementation CustomSearchBar

#pragma mark - override drawRect:
- (void)drawRect:(CGRect)rect
{
    [self setupWithFrame:rect];
}

#pragma mark - override  initWithFrame:
- (instancetype)initWithFrame:(CGRect)frame
{
    self =  [super initWithFrame:frame];
    if (self){
        [self setupWithFrame:frame];
    }
    return self;
}

#pragma mark public 	initialization
- (instancetype)initWithFrame:(CGRect)frame boardColor:(UIColor *)color placeholderString:(NSString *)placehoderString
{
    self = [super initWithFrame:frame];
    if (self ) {
        self.boardColor = color;
        self.placeholderString = placehoderString;
        [self setupWithFrame:frame];
    }
    return self;
}

#pragma mark - private method
- (void)setupWithFrame:(CGRect)frame
{
    
    _searchBarFrame = frame;
    self.layer.cornerRadius = frame.size.height/2.0;
    self.layer.masksToBounds = YES;
    if (self.boardLineWidth != 0){
        if (self.boardLineWidth < 1.0 || self.boardLineWidth > 5.0) {
            self.layer.borderWidth = 1.0;
        }
        else{
            self.layer.borderWidth = self.boardLineWidth;
        }
    }else{
        
    }
    //设置searchbar 背景色
    self.barTintColor = BGCOLOR;
    self.layer.borderColor = self.boardColor.CGColor?self.boardColor.CGColor:DefulatBorderColor;
    //设置取消按钮的颜色
    self.tintColor = self.boardColor?self.boardColor:DefulatTintColor;
    self.placeholder = self.placeholderString?self.placeholderString:DefulatPlacehoderString;
    
    
    
    
    UITextField *searchField = [self valueForKey:@"_searchField"];
    if (searchField) {
        searchField.clearButtonMode = UITextFieldViewModeNever;
        [searchField setBackgroundColor:BGCOLOR];
        [searchField setValue:TEXTCOLOR forKeyPath:@"_placeholderLabel.textColor"];
        //设置光标的颜色
        [searchField setTintColor:TEXTCOLOR];
        searchField.font = [UIFont systemFontOfSize:16];
        searchField.textColor = TEXTCOLOR;
    }
    
    // 设置搜索Icon
    [self setImage:[UIImage imageNamed:@"suo"]
  forSearchBarIcon:UISearchBarIconSearch
             state:UIControlStateNormal];
    
    
    if (IS_IOS9) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:@"取消"];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    }
    //设置关闭按钮大小
    NSDictionary *textAttr = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
    if (IS_IOS9) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }
    [self layoutSubviews];
    
}
-(void) layoutSubviews{
    
    [super layoutSubviews];
    
    
    CGFloat leftSpace = 8;   //Default: 8.0
    CGFloat topSpace = 0;    //Default: (self.bounds.height - 28.0) / 2.0
    CGFloat rightSpace = leftSpace;
    CGFloat bottomSpace = topSpace;
    UITextField *searchField = [self valueForKey:@"_searchField"];
    searchField.frame = CGRectMake(_searchBarFrame.origin.x + leftSpace, _searchBarFrame.origin.y + topSpace, _searchBarFrame.size.width - leftSpace - rightSpace, _searchBarFrame.size.height - topSpace - bottomSpace);
}

@end
