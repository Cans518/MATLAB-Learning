import cv2
from PIL import Image
from retinaface import Retinaface

if __name__ == "__main__":
    retinaface = Retinaface()
    img = input('Input image filename:')
    try:
        image = cv2.imread(img)
        s_image = Image.fromarray(image)
    except:
        print('Open Error! Try again!')

    retinaface.detect_image(s_image)
    print('\nDone')