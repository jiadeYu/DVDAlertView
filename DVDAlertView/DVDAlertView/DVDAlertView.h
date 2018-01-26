//
//  DVDAlertView.h
//  DaVDian_business
//
//  Created by bochengzhang on 2017/4/19.
//  Copyright © 2017年 BraveTime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RIButtonItem.h"
#import "UIView+DAddition.h"

typedef NS_ENUM(NSInteger, DVDAlertViewStyle) {
    
    DVDAlertViewStyleDefault = 0,
    
};

@protocol DVDAlertViewDelegate;

@interface DVDAlertView : UIView

/**
 当前window上是否有alertView在显示

 @return
 */
+ (BOOL)isCurrentAlertInWindow;

//
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;

//可自定义content内容的字体样式
- (instancetype)initWithTitle:(NSString *)title attributedStringMessage:(NSAttributedString *)attributedStringMessage delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;


/**
 自定义弹出框，以block方式初始化。

 @param inTitle 弹出框标题
 @param inMessage 弹出框消息
 @param inCancelButtonItem 取消按键item
 @param inOtherButtonItems 其他按键item
 @return 自定义弹出框对象
 */
-(id)initWithTitle:(NSString *)inTitle message:(NSString *)inMessage cancelButtonItem:(RIButtonItem *)inCancelButtonItem otherButtonItems:(RIButtonItem *)inOtherButtonItems;

@property (nonatomic,weak)id <DVDAlertViewDelegate> delegate;

// 超过两个按钮后，调用该方法不会再有效，以后根据需求再扩展超过两个按钮的情况

- (NSInteger)addButtonWithTitle:(NSString *)title withButtonTitleColor:(UIColor *)titleColor; //返回按钮的index，index从0开始

- (void)show;

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;

- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex;

- (void)setContentLabelTextAlignment:(NSTextAlignment)textAlignment;

//alertView的其他UI风格，留待以后扩展
@property(nonatomic,assign) DVDAlertViewStyle alertViewStyle;

@end

@protocol DVDAlertViewDelegate <NSObject>

@optional

//点击了buttonIndex对应的按钮，alertView会自动消失
//取消按钮的index默认为0

- (void)alertView:(DVDAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex ;

@end

