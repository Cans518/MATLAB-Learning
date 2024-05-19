# -*- coding: utf-8 -*-
import sys
sys.path.insert(0, 'lib/')
from Person import Person
import cv2

preson = Person()

# 创建一个 VideoCapture 对象，参数 0 表示使用默认的摄像头
cap = cv2.VideoCapture(0)

while(True):
    # 逐帧捕获
    ret, frame = cap.read()

    # 对帧进行操作
    img = preson.detect_image(frame,'video')

    # cv2.imwrite("test.jpg", frame)

    # 显示结果帧
    # cv2.imshow('frame', frame)
    
    # 按 'q' 键退出循环
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    if cv2.waitKey(1) & 0xFF == ord('s'):
        cv2.imwrite("test.jpg", frame)

# 完成所有操作后，释放捕获
cap.release()
cv2.destroyAllWindows()
