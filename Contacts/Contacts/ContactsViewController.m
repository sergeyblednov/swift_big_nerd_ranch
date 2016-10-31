//
//  ViewController.m
//  Contacts
//
//  Created by Sergiy Blednov on 10/21/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _contacts = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

#pragma mark - Navigation

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue
{
    
}

- (IBAction)createNewContact:(UIStoryboardSegue *)segue
{
    NewContactViewController *newContactViewController = segue.sourceViewController;
    NSString *firstName = newContactViewController.firstNameTextField.text;
    NSString *lastName = newContactViewController.lastNameTextField.text;
    if (firstName.length != 0 || lastName.length != 0) {
        NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        Contact *newContact = [[Contact alloc] initWithContactName:fullName];
        [self.contacts addObject:newContact];
        [self.tableView reloadData];
    }
}


@end
