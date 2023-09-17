#import <Foundation/Foundation.h>

@interface Robot : NSObject

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, copy) NSString *name;

@end

@implementation Robot

@end





// Создаем экземпляр Робота
Robot *robot = [[Robot alloc] init];
robot.x = 10.0; // Задайте координату x
robot.y = 20.0; // Задайте координату y
robot.name = @"Робот 1"; // Задайте имя Робота

// Сохраняем Робота в UserDefaults
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot];
[defaults setObject:robotData forKey:@"SavedRobot"];
[defaults synchronize]; // синхронизируйте UserDefaults






// Получаем Робота из UserDefaults
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
NSData *savedRobotData = [defaults objectForKey:@"SavedRobot"];
Robot *savedRobot = [NSKeyedUnarchiver unarchiveObjectWithData:savedRobotData];

// Отображаем данные в TextView
self.textView.text = [NSString stringWithFormat:@"Имя: %@\nX: %.2f\nY: %.2f", savedRobot.name, savedRobot.x, savedRobot.y];