ZTAlertView
===========

A custom alertView implement UIView

How to use
===========

1 as notification view
    ZTAlertView *alertView = [[ZTAlertView alloc] initWithBackgroundImage:nil
                                                             contentIamge:[UIImage imageNamed:@"content"]
                                                                 describe:@"ok"
                                                              delayHidden:1];
    alertView.ZTDelegate = self;
    [alertView setDescribeLabelColor:[UIColor redColor]];
    [alertView setButtonCornerRadius:7];
    [alertView show];
    
2 as normal AlertView
    ZTAlertView *alertView = [[ZTAlertView alloc] initWithBackgroundImage:[UIImage imageNamed:@"alertBG"]
                                                                    title:@"ttt"
                                                                 subTitle:@"title"];
    [alertView setCancelButtonWithName:@"cancel"
                          okButtonName:@"ok"
                       backgroundImage:[UIImage imageNamed:@"buttonBg"]];
    alertView.ZTDelegate = self;
    [alertView setTitleColor:[UIColor redColor]];
    [alertView setSubTitleColor:[UIColor redColor]];
    [alertView setButtonCornerRadius:7];
    [alertView show];
    
    must implement protocal
    - (void)alertView:(id)alertView buttonClickedAtIndex:(int)buttonIndex{
      [ZTAlertView hidden];
    }
    
