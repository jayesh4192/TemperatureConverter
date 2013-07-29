//
//  TempConvViewController.h
//  TemperatureConverter
//
//  Created by Jayesh Shah on 7/25/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\jayeshs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempConvViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *fTextField;
@property (nonatomic, weak) IBOutlet UITextField *cTextField;

- (IBAction) converterButtonClicked:(id)sender;

@end
