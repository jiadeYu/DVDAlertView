//
//  DVDAlertView.m
//  DaVDian_business
//
//  Created by bochengzhang on 2017/4/19.
//  Copyright © 2017年 BraveTime. All rights reserved.
//

#import "DVDAlertView.h"

#   define Debug(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define SHARED_APPDELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define ContnetLabelMinHeight       72.f
#define SpeceMinHeight              15.f
#define ButtonHeight                44.f
#define SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define SCREENVIEW_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define STRINGHASVALUE(str)        (str && [str isKindOfClass:[NSString class]] && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 \
green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
blue:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
alpha:(float)(rgbValue & 0xFF)/255.0]

//RGB color macro with alpha
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define FONTBOLD1 [UIFont boldSystemFontOfSize:18]
#define FONT_B10  [UIFont boldSystemFontOfSize:10]
#define FONT_B11  [UIFont boldSystemFontOfSize:11]
#define FONT_B12  [UIFont boldSystemFontOfSize:12]
#define FONT_B13  [UIFont boldSystemFontOfSize:13]
#define FONT_B14  [UIFont boldSystemFontOfSize:14]
#define FONT_B15  [UIFont boldSystemFontOfSize:15]
#define FONT_B16  [UIFont boldSystemFontOfSize:16]
#define FONT_B17  [UIFont boldSystemFontOfSize:17]
#define FONT_13   [UIFont systemFontOfSize:13]
#define FONT_16   [UIFont systemFontOfSize:16]
#define FONT_15   [UIFont systemFontOfSize:15]
#define FONT_14   [UIFont systemFontOfSize:14]
#define FONT_12   [UIFont systemFontOfSize:12]
#define FONT_11   [UIFont systemFontOfSize:11]
#define FONT_10   [UIFont systemFontOfSize:10]
#define FONT_9   [UIFont systemFontOfSize:9]

#define FONT_17   [UIFont systemFontOfSize:17]
#define FONT_18      [UIFont systemFontOfSize:18]
#define FONT_B18  [UIFont boldSystemFontOfSize:18]
#define FONT_19   [UIFont systemFontOfSize:19]
#define FONT_20   [UIFont systemFontOfSize:20]
#define FONT_24   [UIFont systemFontOfSize:24]
#define FONT_30   [UIFont systemFontOfSize:30]
#define FONT_32   [UIFont systemFontOfSize:32]
#define FONT_36   [UIFont systemFontOfSize:36]

#define FONT_L9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:9]:[UIFont systemFontOfSize:9])
#define FONT_L10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:10]:[UIFont systemFontOfSize:10])
#define FONT_L11 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:11]:[UIFont systemFontOfSize:11])
#define FONT_L12  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:12]:[UIFont systemFontOfSize:12])
#define FONT_L13  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:13]:[UIFont systemFontOfSize:13])
#define FONT_L14  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:14]:[UIFont systemFontOfSize:14])
#define FONT_L16  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:16]:[UIFont systemFontOfSize:16])
#define FONT_L18   ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ?[UIFont fontWithName:@"PingFangSC-Light" size:18]:[UIFont systemFontOfSize:18])

#define FONT_B20  [UIFont boldSystemFontOfSize:20]
#define FONT_B24  [UIFont boldSystemFontOfSize:24]
#define FONT_B26  [UIFont boldSystemFontOfSize:26]
#define FONT_B28  [UIFont boldSystemFontOfSize:28]
#define FONT_B32  [UIFont boldSystemFontOfSize:32]
#define FONT_B40  [UIFont boldSystemFontOfSize:40]
#define FONT_B56  [UIFont boldSystemFontOfSize:56]

@interface DVDAlertView()
{
    CGFloat currentOriginY;
}

@property (nonatomic, strong) UIView *contentAlertView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIView *gapLineView;

@property (nonatomic, strong) UIView *buttonGapMiddleView;


@property (nonatomic, strong) NSMutableArray *buttonTitlesArray;

/**
 存放RIButtonItem的数组
 */
@property (nonatomic, strong) NSMutableArray *buttonItemArray;

@property (nonatomic,strong) NSMutableArray *buttonArray;


@end

@implementation DVDAlertView

+ (BOOL)isCurrentAlertInWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    NSArray *subViews = [window subviews];
    for (UIView *view in subViews) {
        if ([view isKindOfClass:self]) {
            
            return YES;
        }
    }
    return NO;
}
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENVIEW_HEIGHT);
        
        self.backgroundColor = UIColorFromRGBWithAlpha(0x000000, 0.5);
        
        self.delegate = delegate;
        
        [self loadWithTitle:title message:message cancelButtonTittle:cancelButtonTitle otherButtonTitle:otherButtonTitle];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title attributedStringMessage:(NSAttributedString *)attributedStringMessage delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    if (self =  [self initWithTitle:title message:[attributedStringMessage string] delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitle:otherButtonTitle]) {
        
        [self.contentLabel setAttributedText:attributedStringMessage];
    
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)inTitle message:(NSString *)inMessage cancelButtonItem:(RIButtonItem *)inCancelButtonItem otherButtonItems:(RIButtonItem *)inOtherButtonItems
{
    if (self = [self initWithTitle:inTitle message:inMessage delegate:nil cancelButtonTitle:inCancelButtonItem.label otherButtonTitle:inOtherButtonItems.label]) {
        
        if(inCancelButtonItem){
            
            [self.buttonItemArray addObject:inCancelButtonItem];
        }
        
        if (inOtherButtonItems) {
            
            [self.buttonItemArray addObject:inOtherButtonItems];
        }
    }
    return self;
}
#pragma mark --- 初始化

- (void)loadWithTitle:(NSString *)title message:(NSString *)message cancelButtonTittle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    //1、初始化数据加载UI
    [self loadSubViewsWithTitle:title message:message cancelButtonTittle:cancelButtonTitle otherButtonTitle:otherButtonTitle];
    //2、UI布局
    [self layoutSubviewsTitle:title message:message cancelButtonTittle:cancelButtonTitle otherButtonTitle:otherButtonTitle];
}

- (void)loadSubViewsWithTitle:(NSString *)title message:(NSString *)message cancelButtonTittle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    [self.buttonTitlesArray removeAllObjects];
    
    [self.buttonArray removeAllObjects];
    
    [self addSubview:self.contentAlertView];
    
    if(STRINGHASVALUE(title)){
        
        [self.contentAlertView addSubview:self.titleLabel];
        
    }
    
    if (STRINGHASVALUE(message)) {
        
        [self.contentAlertView addSubview:self.contentLabel];
        
    }
    
    _gapLineView = [[UIView alloc]initWithFrame:CGRectMake(0, currentOriginY, self.contentAlertView.width, 0.5)];
    
    _gapLineView.backgroundColor = UIColorFromRGB(0xE1E1E1);
    
    [self.contentAlertView addSubview:_gapLineView];
    
    if (STRINGHASVALUE(cancelButtonTitle)) {
        
        [self.buttonTitlesArray addObject:cancelButtonTitle];
        
        [self addButtonWithTitle:cancelButtonTitle withButtonTitleColor:UIColorFromRGB(0x666666)];
    }
    
    if (STRINGHASVALUE(otherButtonTitle)) {
        
        [self.buttonTitlesArray addObject:otherButtonTitle];
        
        [self addButtonWithTitle:otherButtonTitle withButtonTitleColor:UIColorFromRGB(0xFF4A7D)];
    }
    
}

- (void)layoutSubviewsTitle:(NSString *)title message:(NSString *)message cancelButtonTittle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    
    currentOriginY = SpeceMinHeight;
    
    if(STRINGHASVALUE(title)){
        
        self.titleLabel.top = currentOriginY;
        
        currentOriginY += self.titleLabel.height + 10.f;
        
        self.titleLabel.text = title;
        
    }
    
    if (STRINGHASVALUE(message)) {
        
        
        CGSize size = [message boundingRectWithSize:CGSizeMake(self.contentLabel.width, SCREENVIEW_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:FONT_14,NSForegroundColorAttributeName:UIColorFromRGB(0x666666)} context:nil].size;
        self.contentLabel.height = size.height;
        self.contentLabel.text = message;
        
        //top 当前子控件的originY
        if (!STRINGHASVALUE(title) && 2*SpeceMinHeight + self.contentLabel.height <= ContnetLabelMinHeight) {
            self.contentLabel.centerY = ContnetLabelMinHeight/2.f;
            currentOriginY = ContnetLabelMinHeight;
        }else{
            self.contentLabel.top = currentOriginY;
            currentOriginY += self.contentLabel.height + SpeceMinHeight;
        }
    }
    
   self.gapLineView.frame =CGRectMake(0, currentOriginY, self.contentAlertView.width, 0.5);
    
    currentOriginY += self.gapLineView.height;
    
    if (STRINGHASVALUE(cancelButtonTitle)) {
        
        [self layoutButtonWithTitle:cancelButtonTitle];
    }
    
    if (STRINGHASVALUE(otherButtonTitle)) {
        
        [self layoutButtonWithTitle:otherButtonTitle];
    }
    
    currentOriginY += ButtonHeight;
    
    self.contentAlertView.height = currentOriginY;
    
    self.contentAlertView.center = self.center;
}


#pragma mark -- 按钮点击事件
- (void)buttonClick:(UIButton *)button
{
    NSString *title = button.titleLabel.text;
    
    NSInteger index = [self.buttonTitlesArray indexOfObject:title];
    
    [self dismiss];
    
    if (self.buttonItemArray.count > index) {
        //说明走的是block
        RIButtonItem *item = [self.buttonItemArray objectAtIndex:index];
        
        if (item.action) {
            item.action();
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(alertView: clickedButtonAtIndex:)]) {
        [self.delegate alertView:self clickedButtonAtIndex:index];
    }
}

-(NSInteger)addButtonWithTitle:(NSString *)title withButtonTitleColor:(UIColor *)titleColor
{
    NSInteger index = [self.buttonTitlesArray indexOfObject:title];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    button.titleLabel.font = FONT_16;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentAlertView addSubview:button];
    
    if (index == 0) {
        
    }else{
        
        [self.contentAlertView addSubview:self.buttonGapMiddleView];
        
    }
    
    
    [self.buttonArray addObject:button];
    
    return index;
}

- (NSInteger)layoutButtonWithTitle:(NSString *)title
{
    NSInteger index = [self.buttonTitlesArray indexOfObject:title];
    
    UIButton *button = [self.buttonArray objectAtIndex:index];
    
    if (index == 0) {
        
        button.frame = CGRectMake(0, currentOriginY, self.contentAlertView.width, ButtonHeight);
        
    }else{
        
        UIButton *firstButton = [self.buttonArray objectAtIndex:0];
        
        firstButton.width = self.contentAlertView.width / 2.f;
        
        
        self.buttonGapMiddleView.frame=CGRectMake(firstButton.width, currentOriginY, 0.5, ButtonHeight);
        
        button.frame = CGRectMake(CGRectGetMaxX(self.buttonGapMiddleView.frame), currentOriginY, firstButton.width, ButtonHeight);
    }
    return index;

}


- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex
{
    NSString *str;
    if (buttonIndex < self.buttonTitlesArray.count) {
        
        str = [self.buttonTitlesArray objectAtIndex:buttonIndex];
    }
    return str;
}
#pragma mark -- show && dismiss

- (void)show
{
    self.backgroundColor = UIColorFromRGBWithAlpha(0x000000, 0.5);
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    [super endEditing:YES];
    
    self.contentAlertView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
    self.contentAlertView.alpha = 0;
    
    
    [UIView animateWithDuration:.7f delay:0.f usingSpringWithDamping:.7f initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.contentAlertView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        self.contentAlertView.alpha = 1.0;
    } completion:nil];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3f animations:^{
        self.contentAlertView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
        self.contentAlertView.alpha = 0;
        self.backgroundColor = UIColorFromRGBWithAlpha(0x000000, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];

}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
    [self dismiss];
}

#pragma mark -- public
- (void)setContentLabelTextAlignment:(NSTextAlignment)textAlignment
{
    self.contentLabel.textAlignment = textAlignment;
}
#pragma mark -- dealloc
- (void)dealloc
{
    Debug(@"DVDAlertView have released");
}
#pragma mark -- property

- (UIView *)contentAlertView
{
    if (!_contentAlertView) {
        
        _contentAlertView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 270 / 375, 0)];
        
        _contentAlertView.layer.cornerRadius = 4;
        
        _contentAlertView.layer.backgroundColor = UIColorFromRGB(0xFFFFFF).CGColor;
        
    }
    
    return _contentAlertView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, CGRectGetWidth(self.contentAlertView.frame) - 30, 21)];
        _titleLabel.font = FONT_16;
        _titleLabel.textColor = UIColorFromRGB(0x2b343c);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, CGRectGetWidth(self.contentAlertView.frame) - 30, 0)];
        _contentLabel.font = FONT_14;
        
        _contentLabel.textColor = UIColorFromRGB(0x666666);
        
        _contentLabel.numberOfLines = 0;
        
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (UIView *)buttonGapMiddleView
{
    if (!_buttonGapMiddleView) {
        
       _buttonGapMiddleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, ButtonHeight)];
        
        _buttonGapMiddleView.backgroundColor = UIColorFromRGB(0xE1E1E1);
    }
    return _buttonGapMiddleView;
}

- (NSMutableArray *)buttonTitlesArray
{
    if (!_buttonTitlesArray) {
        _buttonTitlesArray = [[NSMutableArray alloc]init];
    }
    return _buttonTitlesArray;
}

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        
        _buttonArray = [[NSMutableArray alloc]init];
        
    }
    return _buttonArray;
}

- (NSMutableArray *)buttonItemArray
{
    if (!_buttonItemArray) {
        
        _buttonItemArray = [[NSMutableArray alloc]init];
    }
    return _buttonItemArray;
}

@end
