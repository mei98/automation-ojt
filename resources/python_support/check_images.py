from skimage.metrics import structural_similarity
import cv2

 
def compare_images(src1, src2):

    bigger = cv2.imread(src1, 0)
    smaller = cv2.imread(src2, 0)
            
    ssim, diff = structural_similarity(bigger, smaller, full=True) #1.0 means identical. Lower = not similar

    if int(ssim) == 1:
        return True
    else:
        return False
