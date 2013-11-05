//
//  ZTAlertView.m
//  ZTCustomAlert
//
//  Created by zt on 13-11-4.
//  Copyright (c) 2013年 zt. All rights reserved.
//

#import "ZTAlertView.h"
#import <QuartzCore/QuartzCore.h>

#define TITLE_FONT [UIFont boldSystemFontOfSize:14]
#define SUB_TITLE_FONT [UIFont systemFontOfSize:13]
#define BOX_WIDTH 280
#define MarginTop 5
#define MarginLeft 20
#define TagForTitleLabel        76112
#define TagForSubTitleLabel     76113

@implementation ZTAlertView

@synthesize boxView, title,subTitle,desStr,backgroundImage,contentImgView, contentImage,ZTDelegate,cancelButtonName,okButtonName,cancleButton,okButton,delayTime;


#pragma mark - publick methods
- (id)initWithBackgroundImage:(UIImage*)bgImg title:(NSString*)ti subTitle:(NSString*)subTi{
    return  [self initWithBackgroundImage:bgImg contentIamge:nil describe:nil title:ti subTitle:subTi delayHidden:-1];
}

- (id)initWithBackgroundImage:(UIImage*)bgImg contentIamge:(UIImage*)contentImg describe:(NSString*)des delayHidden:(int)d{
    return  [self initWithBackgroundImage:bgImg contentIamge:contentImg describe:des title:nil subTitle:nil delayHidden:d];
}

- (id)initWithBackgroundImage:(UIImage*)backgroundImg
                 contentIamge:(UIImage*)contentImg
                     describe:(NSString*)des
                        title:(NSString*)ti
                     subTitle:(NSString*)subTi
                  delayHidden:(int)d{
    self = [super init];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(0, 0, 320, SCREEN_HEIGHT);
        self.tag = ztAlertViewTag;
        self.backgroundColor = [UIColor clearColor];
        self.boxView = [[UIView alloc] init];
        self.title = ti;
        self.subTitle = subTi;
        self.backgroundImage = backgroundImg;
        self.contentImage = contentImg;
        self.desStr = des;
        self.delayTime = d;
        
        if (self.backgroundImage != nil) {
            self.boxView.backgroundColor = [UIColor colorWithPatternImage:self.backgroundImage];
        }else{
            self.boxView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.7];
        }
        self.boxView.layer.cornerRadius = 7;
        self.boxView.layer.borderWidth = 2;
        self.boxView.layer.borderColor = [UIColor clearColor].CGColor;
        
        //
        if (contentImg == nil) {
            [self initItemsForTextStyle];
        }else{
            [self initItemsForImageStyle];
        }
    }
    return self;
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect endRect = self.boxView.frame;
    self.boxView.frame = CGRectMake(0, 0, 0, 0);
    self.boxView.center = self.center;
    for (UIView *view in self.boxView.subviews) {
        view.alpha = 0;
    }
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.boxView.frame = endRect;
    } completion:^(BOOL finished) {
        for (UIView *view in self.boxView.subviews) {
            view.alpha = 1;
        }
    }];
    [window addSubview:self];
}

+ (void)hidden{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ZTAlertView *view = (ZTAlertView*)[window viewWithTag:ztAlertViewTag];
    view.hidden = YES;
    [view removeFromSuperview];
}

- (void)hiddenWithDelay{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ZTAlertView *view = (ZTAlertView*)[window viewWithTag:ztAlertViewTag];
    view.hidden = YES;
    [view removeFromSuperview];
}

- (void)setButtonCornerRadius:(CGFloat)value{
    for (UIView *view in self.boxView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*)view;
            button.layer.cornerRadius = value;
            button.layer.borderWidth = 2;
            button.layer.borderColor = [UIColor clearColor].CGColor;
            button.clipsToBounds = YES;
        }
    }
}

//只要一个按钮的时候条用此方法
- (void)setCancelButtonWithName:(NSString*)cName backgroundImage:(UIImage*)image{
    [self setCancelButtonWithName:cName okButtonName:nil backgroundImage:image];
}

//需要取消和确定都显示条用此方法
- (void)setCancelButtonWithName:(NSString*)cName okButtonName:(NSString*)oName backgroundImage:(UIImage*)image{
    CGRect subTitleFrame = ((UILabel*)[self viewWithTag:TagForSubTitleLabel]).frame;
    // 添加取消按钮
    self.cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleButton.frame = CGRectMake(MarginLeft, 2*MarginTop+CGRectGetMaxY(subTitleFrame), oName == nil ? BOX_WIDTH-2*MarginLeft : 110, 30);
    [cancleButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    cancleButton.tag = 0;
    [cancleButton setBackgroundImage:image forState:UIControlStateNormal];
    [cancleButton setTitle:cName forState:UIControlStateNormal];
    [self.boxView addSubview:cancleButton];
    
    // 添加确定按钮
    if (oName != nil) {
        self.okButton = [UIButton buttonWithType:UIButtonTypeCustom];
        okButton.frame = CGRectMake(CGRectGetMaxX(cancleButton.frame)+MarginLeft, CGRectGetMinY(cancleButton.frame), 110, 30);
        [okButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        okButton.tag = 1;
        [okButton setBackgroundImage:image forState:UIControlStateNormal];
        [okButton setTitle:oName forState:UIControlStateNormal];
        [self.boxView addSubview:okButton];
    }
}

//更改标题颜色
- (void)setTitleColor:(UIColor*)color{
    UILabel *lab = (UILabel*)[self.boxView viewWithTag:TagForTitleLabel];
    lab.textColor = color;
}
//更改子标题改标题颜色
- (void)setSubTitleColor:(UIColor*)color{
    UILabel *lab = (UILabel*)[self.boxView viewWithTag:TagForSubTitleLabel];
    lab.textColor = color;
}
//设置描述文字颜色
- (void)setDescribeLabelColor:(UIColor*)color{
    [self setSubTitleColor:color];
}

#pragma mark - privat method
//图片和文字模式
- (void)initItemsForImageStyle{
    CGSize imageSize = self.contentImage.size;
    CGSize desSize = [self.desStr sizeWithFont:SUB_TITLE_FONT
                             constrainedToSize:CGSizeMake(BOX_WIDTH, 9999999)
                                 lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat boxwidth = MAX(imageSize.width, desSize.width)+MarginLeft*2;
    CGFloat boxheight = imageSize.height+desSize.height+MarginTop*3;
    self.boxView.frame = CGRectMake(0, 0, boxwidth, boxheight);
    self.boxView.center = self.center;
    [self addSubview:self.boxView];

    //图片
    self.contentImgView = [[UIImageView alloc] initWithImage:self.contentImage];
    self.contentImgView.frame = CGRectMake((boxwidth-imageSize.width)/2, MarginTop, imageSize.width, imageSize.height);
    [self.boxView addSubview:self.contentImgView];
    
    //描述
    UILabel *lbDescribe = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentImgView.frame)+MarginTop,boxwidth, desSize.height)];
    lbDescribe.tag =  TagForSubTitleLabel;
    lbDescribe.backgroundColor = [UIColor clearColor];
    lbDescribe.font = SUB_TITLE_FONT;
    lbDescribe.textColor = [UIColor whiteColor];
    lbDescribe.text = self.desStr;
    lbDescribe.numberOfLines = 0;
    lbDescribe.textAlignment = NSTextAlignmentCenter;
    [self.boxView addSubview:lbDescribe];
    
    if (self.delayTime >= 1) {
        [self performSelector:@selector(hiddenWithDelay) withObject:nil afterDelay:2];
    }
}

//标题和子标题模式
- (void)initItemsForTextStyle{
    // title label and subtitle label
    UILabel *lbTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, MarginTop, BOX_WIDTH-10, 21)];
    lbTitle.tag = TagForTitleLabel;
    lbTitle.numberOfLines = 0;
    lbTitle.backgroundColor = [UIColor clearColor];
    lbTitle.font = TITLE_FONT;
    lbTitle.text = self.title;
    lbTitle.textAlignment = NSTextAlignmentCenter;
    [self.boxView addSubview:lbTitle];
    
    // sub titel label
    CGSize subTitleSize = [self.subTitle sizeWithFont:SUB_TITLE_FONT
                              constrainedToSize:CGSizeMake(BOX_WIDTH, 9999999)
                                  lineBreakMode:NSLineBreakByWordWrapping];
    UILabel *lbSubTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, lbTitle.frame.origin.y+lbTitle.frame.size.height+MarginTop, BOX_WIDTH-10, subTitleSize.height)];
    lbSubTitle.tag = TagForSubTitleLabel;
    lbSubTitle.backgroundColor = [UIColor clearColor];
    lbSubTitle.font = SUB_TITLE_FONT;
    lbSubTitle.text = self.subTitle;
    lbSubTitle.numberOfLines = 0;
    lbSubTitle.textAlignment = NSTextAlignmentCenter;
    [self.boxView addSubview:lbSubTitle];
    
    CGRect cancelButtonFrame = CGRectMake(20, 4*MarginTop+CGRectGetHeight(lbTitle.frame)+CGRectGetHeight(lbSubTitle.frame), 110, 35);
    //add box view
    CGFloat boxHeight = MarginTop+CGRectGetMaxY(cancelButtonFrame);
    self.boxView.frame = CGRectMake(0, 0, BOX_WIDTH, boxHeight);
    self.boxView.center = self.center;
    [self addSubview:self.boxView];
}

- (void)buttonClicked:(UIButton*)button{
    if (ZTDelegate) {
        if ([ZTDelegate respondsToSelector:@selector(alertView:buttonClickedAtIndex:)]){
            [ZTDelegate alertView:self buttonClickedAtIndex:button.tag];
            NSLog(@"%d", button.tag);
        }
    }
}
@end
