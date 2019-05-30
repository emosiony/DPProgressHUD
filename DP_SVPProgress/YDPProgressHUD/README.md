#  <#Title#>

# 加载
[DPProgressHUD showLoadingTip:@"Loading..."];

# 成功
[DPProgressHUD showSuccessTip:@"successful"];

# 失败
[DPProgressHUD showFailureTip:@"failure"];

# 信息
[DPProgressHUD showInfoTip:@"信息"];

# 中间提示
[DPProgressHUD showTip:@"中间提示"];

# 自定义图片提示
[DPProgressHUD showImage:[UIImage imageNamed:@"tabbar_search_sel"] tip:@"自定义"];

# 文字提示底部
[DPProgressHUD showBottomTip:@"底部提示"];

# 展示进度
[DPProgressHUD showProgress:0.56];
