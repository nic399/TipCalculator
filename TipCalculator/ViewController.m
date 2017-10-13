//
//  ViewController.m
//  TipCalculator
//
//  Created by Nicholas Fung on 2017-10-13.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (IBAction)CalculateTip:(id)sender {
    if (self.billAmountTextField.text.length > 0 && self.tipPercentageTextField.text.length > 0) {
        double tipAmount = [self.billAmountTextField.text doubleValue] * [self.tipPercentageTextField.text doubleValue] / 100.00;
        self.tipAmountLabel.text = [@"Tip Amount: $" stringByAppendingString:[NSString stringWithFormat:@"%.2f", tipAmount]];
    }
    else {
        self.tipAmountLabel.text = @"Tip Amount: $0.00";
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    self.tipPercentSlider.value = [self.tipPercentageTextField.text doubleValue];
}

- (IBAction)tipSliderAction:(UISlider *)sender {
    self.tipPercentageTextField.text = [NSString stringWithFormat:@"%.1f", sender.value];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *decimalNumberCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"1234567890."];
    NSRange testForNonNumbers = [string rangeOfCharacterFromSet:[decimalNumberCharacterSet invertedSet]];
    
    if (testForNonNumbers.length == 0) {
        if ([textField.text containsString:@"."] && [string containsString:@"."]) { //text field already has a decimal point
            return false;
        }
    }
    else {
        return false;
    }
    return true;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
