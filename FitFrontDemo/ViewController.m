//
//  ViewController.m
//  FitFrontDemo
//
//  Created by LiuLi on 2019/2/22.
//  Copyright © 2019年 LYPC. All rights reserved.
//

#import "ViewController.h"
#import "UIFont+Multi.h"
#import "UIFont+MultiFontName.h"

#import "MultiFont.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *btns;

@property (nonatomic,strong) UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titles = @[@"小号", @"中号", @"大号"];
    self.btns = [NSMutableArray array];
    for (int i=0; i<3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(40+i*(70+10), 150, 70, 44)];
        btn.backgroundColor = [UIColor yellowColor];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont fontWithName:@"GeezaPro" size:15];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [btn addTarget:self action:@selector(clickChangeFontBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
        [self.view addSubview:btn];
        [self.btns addObject:btn];
    }
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, 300, 400)];
    self.resultLabel.textColor = [UIColor redColor];
    self.resultLabel.font = [UIFont systemFontOfSize:15];
    self.resultLabel.numberOfLines = 0;
    self.resultLabel.textAlignment = NSTextAlignmentLeft;
    self.resultLabel.text = @"山不在高，有仙则名。水不在深，有龙则灵。斯是陋室，惟吾德馨。苔痕上阶绿，草色入帘青。谈笑有鸿儒，往来无白丁。可以调素琴，阅金经。无丝竹之乱耳，无案牍之劳形。南阳诸葛庐，西蜀子云亭。孔子云：何陋之有？";
    [self.view addSubview:self.resultLabel];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)clickChangeFontBtn:(UIButton *)sender {
    if (sender.tag == 100) {
        // 小号
        [[NSUserDefaults standardUserDefaults] setObject:@"-4" forKey:FontChangeValue];
    }else if (sender.tag == 101) {
        // 中号
        [[NSUserDefaults standardUserDefaults] setObject:@"5" forKey:FontChangeValue];
    }else if (sender.tag == 102) {
        // 大号
        [[NSUserDefaults standardUserDefaults] setObject:@"7" forKey:FontChangeValue];
    }
    // 刷新 已创建重新刷新字号，新创建的页面不需要
    self.resultLabel.font = [UIFont systemFontOfSize:15];
    [self.btns enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        btn.titleLabel.font = [UIFont fontWithName:@"GeezaPro" size:15];
    }];
}

@end
