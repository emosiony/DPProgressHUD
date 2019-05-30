//
//  ViewController.m
//  DP_SVPProgress
//
//  Created by Jtg_yao on 2019/5/30.
//  Copyright © 2019 jzg. All rights reserved.
//

#import "ViewController.h"
#import "DPProgressHUD.h"

@interface ViewController ()

@property (nonatomic,copy) NSArray *dataList;
@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.dataList = @[@"加载中...", @"成功", @"失败",
                      @"信息", @"只展示文字居中", @"自定义图片提示",
                      @"问题提示 下偏移", @"进度条"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

#pragma mark -- TableView Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    NSString *tip = [self.dataList objectAtIndex:indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            [DPProgressHUD showLoadingTip:tip];
            [DPProgressHUD dissMissDelay:2.0f Complete:nil];
            break;
        case 1: {
            [DPProgressHUD showSuccessTip:tip];
        } break;
        case 2: {
            [DPProgressHUD showFailureTip:tip];
        } break;
        case 3: {
            [DPProgressHUD showInfoTip:tip];
        } break;
        case 4: {
            [DPProgressHUD showTip:tip];
        } break;
        case 5: {
            [DPProgressHUD showImage:[UIImage imageNamed:@"tabbar_search_sel"] tip:tip];
        } break;
        case 6: {
            [DPProgressHUD showBottomTip:tip];
        } break;
        case 7: {
            _progress = 0.0;
            [self.timer fireDate];
        } break;
        default:
            break;
    }
}

-(void)progressUpdate {
    
    if (_progress > 1.0) {
        return ;
    }
    
    _progress += 0.01;
    if (_progress < 1) {
        [DPProgressHUD showProgress:_progress];
    } else {
        [DPProgressHUD dissMissHUD];
    }
}

-(NSTimer *)timer {
    
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(progressUpdate) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

@end
