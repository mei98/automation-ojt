from skimage.metrics import structural_similarity
import cv2
 
def compare_images(src1, src2):

    img1 = cv2.imread(src1, 0)
    img2 = cv2.imread(src2, 0)
            
    ssim, diff = structural_similarity(img1, img2, full=True) #1.0 means identical. Lower = not similar

    if ssim == 1:
        return True
    else:
        return False