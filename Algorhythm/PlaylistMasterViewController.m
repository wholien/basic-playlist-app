//
//  ViewController.m
//  Algorhythm
//
//  Created by Julien Chien on 11/5/15.
//  Copyright (c) 2015 Wholiean. All rights reserved.
//

#import "PlaylistMasterViewController.h"
#import "PlaylistDetailViewController.h"
#import "Playlist.h"

@interface PlaylistMasterViewController ()

@end

@implementation PlaylistMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    for (NSUInteger index = 0; index < self.playlistImageViews.count; index++){
        
        Playlist *playlist = [[Playlist alloc] initWithIndex:index];
        
        UIImageView *playlistImageView = self.playlistImageViews[index];
        
        playlistImageView.backgroundColor = playlist.backgroundColor;
        playlistImageView.image = playlist.playlistIcon;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed {
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"showPlaylistDetail"]){
    
    UIImageView *playlistImageView = (UIImageView*)[sender view];
    
    if ([self.playlistImageViews containsObject:playlistImageView]){
        NSUInteger index = [self.playlistImageViews indexOfObject:playlistImageView];
        
        PlaylistDetailViewController *playlistDetailController = (PlaylistDetailViewController *)segue.destinationViewController;
        playlistDetailController.playlist = [[Playlist alloc] initWithIndex:index];
    }
    
    }
    
}

- (IBAction)showPlaylistDetail:(id)sender {
    [self performSegueWithIdentifier:@"showPlaylistDetail" sender:sender];
}







@end
