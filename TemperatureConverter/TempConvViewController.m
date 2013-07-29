//
//  TempConvViewController.m
//  TemperatureConverter
//
//  Created by Jayesh Shah on 7/25/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\jayeshs. All rights reserved.
//

#import "TempConvViewController.h"

@interface TempConvViewController ()

@property (nonatomic)BOOL isTextFieldFahrenheit;

- (void) onDoneButton;

@end

@implementation TempConvViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cTextField.delegate = self;
    self.fTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL) textFieldShouldBeginEditing:(UITextField *) textField {
    NSLog(@"Begin editing");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}
- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"End editing");
    if (textField == self.fTextField) {
        self.isTextFieldFahrenheit = true;
    }
    else {
        self.isTextFieldFahrenheit = false;
    }
    //self.navigationItem.rightBarButtonItem = nil;
    return YES;
}


#pragma mark - Private method

- (void) onDoneButton {
    self.navigationItem.rightBarButtonItem = nil;
    [self.view endEditing:YES];
}

- (IBAction) converterButtonClicked:(id)sender {
      if (self.isTextFieldFahrenheit) {
        float ff = [self.fTextField.text floatValue];
        NSLog(@"FF %0.2f", ff);
        float cc = (ff - 32);
        cc = cc * (0.5555);
        self.cTextField.text = [NSString stringWithFormat:@"%0.2f", cc];
        NSLog(@"Celsius %0.2f", cc);
    }
    else {
        float fc = [self.cTextField.text floatValue];
        float ff = (fc * 9);
        ff = ff/5;
        ff = ff + 32;
        self.fTextField.text = [NSString stringWithFormat:@"%0.2f", ff];
        NSLog(@"Fahrenheit %0.2f", ff);
    }
    NSLog(@"The button was clicked %@", self.fTextField.text);
}

@end
