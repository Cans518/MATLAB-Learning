import os
import sys
script_path = os.path.abspath(__file__)
script_dir = os.path.dirname(script_path)
parent_dir = os.path.dirname(script_dir)
lib_dir = os.path.join(parent_dir, 'lib')
sys.path.append(lib_dir)

from retinaface import Retinaface

'''
在更换完face_dataset后一定要先运行转换文件，再运行encoding.py。，否则可能会出现打开错误的情况。
在更换facenet网络后一定要重新进行人脸编码，运行encoding.py。
'''
retinaface = Retinaface(1)

script_path = os.path.abspath(__file__)
script_dir = os.path.dirname(script_path)
parent_dir = os.path.dirname(script_dir)

list_dir = os.listdir(os.path.join(parent_dir,'face_dataset'))
image_paths = []
names = []
for name in list_dir:
    image_paths.append("face_dataset/"+name)
    names.append(name.split("_")[0])
retinaface.encode_face_dataset(image_paths,names)
