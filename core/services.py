import face_recognition
import numpy as np
import base64
import io
from PIL import Image

class FaceRecognitionService:

    @staticmethod
    def extract_face_encoding(image_file):
        try:
            image = Image.open(image_file)
            if image.mode != 'RGB':
                image = image.convert('RGB')

            image_np = np.array(image)

            face_locations = face_recognition.face_locations(image_np)
            
            if len(face_locations) == 0:
                raise ValueError("未检测到人脸，请上传包含正脸的图片")
            elif len(face_locations) > 1:
                raise ValueError("检测到多张人脸，请确保图片中只有您一个人")
            

            encodings = face_recognition.face_encodings(image_np, face_locations)
            if not encodings:
                raise ValueError("无法提取人脸特征")
            return encodings[0].tolist()
        except Exception as e:
            raise ValueError(f"图像处理失败: {str(e)}")

    @staticmethod
    def verify_face(known_encoding_list, unknown_image_file, tolerance=0.6):
        try:
            unknown_encoding = FaceRecognitionService.extract_face_encoding(unknown_image_file)
            known_encoding = np.array(known_encoding_list)
            unknown_encoding_np = np.array(unknown_encoding)

            distance = face_recognition.face_distance([known_encoding], unknown_encoding_np)[0]
            
            verified = bool(distance <= tolerance)
            return verified, float(distance)
        except ValueError as e:
            raise ValueError(str(e))