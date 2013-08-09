//
//  ViewController.m
//  SocialNet
//
//  Created by Lan on 09/08/13.
//  Copyright (c) 2013 Miyo's Inc. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postearRedSocial:(id)sender {
    SLComposeViewController *redesView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result)
        {
            [redesView dismissViewControllerAnimated:YES completion:nil];
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"CANCELADO");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"ENVIADO");
                    break;
                default:
                    break;
            }
        };
        [redesView setInitialText:@"Probando la integracion con Twitter en iOS"];
        [redesView addURL:[NSURL URLWithString:@"www.miyosinc.com"]];
        [redesView addImage:[UIImage imageNamed:@"Miyo.png"]];
        [redesView setCompletionHandler:completionHandler];
        [self presentViewController:redesView animated:YES completion:nil];
    }
}
@end
