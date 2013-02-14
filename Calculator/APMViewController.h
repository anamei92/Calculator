//
//  APMViewController.h
//  Calculator
//
//  Created by Ana Mei on 2/3/13.
//  Copyright (c) 2013 Ana Mei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *textArea;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubtract;
@property (weak, nonatomic) IBOutlet UIButton *buttonMultiply;
@property (weak, nonatomic) IBOutlet UIButton *buttonDivide;
@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *buttonDecimal;
@property (weak, nonatomic) IBOutlet UIButton *buttonEqual;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonSign;
@property (nonatomic, strong) NSMutableArray *nums;
@property (nonatomic, strong) NSMutableArray *ops;

- (IBAction)pressedText:(id)sender;
- (IBAction)pressedOperation:(id)sender;
- (IBAction)Calculate:(id)sender;
- (IBAction)Reset:(id)sender;
- (IBAction)AddDecimal:(id)sender;
- (IBAction)changeSign:(id)sender;


@end
