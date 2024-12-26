import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from datetime import datetime

class TimePublisher(Node):

    def __init__(self):
        super().__init__('time_publisher')
        self.publisher_ = self.create_publisher(String, 'current_time', 10)
        self.timer = self.create_timer(1.0, self.timer_callback)
        self.get_logger().info('TimePublisher node has started.')

    def timer_callback(self):
        current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        msg = String()
        msg.data = f"Current time: {current_time}"
        
        self.publisher_.publish(msg)
        self.get_logger().info(f'Publishing: "{msg.data}"')

def main(args=None):
    rclpy.init(args=args)
    node = TimePublisher()
    rclpy.spin(node)
    rclpy.shutdown()

if __name__ == '__main__':
    main()

