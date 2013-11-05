//
//  ZTAlertView.h
//  ZTCustomAlert
//
//  Created by zt on 13-11-4.
//  Copyright (c) 2013年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ztAlertViewTag 123212
#define iphone5 [UIScreen mainScreen].bounds.size.height > 480 ? YES : NO
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@protocol ZTAlertViewDelegate <NSObject>

@required
- (void)alertView:(id)alertView buttonClickedAtIndex:(int)buttonIndex;

@end

@interface ZTAlertView : UIView

@property (nonatomic, strong) UIView *boxView;//main view
@property (nonatomic, strong) UIImageView *contentImgView;//图片区域
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *desStr;//描述文字
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *contentImage;
@property (nonatomic, strong) NSString *cancelButtonName;
@property (nonatomic, strong) NSString *okButtonName;
@property (nonatomic, strong) UIButton *cancleButton;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, assign) int delayTime;
@property (nonatomic, assign) id<ZTAlertViewDelegate> ZTDelegate;

//文字alert, 带有标准的标题，子标题的alert view
- (id)initWithBackgroundImage:(UIImage*)backgroundImg title:(NSString*)ti subTitle:(NSString*)subTi;
//图片alert, 内容部分只有图片的alert view,可以设置延迟隐藏时间，d<1不隐藏
- (id)initWithBackgroundImage:(UIImage*)backgroundImg contentIamge:(UIImage*)contentImg describe:(NSString*)des delayHidden:(int)d;
//只要一个按钮的时候条用此方法
- (void)setCancelButtonWithName:(NSString*)cName backgroundImage:(UIImage*)image;
//需要取消和确定都显示条用此方法
- (void)setCancelButtonWithName:(NSString*)cName okButtonName:(NSString*)oName backgroundImage:(UIImage*)image;
//需要圆角按钮调用此方法
- (void)setButtonCornerRadius:(CGFloat)value;
//更改标题颜色
- (void)setTitleColor:(UIColor*)color;
//更改子标题改标题颜色
- (void)setSubTitleColor:(UIColor*)color;
//设置描述文字颜色
- (void)setDescribeLabelColor:(UIColor*)color;
//显示alertview
- (void)show;
//关闭alert
+ (void)hidden;
@end
