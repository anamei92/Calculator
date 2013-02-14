//
//  APMViewController.m
//  Calculator
//
//  Created by Ana Mei on 2/3/13.
//  Copyright (c) 2013 Ana Mei. All rights reserved.
//

#import "APMViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface APMViewController ()

@end

@implementation APMViewController
    bool prevOP = NO;
    bool startOver = YES;
    bool prevDot = NO;
    bool checkneg = NO;
    bool finishNum = NO;
    bool error = NO;
//used to keep check of positive or negative number
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Add tiled image background
    UIImage *patternImage = [UIImage imageNamed:@"dark_geometric.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
    
    //initialize
    self.nums = [NSMutableArray array];
    self.ops = [NSMutableArray array];
    
    NSArray *buttonMapping = [[NSArray alloc] initWithObjects:self.button0 ,self.button1, self.button2,
                              self.button3, self.button4, self.button5, self.button6, self.button7, self.button8, self.button9, self.buttonAdd, self.buttonSubtract,self.buttonMultiply,self.buttonDivide, self.buttonDecimal, self.buttonSign, self.buttonEqual, self.buttonClear, nil];
    
    for(UIButton *curr in buttonMapping){
    
    [curr setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    CALayer *btnLayer = [curr layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    
    [btnLayer setBorderWidth:1.0f];
    [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedText:(id)sender {
    if(error == NO){
    if(prevOP == YES){
          NSLog(@"Test %@", @"Hi");
        [self.ops addObject:self.textArea.text];
        NSLog(@"Checking Added Length OPS: %d", [self.ops count]);
        prevOP = NO;
    }
    NSString *str = (NSString*)[sender currentTitle];
    NSLog(@"%@", str);
    NSString *current = self.textArea.text;
    if(startOver == YES){
        prevDot = NO;
        self.textArea.text = str;
    }
    else{
        self.textArea.text = [current stringByAppendingString:str];
    }
    startOver = NO;
    }
}

- (IBAction)pressedOperation:(id)sender {
    if(error == NO){
    prevDot = NO;
    
    NSString *str = (NSString*)[sender currentTitle];
    
    if(prevOP == NO){
        [self.nums addObject:self.textArea.text];
        NSLog(@"Checking Added Length: %d", [self.nums count]);
    }
     self.textArea.text = str;
    startOver = YES;
     prevOP = YES;
    }
    
}

- (IBAction)Calculate:(id)sender {
    //add the last num into the num array
    if(prevOP == NO){
        NSString *current = [@"check NUM:" stringByAppendingString:self.textArea.text];
        NSLog(@"%@", current);
        [self.nums addObject:self.textArea.text];
    }
    int index = 0;
    NSLog(@"Checking Added Length total Nums: %d", [self.nums count]);
    NSLog(@"Checking Added Length total Ops: %d", [self.ops count]);
    //traverse through the operation array to find the
    
    while ([self.ops count] > 0 ) {
        //check if there's multiplication or division sign
        bool isthere = [self.ops containsObject: @"÷"] || [self.ops containsObject: @"x"] ;
        if(isthere){
            int div = [self.ops indexOfObject: @"÷"];
            int mul = [self.ops indexOfObject: @"x"];
            
            //get the earliest x or ÷
            if(mul < div){
                index = mul;
            }
            else{
                index = div;
            }
        }
        else{
            index = 0;
        }
        
        
        NSString *op = [self.ops objectAtIndex:index];
        NSString *first = [self.nums objectAtIndex:index];
        NSString *second = [self.nums objectAtIndex:index+1];
        
        float fnum = [first floatValue];
        float snum = [second floatValue];
        float result = 0;
        
        if([op isEqualToString:@"+"]){
            result = fnum + snum;
        }
        else if([op isEqualToString:@"-"]){
            result = fnum - snum;
        }
        else if([op isEqualToString:@"x"]){
            result = fnum*snum;
        }
        else if([op isEqualToString:@"÷"]){
            if(snum == 0){
                error = YES;
                break;
            }
            result = fnum/snum;
        }
        NSLog(@"Check index = %d", index);
    [self.ops removeObjectAtIndex:index];
    [self.nums removeObjectAtIndex:index+1];
    [self.nums removeObjectAtIndex:index];

    NSString *res = [NSString stringWithFormat:@"%f", result];
    [self.nums insertObject:res atIndex:index];
        int length = [self.nums count];
        NSLog(@"Check length loop= %d", length);
        NSLog(@"Check index 0= %@", [self.nums objectAtIndex:0]);
    }
    if(error == NO){
    NSString *final = [self.nums objectAtIndex:0];
    self.textArea.text = final;
    }
    else{
       self.textArea.text = @"Error";
    }
    startOver = YES;
     prevDot = NO;
    
    [self.nums removeAllObjects];
    [self.ops removeAllObjects];
}

- (IBAction)Reset:(id)sender {
    [self.nums removeAllObjects];
    [self.ops removeAllObjects];
    self.textArea.text = @"0";
    checkneg = NO;
    startOver = YES;
    prevDot = NO;
    prevOP = NO;
    error = NO;
}

- (IBAction)AddDecimal:(id)sender {
    NSString *str = (NSString*)[sender currentTitle];
    NSString *current = self.textArea.text;
    if( (prevDot == NO) &&(startOver == NO)){
    self.textArea.text = [current stringByAppendingString:str];
    }
    else if((prevDot == NO) && (startOver == YES)){
        NSString *zero = @"0";
        self.textArea.text = [zero stringByAppendingString:str];
        prevOP = NO;
    }
    prevDot = YES;
    if(startOver == YES){
        startOver = NO;
    }
}

- (IBAction)changeSign:(id)sender {
    NSString *current = self.textArea.text;
    if(checkneg == NO && prevOP == NO){
        NSLog(@"Check = %@", @"came in here");
        NSString *neg = @"-";
        self.textArea.text = [neg stringByAppendingString:current];
        checkneg = YES;
    }
    else if ( checkneg == YES && prevOP == NO){
        int length = [current length];
        NSRange range = NSMakeRange(1, length-1);
        
        NSString *subString = [current substringWithRange:range];
        self.textArea.text = subString;
        checkneg = NO;
    }
}
@end
