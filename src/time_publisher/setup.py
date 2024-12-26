from setuptools import setup

package_name = 'time_publisher'

setup(
    name=package_name,
    version='0.0.1',
    packages=['time_publisher'],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='bun',
    maintainer_email='vlongbf@gmail.com',
    description='時刻を発行するシンプルなROS 2パッケージ。',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'time_publisher = time_publisher.time_publisher:main',
        ],
    },
)

