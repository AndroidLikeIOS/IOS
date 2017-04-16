//
//  ViewController.m
//  UserDefaults
//
//  Created by Filipe Augusto de Souza Rosa on 15/04/17.
//  Copyright © 2017 Filipe Augusto de Souza Rosa. All rights reserved.
//

#import "ViewController.h"

//create var
static NSString *const kMyUserDefaults = @"MyUserDefaults";
static NSString *const kMyUserDefaultsName = @"nameKey";
static NSString *const kMyUserDefaultsFirstAccess = @"firstAccessKey";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstAccessLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameSavedLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTextNameSaved];
    
    if([self isFirstAccess]) {
        self.firstAccessLabel.hidden = false;
        self.firstAccessLabel.text = @"First access";
    }
}

- (void)setTextNameSaved {
    //set name value
    self.nameSavedLabel.text = [NSString stringWithFormat:@"Name seved: %@", [self getNameUserDefaults]];
}

- (BOOL)isFirstAccess {
    //get boolean value
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kMyUserDefaultsFirstAccess] == NO) {
        //update boolean value
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kMyUserDefaultsFirstAccess];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return true;
    }
    return false;
}

- (NSString *)getNameUserDefaults {
    //get name value
    NSString* name = [[NSUserDefaults standardUserDefaults] stringForKey:kMyUserDefaultsName];
    return name != nil ? name : @"" ;
}


- (void)setNameUserDefaults {
    //update name value
    [[NSUserDefaults standardUserDefaults] setObject:self.nameTextField.text forKey:kMyUserDefaultsName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)saveButton:(id)sender {
    [self setNameUserDefaults];
    [self setTextNameSaved];
}


@end