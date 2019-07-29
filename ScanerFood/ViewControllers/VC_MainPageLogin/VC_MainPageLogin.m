//
//  VC_MainPageLogin.m
//  ScanerFood
//
//  Created by Lucas Luu on 7/24/19.
//  Copyright © 2019 Lucas Luu. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "VC_MainPageLogin.h"

#define _textSize               12

@interface VC_MainPageLogin ()<MFMailComposeViewControllerDelegate>
{
    UIImageView*    _logoImage;
    UILabel*        _welcomeTitle;
}

@property (strong, nonatomic) UITextField*      email;
@property (strong, nonatomic) UITextField*      password;
@property (strong, nonatomic) UIButton*         loginBtn;
@property (strong, nonatomic) UIButton*         forgotPassword;

@end

@implementation VC_MainPageLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self.view setBackgroundColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
    
//    UIImage *backImage = [UIImage imageNamed:@"backArrowImage"];
//    UIButton* backBtn = [[UIButton alloc] init];
//    [backBtn addTarget:self action:@selector(backBtnTapped) forControlEvents:UIControlEventTouchUpInside];
//    [backBtn setTintColor:[UIColor greenColor]];
//    [backBtn setImage:backImage forState:UIControlStateNormal];
//    [backBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [self.view addSubview:backBtn];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
//                                                          attribute:NSLayoutAttributeTop
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeTop
//                                                         multiplier:1.0
//                                                           constant:30.0]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
//                                                          attribute:NSLayoutAttributeLeft
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeLeft
//                                                         multiplier:1.0
//                                                           constant:17.0]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
//                                                          attribute:NSLayoutAttributeRight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:backBtn
//                                                          attribute:NSLayoutAttributeLeft
//                                                         multiplier:1.0
//                                                           constant:44.0]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
//                                                          attribute:NSLayoutAttributeBottom
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:backBtn
//                                                          attribute:NSLayoutAttributeTop
//                                                         multiplier:1.0
//                                                           constant:44.0]];
    _logoImage = [[UIImageView alloc] init];
    [_logoImage setImage:[UIImage imageNamed:@"app_icon"]];
    [_logoImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_logoImage];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:5.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.47
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_logoImage
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    _welcomeTitle = [[UILabel alloc] init];
    [_welcomeTitle setText:@"Welcome to Step.fi!"];
    [_welcomeTitle setFont:[UIFont boldSystemFontOfSize:18]];
    [_welcomeTitle setTextColor:[UIColor whiteColor]];
    [_welcomeTitle setTextAlignment:NSTextAlignmentCenter];
    [_welcomeTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_welcomeTitle];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_logoImage
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:8.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.8
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    //    _descriptionLable = [[UILabel alloc] init];
    //    [_descriptionLable setText:@"Some thing over here to description about this app.This note because it will be replace soon"];
    //    [_descriptionLable setFont:[UIFont italicSystemFontOfSize:14]];
    //    [_descriptionLable setTextAlignment:NSTextAlignmentCenter];
    //    [_descriptionLable setNumberOfLines:2];
    //    [_descriptionLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    ////    [self.view addSubview:_descriptionLable];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_welcomeTitle
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                multiplier:1.0
    //                                                                  constant:2.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                multiplier:1.0
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                multiplier:0.8
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                multiplier:1.0
    //                                                                  constant:50.0]];
    //    _changePassword = [[UILabel alloc] init];
    //    [_changePassword setText:@"Sign in"];
    //    [_changePassword setTextAlignment:NSTextAlignmentCenter];
    //    [_changePassword setFont:[UIFont boldSystemFontOfSize:14]];
    //    [_changePassword setTranslatesAutoresizingMaskIntoConstraints:NO];
    //    [self.view addSubview:_changePassword];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_welcomeTitle
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                multiplier:1.0
    //                                                                  constant:20.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                multiplier:1.0
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                multiplier:0.8
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                multiplier:1.0
    //                                                                  constant:30.0]];
    _email = [[UITextField alloc] init];
    _email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor LVL_colorWithHexString:@"cdcccc" andAlpha:1.0]}];
    [_email setTextColor:[UIColor LVL_colorWithHexString:@"cdcccc" andAlpha:1.0]];
    [_email setFont:[UIFont systemFontOfSize:_textSize]];
    [_email setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_email setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_email setKeyboardType:UIKeyboardTypeEmailAddress];
    [_email setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_email];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-8.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:-16.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_email
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    UIView* bottomLineEmail = [[UIView alloc] init];
    [bottomLineEmail setBackgroundColor:[UIColor whiteColor]];
    [bottomLineEmail setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:bottomLineEmail];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLineEmail
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_email
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:1.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLineEmail
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_email
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLineEmail
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:bottomLineEmail
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:1.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLineEmail
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_email
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    _password = [[UITextField alloc] init];
    _password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor LVL_colorWithHexString:@"cdcccc" andAlpha:1.0]}];
    [_password setTextColor:[UIColor LVL_colorWithHexString:@"cdcccc" andAlpha:1.0]];
    [_password setFont:[UIFont systemFontOfSize:_textSize]];
    [_password setSecureTextEntry:YES];
    [_password setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_password];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_email
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:8.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:-16.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    UIView* bottomLinePassword = [[UIView alloc] init];
    [bottomLinePassword setBackgroundColor:[UIColor whiteColor]];
    [bottomLinePassword setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:bottomLinePassword];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLinePassword
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:1.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLinePassword
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLinePassword
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:bottomLinePassword
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:1.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomLinePassword
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    _forgotPassword = [[UIButton alloc] init];
    [_forgotPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_forgotPassword setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    [_forgotPassword.titleLabel setFont:[UIFont systemFontOfSize:_textSize]];
    _forgotPassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_forgotPassword addTarget:self action:@selector(forgotPasswordButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_forgotPassword setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_forgotPassword];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:bottomLinePassword
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-160.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    
    _loginBtn = [[UIButton alloc] init];
    [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor LVL_colorWithHexString:@"aa4b16" andAlpha:1.0]];
    [_loginBtn addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_loginBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_loginBtn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:25.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:-16.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginBtn
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:50.0]];
    //    _registerBtn = [[UIButton alloc] init];
    //    [_registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    //    [_registerBtn setBackgroundColor:[UIColor orangeColor]];
    //    [_registerBtn addTarget:self action:@selector(cancelButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    //    [_registerBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    //    [self.view addSubview:_registerBtn];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_registerBtn
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_password
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                multiplier:1.0
    //                                                                  constant:5.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_registerBtn
    //                                                                 attribute:NSLayoutAttributeLeft
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                multiplier:1.0
    //                                                                  constant:3.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_registerBtn
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                multiplier:0.4
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_registerBtn
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_registerBtn
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                multiplier:1.0
    //                                                                  constant:50.0]];
    UIGestureRecognizer* singleTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTouchTapped)];
    [self.view addGestureRecognizer:singleTouch];
}

-(void)singleTouchTapped
{
    [self.view endEditing:YES];
}

-(void)forgotPasswordButtonTapped {
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        mailVC.mailComposeDelegate = self;
        [mailVC setSubject:@"[Step.fi] - Forgot password request !!"];
        [mailVC setToRecipients:@[@"nguyendaingoc@gmail.com"]];
        [mailVC setMessageBody:[NSString stringWithFormat:@"Account %@ của tôi bị quên mật khẩu, vui lòng hỗ trợ tôi",_email.text] isHTML:NO];
        [self presentViewController:mailVC animated:YES completion:nil];
        
    } else {
        //This device cannot send email
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Lỗi mở mail"
                                                                         message:@"Không thể mở email tự động, vui lòng liên hệ nguyendaingoc@gmail.com"
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok, đã hiểu"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alertVC addAction:okAction];
        [_NavController presentViewController:alertVC animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            //Email sent
            break;
        case MFMailComposeResultSaved:
            //Email saved
            break;
        case MFMailComposeResultCancelled:
            //Handle cancelling of the email
            break;
        case MFMailComposeResultFailed:
            //Handle failure to send.
            break;
        default:
            //A failure occurred while completing the email
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end